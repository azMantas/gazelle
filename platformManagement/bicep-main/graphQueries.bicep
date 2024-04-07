
param queries object = {
  customRoles: {
    query: 'hello azure'
  }
}

module query 'br/public:avm/res/resource-graph/query:0.1.1' = [for item in items(queries): {
  name: item.key
  params: {
    name: item.key
    query: item.value.query
  }
}]
