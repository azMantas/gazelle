using '../bicep-main/roleDefinitions.bicep'

param environment = ''
param topLevelManagementGroupName = ''

param customRoles = [
  {
    platformEngineers: {
      displayName: 'platform engineers'
      description: 'allows to perform manual tasks such as dismiss alerts, remediate policies and other operations that does not brake IaC principles'
      permissions: [
        {
          actions: [
            '*/read'
          ]
          notActions: []
        }
      ]
    }
  }
  {
    clickOps: {
      displayName: 'clickOps specialists'
      description: 'testing custom role assignments.'
      permissions: [
        {
          actions: [
            '*/read'
          ]
          notActions: []
        }
      ]
    }
  }
  {
    copyPaster: {
      displayName: 'copy-paster master'
      description: 'another custom role assignments'
      permissions: [
        {
          actions: [
            '*/read'
          ]
          notActions: []
        }
      ]
    }
  }
]
