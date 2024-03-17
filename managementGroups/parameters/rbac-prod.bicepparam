using '../bicep-main/roleAssignments.bicep'

param environment = ''

var rbacMapping = loadJsonContent('rbacMapping.json')

param rbac = {
  cis: [
    {
      roleDefinitionId: rbacMapping.Reader
      principalId: [
        '40e39f8d-f0c6-4c45-a1f3-69387c5dcd99'
      ]
    }
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/${guid('${'copyPaster'}${environment}')}'
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
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/${guid('${'platformEngineers'}${environment}')}'
      principalId: [
        '40e39f8d-f0c6-4c45-a1f3-69387c5dcd99'
      ]
    }
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/${guid('${'clickOps'}${environment}')}'
      principalId: [
        '40e39f8d-f0c6-4c45-a1f3-69387c5dcd99'
      ]
    }
  ]
}
