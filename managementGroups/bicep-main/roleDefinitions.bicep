targetScope = 'managementGroup'

param environment string

var customRoles = loadJsonContent('../parameters/customRoles.json')

resource roleDefinitions 'Microsoft.Authorization/roleDefinitions@2022-05-01-preview' = [
  for item in items(customRoles): {
  name: guid('${item.value.name}${environment}')
  properties: {
    roleName: '${item.value.displayName}-${environment}'
    description: item.value.description
    assignableScopes: [
      managementGroup().id
    ]
    permissions: item.value.permissions
  }
}]
