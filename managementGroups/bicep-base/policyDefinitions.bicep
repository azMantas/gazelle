targetScope = 'managementGroup'

param policyName string
param policyProperties object

resource policyDefinition 'Microsoft.Authorization/policyDefinitions@2023-04-01' = {
  name: policyName
  properties: policyProperties
}
