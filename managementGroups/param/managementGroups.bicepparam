using '../bicep-main/managementGroups.bicep'

param topLevelManagementGroupname = 'gazelle'
param environment = ''
param childManagementGroups = [
  'platform'
  'playground'
  'CIS'
]
