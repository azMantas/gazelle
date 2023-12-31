targetScope = 'managementGroup'

param managementGroupName string
param principlesId array
param rbacId string

resource rbacAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = [for principal in principlesId: {
  name: guid(rbacId, managementGroupName, principal)
  properties: {
    principalId: principal
    roleDefinitionId: rbacId
  }
}]
