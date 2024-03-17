targetScope = 'managementGroup'

param managementGroupName string
param objectId string
param rbacId string

resource rbacAssignment 'Microsoft.Authorization/roleAssignments@2020-08-01-preview' = {
  name: guid(rbacId, managementGroupName, objectId)
  properties: {
    principalId: objectId
    roleDefinitionId: rbacId
    principalType: 'ServicePrincipal'
  }
}
