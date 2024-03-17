targetScope = 'managementGroup'

param topLevelManagementGroupName string
param environment string
param managementSubscriptionId string
param githubOrganizationName string
param githubRepoName string
param location string

var TopManagementGroupName = '${topLevelManagementGroupName}-${environment}'
var owner = '/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635'

module topLevelManagemntGroup 'managementGroups.bicep' = {
  scope: tenant()
  name: 'toplevel-managementgroup'
  params: {
    managementGroupName: TopManagementGroupName
    parentManagementGroupId: '/providers/Microsoft.Management/managementGroups/${tenant().tenantId}'
  }
}

module platformManagementGroup 'managementGroups.bicep' = {
  scope: tenant()
  name: 'platform-managementgroup'
  params: {
    managementGroupName: 'platform-${environment}'
    parentManagementGroupId: topLevelManagemntGroup.outputs.managementGroupId
  }
}

module placeSubscription 'managementGroupsSubscriptions.bicep' = {
  scope: tenant()
  name: 'subscription-placement'
  params: {
    managementGroupName: platformManagementGroup.outputs.managementGroupName
    subcriptionId: managementSubscriptionId
  }
}

module identityResourceGroup 'resourceGroup.bicep' = {
  name: 'identity-resoruce-group'
  scope: subscription(managementSubscriptionId)
  params: {
    location: location
    environment: environment
  }
}

module platformIdentity 'managedIdentity.bicep' = {
  name: 'platform-identity'
  scope: resourceGroup(managementSubscriptionId, 'platformIdentity-${environment}')
  dependsOn: [
    identityResourceGroup
  ]
  params: {
    githubOrganizationName: githubOrganizationName
    githubRepoName: githubRepoName
    Environment: environment
    location: location
  }
}

module rbac 'roleAssignments.bicep' = {
  name: 'roleAssignment'
  scope: managementGroup(TopManagementGroupName)
  params: {
    managementGroupName: TopManagementGroupName
    objectId: platformIdentity.outputs.objectId
    rbacId: owner
  }
}

output platformIdentityObjectId string = platformIdentity.outputs.objectId
output platformIdentityClientId string = platformIdentity.outputs.objectId
output tenantId string = tenant().tenantId
