targetScope = 'tenant'

param subcriptionsId array
param managementGroupName string

resource placeSubscriptions 'Microsoft.Management/managementGroups/subscriptions@2023-04-01' = [for subscription in subcriptionsId: {
  name: '${managementGroupName}/${subscription}'
}]
