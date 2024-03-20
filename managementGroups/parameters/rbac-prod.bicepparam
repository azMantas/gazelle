using '../bicep-main/roleAssignments.bicep'

import * as func from '../bicep-base/functions.bicep'

param environment = ''

var rbacMapping = loadJsonContent('mappingRbac.json')
var customRoles = loadJsonContent('customRoles.json')
var entraId = loadJsonContent('mappingEntraId.json')

param rbac = {
  TenantRoot: [
    {
      roleDefinitionId: rbacMapping.Reader
      principalId: [
        entraId.AzurePlatformEngineers
        entraId.AzurePlatformReaders
      ]
    }
    {
      roleDefinitionId: rbacMapping.CostManagementReader
      principalId: [
        entraId.CostReaders
      ]
    }
  ]
  gazelle: [
    {
      roleDefinitionId: func.customRoleDefinitionId(customRoles.platformEngineers.name, environment)
      principalId: [
        entraId.AzurePlatformEngineers
      ]
    }
  ]
  cis: [
    {
      roleDefinitionId: rbacMapping.Reader
      principalId: [
        entraId.AzureLandingzoneReaders
      ]
    }
  ]
  playground: [
    {
      roleDefinitionId: rbacMapping.Reader
      principalId: [
        entraId.AzureLandingzoneReaders
      ]
    }
    {
      roleDefinitionId: rbacMapping.Contributor
      principalId: [
        entraId.AzurePlatformEngineers
      ]
    }
  ]
}
