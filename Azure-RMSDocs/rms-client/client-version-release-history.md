---
# required metadata

title: Azure Information Protection client&colon; Version release history
description: See what's new or changed in a release of the Azure Information Protection client for Windows. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 11/28/2017
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

The Azure Information Protection team regularly updates the Azure Information Protection client for fixes and new functionality. The client is included in the Microsoft Update Catalog (category: **Azure Information Protection**) and you can always download the latest general availability (GA) release version and the current preview version from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018). 

Preview versions should not be deployed for end users on production networks. Instead, use preview versions to see and try new functionality or fixes that are coming in the next GA version. 

Use the following information to see what’s new or changed for a release. The most current release is listed first. 

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the Azure Information Protection client, first check that it is not a problem with the latest GA release. If it is, then check the current preview version.
>  
> For technical support, see the [Support options and community resources](../get-started/information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

## Versions later than 1.10.56.0

If you have a version of the client that is later than 1.10.56.0, it is a preview build for testing and evaluation purposes.

The current preview version is **1.17.16.0** and has the following changes since the current GA version of the client.

This version includes the MSIPC version 1.0.3219.0619 of the RMS client.

**New features**:

- The preview of the Azure Information Protection scanner: The PowerShell module that is included with the client has cmdlets to install and configure the scanner. For instructions, see [Deploying the Azure Information Protection scanner to automatically classify and protect files](../deploy-use/deploy-aip-scanner.md). 

- For Office apps, automatic and recommended classification runs continuously in the background, instead of running when documents are saved. With this change in behavior, you can now apply automatic and recommended classification to documents that are stored in SharePoint Online. [More information](../deploy-use/configure-policy-classification.md#how-automatic-or-recommended-labels-are-applied) 

- A new advanced client setting so that Outlook doesn't apply the default label that is configured in the Azure Information Protection policy. Instead, Outlook can apply a different default label, or no label. [More information](client-admin-guide-customizations.md#set-a-different-default-label-for-outlook) 

- For Office apps, when you specify custom permissions, you can now browse and select users from an address book icon. This option brings parity to the user experience when you specify custom permissions by using File Explorer.

**Fixes**:

Fixes for stability and for specific scenarios that include:

- Prevent Outlook hanging when Outlook reminders are used.

- Bootstrap succeeds in Office 64-bit, so that you can protect documents and emails.

- You can now configure a label for user defined permissions for Word, Excel, PowerPoint, and File Explorer and also use the advanced client setting to hide the custom permissions options. [More information](client-admin-guide-customization.mds#make-the-custom-permissions-options-unavailable-to-users) 

- Fall back to the Calibri font if visual markers in the Azure Information Protection policy are configured for a font name that is not installed on the client.

- Prevent Office crashes after the Azure Information Protection client is upgraded.

- For Office apps, improve performance and memory consumption.

- When you configure a label for user defined permissions and HYOK (AD RMS) protection, the protection no longer incorrectly uses the Azure Rights Management service.

Fixes for a better user experience, that include:

- Support for sharp graphics and text for dynamic dot per inch (DDPI) monitors. Applies to File Explorer, right-click to classify and protect files, to the Azure Information Protection Viewer, and to the Click-to-Run version of Office 2016.


## Version 1.10.56.0

**Released**: 09/18/2017

This version includes the MSIPC version 1.0.3219.0619 of the RMS client.

**New features**:

- Support for the new Office 365 DLP conditions that you can configure for a label. For more information, see [Configure conditions for an Azure Information Protection label](../deploy-use/configure-policy-classification.md).

- Support for labels that are configured for user-defined actions. For Outlook, this label automatically applies the Outlook Do Not Forward option. For Word, Excel, PowerPoint, and File Explorer, this label prompts the user to specify custom permissions. For more information, see [Configure an Azure Information Protection label for protection](../deploy-use/configure-policy-protection.md).

- Labels are displayed from the **Protect** button on the Office ribbon, in addition to displaying on the Information Protection bar. 

- Native protection for the following Visio file types: .vsdm, .vsdx, .vssm, .vssx, .vstm, .vstx

- Support for advanced client configurations that you configure in the Azure portal. These configurations include the following:
    
    - [Hide the Do Not Forward button in Outlook](../rms-client/client-admin-guide-customizations.md#hide-the-do-not-forward-button-in-outlook)
    
    - [Make the custom permissions options unavailable to users](../rms-client/client-admin-guide-customizations.md#make-the-custom-permissions-options-unavailable-to-users)
    
    - [Permanently hide the Azure Information Protection bar](../rms-client/client-admin-guide-customizations.md#make-the-custom-permissions-options-unavailable-to-users)
    
    - [Enable recommended classification in Outlook](../rms-client/client-admin-guide-customizations.md#enable-recommended-classification-in-outlook)

- For PowerShell, support to label files non-interactively by using the new PowerShell cmdlets, [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) and [Clear-AIPAuthentication](/powershell/module/azureinformationprotection/clear-aipauthentication). For more information how to use these cmdlets, see the [PowerShell section](../rms-client/client-admin-guide-powershell.md#how-to-label-files-non-interactively-for-azure-information-protection) of the admin guide.

- For the PowerShell cmdlets, [Set-AIPFileLabel](/powershell/module/azureinformationprotection/set-aipfilelabel) and [Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification), there are new parameters: **Owner** and **PreserveFileDetails**. These parameters let you specify an email address for the Owner custom property, and leave the date unchanged for documents that you label.

**Fixes**:

Fixes for stability and for specific scenarios that include:

- Support for generically protecting large files that previously could cause corruption if larger than 1 GB. Now, the file size is limited only by available hard disk space and available memory. For more information about file size limitations, see [File sizes supported for protection](client-admin-guide-file-types.md#file-sizes-supported-for-protection) from the admin guide.

- The Azure Information Protection client viewer opens protected PDF (.ppdf) files as view-only.

- Support for labeling and protection of files stored on SharePoint Server.

- Watermarks now support multiple lines. In addition, visual markings are now applied to a document on the [first save only](../deploy-use/configure-policy-markings.md#when-visual-markings-are-applied) rather than every time a document is saved.

- The **Run Diagnostics** option in the **Help and Feedback** dialog box is replaced with **Reset Settings**. The behavior for this action has changed to include signing out the user and deleting the Azure Information Protection policy. For more information, see [More information about the Reset Settings option](..\rms-client\client-admin-guide.md#more-information-about-the-reset-settings-option) from the admin guide.

- Support for proxy authentication.

Fixes for a better user experience, that include:

- Email validation when users specify custom permissions. Also, multiple email addresses can now be specified by pressing Enter.

- The parent label is not displayed when all its sub-labels are configured for protection and the client does not have an edition of Office that supports protection. 

## Version 1.7.210.0

**Released**: 06/06/2017

This version includes the MSIPC version 1.0.2217.1 of the RMS client.

**New features**:

- New PowerShell cmdlet, [Set-AIPFileClassification](/powershell/module/azureinformationprotection/Set-AIPFileClassification). When you run this cmdlet, it inspects the file contents and automatically applies labels to unlabeled files, according to the conditions that you specify in the Azure Information Protection policy.

**Fixes**:

- All labeling and classification cmdlets are now supported on computers that are not connected to the Internet but have a valid Azure Information Protection policy.

- For consistency, an output parameter from the [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) cmdlet is changed from British English (**IsLabelled**) to American English (**IsLabeled**). If you have scripts or automated processes that look for this parameter, update the spelling for this parameter.

- General fixes for stability that include:

    - For Outlook: Fixes for crashes, high memory consumption, and display issues for menus.
    
    - For Word, Excel, and PowerPoint: Fixes for high CPU usage, display issues when saving large Excel files, or the application stops responding. 
    
    Also for these applications, to improve performance for Office 2016 with SharePoint Online and OneDrive for Business, automatic and recommended labeling is applied when the file closes rather than when the file saves (automatically saves or the user chooses to save). Similarly, if the setting **All documents and email must have a label** is enabled, users are not prompted to select a label until the file closes. The exception is for Word 2016 and Excel 2016 and the user selects the **Save As** option. Then, this action triggers these labeling behaviors if they are configured. 

## Version 1.4.21.0

**Released**: 03/15/2017

**Change to requirements:**

The previous version introduced the new prerequisite of Microsoft .NET Framework 4.6.2 for the full client. Although not recommended, you can bypass this prerequisite with a custom installation parameter, **DowngradeDotNetRequirement**. For more information, see [Install the Azure Information Protection client for users](client-admin-guide-install.md) from the admin guide.

**New features**:

- The ability to set custom permissions from your Office application, which lets you set protection just for you, for external groups, or all users in another organization. For more information, see [Set custom permissions for a document](client-classify-protect.md#set-custom-permissions-for-a-document) from the user guide.
    
- PDF files now support labels that apply classification-only.

- For PDF files, the viewer now supports options such as search, zoom, and rotate. To use these options, right-click on the file when it is displayed in the viewer.

**Fixes**:

- Support for mapped drives to classify and protecting files.

- Support for large files (greater than 250 MB) in the Azure Information Protection client viewer. 

- When HYOK is configured, Outlook can apply labels that are configured to use Azure Rights Management templates or AD RMS templates.

## Version 1.3.155.2

**Released**: 02/08/2017

**New requirements**:

Microsoft .NET Framework

- This version of the Azure Information Protection client requires a minimum version of Microsoft .NET Framework 4.6.2 and if this is missing, the installer tries to download and install it. A computer restart might be required after the Azure Information Protection client installation is complete.

- If the Azure Information Protection Viewer is installed separately, this requires a minimum version of Microsoft .NET Framework 4.5.2 and if this is missing, the installer does not download or install it.

**New features**:

- A new, unified client that combines the features from the Rights Management sharing application for Windows with the Azure Information Protection client. Includes:
    
    - Integration with Windows File Explorer (right-click) to apply labels and protection. Supports additional file formats and the selection of multiple files.
    - A viewer for protected documents (includes protected PDF for SharePoint).
    - PowerShell cmdlets to get and set labels for files that are stored locally or on network shares. These cmdlets install with the cmdlets that previously shipped with the RMS Protection Tool (RMSProtection module).
    - Client usage logs that record information such as which label was applied, how, and by whom.

This client version is the [General Availability release](https://blogs.technet.microsoft.com/enterprisemobility/2017/02/08/azure-information-protection-december-update-moves-to-general-availability/) of the preview client that was first announced in December 2016. For more information about this version of the client, see the following guides:

- [Azure Information Protection client administrator guide](client-admin-guide.md)

- [Azure Information Protection user guide](client-user-guide.md)


## Version 1.2.4.0

**Released**: 10/27/2016

**New feature**:

- Diagnostic tests and a reset option that a user can run from the Office application when the Azure Information Protection client is installed: On the **Home** tab, in the **Protection** group, click **Protect**, click **Help and feedback**, and then click **Run diagnostics**. 

    For more information about this option, see the [Additional checks and troubleshooting](client-admin-guide.md#installation-checks-and-troubleshooting) section from the admin guide.

**Fixes**:

- Client installation completes when the Windows Update service is disabled.

- In Office 2016, when you save a document and an applied label is configured for a header or footer, the cursor does not jump to the header or footer.

- Automatic classification works in Word for text in bundled text boxes.


## Version 1.1.23.0

**Released**: 10/01/2016

General Availability.

## Next steps

For more information about installing and using the client:

- For users: [Download and install the client](install-client-app.md)

- For admins: [Azure Information Protection client administrator guide](client-admin-guide.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]
