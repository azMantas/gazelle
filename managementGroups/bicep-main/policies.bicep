targetScope = 'managementGroup'

#disable-next-line no-unused-params
param topLevelManagementGroupName string
// param environment string
// param location string
param definitions array
// param setDefinitions array
// param assignments array
param utc string = utcNow()

var uniqueValue = take(uniqueString(utc), 5)

@batchSize(20)
module policyDefinition '../bicep-base/policydefinitions.bicep' = [for item in definitions: {
  name: 'definition-${item.name}-${uniqueValue}'
  params: {
    
    policyName: item.name
    policyProperties: item.properties
  }
}]

// @batchSize(20)
// module policySetDefinition '../bicep-base/policySetDefinitions.bicep' = [for item in setDefinitions: {
//   name: 'setDefinition-${item.name}-${uniqueValue}'
//   dependsOn: policyDefinition
//   params: {
//     policySetDefinitionName: item.name
//     policySetDefinitionProperties: item.properties
//   }
// }]

// module assignment '../bicep-nested/policyAssignments-loop.bicep' = [for item in assignments: {
//   name: 'assignment-${item.name}-${uniqueValue}'
//   dependsOn: policySetDefinition
//   params: {
//     location: location
//     assignments: item
//     environment: environment
//   }
// }]
