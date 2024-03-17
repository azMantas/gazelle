param location string
param githubRepoName string
param githubOrganizationName string
param Environment string

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' = {
  name: 'id-platformIdentity-${Environment}'
  location: location
  resource credentials 'federatedIdentityCredentials' = {
    name: 'platformOwner'
    properties: {
      audiences: [
        'api://AzureADTokenExchange'
      ]
      issuer: 'https://token.actions.githubusercontent.com'
      subject: 'repo:${githubOrganizationName}/${githubRepoName}:environment:${Environment}'
    }
  }
}

output objectId string = managedIdentity.properties.principalId
output clientId string = managedIdentity.properties.clientId
