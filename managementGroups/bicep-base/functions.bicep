@export()
func customRoleDefinitionId(customRoleName string, environment string) string =>
  '/providers/Microsoft.Authorization/roleDefinitions/${guid('${customRoleName}${environment}')}'
