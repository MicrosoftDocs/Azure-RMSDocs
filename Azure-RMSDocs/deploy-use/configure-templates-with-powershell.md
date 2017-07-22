---
# required metadata

title: PowerShell for Azure RMS custom templates - AIP
description: Everything that you can do in the Azure portal to create and manage rights management templates, you can do from the command line, by using PowerShell. In addition, you can export and import templates, so that you can copy templates between tenants or perform bulk edits of complex properties in templates, such as multilingual names and descriptions.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/30/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 30ee2f77-ce16-4113-bcda-6089131849ec

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---



# PowerShell reference for custom templates

>*Applies to: Azure Information Protection, Office 365*

Everything that you can do in the Azure portal to create and manage templates, you can do from the command line, by using PowerShell. In addition, you can export and import templates, so that you can copy templates between tenants or perform bulk edits of complex properties in templates, such as multilingual names and descriptions.

You can also use export and import to back up and restore your custom templates, As a best practice, regularly back up your custom templates, so that if you make a change that was not intended, you can easily revert to a previous version.

> [!IMPORTANT]
> To use PowerShell to create and manage Azure Rights Management templates, you must have at least version 2.0.0.0 of the [Windows PowerShell module for Azure RMS](https://go.microsoft.com/fwlink/?LinkId=257721).
> 
> If you have previously installed this PowerShell module, run the following command in a PowerShell window to check the version number: `(Get-Module aadrm -ListAvailable).Version`

For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](install-powershell.md).

The cmdlets that support creating and managing templates:

- [Add-AadrmTemplate](/powershell/module/aadrm/add-aadrmtemplate)

- [Export-AadrmTemplate](/powershell/module/aadrm/export-aadrmtemplate)

- [Get-AadrmTemplate](/powershell/module/aadrm/get-aadrmtemplate)

- [Get-AadrmTemplateProperty](/powershell/module/aadrm/get-aadrmtemplateproperty)

- [Import-AadrmTemplate](/powershell/module/aadrm/import-aadrmtemplate)

- [New-AadrmRightsDefinition](/powershell/module/aadrm/new-aadrmrightsdefinition)

- [Remove-AadrmTemplate](/powershell/module/aadrm/remove-aadrmtemplate)

- [Set-AadrmTemplateProperty](/powershell/module/aadrm/set-aadrmtemplateproperty)



## See Also
[Configuring and managing templates for Azure Information Protection](configure-policy-templates.md)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]