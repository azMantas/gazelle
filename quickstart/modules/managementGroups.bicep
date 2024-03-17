targetScope = 'tenant'

param managementGroupName string
param parentManagementGroupId string

resource managementGroup 'Microsoft.Management/managementGroups@2023-04-01' = {
  name: managementGroupName
  properties: {
    displayName: managementGroupName
    details: {
      parent: {
        id: parentManagementGroupId
      }
    }
  }
}

output managementGroupId string = managementGroup.id
output managementGroupName string = managementGroup.name
