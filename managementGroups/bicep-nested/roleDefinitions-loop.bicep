targetScope = 'managementGroup'

param topLevelManagementGroupName string
param environment string
param customRole object

module roleDefinitionsNested '../bicep-base/roleDefinitions.bicep' = [
  for (item, i) in items(customRole): {
    scope: managementGroup('${topLevelManagementGroupName}-${environment}')
    params: {
      roleName: item.key
      roleDescription: item.value.description
      permissions: item.value.permissions
      roleDisplayName: item.value.displayName
      environment: environment
    }
  }
]
