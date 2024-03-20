using '../bicep-main/roleAssignments.bicep'

param environment = ''

var rbacMapping = loadJsonContent('mappingRbac.json')
var customRoles = loadJsonContent('customRoles.json')
var entraId = loadJsonContent('mappingEntraId.json')

param rbac = {
  cis: [
    {
      roleDefinitionId: rbacMapping.Contributor
      principalId: [
        entraId.AzurePlatformEngineers
      ]
    }
  ]
  playground: [
    {
      roleDefinitionId: rbacMapping.Contributor
      principalId: [
        entraId.AzurePlatformEngineers
      ]
    }
  ]
  gazelle: [
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/${guid('${customRoles.platformEngineers.name}${environment}')}'
      principalId: [
        entraId.AzurePlatformEngineers
      ]
    }
  ]
}
