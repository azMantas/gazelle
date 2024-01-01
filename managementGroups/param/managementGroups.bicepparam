using '../bicep-main/managementGroups.bicep'

param topLevelManagementGroupname = ''
param environment = ''
param childManagementGroups = [
  'platform'
  'playground'
  'CIS'
]
