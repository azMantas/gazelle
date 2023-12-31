targetScope = 'managementGroup'

param managementGroupName string
param principlesId array
param rbacId string

resource rbacAssignment 'Microsoft.Authorization/roleAssignments@2020-08-01-preview' = [for principal in principlesId: {
  name: guid(rbacId, managementGroupName, principal)
  properties: {
    principalId: principal
    roleDefinitionId: rbacId
  }
}]
