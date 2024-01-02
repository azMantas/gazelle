targetScope = 'managementGroup'

param topLevelManagementGroupname string
@description('This value is dynamically fetched from GitHub Actions variables')
param environment string
param childManagementGroups array = [
  'platform'
  'playground'
]

module mgmtGroups '../bicep-base/managementGroups.bicep' = [for item in childManagementGroups: {
  name: 'mgmt-${item}'
  scope: tenant()
  params: {
    managementGroupName: '${item}-${environment}'
    parentManagementGroupId: '/providers/Microsoft.Management/managementGroups/${topLevelManagementGroupname}-${environment}'
  }
}]
