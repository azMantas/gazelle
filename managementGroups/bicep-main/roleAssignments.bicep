targetScope = 'managementGroup'

param roles object
param environment string = 'tst'

module assignRbac '../bicep-nested/roleAssignments-loop.bicep' = [for item in items(roles): {
  scope: managementGroup('${item.key}-${environment}')
  params: {
    managementGroupName: '${item.key}-${environment}'
    roles: item.value
  }
}]
