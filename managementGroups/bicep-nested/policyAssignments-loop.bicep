targetScope = 'managementGroup'

param assignments object
param environment string
param utc string = utcNow()

var uniqueValue = take(uniqueString(utc), 5)

module policyAssignment '../bicep-base/policyAssignments.bicep' = [for item in items(assignments.scope): {
  name: 'assignment-${item.key}-${assignments.name}-${uniqueValue}'
  scope: managementGroup('${item.key}-${environment}')
  params: {
    policyDefinitionId: assignments.policyDefinitionId
    policyDisplayName: assignments.displayName
    name: assignments.name
    policyParameters: item.value.parameters
    policyEnforcmentMode: item.value.enforcementMode
  }
}]
