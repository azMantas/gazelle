targetScope = 'managementGroup'

param environment string


var customRoles = loadJsonContent('../parameters/customRoles.json')
// module roleDefinitions '../bicep-nested/roleDefinitions-loop.bicep' = [
//   for item in customRoles: {
//     params: {
//       topLevelManagementGroupName: topLevelManagementGroupName
//       environment: environment
//       customRole: item
//     }
//   }
// ]


// module roleDefinitionsNested '../bicep-base/roleDefinitions.bicep' = [
//   for (item, i) in items(customRoles): {
//     scope: managementGroup('${topLevelManagementGroupName}-${environment}')
//     params: {
//       roleName: item.key
//       roleDescription: item.value.description
//       permissions: item.value.permissions
//       roleDisplayName: item.value.displayName
//       environment: environment
//     }
//   }
// ]




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
