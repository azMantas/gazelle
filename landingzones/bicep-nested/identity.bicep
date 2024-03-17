targetScope = 'subscription'

param labName string 
param environment string
param location string = 'westeurope'

var name = 'id-${labName}-${environment}'

resource identityResourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'lz-identity-${environment}'
  location: location
}

module identity '../bicep-base/uami.bicep' = {
  scope: identityResourceGroup
  name: 'subscriptionIdentity'
  params: {
    location: location
    name: name
  }
}

module rbac '../bicep-base/roleAssignments.bicep' = {
  name: 'rbac-subscriptionIdentity'
  params: {
    principalId: identity.outputs.principalId
    rbacId: '/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635'
  }
}

output resourceId string = identity.outputs.resourceId
