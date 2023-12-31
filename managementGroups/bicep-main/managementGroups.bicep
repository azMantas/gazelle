targetScope = 'managementGroup'

param topLevelManagementGroupname string = 'gazelle'
param environment string = 'tst'
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
