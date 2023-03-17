---
# required metadata

title: Release management and supportability - Azure Information Protection (AIP)
description: Learn about the contents of each version of the Azure Information Protection (AIP) unified labeling client for Windows and understand the lifecycle policy for support.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 06/24/2022
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:git
#ms.devlang:
ms.subservice: v2client
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Azure Information Protection unified labeling client - Release management and supportability

[!INCLUDE [looking-for-mip](../includes/looking-for-mip.md)]

This article describes the functionality added to each recent version of the unified labeling client, as well as servicing information and support timelines for each AIP unified client version.

You can download the Azure Information Protection unified labeling client from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018).

If you're looking for updates for the *built-in labeling solution* for Microsoft Office applications, see:

- Information protection items, such as the "Sensitivity labels" sections in [What's new in Microsoft Purview risk and compliance solutions](/microsoft-365/compliance/whats-new)
- [Protect your sensitive data with Microsoft Purview](/microsoft-365/compliance/information-protection)
- The [Microsoft 365 roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap?filters=&searchterms=compliance), filtered for Microsoft 365 compliance items

## Servicing information and timelines

The Azure Information Protection unified labeling client has [multiple components bundled up into a single downloadable package](clientv2-admin-guide.md#technical-overview-of-the-azure-information-protection-unified-labeling-client). The Azure Information Protection add-in [part of the unified labeling client] is the only component in maintenance mode as of Jan 1, 2022, driven by the modernization effort to make sensitivity labeling and protection built-in to Office applications. All other components within the unified labeling client aren't in maintenance mode and are fully supported. For more information, see our [TechCommunity blog](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/azure-information-protection-and-the-information-protection/ba-p/3671070#:~:text=Azure%20Information%20Protection%20%28AIP%29%20has%20been%20on%20a,management%20experience%20into%20the%20Microsoft%20Purview%20compliance%20portal).

The lifecycle of each generally available (GA) version of the Azure Information Protection unified labeling client could vary from build to build, depending on the release date of a subsequent GA version.

|Client version|Date released|Supported through|
|--------------|-------------|-------------|
|2.15.33.0|02/17/2023|02/17/2024|
|2.14.90.0|09/01/2022|09/01/2023|
|2.13.49.0|01/12/2022|03/01/2023|
|2.12.62.0|08/02/2021|Deprecated|
|2.11.58.0 |04/29/2021|Deprecated|
|2.9.116.0|02/08/2021|Deprecated|
|2.9.111.0|01/13/2021|Deprecated|
|2.8.85.0|09/22/2020|Deprecated|
|2.7.101.0|08/23/2020|Deprecated|
|2.7.99.0|07/20/2020|Deprecated|
|2.7.96.0|06/29/2020|Deprecated|
|2.6.111.0|03/09/2020|Deprecated|
|2.5.33.0|10/23/2019|Deprecated|
|2.2.21.0|09/03/2019|Deprecated|
|2.2.19.0|08/06/2019|Deprecated|
|2.2.14.0|07/15/2019|Deprecated|
|2.0.779.0|05/01/2019|Deprecated|
|2.0.778.0|04/16/2019|Deprecated|

The date format used on this page is *month/day/year*.

The documentation is updated accordingly to a client release cycle and is applicable only to the latest supported GA versions of the client. Fixes and new functionality are always applied to the latest GA version and won't be applied to older GA versions.

### Microsoft Update Catalog availability

After a short delay of typically four weeks, the latest general availability version is also included in the Microsoft Update Catalog. Azure Information Protection versions have a product name of **Microsoft Azure Information Protection** > **Microsoft Azure Information Protection Unified Labeling Client**, and a classification of **Updates**.

Including Azure Information Protection in the catalog means that you can upgrade the client using WSUS or Configuration Manager, or other software deployment mechanisms that use Microsoft Update.

For more information, see [Upgrading and maintaining the Azure Information Protection unified labeling client](clientv2-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-unified-labeling-client).

### Release information

Use the following information to see the contents of each supported release of the Azure Information Protection unified labeling client for Windows. The most current release is listed first. The date format used on this page is *month/day/year*.

Noted Azure Information Protection features are currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

> [!TIP]
> Minor fixes aren't always listed so if you experience a problem with the unified labeling client, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version (if available).
>
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

## Version 2.15.33.0

Unified labeling scanner and client version 2.15.33.0

**Supported through** 02/17/2024

**Released** 02/17/2023

This version includes the following fixes for the unified labeling scanner and client:

### EU Data Boundary Support

Starting in 2.15.33.0, EU customers can send data from the AIP UL Client to the EU for storage and processing. To enable the EU data boundary setting, configure this [registry key](/azure/information-protection/rms-client/clientv2-admin-guide-customizations#enable-data-boundary-settings).

### Fixes and improvements

This version of the unified labeling client and scanner provides the following fixes and improvements:

- Outlook supports [Double Key Encryption](/microsoft-365/compliance/double-key-encryption) templates.
- Updated to [MIP SDK 1.12.101](/information-protection/develop/version-release-history#version-112101) for classification, labeling and protection services.


## Version 2.14.90.0

Unified labeling scanner and client version 2.14.90.0

**Supported through** 09/01/2023

**Released** 09/01/2022

This version includes the following fixes for the unified labeling scanner and client:

### Updating Authentication Library to MSAL

Starting in 2.14.90.0, MSAL is the default authentication library for AIP UL client and AIP Scanner, replacing ADAL from the previous versions.

For the AIP add-in, users should see no impact as we'll use token cache or the integrated Windows authentication (SSO) before prompting the use to log in again. 

For the AIP PowerShell and AIP Scanner, reauthentication is required. To reauthenticate, use the PowerShell cmdlet [Set-AIPAuthentication](/powershell/module/azureinformationprotection/set-aipauthentication) after upgrading to this version. 

### Fixes

This version of the unified labeling client and scanner provides the following fixes:

- Fixed an issue where msg.pfile wasn't opening in AIP Viewer.
- Fixed an issue with the performance of `GetLabel`/`SetLabel`.
- Fixed issues with handling of IQP protected files.
- Fixed an issue with `Set-AIPFileLabel` crashes.
- Fixed an issue with audit logging in AIP Viewer for protected PDFs.
- Fixed an issue with co-authoring where users couldn't apply labels for certain cultures with special characters (i.e. "tr-TR").
- Fixed an issue with super user protection for `Set-AIPFileLabel` -RemoveProtection if label wasn't published by super user.


## Version 2.13.49.0

Unified labeling scanner and client version 2.13.49.0

**Supported through** 03/01/2023

**Released** 01/12/2022

This version includes the following new updates, fixes, and enhancements for the unified labeling scanner and client:

### Increased accuracy for sensitive information types

This version of the unified labeling client provides globalization enhancements, including increased accuracy for East Asian languages and support for double-byte characters. These enhancements are provided only for 64-bit processes, and are turned off by default.

For more information, see [Turn on classification globalization features](clientv2-admin-guide-customizations.md#turn-on-classification-globalization-features-public-preview) and [Learn about sensitive information types](/microsoft-365/compliance/sensitive-information-type-learn-about).

### Updated audit logs for the AIP Viewer app

The [Azure Information Protection Viewer](clientv2-view-use-files.md) app now generates [Access audit logs](../audit-logs.md#access-audit-logs) each time a labeled or protected file is opened within the organization.

The Viewer app no longer generates [Discover audit logs](../audit-logs.md#discover-audit-logs).

For more information, see:

- [Azure Information Protection audit log reference (public preview)](../audit-logs.md)
- [Analytics and central reporting for Azure Information Protection (public preview)](../reports-aip.md)

### Scanner support for 64-bit versions only

Starting in version 2.13.47.0, the unified labeling scanner is supported only on 64-bit systems.

For more information, see [Requirements for installing and deploying the Azure Information Protection unified labeling scanner](/microsoft-365/compliance/deploy-scanner-prereqs).

### Integrated support for MIP SDK version 1.10

This version of the Azure Information Protection client and scanner fully integrates the Microsoft Purview Information Protection Software Development Kit (SDK) version 1.10.93.

For more information, see the [MIP SDK documentation](/information-protection/develop/version-release-history#version-11093).

### Fixes and improvements

This version of the unified labeling client and scanner provides the following fixes and improvements:

- Enhanced support for the [PFileSupportedExtensions](clientv2-admin-guide-customizations.md#pfilesupportedextension) advanced setting, to add the ability to protect only Office file types and PDF files, without configuring one specific value.
- Fixed an issue where a watermark may not be reflected correctly when a label is changed.
- Fixed  an issue where Office apps may behave unexpectedly if the [`color`](clientv2-admin-guide-customizations.md#specify-a-color-for-the-label) value for a label has an invalid value.
- Fixed an issue where selecting permissions via the File Explorer **Classify and protect** option may remove email addresses from the defined permissions if multiple email addresses include an apostrophe (**'**).
- Fixed an issue where the auto-labeling custom text tooltip configured may not display as expected in case of an AsyncPolicy applied.
- Fixed an issue when [pop-ups in Outlook](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent) may behave unexpectedly when attaching an email to another, newly encrypted email.
- Fixed an issue where an AIP-related error appeared after a child label is added and scoped to *Groups & Sites*.
- Fixed an issue where the **Delete Label** icon may not appear in the Outlook classification bar when mandatory labeling is enabled across Office, [but not in Outlook](clientv2-admin-guide-customizations.md#exempt-outlook-messages-from-mandatory-labeling).
- Fixed an issue where Excel may not close completely when both the AIP add-in and other add-ins are running.
- Fixed an issue where Outlook may fail to send a message with embedded images in rich-text with rules for [pop-ups in Outlook](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent) configured.
- Fixed an issue where the AIP add-in may fail to load in Office apps with language related errors.
- Fixed an issue to prevent errors from occurring when removing protection from a PST file with special characters.
- Fixed an issue where extra draft emails were kept while working with Outlook in [Online mode](https://support.microsoft.com/en-us/office/switch-from-working-offline-to-online-2460e4a8-16c7-47fc-b204-b1549275aac9).
- Fixed an issue where popup messages were displayed, prompting users to save changes even when no changes were made, when working with Outlook in [Online mode](https://support.microsoft.com/en-us/office/switch-from-working-offline-to-online-2460e4a8-16c7-47fc-b204-b1549275aac9).
- Fixed an issue where emails to external guest users couldn't be sent if collaboration rules for [popup messages](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent) were configured.


## Version 2.12.62.0

Unified labeling scanner and client version 2.12.62.0

**Supported through** 09/30/2022

**Released** 08/02/2021

This version includes the following new features, fixes, and enhancements for the unified labeling scanner and client:

### Built-in co-authoring support

Microsoft 365's co-authoring features are now supported directly in the main Azure Information Protection unified labeling client installation, for enabled tenants.

Co-authoring for Office apps enables multiple users to edit documents that are labeled and encrypted by [sensitivity labels](/microsoft-365/compliance/sensitivity-labels).

> [!NOTE]
> Before you start, we recommend that you review all related prerequisites and limitations. For more information, see:
>
> - [Enable co-authoring for files encrypted with sensitivity labels](/microsoft-365/compliance/sensitivity-labels-coauthoring) in the Microsoft 365 documentation.
> - [Known issues for co-authoring in AIP](../known-issues.md#known-issues-for-co-authoring)
>

### Support for DKE labels with user-defined permissions

This version of the unified labeling client and scanner supports DKE labels with user-defined permissions in Word, Excel, and PowerPoint.

For more information, see [Azure Information Protection tenant keys](../plan-implement-tenant-key.md#double-key-encryption-dke) and [Microsoft Purview Double Key Encryption](/microsoft-365/compliance/double-key-encryption).

### Client usage logging in the Windows event log

The unified labeling client now [logs user activity to the local Windows event log](clientv2-admin-guide-files-and-logging.md#client-side-usage-logging).

### AIP scanner: General availability support for DLP policies

Microsoft 365 Data Loss Prevention (DLP) policies are now supported with the Azure Information Protection unified labeling scanner directly in the main installation instead of a dedicated version only.

- **Using a DLP policy** enables the scanner to detect potential data leaks by matching DLP rules to files stored in file shares and SharePoint Server.

- [**Enable DLP rules in your content scan job**](/microsoft-365/compliance/deploy-scanner-configure-install#use-a-dlp-policy) to reduce the exposure of any files that match your DLP policies.

    The scanner may reduce file access to data owners only, or reduce exposure to network-wide groups, such as **Everyone**, **Authenticated Users**, or **Domain Users**.

- **Scanning your files with DLP rules enabled also creates file permission reports**. Query these reports to investigate specific file exposures or explore the exposure of a specific user to scanned files.

Settings for enforcing or testing the DLP policy are configured in the [Microsoft Purview compliance portal](/microsoft-365/compliance/create-test-tune-dlp-policy#turn-on-a-dlp-policy).

For more information, including licensing requirements, see:

- [Configure a DLP policy in the AIP scanner](/microsoft-365/compliance/deploy-scanner-configure-install#use-a-dlp-policy)
- [Learn about the Microsoft 365 data loss prevention on-premises scanner](/microsoft-365/compliance/dlp-on-premises-scanner-learn), in the Microsoft 365 documentation
- [Get started with the data loss prevention on-premises scanner](/microsoft-365/compliance/dlp-on-premises-scanner-get-started)
- [Use the Microsoft 365 data loss prevention on-premises scanner](/microsoft-365/compliance/dlp-on-premises-scanner-use)

### Fixes and improvements - version 2.12.62.0

- Fixes for errors where AIP may not load if a [policy](/microsoft-365/compliance/create-sensitivity-labels#publish-sensitivity-labels-by-creating-a-label-policy) fails to parse parsing. Fix provided by updates to the [Microsoft Information Protection (MIP) SDK](/information-protection/develop/version-release-history).

- Fixed possibly incorrect **method** values in [New label audit logs](../audit-logs.md#new-label-audit-logs) for Outlook events.

- Fixes for possibly incorrect **label** and **labelBefore** values in [Change protection audit logs](../audit-logs.md#change-protection-audit-logs).

- Fixes for errors where documents may not be saved because of [edits made in the labeling metadata and lack of permissions](/microsoft-365/compliance/create-sensitivity-labels).

- Fixes for possible crashes when running PowerShell cmdlets. Fix provided by updates to the [Microsoft Information Protection (MIP) SDK](/information-protection/develop/version-release-history).

- Fixed errors where [justification popup messages](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent) may not appear in Outlook.

- Fixed errors where the [AIP add-in](clientv2-admin-guide-install.md) in Outlook may cause an error message to appear, if a message file that was saved locally was opened, closed, and then opened again.

- Fixed errors where [visual markings](use-client.md) may not be refreshed as expected after changing a file's label to a label with no content markings.

- Fixed errors where [audit logs](../audit-logs.md) may not be sent when a default label is applied to a document.

- Fixed issues for [content markings](use-client.md) in Outlook may be duplicated.

- Fixed issues where deferred messages may not be sent in Outlook when a deferral rule set is defined and the [AIP client is installed](clientv2-admin-guide-install.md).

- Fixed issues where [customized Outlook popup messages](clientv2-admin-guide-customizations.md#customize-outlook-popup-messages) may not display correctly when an image is found in the email signature.

- Fixed issues where [Change protection audit logs](../audit-logs.md#change-protection-audit-logs) may not be sent as expected when a label is removed in Outlook.

## Version 2.11.58.0

Unified labeling scanner and client version 2.11.58.0

**Supported through** 02/08/2022

**Released** 04/29/2021

> [!NOTE]
> Version 2.11.58.0 is identical to version 2.11.57.0. Due to an issue in our software packaging system, we needed to repackage this version and provide an updated version number. Users who've installed version 2.11.57.0 can be assured that have a fully supported and functional version.
>

This version includes the following new features, fixes, and enhancements for the unified labeling scanner and client:

- [Scanner usage logging in the Windows event log](#scanner-usage-logging-in-the-windows-event-log)
- [Scanner diagnostics tool improvements](#scanner-diagnostics-tool-improvements)
- [Improved scanner details output](#improved-scanner-details-output)
- [Updates for the scanner's supported information types](#updates-for-the-scanners-supported-information-types)
- [Fixes and improvements](#fixes-and-improvements-211580)

### Scanner usage logging in the Windows event log

The unified labeling scanner now logs user activity to the local Windows event log.

For more information, see [Usage logging for the Azure Information Protection scanner](clientv2-admin-guide-files-and-logging.md#scanner-side-usage-logging).

### Scanner diagnostics tool improvements

With the upgrade to version 2.11.58.0, running the [Start-AIPScannerDiagnostics](/powershell/module/azureinformationprotection/start-aipscannerdiagnostics) cmdlet with the **Verbose** parameter prints the last 10 errors from the scanner log.

To print more or fewer errors, use the new **VerboseErrorCount** parameter to define the number of errors you want to print.

For more information, see [Troubleshooting using the scanner diagnostic tool](/microsoft-365/troubleshoot/information-protection-scanner/resolve-deployment-issues#troubleshooting-using-the-scanner-diagnostic-tool).

### Improved scanner details output

The unified labeling on-premises scanner has improved outputs for the following cmdlets:

|Cmdlet  |Improvement  |
|---------|---------|
|**Get-AIPScannerStatus**     |  Previously, running the [Get-AIPScannerStatus](/powershell/module/azureinformationprotection/get-aipscannerstatus) command provided only high-level details of the scanner cluster status, without details per node in your cluster.   <br><br> Now, you can use the **NodesInfo** variable and the **Verbose** parameter to drill down into additional levels of detail for each node. <br><br>   For more information, see the [Verify scanning details per scanner node and repository](/microsoft-365/troubleshoot/information-protection-scanner/resolve-deployment-issues#verify-scanning-details-per-scanner-node-and-repository). |
|**Get-AIPScannerConfiguration**     |   Running the [Get-AIPScannerConfiguration](/powershell/module/azureinformationprotection/get-aipscannerconfiguration) now provides details about the current scanner configuration in addition to the online configuration settings.     |

### Updates for the scanner's supported information types

Beginning with version 2.11.58.0, the following sensitive information types aren't scanned by the unified labeling scanner.

If you have sensitivity labels that use these sensitive information types, we recommend that you remove them.

- **EU Phone Number**
- **EU GPS Coordinates**

### Fixes and improvements (2.11.58.0)

The following fixes were delivered in version 2.11.58.0 of the Azure Information Protection unified labeling client and scanner:

- Improvements in loading time for the [AIP add-in in Office apps](clientv2-user-guide.md).

- Fixed issues in Outlook where protection wasn't removed when the label was removed, in some edge cases.

- The [PowerPointRemoveAllShapesByShapeName](clientv2-admin-guide-customizations.md#remove-all-shapes-of-a-specific-shape-name) advanced setting no longer requires that you also define the [ExternalContentMarkingToRemove](clientv2-admin-guide-customizations.md#how-to-configure-externalcontentmarkingtoremove) setting. Now you can define the **PowerPointRemoveAllShapesByShapeName** advanced setting on its own.

- Fixed an issue where an empty option would appear on [customized Outlook popup messages](clientv2-admin-guide-customizations.md#customize-outlook-popup-messages) when only two options for the user to select were configured for the popup message.

- Fixed issues for opening protected **.jt** files in the [AIP Viewer app](clientv2-view-use-files.md).

- [Size limits](clientv2-admin-guide-file-types.md#supported-file-sizes-for-the-file-explorer-and-powershell) for protecting files using the File Explorer and PowerShell are now updated.

- Fixed issues in parsing [sensitivity label policies](/microsoft-365/compliance/create-sensitivity-labels).

## Version 2.9.116.0

Unified labeling scanner and client version 2.9.116.0

**Released** 02/08/2021

**Supported through** 10/29/2021

**Fixed issues**

Users are now able to view protected files as expected in the following scenarios:

- When protected files are shared with users who don’t have an AIP policy configured, such as external users. This issue had occurred only with the [AIP Viewer app](clientv2-view-use-files.md).

- When content with a scoped label is shared with users or groups not included in the label's scope. This issue had occurred both with the [AIP Viewer app](clientv2-view-use-files.md) and when viewing or classifying the shared content via the [File Explorer](clientv2-classify-protect.md#use-the-file-explorer-to-classify-and-protect-files).

For more information, see the [AIP unified labeling client user guide](clientv2-user-guide.md).

## Next steps

For more information, see:

- [Compare Azure Information Protection and MIP built-in labeling](use-client.md)
- For users: [Download and install the client](install-unifiedlabelingclient-app.md)
- For admins: [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)

For information about new features in the Microsoft Purview compliance portal, see:

- [What's new in Microsoft 365 compliance?](/microsoft-365/compliance/whats-new)
- [Microsoft 365 roadmap](https://www.microsoft.com/microsoft-365/roadmap?filters=&searchterms=Microsoft%2CInformation%2CProtection)