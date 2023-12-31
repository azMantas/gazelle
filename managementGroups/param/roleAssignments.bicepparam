using '../bicep-main/roleAssignments.bicep'

param roles = {
  platform: [
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
      principlesId: [
        'c9f207af-e779-4c2d-9d67-29e21b117cb4'
        '3fd9d757-de95-451c-bd44-a7bb90e2a7dc'
        'd7a86287-f065-442f-b0f4-2728e94ad4a8'
      ]
    }
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/7f951dda-4ed3-4680-a7ca-43fe172d538d'
      principlesId: [
        'c9f207af-e779-4c2d-9d67-29e21b117cb4'
      ]
    }
  ]
  playground: [
    {
      roleDefinitionId: '/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7'
      principlesId: [
        'c9f207af-e779-4c2d-9d67-29e21b117cb4'
        '3fd9d757-de95-451c-bd44-a7bb90e2a7dc'
        'd7a86287-f065-442f-b0f4-2728e94ad4a8'
      ]
    }
  ]
}
