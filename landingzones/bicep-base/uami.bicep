param project string
param environment string
param location string
param githubRepoName string
param githubOrganizationName string


resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-07-31-preview' = {
  name: 'id-${project}-${environment}'
  location: location
  resource credentials 'federatedIdentityCredentials' = {
    name: 'landingzone-owner'
    properties: {
      audiences: [
        'api://AzureADTokenExchange'
      ]
      issuer: 'https://token.actions.githubusercontent.com'
      subject: 'repo:${githubOrganizationName}/${githubRepoName}:environment:${environment}'
    }
  }
}

output clientId string = managedIdentity.properties.clientId
output principalId string = managedIdentity.properties.principalId
output resourceId string = managedIdentity.id
output resourceName string = managedIdentity.name
