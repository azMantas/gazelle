using '../bicep-main/roleAssignments.bicep'

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
        entraId.CostReaders
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
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/${guid('${customRoles.platformEngineers.name}${environment}')}'
      principalId: [
        entraId.AzurePlatformEngineers
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
  platform: [
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/${guid('${customRoles.platformEngineers.name}${environment}')}'
      principalId: [
        entraId.AzurePlatformEngineers
      ]
    }
  ]
}
