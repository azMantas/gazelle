targetScope = 'tenant'

param subcriptionId string
param managementGroupName string

resource placeSubscriptions 'Microsoft.Management/managementGroups/subscriptions@2023-04-01' = {
  name: '${managementGroupName}/${subcriptionId}'
}
