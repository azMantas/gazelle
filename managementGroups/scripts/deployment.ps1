
$managementGroups = @{
    Name                  = "bigBang"
    Location              = "West Europe"
    TemplateFile          = ".\managementGroups\bicep-main\managementGroups.bicep"
    TemplateParameterFile = ".\managementGroups\param\managementGroups.bicepparam"
    ManagementGroupId     = (Get-AzTenant).TenantId
    Verbose               = $true
}

New-AzManagementGroupDeployment @managementGroups -environment 'tst'




$Name = "Policies"
$templateFile = ".\managementGroups\bicep-main\policies.bicep"
$TemplateParameterFile = '.\managementGroups\param\policies.bicepparam'

$policyDeployment = @{
    Name                  = $Name
    Location              = "West Europe"
    TemplateFile          = $templateFile
    TemplateParameterFile = $TemplateParameterFile
    Verbose               = $true
    Force                 = $true
    DeleteAll             = $true
    DenySettingsMode      = "None"
}

New-AzManagementGroupDeploymentStack @policyDeployment -ManagementGroupId gazelle-tst




$Name = "rbac"
$templateFile = ".\managementGroups\bicep-main\roleAssignments.bicep"
$TemplateParameterFile = '.\managementGroups\param\roleAssignments.bicepparam'


$rbacDeployment = @{
    Name                  = $Name
    Location              = "West Europe"
    TemplateFile          = $templateFile
    templateParameterFile = $TemplateParameterFile
    Verbose               = $true
    DeleteAll             = $true
    DenySettingsMode      = "None"
}

New-AzManagementGroupDeploymentStack @rbacDeployment -ManagementGroupId gazelle-tst


