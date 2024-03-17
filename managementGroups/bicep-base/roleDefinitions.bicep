targetScope = 'managementGroup'

param environment string
param roleName string
param roleDisplayName string
param roleDescription string
param permissions array

resource roleDefinitions 'Microsoft.Authorization/roleDefinitions@2022-05-01-preview' = {
  name: guid('${roleName}${environment}')
  properties: {
    roleName: '${roleDisplayName}-${environment}'
    description: roleDescription
    assignableScopes: [
      managementGroup().id
    ]
    permissions: permissions
  }
}

output roleId string = roleDefinitions.id
output roleName string = roleDefinitions.name
output displayName string = roleDefinitions.properties.roleName
