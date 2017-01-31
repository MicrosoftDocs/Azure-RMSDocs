---
# required metadata

title: Using PowerShell with the Azure Information Protection client | Azure Information Protection
description: Instructions and information for admins to manage the Azure Information Protection client by using PowerShell.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/30/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 4f9d2db7-ef27-47e6-b2a8-d6c039662d3c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Using PowerShell with the Azure Information Protection client

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*

When you install the Azure Information Protection client, PowerShell commands are automatically installed so that you can manage the client by running commands that you can put into scripts for automation.

The cmdlets are installed with the PowerShell module **AIP**, which replaces the RMSProtection module that was installed with the RMS Protection Tool. If you have the RMSProtection tool installed when you install the Azure Information Protection client, the RMSProtection module is automatically uninstalled.

The AIP module includes all the Rights Management cmdlets from the RMS Protection Tool, and two new cmdlets for labeling:

- [Get-AIPFileStatus](/powershell/rmsprotection/vlatest/get-aipfilestatus)

- [Set-AIPFileLabel](/powershell/rmsprotection/vlatest/set-aipfilelabel) 

Examples for using these cmdlets:

- For a shared folder, identify all files with a specific label.

- For a shared folder, apply a specified label to all files that do not have a label.

This module installs in **\ProgramFiles (x86)\Microsoft Azure Information Protection** and adds this folder to the **PSModulePath** system variable. The .dll for this module is named **AIP.dll**.

As with the RMSProtection module, the current release of the AIP module has the following limitations:

- You can unprotect Outlook personal folders (.pst files), but you cannot currently natively protect these files or other container files by using this PowerShell module.

- You can unprotect Outlook protected email messages (.rpmsg files) when they are in a Outlook personal folder (.pst), but you cannot unprotect .rpmsg files outside a personal folder.

- For Azure Information Protection and for Azure Rights Management protection, the cmdlets are not supported outside North America. As a workaround, you can edit the registry, as documented in [about_RMSProtection_AzureRMS](/powershell/rmsprotection/vlatest/about_RMSProtection_AzureRMS). Without this registry change, authentication to the service fails outside the Azure North America region.

Before you start to use these cmdlets, see the additional prerequisites and instructions that corresponds to your deployment:

- [How to use the PowerShell commands for the Azure Information Protection client and the Azure Rights Management service](client-admin-guide-powershell-aip-azurerms.md)

	- Applicable if you use classification-only or classification with Azure Rights Management protection: You have a subscription that includes Azure Information Protection (for example, Enterprise Mobility + Security).
	- Applicable if you use protection-only with the Azure Rights Management service: You have a subscription that includes the Azure Rights Management service (for example, Office 365 E3 and Office 365 E5).

- [How to use the PowerShell commands for Active Directory Rights Management Services](client-admin-guide-powershell-adrms.md)

	- Applicable if you use protection-only with the on-premises version of Azure Rights Management; Active Directory Rights Management Services (AD RMS).



- AD RMS: [about_RMSProtection_ADRMS](/powershell/rmsprotection/vlatest/about_RMSProtection_ADRMS)


## Next steps
See the following for additional information that you might need to support the Azure Information Protection client:

- [Client files and usage logging](client-admin-guide-files-and-logging.md)

- [Document tracking](client-admin-guide-document-tracking.md)

- [File types supported](client-admin-guide-file-types.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
