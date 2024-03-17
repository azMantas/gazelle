targetScope = 'managementGroup'

param name string
param location string
param policyIdentityResourceId string
param displayName string
param enforcmentMode string = 'Default'
param nonScopes array = []
param definitionId string
param parameters object


resource policyAssignment 'Microsoft.Authorization/policyAssignments@2023-04-01' = {
  name: name
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${policyIdentityResourceId}': {}
    }
  }
  location: location
  properties: {
    displayName: displayName
    enforcementMode: enforcmentMode
    notScopes: nonScopes
    policyDefinitionId: definitionId
    parameters: parameters
  }
}
