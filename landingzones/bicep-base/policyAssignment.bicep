targetScope = 'subscription'

param location string
param identityResourceId string
param displayName string
param parameters object
param policyDefinitionId string
param name string

resource policyAssignment 'Microsoft.Authorization/policyAssignments@2023-04-01' = {
  name: name
  location: location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${identityResourceId}': {}
    }
  }
  properties: {
    displayName: displayName
    parameters: parameters
    policyDefinitionId: policyDefinitionId
  }
}
