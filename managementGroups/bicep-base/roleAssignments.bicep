targetScope = 'managementGroup'

param principlesId array
param rbacId string

resource rbacAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = [for principal in principlesId: {
  name: guid(rbacId, managementGroup().name, principal)
  properties: {
    principalId: principal
    roleDefinitionId: rbacId
    principalType: 'Group'
  }
}]
