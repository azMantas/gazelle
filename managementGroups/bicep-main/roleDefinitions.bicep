targetScope = 'managementGroup'

param environment string

var customRoles = loadJsonContent('../parameters/customRoles.json')

resource roleDefinitions 'Microsoft.Authorization/roleDefinitions@2022-05-01-preview' = [
  for (item, i) in items(customRoles): {
  name: guid('${item.key}${environment}')
  properties: {
    roleName: '${item.value.displayName}-${environment}'
    description: item.value.description
    assignableScopes: [
      managementGroup().id
    ]
    permissions: item.value.permissions
  }
}]
