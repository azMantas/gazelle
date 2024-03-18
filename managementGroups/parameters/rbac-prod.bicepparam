using '../bicep-main/roleAssignments.bicep'

param environment = ''

var rbacMapping = loadJsonContent('rbacMapping.json')
var customRoles = loadJsonContent('customRoles.json')


param rbac = {
  cis: [
    {
      roleDefinitionId: rbacMapping.Reader
      principalId: [
        '40e39f8d-f0c6-4c45-a1f3-69387c5dcd99'
      ]
    }
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/${guid('${customRoles.copyPaster.name}${environment}')}'
      principalId: [
        '40e39f8d-f0c6-4c45-a1f3-69387c5dcd99'
      ]
    }
  ]
  playground: [
    {
      roleDefinitionId: rbacMapping.Reader
      principalId: [
        '40e39f8d-f0c6-4c45-a1f3-69387c5dcd99'
      ]
    }
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/${guid('${customRoles.platformEngineers.name}${environment}')}'
      principalId: [
        '40e39f8d-f0c6-4c45-a1f3-69387c5dcd99'
      ]
    }
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/${guid('${customRoles.clickOps.name}${environment}')}'
      principalId: [
        '40e39f8d-f0c6-4c45-a1f3-69387c5dcd99'
      ]
    }
  ]
}
