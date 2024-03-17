using '../bicep-main/roleAssignments.bicep'

param environment = ''

var rbacMapping = loadJsonContent('rbacMapping.json')


param rbac = {
  cis: [
    {
      roleDefinitionId: rbacMapping.Reader
      principalId: [
        '40e39f8d-f0c6-4c45-a1f3-69387c5dcd99'
        '3a33005a-557e-4c16-8d4e-27dd64e94571'
        'f563bfc8-0d96-4846-9f4c-0a10d49309c1'
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
        '3a33005a-557e-4c16-8d4e-27dd64e94571'
        'f563bfc8-0d96-4846-9f4c-0a10d49309c1'
      ]
    }
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/${guid('${'clickOps'}${environment}')}'
      principalId: [
        '40e39f8d-f0c6-4c45-a1f3-69387c5dcd99'
        '3a33005a-557e-4c16-8d4e-27dd64e94571'
        'f563bfc8-0d96-4846-9f4c-0a10d49309c1'
      ]
    }
  ]
}
