targetScope = 'managementGroup'

param topLevelManagementGroupName string = ''
param environment string = ''
param managementGroupName array

param utc string = utcNow()
var uniqueValue = take(uniqueString(utc), 5)

module mgmtGroups '../bicep-base/managementGroups.bicep' = [for item in managementGroupName: {
  name: 'mgmt-${item}-${uniqueValue}'
  scope: tenant()
  params: {
    parentManagementGroupId: '/providers/Microsoft.Management/managementGroups/${topLevelManagementGroupName}-${environment}'
    managementGroupName: '${item}-${environment}'
  }
}]
