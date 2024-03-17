targetScope = 'tenant'

param defaultManagementGroupName string
param requireAuthorizationForGroupCreation bool = true

resource rootMgmtGroup 'Microsoft.Management/managementGroups@2023-04-01' existing = {
  name: tenant().tenantId
}

resource hierarchy 'Microsoft.Management/managementGroups/settings@2023-04-01' = {
  name: 'default'
  parent: rootMgmtGroup
  properties: {
    defaultManagementGroup: '/providers/Microsoft.Management/managementGroups/${defaultManagementGroupName}'
    requireAuthorizationForGroupCreation: requireAuthorizationForGroupCreation
  }
}
