targetScope = 'managementGroup'

param params object

module identity '../bicep-nested/identity.bicep' = {
  name: 'landingzone-identity'
  scope: subscription(params.basic.subscriptionId)
  params: {
    project: params.basic.project
    environment: params.basic.environment
    location: params.basic.location
    githubOrganizationName: params.identity.githubOrganizationName
    githubRepoName: params.identity.githubRepoName
  }
}

module tagsOnSubscription '../bicep-base/policyAssignment.bicep' = [for item in items(params.policies.tags.subscriptionLevel): {
  scope: subscription(params.basic.subscriptionId)
  name: 'tag-${item.key}'
  params: {
    location: params.basic.location
    identityResourceId: identity.outputs.resourceId
    policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/61a4d60b-7326-440e-8051-9f94394d4dd1'
    name: 'tag-${item.key}'
    displayName: 'tag: ${item.key} - ${item.value}'
    parameters: {
      tagName: {
        value: item.key
      }
      tagValue: {
        value: item.value
      }
    }
  }
}]

module tagsOnResources '../bicep-base/policyAssignment.bicep' = [for item in items(params.policies.tags.resourceLevel): {
  scope: subscription(params.basic.subscriptionId)
  name: 'tag-${item.key}'
  params: {
    location: params.basic.location
    identityResourceId: identity.outputs.resourceId
    policyDefinitionId: '/providers/Microsoft.Authorization/policyDefinitions/4f9dc7db-30c1-420c-b61a-e1d640128d26'
    name: 'tag-${item.key}'
    displayName: 'tag: ${item.key} - ${item.value}'
    parameters: {
      tagName: {
        value: item.key
      }
      tagValue: {
        value: item.value
      }
    }
  }
}]

module securityContacts '../bicep-base/securityContacts.bicep' = {
  scope: subscription(params.basic.subscriptionId)
}

output clientId string = identity.outputs.clientId
