---
# required metadata

title: Azure Information Protection unified labeling client - Version history & support policy
description: See the release information for the Azure Information Protection unified labeling client for Windows. 
author: mlottner
ms.author: mlottner
manager: rkarlin
ms.date: 02/20/2020
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

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*


You can download the Azure Information Protection unified labeling client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

After a short delay of typically a couple of weeks, the latest general availability version is also included in the Microsoft Update Catalog with a product name of **Microsoft Azure Information Protection** > **Microsoft Azure Information Protection Unified Labeling Client**, and the classification of **Updates**. This inclusion in the catalog means that you can upgrade the client by using WSUS or Configuration Manager, or other software deployment mechanisms that use Microsoft Update.

For more information, see [Upgrading and maintaining the Azure Information Protection unified labeling client](clientv2-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-unified-labeling-client).

### Servicing information and timelines

Each general availability (GA) version of the Azure Information Protection unified labeling client is supported for up to six months after the release of the subsequent GA version. The documentation does not include information about unsupported versions of the client. Fixes and new functionality are always applied to the latest GA version and will not be applied to older GA versions.

Preview versions should not be deployed for end users on production networks. Instead, use the latest preview version to see and try new functionality or fixes that are coming in the next GA version. Preview versions that are not current are not supported.

##### General availability versions that are no longer supported:

|Client version|Date released|
|--------------|-------------|
|2.2.14.0|07/15/2019|
|2.0.779.0|05/01/2019|
|2.0.778.0|04/16/2019|

The date format used on this page is *month/day/year*.


### Release information

Use the following information to see what’s new or changed for a supported release of the Azure Information Protection unified labeling client for Windows. The most current release is listed first. The date format used on this page is *month/day/year*.

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the unified labeling client, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version (if available).
>  
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

This client is replacing the Azure Information Protection client (classic). To compare features and functionality with the classic client, see [Compare the the labeling clients for Windows computers](use-client.md#compare-the-labeling-clients-for-windows-computers).

## Version 2.6.101.0 (preview)

**Released** 1/15/2020

**New features:**

- Modification of [PowerShell](https://docs.microsoft.com/azure/information-protection/rms-client/clientv2-admin-guide-powershell) cmdlet **Set-AIPFileLabel** to enable removal of protection from PST, rar, 7zip and MSG files. This feature is disabled by default and must be turned on using the [Set-LabelPolicy](https://docs.microsoft.com/azure/information-protection/rms-client/clientv2-admin-guide-customizations) cmdlet, as described [here](https://docs.microsoft.com/azure/information-protection/rms-client/clientv2-admin-guide-customizations#enable-removal-of-protection-from-compressed-files).  

- Added ability for Azure Information Protection administrators to control when .pfile extensions are used for files. Learn more about [changing protected file types](https://docs.microsoft.com/azure/information-protection/rms-client/clientv2-admin-guide-customizations#change-which-file-types-to-protect). 

- Dynamic visual marking support added for applications and variables. Learn more about how to [configure labels for visual markings](https://docs.microsoft.com/azure/information-protection/configure-policy-markings). 

- Improvements made to [customizable policy tips for automatic and recommended labels](use-client.md).   

- Support added for [offline labeling capability](https://docs.microsoft.com/azure/information-protection/rms-client/clientv2-admin-guide-customizations#support-for-disconnected-computers) with Office apps in the unified labeling client.

- New **WordShapeNameToRemove** advanced property enables removal of content marking in Word documents made by third party applications. Learn more about how to [identify existing shape names and define them for removal using **WordShapeNameToRemove**](https://docs.microsoft.com/azure/information-protection/rms-client/clientv2-admin-guide-customizations#remove-headers-and-footers-from-other-labeling-solutions). 

- [Scanner](../deploy-aip-scanner.md) related features:
    - [Easier SharePoint on-premises and subsite discovery](https://docs.microsoft.com/azure/information-protection/quickstart-findsensitiveinfo#permission-users-to-scan-sharepoint-repositories). Setting each specific site is no longer required. 
    - Advanced property for [SQL chunk sizing](https://docs.microsoft.com/azure/information-protection/deploy-aip-scanner#storage-requirements-and-capacity-planning-for-sql-server) added.
    - Administrators now have the ability to [stop existing scans and perform a re-scan](https://docs.microsoft.com/azure/information-protection/deploy-aip-scanner#stop-a-scan) if a change was made to the default label.
    - By default, scanner now sets minimal telemetry for faster scans and reduced log size and information types are now cached in the database. Learn more about [scanner optimization](https://docs.microsoft.com/azure/information-protection/deploy-aip-scanner#optimizing-the-performance-of-the-scanner). 

**Fixes:**

- Scanner now supports separate deployments for database and the service, while **Sysadmin** rights are needed only for database deployment. 
- In instances where users attempted unsuccessfully to open protected TIFF files, and TIFF files created by RightFax, the TIFF files now open and remain stable as expected.  
- Previous corruptions of protected txt and PDF files are resolved.
- Inconsistent labeling between **Automatic** and **Manual** in Log Analytics was corrected. 
- Unexpected inheritance issues identified between new emails and a user's last opened email is now resolved.  
- Protection of .msg files as .msg.pfiles now works as expected. 
- Co-owner permissions added from Office user defined settings is now applied as expected. 
- When entering permissions downgrade justification, text can no longer be entered when other options are already selected. 


## Version 2.5.33.0

**Released**: 10/23/2019

**New features:**

- Preview version of the [scanner](../deploy-aip-scanner.md), to inspect and label documents on-premises data stores. With this version of the scanner:
    
    - Multiple scanners can share the same SQL Server database when you configure the scanners to use the same scanner profile. This configuration makes it easier to manage multiple scanners, and results in faster scanning times. When you use this configuration, always wait for a scanner to finish installing before installing another scanner with the same profile.
    
    - You must specify a profile when you install the scanner and the scanner database is named **AIPScannerUL_\<profile_name>**. The *Profile* parameter is also mandatory for Set-AIPScanner.
    
    - You can set a default label on all documents, even if documents are already labeled. In the scanner profile or repository settings, set the **Relabel files** option to **On** with the new **Enforce default label** checkbox selected.
    
    - You can remove existing labels from all documents and this act includes removing protection if it was previously applied by a label. Protection applied independently from a label is preserved. This scanner configuration is achieved in the scanner profile or repository settings with the following settings:
        - **Label files based on content**: **Off**
        - **Default label**: **None**
        - **Relabel files**: **On** with the **Enforce default label** checkbox selected
    
    - As with the scanner from the classic client, by default, the scanner protects Office files and PDF files. You can protect other files types when you use a [PowerShell advanced setting](clientv2-admin-guide-customizations.md#change-which-file-types-to-protect).
    
    - Event IDs for the scanner cycles starting and finishing are not written to the Windows event log. Instead, use the Azure portal for this information.
    
    - Known issue: New and renamed labels aren't available to select as a default label for the scanner profile or repository settings. Workarounds:
        - For new labels: In the Azure portal, [add the label](../configure-policy-add-remove-label.md) you want to use to the global policy or a scoped policy.
        - For renamed labels: Close and reopen the Azure portal.
    
    You can upgrade scanners from the Azure Information Protection client (classic). After the upgrade, which creates a new database, the scanner rescans all files the first time it runs. For instructions, see [Upgrading the Azure Information Protection scanner](clientv2-admin-guide.md#upgrading-the-azure-information-protection-scanner) from the admin guide.
    
    For additional information, see the blog post announcement: [Unified labeling AIP scanner preview brings scaling out and more!](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Unified-labeling-AIP-scanner-preview-brings-scaling-out-and-more/ba-p/862552)

- The PowerShell cmdlet [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) has new parameters (*AppId*, *AppSecret*, *TenantId*, *DelegatedUser*, and *OnBehalfOf*) for when you want to label files non-interactively, and also a new procedure to register an app in Azure AD. Example scenarios include the scanner and automated PowerShell scripts to label documents. For instructions, see [How to label files non-interactively](clientv2-admin-guide-powershell.md#how-to-label-files-non-interactively-for-azure-information-protection) from the admin guide.
    
    Note that *DelegatedUser* is a new parameter since the last preview version of the unified labeling client, and that the API permissions for the registered app have consequently changed.

- New PowerShell label policy advanced setting to [change which file types to protect](clientv2-admin-guide-customizations.md#change-which-file-types-to-protect).

- New PowerShell label policy advanced setting to [extend your label migration rules to SharePoint properties](clientv2-admin-guide-customizations.md#extend-your-label-migration-rules-to-sharepoint-properties).

- Matched custom sensitive information types are sent to [Azure Information Protection analytics](../reports-aip.md).

- The applied label displays the configured color for the label, if a [color has been configured](clientv2-admin-guide-customizations.md#specify-a-color-for-the-label).

- When you add or change protection settings to a label, the client reapplies the label with these latest protection settings when the document is next saved. Similarly, the scanner reapplies the label with these latest protection settings when the document is next scanned in enforce mode.

- [Support for disconnected computers](clientv2-admin-guide-customizations.md#support-for-disconnected-computers) by exporting files from one client and manually copying them to the disconnected computer. Note that this configuration is supported for labeling with File Explorer, PowerShell, and the scanner. This configuration is not supported for labeling with Office apps.

- New cmdlet, [Export-AIPLogs](https://docs.microsoft.com/powershell/module/azureinformationprotection/export-aiplogs), to gather all log files from %localappdata%\Microsoft\MSIP\Logs and saves them to a single, compressed file that has a .zip format. This file can then be sent to Microsoft Support if you are requested to send log files to help investigate a reported issue.

**Fixes:**

- You can successfully make changes to a protected file using File Explorer and right-click after a password for the file has been removed.

- You can successfully open natively protected files in the viewer without requiring the Save As, Export (EXPORT) [usage right](../configure-usage-rights.md#usage-rights-and-descriptions).

- Labels and policy settings refresh as expected without having to run [Clear-AIPAuthentication](/powershell/module/azureinformationprotection/clear-aipauthentication?), or manually delete the %LocalAppData%\Microsoft\MSIP\mip folder.

**Additional changes**

- [Reset Settings](clientv2-admin-guide.md#more-information-about-the-reset-settings-option) now deletes the %LocalAppData%\Microsoft\MSIP\mip\\*\<ProcessName.exe\>* folders instead of the %LocalAppData%\Microsoft\MSIP\mip\\*\<ProcessName\>*\mip folder.

- [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) now includes the content ID for a protected document.

## Version 2.2.21.0

**Released**: 09/03/2019

Supported through 04/23/2020

**Fixes:**

- When you use the advanced setting [OutlookDefaultLabel](clientv2-admin-guide-customizations.md#set-a-different-default-label-for-outlook) to set a different default label for Outlook, and the label you specify doesn't have any sublabels for the label policy, the label is correctly applied.

- When the Azure Information Protection client is used in an Office app, a user with an Active Directory account that isn't configured for single sign-on is prompted to authenticate for Azure Information Protection. After successfully authenticating, the client status correctly changes to online, which enables labeling functionality.

## Version 2.2.19.0

**Released**: 08/06/2019

Supported through 03/03/2020

**Fixes:**

- The client can successfully download its policy and display the current sensitivity labels. This fix is required after upgrading from a previous version and you haven't configured any custom information types in your labeling center.

- General performance and stability improvements.

## Next steps

Not sure if this is the right client to install?  See [Choose which labeling client to use for Windows computers](use-client.md#choose-which-labeling-client-to-use-for-windows-computers).

For more information about installing and using this client: 

- For users: [Download and install the client](install-unifiedlabelingclient-app.md)

- For admins: [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)

