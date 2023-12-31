targetScope = 'managementGroup'

param managementGroupName string
param roles array

module assignRbac '../bicep-base/roleAssignments.bicep' = [for item in roles: {
  params: {
    rbacId: item.roleDefinitionId
    principlesId: item.principlesId
    managementGroupName: managementGroupName
  }
}]

