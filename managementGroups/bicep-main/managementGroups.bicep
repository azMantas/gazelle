targetScope = 'managementGroup'

param topLevelManagementGroupname string = ''
param environment string = ''
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
