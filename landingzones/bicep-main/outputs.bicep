targetScope = 'managementGroup'

param params object

output subscriptionId string =  params.basic.subscriptionId
output subscriptionName string = '${params.basic.solution}-${params.basic.environment}'
output budget int = params.cost.budget


