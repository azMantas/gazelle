targetScope = 'managementGroup'

param policySetDefinitionName string
param policySetDefinitionProperties object

resource policySetDefinition 'Microsoft.Authorization/policySetDefinitions@2023-04-01' ={
  name: policySetDefinitionName
  properties: policySetDefinitionProperties
}

output displayName string = policySetDefinition.properties.displayName
output description string = policySetDefinition.properties.metadata.description
output name string = policySetDefinition.name
output id string = policySetDefinition.id
