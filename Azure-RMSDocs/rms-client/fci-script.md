---
# required metadata

title: PowerShell script for Azure RMS & FCI - AIP
description: Sample script to copy and edit, as described in the instructions for RMS protection with Windows Server File Classification Infrastructure.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/30/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: ae6d8d0f-4ebc-43fe-a1f6-26b690fd83d0
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.subservice: fci
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Windows PowerShell script for Azure RMS protection by using File Server Resource Manager FCI

This page contains the sample script to copy and edit, as described in [RMS protection with Windows Server File Classification Infrastructure](configure-fci.md).

This script uses a minimum version of **2.13** for the AzureInformationProtection module. Run the following command to check the version: `(Get-Module AzureInformationProtection -ListAvailable).Version` 

```
<#
.SYNOPSIS 
     Helper script to protect all file types using the Azure Rights Management service and FCI.
.DESCRIPTION
     Protect files with the Azure Rights Management service and Windows Server FCI, using an AIP label ID and AzureInformationProtection module minimum version 2.13.  
#>
param(
            [Parameter(Mandatory = $false)]
            [ValidateScript({ If($_ -eq "") {$true} else { if (Test-Path -Path $_ -PathType Leaf) {$true} else {throw "Can't find file specified"} } })]
            [string]$File,

            [Parameter(Mandatory = $false)]
            [string]$LabelID,

            [Parameter(Mandatory = $false)]
            [string]$AppId = "<enter your AppId here>",

            [Parameter(Mandatory = $false)]
            [string]$AppSecret = "<enter your secret here>",

            [Parameter(Mandatory = $false)]
            [string]$TenantId = "<enter your TenantId here>"
) 

# script information
[String] $Script:Version = 'version 3.4' 
[String] $Script:Name = "RMS-Protect-FCI.ps1"

#global working variables
[switch] $Script:isScriptProcess = $False # Controls the script process. If false, the script gracefully stops running.

#**Functions (general helper)***************************************
function Get-ScriptName(){ 

	return $MyInvocation.ScriptName.Substring($MyInvocation.ScriptName.LastIndexOf('\') + 1, $MyInvocation.ScriptName.LastIndexOf('.') - $MyInvocation.ScriptName.LastIndexOf('\') - 1)
}

#**Functions (script specific)**************************************

function Check-Module{

    param ([String]$Module = $(Throw "Module name not specified"))

    [bool]$isResult = $False

    #try to load the module
    if ((get-module -list -name $Module) -ne $nil)
        {

            $isResult = $True
        } else 
        
        {
            $isResult = $False
        } 

    return $isResult
}

function Protect-File ($ffile, $flabelId) {

    [bool] $returnValue = $false
    try {
            $protectReturn = Set-AIPFileLabel -File $ffile -LabelID $flabelId
            $returnValue = $true
            Write-Host ( "Information: " + "Protected File: $ffile with Template: $flabelId")
    } catch {
        Write-Host ( "ERROR" + "During protection of file: $ffile with Template: $flabelId")
    }
    return $returnValue
}

function Set-AIPConnection ($fappId, $fsecret, $ftenantId) {

	[bool] $returnValue = $false
    try {
               Set-AIPAuthentication -AppId $fappId -AppSecret $fsecret -TenantId $ftenantId
        Write-Host ("Information: " + "Connected to Azure Information Protection Service with TenantId: $ftenantId using AppId: $fappId")
        $returnValue = $true
    } catch {
        Write-Host ("ERROR" + "During connection to Azure Information Protection Service with TenantId: $ftenantId using AppId: $fappId")
    }
    return $returnValue
}

#**Main Script (Script)*********************************************
Write-Host ("-== " + $Script:Name + " " + $Version + " ==-")

$Script:isScriptProcess = $True

# Validate Azure Information Protection connection by checking the module and then connection
if ($Script:isScriptProcess) {
 		if (Check-Module -Module AzureInformationProtection){
    	$Script:isScriptProcess = $True
	} else {

		Write-Host ("The AzureInformationProtection module is not loaded") -foregroundcolor "yellow" -backgroundcolor "black"	        
		$Script:isScriptProcess = $False
	}
}

if ($Script:isScriptProcess) {
	#Write-Host ("Try to connect to Azure Information Protection with AppId: $AppId and TenantID: $TenantId" )	
    if (Set-AIPConnection $AppId $AppSecret $TenantId) {
	    Write-Host ("Connected to Azure Information Protection")

    } else {
		Write-Host ("Couldn't connect to Azure Information Protection") -foregroundcolor "yellow" -backgroundcolor "black"
		$Script:isScriptProcess = $False
	}
}

#  Start working loop
if ($Script:isScriptProcess) {
    if ( !(($File -eq $null) -or ($File -eq "")) ) {
        if (!(Protect-File -ffile $File -ftemplateId $TemplateID)) {
            $Script:isScriptProcess = $False           
        }
    }
}

# Closing
if (!$Script:isScriptProcess) { Write-Host "ERROR occurred during script process" -foregroundcolor "red" -backgroundcolor "black"}
write-host ("-== " + $Script:Name + " " + $Version + "  ==-")
if (!$Script:isScriptProcess) { exit(-1) } else {exit(0)}
```

---

Back to [RMS protection with Windows Server File Classification Infrastructure](configure-fci.md).
