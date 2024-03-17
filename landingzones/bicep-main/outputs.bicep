targetScope = 'managementGroup'

param params object

output subscriptionId string =  params.basic.subscriptionId
output budget int = params.cost.budget


