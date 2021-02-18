---
# required metadata

title: Azure Information Protection unified labeling client - Version history & support policy
description: Find out what's new for the Azure Information Protection (AIP) unified labeling client for Windows.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 02/14/2021
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

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
>*If you have Windows 7 or Office 2010, see [AIP and legacy Windows and Office versions](../known-issues.md#aip-and-legacy-windows-and-office-versions).*
>
>***Relevant for**: [AIP unified labeling client only](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the classic client, see [AIP classic client version release history and support policy](client-version-release-history.md).*

You can download the Azure Information Protection unified labeling client from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018).

After a short delay of typically a couple of weeks, the latest general availability version is also included in the Microsoft Update Catalog. Azure Information Protection versions have a product name of **Microsoft Azure Information Protection** > **Microsoft Azure Information Protection Unified Labeling Client**, and a classification of **Updates**.

Including Azure Information Protection in the catalog means that you can upgrade the client using WSUS or Configuration Manager, or other software deployment mechanisms that use Microsoft Update.

For more information, see [Upgrading and maintaining the Azure Information Protection unified labeling client](clientv2-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-unified-labeling-client).

## Servicing information and timelines

Each general availability (GA) version of the Azure Information Protection unified labeling client is supported for up to six months after the release of the subsequent GA version. The documentation does not include information about unsupported versions of the client. Fixes and new functionality are always applied to the latest GA version and will not be applied to older GA versions.

Noted Azure Information Protection features are currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

### General availability versions that are no longer supported

|Client version|Date released|
|--------------|-------------|
| 2.7.96  |01/20/2021 |
|2.6.111.0 | 03/09/2020|
|2.5.33.0 |10/23/2019|
|2.2.21.0|09/03/2019|
|2.2.19.0|08/06/2019|
|2.2.14.0|07/15/2019|
|2.0.779.0|05/01/2019|
|2.0.778.0|04/16/2019|
| | |

The date format used on this page is *month/day/year*.

### Release information

Use the following information to see what's new or changed for a supported release of the Azure Information Protection unified labeling client for Windows. The most current release is listed first. The date format used on this page is *month/day/year*.

The latest version of Azure Information Protection is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the unified labeling client, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version (if available).
>
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

The unified labeling client replaces the Azure Information Protection classic client. To compare features and functionality with the classic client, see [Compare the labeling solutions for Windows computers](use-client.md#compare-the-labeling-solutions-for-windows-computers).

## Version 2.10.x (Public preview)

Unified labeling scanner and client version 2.10.x

**Released** 03/15/2021
### Usage logging in the Windows event log

The unified labeling client now logs user activity to the local Windows event log. 

For more information, see [Usage logging for the Azure Information Protection unified labeling client](clientv2-admin-guide-files-and-logging.md#usage-logging-for-the-azure-information-protection-unified-labeling-client).

### Scanner diagnostics tool improvements

With the upgrade to version 2.10.x, running the [Start-AIPScannerDiagnostics](/powershell/module/azureinformationprotection/start-aipscannerdiagnostics?view=azureipps) cmdlet with the **Verbose** parameter prints the last 10 errors from the scanner log.

To print more or fewer errors, use the new **VerboseErrorCount parameter** to define the number of errors you want to print.

For more information, see [Using PowerShell with the Azure Information Protection unified client](clientv2-admin-guide-powershell.md) and [Troubleshooting your unified labeling on-premises scanner deployment](../deploy-aip-scanner-tsg.md).

### Fixes and improvements

The following fixes were delivered in version 2.10.x of the Azure Information Protection unified labeling client and scanner:

- Added support for removing a protected label when the [File API engine](/information-protection/develop/concept-profile-engine-file-engine-cpp) isn't loaded in Outlook. <!-- when might this occur? when should the regular user be concerned about it? -->

- Fixed issues for mandatory labeling functionality when opening protected PowerPoint files with [Track and Revoke](track-and-revoke-admin.md) enabled. <!-- and async?>

- Fixed issues for opening protected files with inactive labels with the File Explorer and the [AIP Viewer app](clientv2-view-use-files.md).

- The [PowerPointRemoveAllShapesByShapeName](clientv2-admin-guide-customizations.md#remove-all-shapes-of-a-specific-shape-name) advanced setting no longer requires that you also define the [ExternalContentMarkingToRemove](clientv2-admin-guide-customizations.md#how-to-configure-externalcontentmarkingtoremove) setting. Now you can define PowerPointRemoveAllShapesByShapeName on its own.

- Fixed an issue where an empty option would appear on [customized Outlook popup messages](clientv2-admin-guide-customizations.md#customize-outlook-popup-messages) when only two options for the user to select were configured for the popup message.

- The AIP viewer app now supports opening files without a labeling policy, to support protection-only scenarios.

- Fixed issues where audit logs for [discovery](../audit-logs.md#discover-audit-logs) and [new label](../audit-logs.md#new-label-audit-logs) events aren't sent from Outlook. 

- Fixes to prevent [PowerShell](clientv2-admin-guide-powershell.md) from behaving unexpectedly in client versions after 2.8.x.

- Fixes to ensure that a [justification prompt](clientv2-admin-guide-customizations.md#customize-justification-prompt-texts-for-modified-labels) appears in Outlook, when a user downgrades a classification label for the second time in the same Outlook session.

## Version 2.9.116 

Unified labeling scanner and client version 2.9.116 

**Released** 02/08/2021

**Fixed issues** Users are now able to view protected files as expected in the following scenarios:

- When protected files are shared with users who don’t have an AIP policy configured, such as external users. This issue had occurred only with the [AIP Viewer app](clientv2-view-use-files.md).

- When content with a scoped label is shared with users or groups not included in the label's scope. This issue had occurred both with the [AIP Viewer app](clientv2-view-use-files.md) and when viewing or classifying the shared content via the [File Explorer](clientv2-classify-protect.md#using-file-explorer-to-classify-and-protect-files).

For more information, see the [AIP unified labeling client user guide](clientv2-user-guide.md).
## Version 2.9.111.0

Unified labeling scanner and client version 2.9.111.0

**Released** 01/13/2021

**Supported through** 08/08/2021

This version includes the following new features, fixes, and enhancements for the unified labeling scanner and client:

- **New features for the scanner**:

    - [PowerShell support for disconnected scanner servers](#powershell-support-for-disconnected-scanner-servers)
    - [Support for NFS repositories in content scan jobs](#support-for-nfs-repositories-in-content-scan-jobs-public-preview) (Public preview)
    - [Added support for additional sensitive information types](#added-support-for-additional-sensitive-information-types)

- **New features for the client**:

    - [Track document access and revoke access](#track-document-access-and-revoke-access-public-preview) (Public preview)
    - [Added support for additional sensitive information types](#added-support-for-additional-sensitive-information-types)

- **Fixes and improvements**:

    - [Fixes and improvements for the unified labeling scanner](#fixes-and-improvements-for-the-unified-labeling-scanner---version-291110)
    - [Fixes and improvements for the unified labeling client](#fixes-and-improvements-for-the-unified-labeling-client---version-291110)

- **Known issue**: An issue was identified in the latest GA version (2.9.111) where some users were not able to view protected files in the following scenarios:

    - When protected files are shared with users who don’t have an AIP policy configured, such as external users. This issue occurs only with the [AIP Viewer app](clientv2-view-use-files.md).

	- When content with a scoped label is shared with users or groups not included in the label's scope. This issue occurs both with the [AIP Viewer app](clientv2-view-use-files.md) and when viewing or classifying the shared content via the [File Explorer](clientv2-classify-protect.md#using-file-explorer-to-classify-and-protect-files).

### PowerShell support for disconnected scanner servers

The [Azure Information Protection on-premises scanner](../deploy-aip-scanner.md) now supports managing content scan jobs over PowerShell, for scanner servers that cannot connect to the internet, or for scanners in an [Azure China 21Vianet environment (China sovereign cloud)](/microsoft-365/admin/services-in-china/parity-between-azure-information-protection#manage-azure-information-protection-content-scan-jobs).

To support disconnected or Azure China 21Vianet scanner servers, we've added the following new cmdlets:

|Cmdlet  |Description  |
|---------|---------|
|**[Add-AIPScannerRepository](/powershell/module/azureinformationprotection/add-aipscannerrepository)**     | Adds a new repository to your content scan job.        |
|**[Get-AIPScannerContentScanJob](/powershell/module/azureinformationprotection/get-aipscannercontentscanjob)**     |      Gets details about your content scan job.   |
|**[Get-AIPScannerRepository](/powershell/module/azureinformationprotection/get-aipscannerrepository)**     |  Gets details about repositories defined for your content scan job.       |
|**[Remove-AIPScannerContentScanJob](/powershell/module/azureinformationprotection/remove-aipscannercontentscanjob)**       |    Deletes your content scan job.     |
| **[Remove-AIPScannerRepository](/powershell/module/azureinformationprotection/remove-aipscannerrepository)**    |   Removes a repository from your content scan job.      |
|**[Set-AIPScannerContentScanJob](/powershell/module/azureinformationprotection/set-aipscannercontentscanjob)**     |   Defines settings for your content scan job.      |
**[Set-AIPScannerRepository](/powershell/module/azureinformationprotection/set-aipscannerrepository)**     |   Defines settings for an existing repository in your content scan job.      |
| | |

The [**Set-MIPNetworkDiscovery**](/powershell/module/azureinformationprotection/set-mipnetworkdiscovery) cmdlet was also added to provide additional support, enabling you to update the installation settings for the Network Discovery service via PowerShell.

For more information, see [When the scanner server cannot have internet connectivity](../deploy-aip-scanner-prereqs.md#restriction-the-scanner-server-cannot-have-internet-connectivity) and [Configure the scanner](../deploy-aip-scanner-configure-install.md#configure-the-scanner-in-the-azure-portal).

### Support for NFS repositories in content scan jobs (Public preview)

Now you can add NFS repositories to your content scan jobs, in addition to SMB file shares and SharePoint repositories.

To support scans on NFS shares, services for NFS must be deployed on the scanner machine:

1. On your machine, navigate to the **Windows Features (Turn Windows features on or off)** settings dialog.

1. Select the following items:

    - **Services for NFS**
        - **Administrative Tools**
        - **Client for NFS**

For more information, see [Create a content scan job](../deploy-aip-scanner-configure-install.md#create-a-content-scan-job).

### Added support for additional sensitive information types

We’ve added support for additional sensitive information types in Azure Information Protection, such as **Australia business number**, **Australia company number**, or **Austria identity card**.

For more information, see the [Sensitive information type entity definitions](/microsoft-365/compliance/sensitive-information-type-entity-definitions) in the Microsoft 365 documentation.

### Track document access and revoke access (Public preview)

Once you've upgraded to version 2.9.111.0, any protected documents that are not yet registered for tracking are registered the next time they're opened on a machine with the AIP unified labeling client installed. Protected documents are supported for track and revoke, even if they are not labeled.

Having your documents registered for tracking enables administrators to use PowerShell to track document access, and revoke access if needed.

Once you've upgraded, end-users can also revoke access for documents that they've protected. To revoke access from Microsoft Office apps, use the new **Revoke access** option on the **Sensitivity** menu.

For more information, see:

- [Administrator Guide: Track and revoke document access with Azure Information Protection](track-and-revoke-admin.md)
- [User Guide: Revoke document access with Azure Information Protection](revoke-access-user.md)
- [Known issues for tracking and revoking document access](../known-issues.md#known-issues-for-track-and-revoke-features-public-preview)

If you have privacy requirements in your organization or region that require you to turn off document tracking features, see the [track and revoke administrator procedures](track-and-revoke-admin.md#turn-off-track-and-revoke-features-for-your-tenant).

**Upgrades from the classic client**

The AIP classic client supports track and revoke features using the [Microsoft tracking portal](client-track-revoke.md#using-a-web-browser-to-track-and-revoke-documents-that-you-have-registered). This tracking portal is not relevant when working with the unified labeling client.
 
To view tracking data with the unified labeling client, use the PowerShell commands only, as described in the [admin guide](track-and-revoke-admin.md).

### Fixes and improvements for the unified labeling scanner - version 2.9.111.0

The following fixes were delivered in version 2.9.111.0 of the [Azure Information Protection unified labeling scanner](../deploy-aip-scanner.md):

- Added support for hyphens (**-**) in [scanner database](../deploy-aip-scanner-prereqs.md) names
- Updates in reports for when the **[Label files based on content](../deploy-aip-scanner-configure-install.md#create-a-content-scan-job)** option is set to **Off**
- [Improved memory consumption](../deploy-aip-scanner-configure-install.md#optimizing-scanner-performance) for large numbers of information type matches
- Support for [SharePoint on-premises](../deploy-aip-scanner-prereqs.md#sharepoint-requirements) paths that end in a slash (**/**)
- Increased SharePoint scanning [speed](../deploy-aip-scanner-configure-install.md#optimizing-scanner-performance)
- Support for [avoiding a timeout](clientv2-admin-guide-customizations.md#avoid-scanner-timeouts-in-sharepoint) when scanning a SharePoint server.

### Fixes and improvements for the unified labeling client - version 2.9.111.0

- Issues fixed for [labeling on emails](clientv2-admin-guide-customizations.md#extend-your-label-migration-rules-to-emails) from Office MSI, such as when replying to or forwarding an email.

- [NewLabel audit log](../audit-logs.md#new-label-audit-logs) events now include the action source, for events generated by emails sent from Outlook.

- Issues fixed where the policy was sometimes not updated without clearing the cache, after [making changes to the label policy in Microsoft 365](/microsoft-365/compliance/create-sensitivity-labels#publish-sensitivity-labels-by-creating-a-label-policy).

- Outlook Preview mode now generates [audit logs for discovery events](../audit-logs.md#discover-audit-logs)

- [Recommended labels](/microsoft-365/compliance/sensitivity-labels#what-sensitivity-labels-can-do) and [visual marking](/microsoft-365/compliance/sensitivity-labels#what-sensitivity-labels-can-do) are applied as expected in Outlook. 

- Added support for [finding recipients in Outlook distribution lists](clientv2-admin-guide-customizations.md#expand-outlook-distribution-lists-when-searching-for-email-recipients), such as when [OutlookBlockTrustedDomains](clientv2-admin-guide-customizations.md#to-exempt-domain-names-for-pop-up-messages-configured-for-specific-labels) and [OutlookBlockUntrustedCollaborationLabel](clientv2-admin-guide-customizations.md#to-implement-the-warn-justify-or-block-pop-up-messages-for-specific-labels) settings are configured.

    When turning on this functionality, we recommend that you also raise the default timeout value, as defined in the [OutlookGetEmailAddressesTimeOutMSProperty](clientv2-admin-guide-customizations.md#expand-outlook-distribution-lists-when-searching-for-email-recipients) setting.

- Updates to the [order of precedence](clientv2-admin-guide-customizations.md#order-of-precedence---how-conflicting-settings-are-resolved) used when more than one label policy is configured for a user, each with conflicting advanced settings.

    In such cases, the advanced settings from the first policy are always applied, according to the order of the policies in the admin center. The exception for the *OutlookDefaultLabel* is now removed.

- In a scenario where **%APPDATA% (AppData\Roaming)** points to a non-default Windows folder structure, files in folders that are mapped to user directories are now [excluded from labeling and protection](clientv2-admin-guide-file-types.md#file-types-that-are-excluded-from-classification-and-protection) as expected, based on the configuration.

- [New advanced client setting](clientv2-admin-guide-customizations.md#remove-all-shapes-of-a-specific-shape-name) (**PowerPointRemoveAllShapesByShapeName**), added to remove shapes from PowerPoint headers or footers, by using the shape name instead of the text inside a shape.

## Version 2.8.85.0

Unified labeling scanner and client version 2.8.85.0

**Released** 09/22/2020

**Supported through** 7/13/2021

This version includes the following new features, fixes, and enhancements, for the unified labeling scanner and client:

- **New features for the scanner**:

    - [Optional full rescans for changes detected](#optional-full-rescans-for-changes-detected)
    - [Configure SharePoint timeouts](#configure-sharepoint-timeouts)
    - [Network discovery support](#network-discovery-support-public-preview) (public preview)

- **New features for the client**:

    - [Administrator customizations for AIP popups in Outlook](#administrator-customizations-for-aip-popups-in-outlook)
    - [Administrator customizations for justification prompts](#administrator-customizations-for-justification-prompts)
    - [Audit log updates](#audit-log-updates)
    - [DKE template-based labeling updates](#dke-template-based-labeling-updates)

- **Fixes and improvements:**

    - [Scanner fixes and improvements](#azure-information-protection-scanner-fixed-issues-version-28850)
    - [Client fixes and improvements](#azure-information-protection-client-fixed-issues-version-28850)


### Optional full rescans for changes detected

Administrators can now skip a full rescan after making changes to policies or content scan jobs. Skipping a full rescan applies your changes only on files that have been modified or created since the last scan.

For example, you may have made changes that only affect the end user, such as in visual markings, and don't want to take the time required to run a full rescan immediately.

Skip the full, immediate rescan, and return later to [run a full rescan](../deploy-aip-scanner-manage.md#rescanning-files) and apply your changes across your repositories.

> [!IMPORTANT]
> Administrators making changes in their policies and content scan jobs must now understand the effects of those changes on the content, and determine whether a full rescan is required.
>
> For example, if you’ve changed **Sensitivity policy** settings from **Enforce = Off** to **Enforce = On**, make sure to run a full rescan to apply your labels across your content.
>

### Configure SharePoint timeouts

The default timeout for SharePoint interactions has been updated to two minutes, after which the attempted AIP operation fails.

AIP administrators can also now configure SharePoint timeouts, separately for all web requests and file web requests.

For more information, see [Configure SharePoint timeouts](clientv2-admin-guide-customizations.md#configure-sharepoint-timeouts).

### Network Discovery support (public preview)

The unified labeling scanner now includes a new **network discovery** service, which enables you to scan specified IP addresses or ranges for network file shares that may have sensitive content.

The **network discovery** service updates **Repository** reports with a list of share locations that may be at risk, based on the discovered permissions and access rights. Check the updated **Repository** reports to ensure that your content scan jobs include all repositories that need to be scanned.

> [!TIP]
> For more information, see [Network discovery cmdlets](#network-discovery-cmdlets-public-preview).

**To use the Network discovery service**

1. Upgrade your scanner version and make sure that you have your scanner cluster configured correctly. For more information, see:
    - [Upgrading your scanner](../deploy-aip-scanner-configure-install.md#upgrading-your-scanner)
    - [Create a scanner cluster](../deploy-aip-scanner-configure-install.md#create-a-scanner-cluster)

1. Make sure that you have Azure Information Protection analytics enabled.

    In the Azure portal, go to **Azure Information Protection > Manage > Configure analytics (Preview)**.

    For more information, see [Central reporting for Azure Information Protection (public preview)](../reports-aip.md).

1. Enable Network Discovery by running the [**Install-MIPNetworkDiscovery**](/powershell/module/azureinformationprotection/Install-MIPNetworkDiscovery) PowerShell cmdlet.

    > [!IMPORTANT]
    > When running this cmdlet, make sure to use a weak user as the value for the **StandardDomainsUserAccount** parameter to ensure that any public access to repositories is reported.
    >
    > This user must be a member of the **Domain Users** group only, and is used to simulate public access to the repositories.

1. In the Azure portal, go to Azure Information Protection > **Network scan jobs** and [create jobs to scan specific areas of your network](../deploy-aip-scanner-configure-install.md#create-a-network-scan-job-public-preview).

1. Use the generated reports on the new [**Repositories**](../deploy-aip-scanner-configure-install.md#analyze-risky-repositories-found-public-preview) pane to find additional network file shares that may be at risk. Add any risky file shares to your [content scan jobs](../deploy-aip-scanner-configure-install.md#create-a-content-scan-job) to scan the added repositories for sensitive content.

#### Network discovery cmdlets (public preview)

PowerShell cmdlets added for Network Discovery include:

|Cmdlet  |Description  |
|---------|---------|
|[**Get-MIPNetworkDiscoveryConfiguration**](/powershell/module/azureinformationprotection/Get-MIPNetworkDiscoveryConfiguration)     |   Gets the current setting for whether the Network Discovery service pulls network scan data from the default, online configuration, or an offline file exported from the Azure portal.      |
|[**Get-MIPNetworkDiscoveryJobs**](/powershell/module/azureinformationprotection/Get-MIPNetworkDiscoveryJobs)     |    Gets a list of currently configured network scan jobs.     |
|[**Get-MIPNetworkDiscoveryStatus**](/powershell/module/azureinformationprotection/Get-MIPNetworkDiscoveryStatus)     |     Gets the current status of all network scan jobs configured in your tenant.    |
| [**Import-MIPNetworkDiscoveryConfiguration**](/powershell/module/azureinformationprotection/Import-MIPNetworkDiscoveryConfiguration)     |    Imports the configuration for a network scan job from a file.     |
| [**Install-MIPNetworkDiscovery**](/powershell/module/azureinformationprotection/Install-MIPNetworkDiscovery)| Installs the Network Discovery service |
|[**Set-MIPNetworkDiscoveryConfiguration**](/powershell/module/azureinformationprotection/Set-MIPNetworkDiscoveryConfiguration)     |   Sets the configuration for whether the Network Discovery service pulls network scan data from the default, online configuration, or an offline file exported from the Azure portal.      |
|[**Start-MIPNetworkDiscovery**](/powershell/module/azureinformationprotection/Start-MIPNetworkDiscovery)     |  Runs a specific network scan job immediately.       |
|[**Uninstall-MIPNetworkDiscovery**](/powershell/module/azureinformationprotection/Uninstall-MIPNetworkDiscovery)     |  Uninstalls the Network Discovery service.       |
| | |


### Administrator customizations for AIP popups in Outlook

AIP administrators can now customize the popups that appear in Outlook for end-users, such as popups for blocked emails, warning messages, and justification prompts.

For more information, including several sample rules for common use case scenarios, see [Customize Outlook popup messages](clientv2-admin-guide-customizations.md#customize-outlook-popup-messages).

### Administrator customizations for justification prompts

AIP administrators can now customize one of the options in the justification prompts that are displayed when end-users change classification labels on documents and emails.

For more information, see [Customize justification prompt texts for modified labels](clientv2-admin-guide-customizations.md#customize-justification-prompt-texts-for-modified-labels).

### Audit log updates

Audit logs for access events from the unified labeling client are now sent only when users open labeled or protected files, providing a clearer indication of user access.

Information types are no longer sent by [audit logs for access events](../audit-logs.md#access-audit-logs), and are now sent only with [audit logs for discover events](../audit-logs.md#discover-audit-logs).

For more information, see [Access audit logs](../audit-logs.md#access-audit-logs).

For more information, see [Azure Information Protection audit log reference](../audit-logs.md).
### DKE template-based labeling updates

Azure Information Protection now supports Double Key Encryption (DKE) template-based labeling in the scanner, as well as using the File Explorer and PowerShell.

For more information, see:

- [Planning and implementing your Azure Information Protection tenant key](../plan-implement-tenant-key.md)
- [Double Key Encryption](/microsoft-365/compliance/double-key-encryption) in the Microsoft 365 docs

### Azure Information Protection scanner fixed issues, version 2.8.85.0

The following fixes were delivered in version 2.8.85.0 of the Azure Information Protection unified labeling scanner:

- Improvements for [scanning files with long paths](../deploy-aip-scanner-prereqs.md#file-path-requirements)
- The AIP scanner now scans full [SharePoint](../deploy-aip-scanner-prereqs.md#sharepoint-requirements) environments when there are multiple ContentDatabases.
- The AIP scanner now supports [SharePoint](../deploy-aip-scanner-prereqs.md#sharepoint-requirements) files with a period in the path, but no extension. For example, a file with a path of `https://sharepoint.contoso.com/shared documents/meeting-notes`, with no extension, is now scanned successfully.
- The AIP scanner now supports [custom sensitive information types](../deploy-aip-scanner-configure-install.md#identify-all-custom-conditions-and-known-sensitive-information-types) that are created in the Microsoft Security and Compliance center, and do not belong to any policy.

### Azure Information Protection client fixed issues, version 2.8.85.0

The following fixes were delivered in version 2.8.85.0 of the Azure Information Protection unified labeling client:

- A new, narrated indication for any items currently selected from the **Sensitivity** ![columns icon](../media/selected-sensitivity-options.png "columns icon") menu in Office apps. For more information, see the page on [Sensitivity labels in the Microsoft 365 docs](/microsoft-365/compliance/sensitivity-labels#what-sensitivity-labels-can-do).
- Fixes for viewing JPEG files in the [AIP Viewer](clientv2-view-use-files.md)
- Downgrading a label now automatically includes the **ProtectionOwnerBefore** in [audit events](../audit-logs.md#downgrade-label-audit-logs)
- Change events now include the **LastModifiedDate** in [audit logs](../audit-logs.md#change-protection-audit-logs)
- Added support for **Proxy.pac** files when using a proxy to acquire a token. For more information, see [Firewalls and network infrastructure requirements](../requirements.md#firewalls-and-network-infrastructure).
- Fixes for authenticating when [refreshing policies](../configure-policy.md#making-changes-to-the-policy)
- Fixes for [automatic content marking](../configure-policy-markings.md) updates for PowerPoint in read-only mode
- Improvements in popups and error texts
- Tooltip updates to show the highest [classification for email attachments](../faqs-infoprotect.md#when-an-email-is-labeled-do-any-attachments-automatically-get-the-same-labeling), considering both the classification of the email and the attachment.
- Fixes to the **Report an Issue** text when modifying sensitivity labeling policies using the [**Set-LabelPolicy**](/powershell/module/exchange/set-labelpolicy) cmdlet
- Fixes in errors shown when the [**Set-AipFileLabel**](/powershell/module/azureinformationprotection/set-aipfilelabel) cmdlet is used with an invalid label ID.
- Performance fixes for decrypting SMIME emails in Outlook's reading pane. To implement this fix, enable the [**OutlookSkipSmimeOnReadingPaneEnabled**](clientv2-admin-guide-customizations.md#prevent-outlook-performance-issues-with-smime-emails) advanced property.
- Fixes for [decrypting PST files](clientv2-admin-guide-file-types.md) that contain password-encrypted files. Decrypting PST files no longer fails if the PST file contains a password-protected file.
- Removing a protection label that is not included in your scoped policy now removes both the label and protection from the content.

## Version 2.7.101.0

Unified labeling scanner and client version 2.7.101.0

**Released** 08/23/2020

**Supported through** 3/22/2021

**Fix**:

Fixed issue for PPT, Excel and Word users which resulted in files freezing, crashing, or being forced to repeat save that was related to mandatory labels configured with protection, watermarking, and/or content marking.

## Version 2.7.99.0

Unified labeling scanner and client version 2.7.99.0

**Released** 07/20/2020

**Supported through** 2/23/2021

**Fixes and improvements**:

Fixed issues in file labeling actions for **New Label** audit logs.

For more information, see [Version 2.7.96.0](#version-27960) and [Azure Information Protection audit log reference (public preview)](../audit-logs.md).

## Version 2.7.96.0

Unified labeling scanner and client version 2.7.96.0

**Released** 06/29/2020

**Supported through** 1/20/2021

- [New features for the unified labeling client, version 2.7.96.0](#new-features-for-the-unified-labeling-client-version-27960)
- [New features for the unified labeling scanner, version 2.7.96.0](#new-features-for-the-unified-labeling-scanner-version-27960)
- [New audit logs generated for removed files](#new-audit-logs-generated-for-removed-files)
- [TLS 1.2 enforcement](#tls-12-enforcement)
- [Fixes and improvements, version 2.7.96.0](#fixes-and-improvements-version-27960)
### New features for the unified labeling scanner, version 2.7.96.0

- [Use scanner to apply labels based on recommended conditions](../deploy-aip-scanner-prereqs.md). AIP customers can now choose to implement service side only autolabeling. This feature allows AIP end users to always follow recommendations instead of the previous scenario, which only enabled automatic labeling on the user side.

- [Learn which files previously discovered by scanner were deleted from the scanned repository](../reports-aip.md) These deleted files were not previously reported in AIP analytics and are now available in the scanner discovery report.

- [Get reports from scanner on failures to apply action events](../reports-aip.md#friendly-schema-reference-for-event-functions). Use reports to learn about failed action events and discover ways to prevent future occurrences.

- Introduction of AIP scanner diagnostic analyzer tool for detection and analysis of common scanner errors. To begin using AIP scanner diagnostics, [run the **Start-AIPScannerDiagnostics** cmdlet](../deploy-aip-scanner-tsg.md#troubleshooting-using-the-scanner-diagnostic-tool).

- You can now manage and limit max CPU consumption on the scanner machine. Learn how to prevent 100% CPU usage and manage your CPU usage using [two new advanced settings **ScannerMaxCPU**, and **ScannerMinCPU**](./clientv2-admin-guide-customizations.md#limit-cpu-consumption).

- Now you can configure the unified labeling scanner to skip specific files depending on their file attributes. Define the list of file attributes that triggers a file to be skipped using the new **[ScannerFSAttributesToSkip](clientv2-admin-guide-customizations.md#skip-or-ignore-files-during-scans-depending-on-file-attributes)** advanced setting.

### New features for the unified labeling client, version 2.7.96.0

- [**Justification popups**](client-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent) now appear for changes made to default labels in the unified labeling client.

- Smoother integration with visual content markings applied by Office. For more information about configuring content markings in Office document, see [How to configure a label for visual markings for Azure Information Protections](../configure-policy-markings.md).

- New **WordShapeNameToRemove** advanced property enables removal of content marking in Word documents made by third-party applications. Learn more about how to [identify existing shape names and define them for removal using **WordShapeNameToRemove**](./clientv2-admin-guide-customizations.md#remove-headers-and-footers-from-other-labeling-solutions).

- Support for **Double Key Encryption (DKE)** (public preview).

    Now you can use the unified labeling client to protect highly sensitive content while maintaining full control of your key. DKE requires two keys to access protected content: one key is stored in Azure, and the other key is held by the customer.

    For more information about the default, cloud-based tenant root keys, see [Planning and implementing your Azure Information Protection tenant key](../plan-implement-tenant-key.md). For information about implementing Double Key Encryption, see [Double key encryption](/microsoft-365/compliance/double-key-encryption) in the Microsoft 365 documentation.

### New audit logs generated for removed files

Audit logs are now generated each time the scanner detects that a file that had previously been scanned is now removed.

For more information, see:

- [File removed audit logs](../audit-logs.md#file-removed-audit-logs)
- [Central reporting for Azure Information Protection](../reports-aip.md)

> [!IMPORTANT]
> In this version, file labeling actions do not generate **New Label** audit logs.
> If you run the scanner in **Enforce=On** mode, we recommend that upgrade to [Version 2.7.99.0](#version-27990).
>

### TLS 1.2 enforcement

Starting with this version of the Azure Information Protection client, only TLS versions 1.2 or later are supported.

Customers that have a TLS setup that does not support TLS 1.2 must move to a setup that supports TLS 1.2 to use Azure Information Protection policies, tokens, audit, and protection, and to receive Azure Information Protection-based communication.

For more requirement details, see [Firewalls and network infrastructure requirements](../requirements.md#firewalls-and-network-infrastructure).

### Fixes and improvements, version 2.7.96.0

- Scanner SQL improvements for:
    - Performance
    - Files with large numbers of information types

- SharePoint scanning improvements for:
    - Scanning performance
    - Files with special characters in the path
    - Libraries with large file count

    To view a quickstart for using Azure Information Protection with SharePoint, see [Quickstart: Find what sensitive information you have in files stored on-premises](../quickstart-findsensitiveinfo.md).

- Improved user notifications for missing policies. For more information about label policies for the unified labeling client, see [What label policies can do](/microsoft-365/compliance/sensitivity-labels#what-label-policies-can-do) in the Microsoft 365 documentation.

- [Automatic labels](../configure-policy-classification.md) are now applied in Excel for scenarios where a user starts to close a file without saving, just as they are when a user actively saves a file.

- Headers and footers are removed as expected, and not on each document save, when the [ExternalContentMarkingToRemove](client-admin-guide-customizations.md#remove-headers-and-footers-from-other-labeling-solutions) setting is configured.

- [Dynamic user variables](../configure-policy-markings.md#using-variables-in-the-text-string) are now displayed in a document's visual markings as expected.

- Issue where only the first page of content of a PDF was being used for applying autoclassification rules is now resolved, and autoclassification based on all content in the PDF now proceeds as expected. For more information about classification and labeling, see the [classification and labeling FAQ](../faqs-infoprotect.md).

- When multiple Exchange accounts are configured and the Azure Information Protection Outlook client is enabled, mails are sent from the secondary account as expected. For more information about configuring the unified labeling client with Outlook, see [Configure your group policy to prevent disabling AIP](reqs-ul-client.md#configure-your-group-policy-to-prevent-disabling-aip).

- When a document with a higher confidentiality label is dragged and dropped into an email, the email now automatically receives the higher confidentiality label as expected. For more information about labeling client features, see the [labeling client comparison table](use-client.md#compare-the-labeling-solutions-for-windows-computers).

- Custom permissions are now applied to emails as expected, when email addresses include both an apostrophe (') and period (.) For more information about configuring the unified labeling client with Outlook, see [Configure your group policy to prevent disabling AIP](reqs-ul-client.md#configure-your-group-policy-to-prevent-disabling-aip).


- By default, a file's NTFS owner is lost when the file is labeled by the unified labeling scanner, PowerShell, or the File Explorer extension. Now you can configure the system to keep the file's NTFS owner by setting the new **[UseCopyAndPreserveNTFSOwner](clientv2-admin-guide-customizations.md#preserve-ntfs-owners-during-labeling-public-preview)** advanced setting to **true**.

    The **UseCopyAndPreserveNTFSOwner** advanced setting requires a low latency, reliable network connection between the scanner and the scanned repository.

## Next steps

Not sure if unified labeling is the right client to install?  See [Choose your Windows labeling solution](use-client.md#choose-your-windows-labeling-solution).

For more information about installing and using the unified labeling client:

- For users: [Download and install the client](install-unifiedlabelingclient-app.md)

- For admins: [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)
