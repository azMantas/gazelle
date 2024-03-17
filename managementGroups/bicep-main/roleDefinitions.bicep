targetScope = 'managementGroup'

param topLevelManagementGroupName string
param environment string
param customRoles array

module roleDefinitions '../bicep-nested/roleDefinitions-loop.bicep' = [
  for item in customRoles: {
    params: {
      topLevelManagementGroupName: topLevelManagementGroupName
      environment: environment
      customRole: item
    }
  }
]
