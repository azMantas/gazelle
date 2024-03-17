param name string
param location string

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: name
  location: location
}

output principalId string = managedIdentity.properties.principalId
output resourceId string = managedIdentity.id
