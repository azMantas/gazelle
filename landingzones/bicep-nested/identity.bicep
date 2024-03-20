targetScope = 'subscription'

param project string
param environment string
param location string = 'westeurope'
param githubOrganizationName string
param githubRepoName string

var rbacMapping = loadJsonContent('../../managementGroups/parameters/mappingRbac.json')

resource identityResourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'landingzone-${project}-${environment}'
  location: location
}

module identity '../bicep-base/uami.bicep' = {
  scope: identityResourceGroup
  name: 'subscriptionIdentity'
  params: {
    project: project
    environment: environment
    location: location
    githubOrganizationName: githubOrganizationName
    githubRepoName: githubRepoName
  }
}

module rbac '../bicep-base/roleAssignments.bicep' = {
  name: 'rbac-subscriptionIdentity'
  params: {
    principalId: identity.outputs.principalId
    rbacId: rbacMapping.Reader
  }
}

output clientId string = identity.outputs.clientId
output principalId string = identity.outputs.principalId
output resourceId string = identity.outputs.resourceId
output resourceName string = identity.outputs.resourceName
