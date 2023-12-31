targetScope = 'managementGroup'

param name string
param location string
param policyDisplayName string
param policyEnforcmentMode string = 'Default'
param policyNonScopes array = []
param policyDefinitionId string
param policyParameters object


resource policyAssignment 'Microsoft.Authorization/policyAssignments@2023-04-01' = {
  name: name
  identity: {
    type: 'SystemAssigned'
  }
  location: location
  properties: {
    displayName: policyDisplayName
    enforcementMode: policyEnforcmentMode
    notScopes: policyNonScopes
    policyDefinitionId: policyDefinitionId
    parameters: policyParameters
  }
}
