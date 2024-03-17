targetScope = 'managementGroup'

param policies object
param environment string
param policyIdentityResourceId string

var formatPolicies = [for item in items(policies.scope):{
  scope: item.key
  param: item.value.parameters
  mode: item.value.enforcementMode
  name: policies.policyName
  display: policies.policyDisplayName
  id: policies.policyDefinitionId
}]


module assginmentNested '../bicep-base/policyAssignments.bicep' = [for item in formatPolicies: {
  scope: managementGroup('${item.scope}-${environment}')
  params: {
    name: item.name
    location: 'westeurope'
    definitionId: item.id
    displayName: item.display
    parameters: item.param
    policyIdentityResourceId: policyIdentityResourceId
  }
}]
