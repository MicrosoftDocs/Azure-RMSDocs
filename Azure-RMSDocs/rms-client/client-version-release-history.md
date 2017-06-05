---
# required metadata

title: Azure Information Protection client&colon; Version release history
description: See what's new or changed in a release of the Azure Information Protection client for Windows. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 06/06/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid:  6ebd0ca3-1864-4b3d-bb3e-a168eee5eb1d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Azure Information Protection client: Version release history

>*Applies to: Azure Information Protection*

The Azure Information Protection team regularly updates the Azure Information Protection client for fixes and new functionality. The client is included in the Microsoft Update Catalog (category: **Azure Information Protection**) and you can always download the latest  general availability (GA) release version and the upcoming version (the preview version) from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

Preview versions should not be deployed for end users on production networks. Instead, use preview versions to see and try new functionality or fixes that are coming in the next GA version. 

Use the following information to see what’s new or changed for a GA release. The most current release is listed first. For information about the current preview version, see the information on the download page.

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the Azure Information Protection client, first check that it is not a problem with the latest GA release. If it is, then check the current preview version.
>  
> If the problem remains, see the [Support options and community resources](../get-started/information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).


## Version 1.7.210.0

**Released**: 06/06/2017

This version includes the MSIPC version 1.0.2217.1 of the RMS client.

**Fixes**:

- All labeling and classification cmdlets are now supported on computers that are not connected to the Internet but have a valid Azure Information Protection policy.

- General fixes for stability that include:

    - For Outlook: Fixes for crashes, high memory consumption, and display issues for menus.
    
    - For Word, Excel, and PowerPoint: Fixes for high CPU usage, display issues when saving large Excel files, or the application stops responding. 
    
    Also for these applications, to improve performance for Office 2016 with SharePoint Online and OneDrive for Business, apply automatic and recommended labeling when the file closes rather than when the file saves. Simillarly, if the setting **All documents and email must have a label** is enabled, this setting is applied only when the file closes. The exception is for Word 2016 and Excel 2016 and the user selects the **Save As** option, when automatic and recommended labeling is applied or the user is prompted to select a label.

**New features**:

- New PowerShell cmdlet, [Set-AIPFileClassification](/powershell/azureinformationprotection/vlatest/set-aipfileclassification). When you run this cmdlet, it inspects the file contents and automatically applies labels to unlabeled files, according to the conditions that you specify in the Azure Information Protection policy.


## Version 1.4.21.0

**Released**: 03/15/2017

**Change to requirements:**

The previous version introduced the new prerequisite of Microsoft .NET Framework 4.6.2 for the full client. Although not recommended, you can bypass this prerequisite with a custom installation parameter, **DowngradeDotNetRequirement**. For more information, see the [client installation section](client-admin-guide.md#how-to-install-the-azure-information-protection-client-for-users) from the admin guide.


**Fixes**:

- Support for mapped drives to classify and protecting files.

- Support for large files ( >250 MB) in the viewer. 

- When HYOK is configured, Outlook can apply labels that are configured to use Azure Rights Management templates or AD RMS templates.


**New features**:

- The ability to set custom permissions from your Office application, which lets you set protection just for you, for external groups, or all users in another organization. For more information, see [Set custom permissions for a document](client-classify-protect.md#set-custom-permissions-for-a-document) from the user guide.
    
- PDF files now support labels that apply classification-only.

- For PDF files, the viewer now supports options such as search, zoom, and rotate. To use these options, right-click on the file when it is displayed in the viewer.


## Version 1.3.155.2

**Released**: 02/08/2017

**New requirements**:

Microsoft .NET Framework

- This version of the Azure Information Protection client requires a minimum version of Microsoft .NET Framework 4.6.2 and if this is missing, the installer tries to download and install it. A computer restart might be required after the Azure Information Protection client installation is complete.

- If the Azure Information Protection Viewer is installed separately, this requires a minimum version of Microsoft .NET Framework 4.5.2 and if this is missing, the installer does not download or install it.

**New features**:

- A new, unified client that combines the features from the Rights Management sharing application for Windows with the Azure Information Protection client. Includes:
    
    - Integration with Windows File Explorer (right-click) to apply labels and protection. Supports additional file formats and multiple file selection.
    - A viewer for protected documents (includes protected PDF for SharePoint).
    - PowerShell cmdlets to get and set labels for files that are stored locally or on network shares. These cmdlets install with the cmdlets that previously shipped with the RMS Protection Tool (RMSProtection module).
    - Client usage logs that record information such as which label was applied, how, and by whom.

This client version is the [General Availability release](https://blogs.technet.microsoft.com/enterprisemobility/2017/02/08/azure-information-protection-december-update-moves-to-general-availability/) of the preview client that was first announced in December 2016. For more information about this version of the client, see the following guides:

- [Azure Information Protection client administrator guide](client-admin-guide.md)

- [Azure Information Protection user guide](client-user-guide.md)


## Version 1.2.4.0

**Released**: 10/27/2016

**Fixes**:

- Client installation completes when the Windows Update service is disabled.

- In Office 2016, when you save a document and an applied label is configured for a header or footer, the cursor does not jump to the header or footer.

- Automatic classification works in Word for text in bundled text boxes.

**New feature**:

- Diagnostic tests and a reset option that a user can run from the Office application when the Azure Information Protection client is installed: On the **Home** tab, in the **Protection** group, click **Protect**, click **Help and feedback**, and then click **Run diagnostics**. 

    For more information about this option, see the [Additional checks and troubleshooting](client-admin-guide.md#additional-checks-and-troubleshooting) section from the admin guide.

## Version 1.1.23.0

**Released**: 10/01/2016

General Availability.

## Next steps

For more information about installing the client:

- For users: [Download and install the client](install-client-app.md)

- For admins: [Azure Information Protection client administrator guide](client-admin-guide.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]