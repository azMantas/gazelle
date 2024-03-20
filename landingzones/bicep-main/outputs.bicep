targetScope = 'managementGroup'

param params object

output subscriptionId string =  params.basic.subscriptionId
output subscriptionName string = '${params.basic.project}-${params.basic.environment}'
output budget int = params.cost.budget


