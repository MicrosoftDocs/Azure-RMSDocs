---
# required metadata

title: PowerShell reference for custom templates | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
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
Everything that you can do in the Azure classic portal to create and manage templates, you can do from the command line, by using PowerShell. In addition, you can export and import templates, so that you can copy templates between tenants or perform bulk edits of complex properties in templates, such as multilingual names and descriptions.

You can also use export and import to back up and restore your custom templates, As a best practice, regularly back up your custom templates, so that if you make a change that was not intended, you can easily revert to a previous version.

> [!IMPORTANT]
> To use Windows PowerShell to create and manage Azure RMS rights policy templates, you must have at least version 2.0.0.0 of the [Windows PowerShell module for Azure RMS](http://go.microsoft.com/fwlink/?LinkId=257721).
> 
> If you have previously installed this PowerShell module, run the following command in a PowerShell window to check the version number: `(Get-Module aadrm -ListAvailable).Version`

For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](install-powershell.md).

The cmdlets that support creating and managing templates:

-   [Add-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727075.aspx)

-   [Export-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727078.aspx)

-   [Get-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727079.aspx)

-   [Get-AadrmTemplateProperty](https://msdn.microsoft.com/library/azure/dn727081.aspx)

-   [Import-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727077.aspx)

-   [New-AadrmRightsDefinition](https://msdn.microsoft.com/library/azure/dn727080.aspx)

-   [Remove-AadrmTemplate](https://msdn.microsoft.com/library/azure/dn727082.aspx)

-   [Set-AadrmTemplateProperty](https://msdn.microsoft.com/library/azure/dn727076.aspx)



## See Also
[Configure Custom Templates for Azure Rights Management](configure-custom-templates.md)