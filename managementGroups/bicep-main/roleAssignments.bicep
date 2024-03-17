targetScope = 'managementGroup'

param environment string
param rbac object

param utc string = utcNow()
var uniqueValue = take(uniqueString(utc), 5)

module roleAssignment '../bicep-nested/roleAssignments-loop.bicep' = [
  for item in items(rbac): {
    scope: managementGroup('${item.key}-${environment}')
    name: 'rbac-${item.key}-${uniqueValue}'
    params: {
      rbac: item.value
    }
  }
]
