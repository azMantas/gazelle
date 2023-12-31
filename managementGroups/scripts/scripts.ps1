function get-DeploymentStackOutputs {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ManagementGroupId
    )

    $deploymentStack = Get-AzManagementGroupDeploymentStack -ManagementGroupId $ManagementGroupId

    Write-Output "Provisioning State:"
    $deploymentStack.provisioningState

    Write-Output "Resources:"
    $deploymentStack.resources


    Write-Output "Deleted Resources:"
    $deploymentStack.deletedResources
}

get-DeploymentStackOutputs -ManagementGroupId "mountainGoat"