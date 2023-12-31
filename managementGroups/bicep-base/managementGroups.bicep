targetScope = 'tenant'

param managementGroupName string
param parentManagementGroupId string

resource managementGroup 'Microsoft.Management/managementGroups@2020-05-01' = {
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

output mgmtName string = managementGroup.name
output mgmtId string = managementGroup.id
