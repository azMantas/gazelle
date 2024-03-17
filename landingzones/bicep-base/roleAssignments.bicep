targetScope  = 'subscription'

param principalId string
param rbacId string

resource rbacAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(rbacId, subscription().id , principalId)
  properties: {
    principalId: principalId
    roleDefinitionId: rbacId
    principalType: 'ServicePrincipal'
  }
}
