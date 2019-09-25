---
# required metadata

title: Azure Information Protection unified labeling client - Version history & support policy
description: See the release information for the Azure Information Protection unified labeling client for Windows. 
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 09/24/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:git
#ms.devlang:
ms.subservice: v2client
ms.reviewer: elkamins
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Azure Information Protection unified labeling client - Version release history and support policy

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*


You can download the Azure Information Protection unified labeling client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

After a short delay of typically a couple of weeks, the latest general availability version is also included in the Microsoft Update Catalog with a product name of **Microsoft Azure Information Protection** > **Microsoft Azure Information Protection Unified Labeling Client**, and the classification of **Updates**. This inclusion in the catalog means that you can upgrade the client by using WSUS or Configuration Manager, or other software deployment mechanisms that use Microsoft Update.

For more information, see [Upgrading and maintaining the Azure Information Protection unified labeling client](clientv2-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-unified-labeling-client).

### Servicing information and timelines

Each general availability (GA) version of the Azure Information Protection unified labeling client is supported for up to six months after the release of the subsequent GA version. The documentation does not include information about unsupported versions of the client. Fixes and new functionality are always applied to the latest GA version and will not be applied to older GA versions.

Preview versions should not be deployed for end users on production networks. Instead, use the latest preview version to see and try new functionality or fixes that are coming in the next GA version. Preview versions that are not current are not supported.

> [!NOTE]
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

### Release information

Use the following information to see what’s new or changed for a supported release of the Azure Information Protection unified labeling client for Windows. The most current release is listed first. The date format used on this page is *month/day/year*.

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the unified labeling client, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version (if available).
>  
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

This client is replacing the Azure Information Protection client (classic). To compare features and functionality with the classic client, see [Compare the clients](use-client.md#compare-the-clients).

## Versions later than 2.2.21.0

If you have a version 2 of the client that is later than 2.2.21.0, it is a preview build for testing and evaluation purposes.

**Released**: 09/17/2019

**New features:**

- Support for the [scanner](../deploy-aip-scanner.md), to inspect and label documents on-premises data stores. With this version of the scanner:
    
    - Multiple scanners can share the same SQL Server database when you configure the scanners to use the same scanner profile. This configuration makes it easier to manage multiple scanners, and results in faster scanning times. When you use this configuration, always wait for a scanner to finish installing before installing another scanner with the same profile.
    
    - You must specify a profile when you install the scanner and the scanner database is named **AIPScannerUL_\<profile_name>**. The *Profile* parameter is also mandatory for Set-AIPScanner.
    
    - You can set a default label on all documents, even if documents are already labeled. In the scanner profile or repository settings, set the **Relabel files** option to **On** with the new **Enforce default label** checkbox selected.
    
    - You can remove existing labels from all documents and this act includes removing protection if it was previously applied by a label. Protection applied independently from a label is preserved. This scanner configuration is achieved in the scanner profile or repository settings with the following settings:
        - **Label files based on content**: **Off**
        - **Default label**: **None**
        - **Relabel files**: **On** with the **Enforce default label** checkbox selected
    
    - As with the scanner from the classic client, the scanner protects Office files and PDF files. Currently, you can't configure other file types to be protected by this version of the scanner.
    
    - Known issue: New and renamed labels aren't available to select as a default label for the scanner profile or repository settings. Workarounds:
        - For new labels: In the Azure portal, [add the label](../configure-policy-add-remove-label.md) you want to use to the global policy or a scoped policy.
        - For renamed labels: In the Azure portal, go to **Azure Information Protection** > **Manage** > **Unified labeling**, and select **Publish**.
    
    You can upgrade scanners from the Azure Information Protection client (classic). After the upgrade, which creates a new database, the scanner rescans all files the first time it runs. For instructions, see [Upgrading the Azure Information Protection scanner](clientv2-admin-guide.md#upgrading-the-azure-information-protection-scanner) from the admin guide.
    
    For additional information, see the blog post announcement: [Unified labeling AIP scanner preview brings scaling out and more!](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Unified-labeling-AIP-scanner-preview-brings-scaling-out-and-more/ba-p/862552)

- The PowerShell cmdlet [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) has new parameters for when you want to [label files non-interactively](clientv2-admin-guide-powershell.md#how-to-label-files-non-interactively-for-azure-information-protection), and a [new procedure to register an app in Azure AD](clientv2-admin-guide-powershell.md#to-create-and-configure-the-azure-ad-applications-for-set-aipauthentication---preview-client). Example scenarios include the scanner and automated PowerShell scripts to label documents.

- Matched custom sensitive information types are sent to [Azure Information Protection analytics](../reports-aip.md).

- The applied label displays the configured color for the label, if a [color has been configured](clientv2-admin-guide-customizations.md#specify-a-color-for-the-label).

- When you add or change protection settings to a label, the client reapplies the label with these latest protection settings when the document is next saved. Similarly, the scanner reapplies the label with these latest protection settings when the document is next scanned in enforce mode.

- New cmdlet, [Export-AIPLogs](https://docs.microsoft.com/powershell/module/azureinformationprotection/export-aiplogs), to gather all log files from %localappdata%\Microsoft\MSIP\Logs and saves them to a single, compressed file that has a .zip format. This file can then be sent to Microsoft Support if you are requested to send log files to help investigate a reported issue.

**Fixes:**

- You can successfully make changes to a protected file using File Explorer and right-click after a password for the file has been removed.


## Version 2.2.21.0

**Released**: 09/03/2019

**Fixes:**

- When you use the advanced setting [OutlookDefaultLabel](clientv2-admin-guide-customizations.md#set-a-different-default-label-for-outlook) to set a different default label for Outlook, and the label you specify doesn't have any sublabels for the label policy, the label is correctly applied.

- When the Azure Information Protection client is used in an Office app, a user with an Active Directory account that isn't configured for single sign-on is prompted to authenticate for Azure Information Protection. After successfully authenticating, the client status correctly changes to online, which enables labeling functionality.

## Version 2.2.19.0

**Released**: 08/06/2019

Supported through 03/03/2020

**Fixes:**

- The client can successfully download its policy and display the current sensitivity labels. This fix is required after upgrading from a previous version and you haven't configured any custom information types in your labeling center.

- General performance and stability improvements.

## Version 2.2.14.0

**Released**: 07/15/2019

Supported through 02/06/2020

**New features:**

- Support for [advanced settings](clientv2-admin-guide-customizations.md#how-to-configure-advanced-settings-for-the-client-by-using-office-365-security--compliance-center-powershell) that you configure with PowerShell for the Security & Compliance Center.
    
    These advanced settings support the following customizations:
     - [Display the Information Protection bar in Office apps](clientv2-admin-guide-customizations.md#display-the-information-protection-bar-in-office-apps)
    - [Exempt Outlook messages from mandatory labeling](clientv2-admin-guide-customizations.md#exempt-outlook-messages-from-mandatory-labeling)
    - [Enable recommended classification in Outlook](clientv2-admin-guide-customizations.md#enable-recommended-classification-in-outlook)
    - [Set a different default label for Outlook](clientv2-admin-guide-customizations.md#set-a-different-default-label-for-outlook)
    - [Remove "Not now" for documents when you use mandatory labeling](clientv2-admin-guide-customizations.md#remove-not-now-for-documents-when-you-use-mandatory-labeling)
    - [Remove headers and footers from other labeling solutions](clientv2-admin-guide-customizations.md#remove-headers-and-footers-from-other-labeling-solutions)
    - [Disable custom permissions in File Explorer](clientv2-admin-guide-customizations.md#disable-custom-permissions-in-file-explorer)
    - [For files protected with custom permissions, always display custom permissions to users in File Explorer](clientv2-admin-guide-customizations.md#for-files-protected-with-custom-permissions-always-display-custom-permissions-to-users-in-file-explorer)
    - [For email messages with attachments, apply a label that matches the highest classification of those attachments](clientv2-admin-guide-customizations.md#for-email-messages-with-attachments-apply-a-label-that-matches-the-highest-classification-of-those-attachments)
    - [Add "Report an Issue" for users](clientv2-admin-guide-customizations.md#add-report-an-issue-for-users)
    - [Implement pop-up messages in Outlook that warn, justify, or block emails being sent](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent)
    - [Disable sending discovered sensitive information in documents to Azure Information Protection analytics](clientv2-admin-guide-customizations.md#disable-sending-discovered-sensitive-information-in-documents-to-azure-information-protection-analytics)
    - [Send information type matches](clientv2-admin-guide-customizations.md#send-information-type-matches)
    - [Migrate labels from Secure Islands and other labeling solutions](clientv2-admin-guide-customizations.md#migrate-labels-from-secure-islands-and-other-labeling-solutions)
    - [Apply a custom property when a label is applied](clientv2-admin-guide-customizations.md#apply-a-custom-property-when-a-label-is-applied)
    - [Configure a label to apply S/MIME protection in Outlook](clientv2-admin-guide-customizations.md#configure-a-label-to-apply-smime-protection-in-outlook)
    - [Specify a default sublabel for a parent label](clientv2-admin-guide-customizations.md#specify-a-default-sublabel-for-a-parent-label)
    - [Specify a color for the label](clientv2-admin-guide-customizations.md#specify-a-color-for-the-label)

- Support for labels that are configured for user-defined permissions for Word, Excel, PowerPoint, and File Explorer. For more information, see the [Let users assign permissions](/Office365/SecurityCompliance/encryption-sensitivity-labels#let-users-assign-permissions) section in the Office documentation.

- PowerShell changes in the AzureInformationProtection module:
    - New cmdlet: [New-AIPCustomPermissions](/powershell/module/azureinformationprotection/New-AIPCustomPermissions) - replaces New-RMSProtectionLicense to create an ad-hoc policy for custom permissions
    - New parameters:
        -  *CustomPermissions* and *RemoveProtection* - added to [Set-AIPFileLabel](/powershell/module/azureinformationprotection/Set-AIPFileLabel)
        -  *OnBeHalfOf* - added to [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication), to be used instead of the *Token* parameter for non-interactive sessions
        -  *WhatIf* and *DiscoveryInfoTypes* - added to [Set-AIPFileClassification](/powershell/module/azureinformationprotection/set-aipfileclassification), so that this cmdlet can run in discovery mode without applying labels
    - Deprecated cmdlets that connect directly to a protection service: Clear-RMSAuthentication, Get-RMSFileStatus, Get-RMSServer, Get-RMSServerAuthentication, Get-RMSTemplate, Protect-RMSFile, Set-RMSServerAuthentication, Unprotect-RMSFile


**Fixes:**

- Support for [content matches](../reports-aip.md#content-matches-for-deeper-analysis) for analytics and [Set-AIPFileClassification](https://docs.microsoft.com/powershell/module/azureinformationprotection/set-aipfileclassification?view=azureipps) with the *DiscoveryInfoTypes* parameter.

- After you change to an alternative locale in Windows, you can still apply a label with protection to a PDF document.

- When a label is removed from content, protection is also removed only when it was applied as part of the label configuration. If the protection was applied independently from the label, that protection is preserved. For example, a user applied custom permissions to a file.

- When automatic labeling is configured, the label applies the first time a document is saved.

- Default labeling supports sublabels.

## Version 2.0.779.0

**Released**: 05/01/2019

Supported through 02/15/2020

This release has a single fix to resolve a race-condition issue where sometimes, no labels display in Office apps or File Explorer.

## Version 2.0.778.0

**Released**: 04/16/2019

Supported through 11/01/2019

This first general availability version of the Azure Information Protection unified labeling client for Windows supports the following features: 

- Upgrade from the Azure Information Protection client.

- Manual, automatic, and recommended labeling: For more information about configuring automatic and recommended labeling for this client, see [Apply a sensitivity label to content automatically](/Office365/SecurityCompliance/apply-sensitivity-label-automatically).

- File Explorer, right-click actions to classify and protect files, remove protection, and apply custom permissions.

- A viewer for protected text and image files, protected PDF files, and files that are generically protected.

- PowerShell commands to do the following:
    - [Set or remove a label on a document](/powershell/module/azureinformationprotection/set-aipfilelabel)
    - [Label a document after inspecting its contents](/powershell/module/azureinformationprotection/set-aipfileclassification)
    - [Read label information applied to a document](/powershell/module/azureinformationprotection/get-aipfilestatus)
    - [Authenticate to support unattended PowerShell sessions](/powershell/module/azureinformationprotection/set-aipauthentication)

- Auditing data and endpoint discovery support for central reporting by using [Azure Information Protection analytics](../reports-aip.md).

- The following label and policy settings:
    - Visual marking (headers, footers, watermarks)
    - Default labeling - currently limited to labels without sublabels
    - Labels that apply Do Not Forward and display in Outlook only
    - Justification prompts if users lower the classification level or remove a label
    - Colors for the labels

- Policy refresh from the admin centers:
    - Each time an Office app starts and every 4 hours
    - When you right-click to classify and protect a file or folder
    - When you run the PowerShell cmdlets for labeling and protection

- A Help and feedback dialog box, which includes reset settings and export logs.


## Next steps

For full details, see the [comparison tables](use-client.md#compare-the-clients).

For more information about installing and using this client: 

- For users: [Download and install the client](install-unifiedlabelingclient-app.md)

- For admins: [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)

