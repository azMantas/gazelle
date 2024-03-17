
$deployParams = @{
    topLevelManagementGroupName = 'gazelle'
    environment                 = 'prod'
    managementSubscriptionId    = '84e64f94-714d-4c07-9f03-f07af8380b36'
    githubOrganizationName      = "azMantas"
    githubRepoName              = "gazelle"
    ManagementGroupId           = (get-AzTenant).tenantId
    TemplateFile                = ".\quickstart\modules\main.bicep"
    verbose                     = $true
    locationFromTemplate        = "francecentral"
    Location                    = "francecentral"
}

$deployment = new-azManagementGroupDeployment @deployParams

$assignRbac = @{
    Scope              = "/"
    RoleDefinitionName = "Resource Policy Contributor"
    ObjectId           = $deployment.Outputs.platformIdentityObjectId.Value
}

$getAssignment = Get-AzRoleAssignment @assignRbac
if ($assignRbac.RoleDefinitionName -eq $getAssignment.RoleDefinitionName) {
    Write-Output "Role assignment already exists."
} else {
    New-AzRoleAssignment @assignRbac
}


$deployment.Outputs.platformIdentityClientId.Value

# github action environment variable
# tst & prod
# PLATFORM_IDENTITY_CLIENT_ID
15e448cc-8eeb-4bca-a4bf-f457dc611b02 tst
8f2efc3c-ab97-434d-a60e-1c3dfa4b1d2d prod




# clean up

Get-AzRoleAssignment -Scope "/" 

Remove-AzRoleAssignment -Scope "/" -RoleDefinitionName "Resource Policy Contributor" -ObjectId 0593a941-9de0-44db-aab3-57aed2d25f49

Get-AzTenantDeployment | ForEach-Object -Parallel { Remove-AzTenantDeployment -Id $_.id } -ThrottleLimit 30
