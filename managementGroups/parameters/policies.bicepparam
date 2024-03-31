using '../bicep-main/policies.bicep'

param topLevelManagementGroupName = 'gazelle'
param environment = ''
param location = ''
var topLevelMgId = '${'/providers/Microsoft.Management/managementGroups/'}${topLevelManagementGroupName}-${environment}'

param definitions = [
  loadJsonContent('policyDefinitions/st_allowCrossTenantReplication.json')
  loadJsonContent('policyDefinitions/st_networkAclsVirtualNetworkRules.json')
]

param setDefinitions = [
  json(replace(loadTextContent('policySetDefinitions/storage.json'), '{{topLevel}}', topLevelMgId))
  json(replace(loadTextContent('policySetDefinitions/allowedLocations.json'), '{{topLevel}}', topLevelMgId))
  json(replace(loadTextContent('policySetDefinitions/allowedResourcesTypes.json'), '{{topLevel}}', topLevelMgId))
]

param policyAssignments = [
  json(replace(loadTextContent('policyAssignments/storage.json'), '{{topLevel}}', topLevelMgId))
  loadJsonContent('policyAssignments/CIS.json')
]
