targetScope = 'subscription'

param location string
param resourceGroupName string = 'platformIdentity'
param environment string

resource platformIdentityResourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: '${resourceGroupName}-${environment}'
  location: location
}

output resourceGroupName string = platformIdentityResourceGroup.name
