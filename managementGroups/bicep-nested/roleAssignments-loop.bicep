targetScope = 'managementGroup'

param rbac array

module rbacNested '../bicep-base/roleAssignments.bicep' = [for item in rbac: {
  params: {
    rbacId: item.roleDefinitionId
    principlesId: item.principalId
  }
}]

