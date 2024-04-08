targetScope = 'subscription'

param location string
param environment string


var queries = loadJsonContent('../parameters/graphQueries.json')

resource graphQueriesRG 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'graphQueries-${environment}'
  location: location
}

module graphQueries 'br/public:avm/res/resource-graph/query:0.1.1' = [
  for item in items(queries): {
    name: item.key
    scope: graphQueriesRG
    params: {
      name: '${item.key}-${environment}'
      query: item.value.query
    }
  }
]
