targetScope = 'managementGroup'

param subscriptionId string
param managementGroupId string

resource subscriptionPlacement 'Microsoft.Management/managementGroups/subscriptions@2023-04-01' = {
  name: '${managementGroupId}/${subscriptionId}'
  scope: tenant()
}
