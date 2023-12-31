using '../bicep-main/policies.bicep'

param topLevelManagementGroupName = 'gazelle'
param environment = 'tst'
param location = 'westeurope'

var topLevelMgId = '${'/providers/Microsoft.Management/managementGroups/'}${topLevelManagementGroupName}-${environment}'

param definitions = [
  loadJsonContent('policies/definitions/st_allowCrossTenantReplication.json')
  loadJsonContent('policies/definitions/st_networkAclsVirtualNetworkRules.json')
]

param setDefinitions = [
  json(replace(loadTextContent('policies/setDefinitions/storage.json'), '{{topLevel}}', topLevelMgId))
]

param assignments = [
  json(replace(loadTextContent('policies/assignments/storage.json'), '{{topLevel}}', topLevelMgId))
  loadJsonContent('policies/assignments/builtIn.json')
]
