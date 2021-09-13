---
# required metadata

title: What's new in Azure Information Protection (AIP) - Version history & support policy
description: Find out what's new for the Azure Information Protection (AIP) unified labeling client for Windows.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 09/13/2021
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

# Azure Information Protection unified labeling client - Version release history and support policy

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
>*If you have Windows 7 or Office 2010, see [AIP and legacy Windows and Office versions](../known-issues.md#aip-and-legacy-windows-and-office-versions).*
>
>***Relevant for**: [AIP unified labeling client only](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients).*

This article describes the new features available for the unified labeling client, as well as servicing information and support timelines for each AIP unified client version.

You can download the Azure Information Protection unified labeling client from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018).

After a short delay of typically four weeks, the latest general availability version is also included in the Microsoft Update Catalog. Azure Information Protection versions have a product name of **Microsoft Azure Information Protection** > **Microsoft Azure Information Protection Unified Labeling Client**, and a classification of **Updates**.

Including Azure Information Protection in the catalog means that you can upgrade the client using WSUS or Configuration Manager, or other software deployment mechanisms that use Microsoft Update.

For more information, see [Upgrading and maintaining the Azure Information Protection unified labeling client](clientv2-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-unified-labeling-client).

## Servicing information and timelines

Each general availability (GA) version of the Azure Information Protection unified labeling client is supported for up to six months after the release of the subsequent GA version. The documentation does not include information about unsupported versions of the client. Fixes and new functionality are always applied to the latest GA version and will not be applied to older GA versions.

### General availability versions that are no longer supported

|Client version|Date released|
|--------------|-------------|
| 2.9.111.0 |01/13/2021 |
| 2.8.85.0| 09/22/2020|
| 2.7.101.0 | 08/23/2020 |
| 2.7.99.0 | 07/20/2020 |
| 2.7.96.0  |06/29/2020 |
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

Noted Azure Information Protection features are currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

> [!TIP]
> Minor fixes are not always listed so if you experience a problem with the unified labeling client, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version (if available).
>
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

The unified labeling client replaces the Azure Information Protection classic client. To compare features and functionality with the classic client, see [Compare the labeling solutions for Windows computers](use-client.md#compare-the-labeling-solutions-for-windows-computers).

## Version 2.13.xx.x (Public preview)

Unified labeling scanner and client version 2.12.xx.x

**Released** 10/12/2021

This version includes the following new updates, fixes, and enhancements for the unified labeling scanner and client:

### Increased accuracy for sensitive information types

This version of the unified labeling client provides increased accuracy for automatic labeling, especially for content in East Asian languages, and with support for double-byte (full-width and half-width) characters.

- <TBD about analytics>

- Globalization enhancements, including increased accuracy for East Asian languages and support for double-bit characters is provided only for 64-bit processes, and is turned off by default.

    For more information, see [Turn on classification globalization features](clientv2-admin-guide-customizations.md#turn-on-classification-globalization-features-public-preview).

For more information, see [Learn about sensitive information types](/microsoft-365/compliance/sensitive-information-type-learn-about).

### Integrated support for MIP SDK version 1.10

This version of the Azure Information Protection client and scanner fully integrates the Microsoft Information Protection (MIP) Software Development Kit (SDK) version 1.10.93. 

For more information, see the [MIP SDK documentation](../information-protection/develop/version-release-history#version-11093).

### Scanner support for 64-bit versions only

Starting in version 2.12.xx.x, the unified labeling scanner is supported only on 64-bit systems.

For more information, see [Requirements for installing and deploying the Azure Information Protection unified labeling scanner](../deploy-aip-scanner-prereqs.md).

### Fixes and improvements

This version of the unified labeling client and scanner provides the following fixes and improvements:

- 7562760 Fixed an issue where toggling off the Information Protection bar in Office apps may not work consistently.
- 8605749 Fixed an issue where the *Basic Text* taskpane may become greyed out after a label is applied in Outlook until the user clicks in the body of the email.
- 8789561 Fixed an issue where an error may be displayed after the **Show add-in user interface errors** option is selected, while AIP functionality continues to work as expected.
- 8989279 Fixed an issue where large .PTIF files may fail to open in the AIP Viewer app.
- 9015904 Fixed issue where .PST files may not be completely decrypted using the [Set-AIPFileLabel](xref) PowerShell cmdlet.
- 9036848 Fixed issue where [pop-up messages configured for Outlook](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent) may be fully applied only after restarting Outlook a second time.
- 9195412 Fixed issue where encrypting a .MSG file using the [Set-AIPFileLabel](xref) PowerShell cmdlet may work unexpectedly.
- 9697560 10666773 Fixed issues where prompts to save changes may appear unexpectedly, either after forwarding or replying to labeled messages, or when working in Outlook online.
- 10171096 Fixed an issue where duplicate [Discover](../audit-logs.md#discover-audit-logs) entries may appear in AIP activity logs after adding an attachment to a mail.
- 10879169 Fixed an issue where the macro editor in Office apps may not support all Unicode characters after enabling the Azure Information Protection unified labeling client.
- 10880496 Fixed an issue where an error may appear when labeling an email in a PST file.
- 7566366 Enhanced support for the [PFileSupportedExtensions](clientv2-admin-guide-customizations#pfilesupportedextension) advanced setting, to add the ability to protect only Office file types and PDF files, without configuring one specific value.
- 8070538 Fixed an issue where a watermark may not be reflected correctly when a label is changed.
- 9449266 Fixed  an issue where Office apps may behave unexpectedly if the [`color`](clientv2-admin-guide-customizations#specify-a-color-for-the-label) value for a label has an invalid value.
- 10211100 Fixed an issue where selecting permissions via the File Explorer **Classify and protect** option may remove email addresses from the defined permissions if multiple email addresses include an apostrophe (**'**).
- 10240706 Fixed an issue where the auto-labeling custom text tooltip configured may not display as expected in case of an AsyncPolicy applied.
- 10420686 Fixed an issue where an AIP-related error appeared after a child label is added and scoped to *Groups & Sites*.
- 10447949 Fixed an issue where the **Delete Label** icon may not appear in the Outlook classification bar when mandatory labeling is enabled across Office, [but not in Outlook](clientv2-admin-guide-customizations#exempt-outlook-messages-from-mandatory-labeling).
- 10525046 Fixed an issue where Excel may not close completely when both the AIP add-in and other add-ins are running.
- 10565248 Fixed an issue where Outlook may fail to send a message with embedded images in rich-text with rules for [pop-ups in Outlook](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent) configured.
- 10632840 Fixed an issue where the AIP add-in may fail to load in Office apps with language related errors. <!--To fully apply this fix, you may need to assign the default [UILanguage](/windows-hardware/customize/desktop/unattend/microsoft-windows-international-core-winpe-uilanguage) value to `en_US`.-->
- 10350407 Fixed an issue when [pop-ups in Outlook](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent) may behave unexpectedly when attaching an email to another, newly encrypted email.

## Version 2.12.62.0

Unified labeling scanner and client version 2.12.62.0

**Released** 08/02/2021

This version includes the following new features, fixes, and enhancements for the unified labeling scanner and client:

### Support for DKE labels with user-defined permissions

This version of the unified labeling client and scanner supports DKE labels with user-defined permissions in Word, Excel, and PowerPoint.

For more information, see [Azure Information Protection tenant keys](../plan-implement-tenant-key.md#double-key-encryption-dke) and [Double Key Encryption for Microsoft 365](/microsoft-365/compliance/double-key-encryption).

### Client usage logging in the Windows event log

The unified labeling client now [logs user activity to the local Windows event log](clientv2-admin-guide-files-and-logging.md#client-side-usage-logging).

### AIP scanner: General availability support for DLP policies

Microsoft 365 Data Loss Prevention (DLP) policies are now supported with the Azure Information Protection unified labeling scanner directly in the main installation instead of a dedicated version only.

- **Using a DLP policy** enables the scanner to detect potential data leaks by matching DLP rules to files stored in file shares and SharePoint Server.

- [**Enable DLP rules in your content scan job**](../deploy-aip-scanner-configure-install.md#use-a-dlp-policy) to reduce the exposure of any files that match your DLP policies.

    The scanner may reduce file access to data owners only, or reduce exposure to network-wide groups, such as **Everyone**, **Authenticated Users**, or **Domain Users**.

- **Scanning your files with DLP rules enabled also creates file permission reports**. Query these reports to investigate specific file exposures or explore the exposure of a specific user to scanned files.

Settings for enforcing or testing the DLP policy are configured in the [Microsoft 365 Compliance center](/microsoft-365/compliance/create-test-tune-dlp-policy#turn-on-a-dlp-policy).

For more information, including licensing requirements, see:

- [Configure a DLP policy in the AIP scanner](../deploy-aip-scanner-configure-install.md#use-a-dlp-policy)
- [Learn about the Microsoft 365 data loss prevention on-premises scanner](/microsoft-365/compliance/dlp-on-premises-scanner-learn), in the Microsoft 365 documentation
- [Get started with the data loss prevention on-premises scanner](/microsoft-365/compliance/dlp-on-premises-scanner-get-started)
- [Use the Microsoft 365 data loss prevention on-premises scanner](/microsoft-365/compliance/dlp-on-premises-scanner-use)

### Fixes and improvements - version 2.12.62.0

- Fixes for errors where AIP may not load if a [policy](/microsoft-365/compliance/reate-sensitivity-labels#publish-sensitivity-labels-by-creating-a-label-policy) fails to parse parsing. Fix provided by updates to the [Microsoft Information Protection (MIP) SDK](/information-protection/develop/version-release-history).

- Fixed possibly incorrect **method** values in [New label audit logs](../audit-logs.md#new-label-audit-logs) for Outlook events.

- Fixes for possibly incorrect **label** and **labelBefore** values in [Change protection audit logs](../audit-logs.md#change-protection-audit-logs).

- Fixes for errors where documents may not be saved because of [edits made in the labeling metadata and lack of permissions](/microsoft-365/compliance/create-sensitivity-labels).

- Fixes for possible crashes when running PowerShell cmdlets. Fix provided by updates to the [Microsoft Information Protection (MIP) SDK](/information-protection/develop/version-release-history).

- Fixed errors where [justification popup messages](clientv2-admin-guide-customizations.md#implement-pop-up-messages-in-outlook-that-warn-justify-or-block-emails-being-sent) may not appear in Outlook.

- Fixed errors where the [AIP add-in](clientv2-admin-guide-install.md) in Outlook may cause an error message to appear, if a message file that was saved locally was opened, closed, and then opened again.

- Fixed errors where [visual markings](use-client.md#the-client-side-of-azure-information-protection) may not be refreshed as expected after changing a file's label to a label with no content markings.

- Fixed errors where [audit logs](../audit-logs.md) may not be sent when a default label is applied to a document.

- Fixed issues for [content markings](use-client.md#the-client-side-of-azure-information-protection) in Outlook may be duplicated.

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

For more information, see [Troubleshooting using the scanner diagnostic tool](../deploy-aip-scanner-tsg.md#troubleshooting-using-the-scanner-diagnostic-tool).

### Improved scanner details output

The unified labeling on-premises scanner has improved outputs for the following cmdlets:

|Cmdlet  |Improvement  |
|---------|---------|
|**Get-AIPScannerStatus**     |  Previously, running the [Get-AIPScannerStatus](/powershell/module/azureinformationprotection/get-aipscannerstatus) command provided only high-level details of the scanner cluster status, without details per node in your cluster.   <br><br> Now, you can use the **NodesInfo** variable and the **Verbose** parameter to drill down into additional levels of detail for each node. <br><br>   For more information, see the [Verify scanning details per scanner node and repository](../deploy-aip-scanner-tsg.md#verify-scanning-details-per-scanner-node-and-repository). |
|**Get-AIPScannerConfiguration**     |   Running the [Get-AIPScannerConfiguration](/powershell/module/azureinformationprotection/get-aipscannerconfiguration) now provides details about the current scanner configuration in addition to the online configuration settings.     |
|     |         |


### Updates for the scanner's supported information types

Beginning with version 2.11.58.0, the following sensitive information types are not scanned by the unified labeling scanner.

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

## Version 2.10.46.0 for co-authoring (Public preview)

Unified labeling client version 2.10.46.0

**Release** 03/02/2021

This dedicated version of Azure Information Protection provides a public preview of co-authoring features newly supported in Microsoft 365.

Co-authoring for Office apps enables multiple users to edit documents that are labeled and encrypted by [sensitivity labels](/microsoft-365/compliance/sensitivity-labels).

> [!IMPORTANT]
> To leverage the co-authoring features in public preview, you must download and install the dedicated installation file for this release. On the [Microsoft download site](https://www.microsoft.com/en-us/download/details.aspx?id=53018), download and install the `AzInfoProtection_2.10.46_CoAuthoring_PublicPreview.exe`  file.
>
> Your system must also comply with the version requirements listed in the [Microsoft 365 prerequisites for co-authoring](/microsoft-365/compliance/sensitivity-labels-coauthoring#prerequisites).
>

Before you start, we recommend that you review all related prerequisites and limitations. For more information, see:

- [Enable co-authoring for files encrypted with sensitivity labels](/microsoft-365/compliance/sensitivity-labels-coauthoring) in the Microsoft 365 documentation.
- [Known issues for co-authoring in AIP](../known-issues.md#known-issues-for-co-authoring-public-preview)

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

Not sure if unified labeling is the right client to install?  See [Choose your Windows labeling solution](use-client.md#choose-your-windows-labeling-solution).

For more information about installing and using the unified labeling client:

- For users: [Download and install the client](install-unifiedlabelingclient-app.md)
- For admins: [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)

For information about new features in the Microsoft 365 compliance center, see:

- [What's new in Microsoft 365 compliance?](/microsoft-365/compliance/whats-new)
- [Microsoft 365 roadmap](https://www.microsoft.com/microsoft-365/roadmap?filters=&searchterms=Microsoft%2CInformation%2CProtection)
