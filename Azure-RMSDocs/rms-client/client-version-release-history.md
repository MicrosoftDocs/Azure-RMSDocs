---
# required metadata

title: Azure Information Protection client - Version release history and support policy
description: See what's new or changed in a release of the Azure Information Protection client for Windows, and understand the lifecycle policy for support. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/02/2018
ms.topic: conceptual
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:git
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Azure Information Protection client: Version release history and support policy

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

The Azure Information Protection team regularly updates the Azure Information Protection client for fixes and new functionality. 

You can download the latest general availability release version and the current preview version (if available) from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018). After a short delay of typically a couple of weeks, the general availability version is also included in the Microsoft Update Catalog (category: **Azure Information Protection**). This inclusion in the catalog means that you can upgrade the client by using WSUS or Configuration Manager, or other software deployment mechanisms that use Microsoft Update.

For more information, see [Upgrading and maintaining the Azure Information Protection client](client-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-client).

### Servicing information and timelines

Each general availability (GA) version of the Azure Information Protection client is supported for up to six months after the release of the subsequent GA version. Unsupported versions of the client are not included on this page. Fixes and new functionality are always applied to the latest GA version and will not be applied to older GA versions.

Preview versions should not be deployed for end users on production networks. Instead, use the latest preview version to see and try new functionality or fixes that are coming in the next GA version. Preview versions that are not current are not supported.

### Release history

Use the following information to see what’s new or changed for a supported release of the Azure Information Protection client for Windows. The most current release is listed first. 

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the Azure Information Protection client, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version.
>  
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

## Version 1.41.51.0

> [!TIP]
> Interested in evaluating the Azure Information Protection unified labeling client because your labels are published from the Office 365 Security & Compliance Center? See [Azure Information Protection unified labeling client: Version release information](unifiedlabelingclient-version-release-history.md).

**Released**: 11/27/2018

This version includes the MSIPC version 1.0.3592.627 of the RMS client.

**New features:**

- Support for [central reporting](../reports-aip.md) for the Azure Information Protection analytics feature announced at Microsoft Ignite.

- Excel now also supports [visual marking](../configure-policy-markings.md)s in different colors.

- For existing S/MIME deployments, a new advanced client setting (in preview) to configure a label to automatically apply S/MIME protection in Outlook. [More information](client-admin-guide-customizations.md#configure-a-label-to-apply-smime-protection-in-outlook)

- A new advanced client setting, as an alternative to editing the registry to prevent sign-in prompts for the Azure Information Protection service for [disconnected computers](client-admin-guide-customizations.md#support-for-disconnected-computers).

**Fixes**:

- The Azure Information Protection client no longer excludes .msg, .rar, and .zip file name extensions for File Explorer (right-click) and PowerShell commands. However, these file name extensions remain excluded by default for the scanner. 

- The Azure Information Protection client can unprotect multiple files (multi-select and a folder that contains protected files) when you use File Explorer, right-click.

- For Excel:
    
    - Visual markings are now applied if you save the spreadsheet while editing a cell.
    
    - Excel 2010: When a spreadsheet is protected by using the Co-Author [permission level](../configure-usage-rights.md#rights-included-in-permissions-levels), the **Delete Label** button is now available when you right-click the file and choose **Classify and Protect**.

- The advanced client settings that can [remove headers and footers from other labeling solutions](client-admin-guide-customizations.md#remove-headers-and-footers-from-other-labeling-solutions) now supports custom layouts.

**Additional changes:**

- When the scanner's schedule is set to **Always**, there is now a delay of 30 seconds between scans.

## Version 1.37.19.0

**Released**: 09/17/2018

This version includes the MSIPC version 1.0.3592.627 of the RMS client.

**New features**: 

- Support for the ISO standard for PDF encryption, by configuring a new [advanced client configuration](client-admin-guide-customizations.md#protect-pdf-files-by-using-the-iso-standard-for-pdf-encryption). When this option is configured, PDF documents that you protect retain their .pdf file name extension (rather than change to .ppdf) and can be opened by PDF readers that support this ISO standard. Currently, you must instruct users to open these protected PDFs manually by using the Azure Information Protection viewer. To help users do this, when they open one of these protected PDFs, they see a page with icons to select for their operating system.

- Support for new sensitive information types to help you classify documents that contain personal information. [More information](../configure-policy-classification.md#sensitive-information-types-that-require-a-minimum-version-of-the-client) 

- Labels that apply protection now display in Office 2016 apps (minimum version 1805, build 9330.2078) when the user is assigned a license for Azure Rights Management (also known as Azure Information Protection for Office 365).

- Labeling support for **Strict Open XML Document** format in Word, Excel, and PowerPoint files. For more information about the Open XML formats, see the Office blog post, [New file format options in the new Office](https://www.microsoft.com/en-us/microsoft-365/blog/2012/08/13/new-file-format-options-in-the-new-office/). 

- Support for files that have been protected by Secure Islands when those files are other than PDF and Office documents. For example, protected text and picture files. Or, files that have a .pfile file name extension. This support enables new scenarios, such as the Azure Information Protection scanner being able to inspect these files for sensitive information, and automatically relabeling them for Azure Information Protection. [More information](client-admin-guide-customizations.md#support-for-files-protected-by-secure-islands)

- New advanced client settings to remove headers and footers that have been applied to documents by other labeling solutions. [More information](client-admin-guide-customizations.md#remove-headers-and-footers-from-other-labeling-solutions)

- For the Azure Information Protection scanner:

    - New cmdlet, [Update-AIPScanner](/powershell/module/azureinformationprotection/Update-AIPScanner): Required to run once after upgrading from the previous GA version (1.29.5.0) or earlier.
    
    - New cmdlet, [Get-AIPScannerStatus](/powershell/module/azureinformationprotection/Get-AIPScannerStatus): Gets the current status of the service for the scanner.  
    
    - New cmdlet, [Start-AIPScan](/powershell/module/azureinformationprotection/Start-AIPScan): Instructs the scanner to start a one time scan cycle when the schedule is set to manual.
    
    - SharePoint Server 2010 is supported for customers who have [extended support for this version of SharePoint](https://support.microsoft.com/lifecycle/search?alpha=SharePoint%20Server%202010).
    
- Support for the new **Azure Information Protection - Nodes (Preview)** blade in the Azure portal, that lets you manage scanners from a central location. Information from your deployed scanners that have connectivity to Azure is updated every five minutes. From this blade, you can start the scanner for a one-time scan, rescan all files, check the status of a scanner, and view the scan rate.

**Fixes**

- For the Azure Information Protection scanner:
    
    - For documents that are protected in SharePoint libraries, if the *DefaultOwner* parameter is not used for the data repository, the SharePoint Editor value is now used as the default value instead of the Author value.
    
    - Scanner reports include "Last modified by" for Office documents.
    
    - You can now protect all file types by using the `*` wildcard when you edit the registry as described in the [Editing the registry for the scanner](../deploy-aip-scanner.md#editing-the-registry-for-the-scanner) section.

- Viewing emails by using the Next Item and Previous Item arrow icons on the Quick Access toolbar shows the correct label for each email.

- When you classify and protect by using File Explorer, PowerShell, or the scanner, the Office document metadata is not removed or encrypted.

- Custom permissions support recipient email addresses that contain an apostrophe.

- The computer environment will successfully initialize (bootstrap) when this action is initiated by opening a protected document that's stored in SharePoint Online.

- When you use the client for right-click in File Explorer, PowerShell, or the scanner, labeling is blocked for files in WebDav locations because this is an unsupported scenario.

- The Delete Label icon does not display in client apps (Word, Excel, PowerPoint, and Outlook) when you configure the [policy setting](../configure-policy-settings.md) of **All documents and emails must have a label**.

**Additional changes**:

- For [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration):
    
    - Values for the *Schedule* parameter are no longer **OneTime**, **Continuous**, and **Never**, but now **Manual** and **Always**.
        
    - The *Type* parameter is removed, so it is also removed from the output when you run [Get-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Get-AIPScannerConfiguration). By default, only new or modified files are inspected after the first scan cycle. If you previously set the *Type* parameter to **Full** to rescan all files, now run [Start-AIPScan](/powershell/module/azureinformationprotection/Start-AIPScan) with the *Reset* parameter. The scanner must also be configured for a manual schedule, which requires the *Schedule* parameter to be set to **Manual** with [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration).
    
- The default exclusion list for the client and scanner now includes .msg, .rar, and .zip files. The scanner also excludes .rtf files. [More information](client-admin-guide-file-types.md#file-types-that-are-excluded-from-classification-and-protection)

- The policy version is changed to 1.4. Identifying the version number is required for [configuring disconnected computers](client-admin-guide-customizations.md#support-for-disconnected-computers).

- The **Send Us Feedback** link in the **Help and Feedback** dialog box is removed. It was temporarily replaced with **Report an Issue**, but this link now displays in preview versions only. By default, this option sends an email to Microsoft but you can change this email address to an HTTP string that you specify. For example, a customized web page that you have for users to report issues, or an email address that goes to your help desk. To modify this address, use an [advanced client setting](client-admin-guide-customizations.md#modify-the-email-address-for-the-report-an-issue-link).

## Version 1.29.5.0 

**Released**: 06/26/2018

This version includes the MSIPC version 1.0.3403.1224 of the RMS client.

**Fixes**:

- For Outlook versions 16.0.9324.1000 and later (Click-to-Run), the Azure Information Protection bar supports the latest monitor display options that previously might result in the bar displaying outside the Outlook application.

- Visual markings that you configure [per Office application type](../configure-policy-markings.md#setting-different-visual-markings-for-word-excel-powerpoint-and-outlook) now replace a header or footer that was previously applied by an Azure Information Protection label.

- When an Excel file is already labeled and the label applies visual markings, a new sheet now also has the label's visual markings applied.

- When you use the advanced client setting to [label an Office document by using an existing custom property](client-admin-guide-customizations.md#label-an-office-document-by-using-an-existing-custom-property), automatic labeling doesn't override manual labeling.

## Version 1.27.48.0

**Released**: 05/30/2018

This version includes the MSIPC version 1.0.3403.1224 of the RMS client.

**New features**: 

- For the Azure Information Protection scanner:
    
    - You can specify a file types list to include or exclude from scanning. To specify this list, use [Set-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Set-AIPScannerScannedFileTypes). After you have specified your file types list, you can add a new file type to the list by using [Add-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Add-AIPScannerScannedFileTypes), and remove a file type from the list by using [Remove-AIPScannerScannedFileTypes](/powershell/module/azureinformationprotection/Remove-AIPScannerScannedFileTypes).
    
    - You can label files without inspecting the contents by applying a default label. Use the [Set-AIPScannerRepository](/powershell/module/azureinformationprotection/Set-AIPScannerRepository) cmdlet, and set the *MatchPolicy* parameter to **Off**. 
    
    - You can discover files with sensitive information types without configuring labels for automatic classification. use the [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration) cmdlet, and set the *DiscoverInformationTypes* parameter to **All**
    
    - By default, only Office document types are protected. Other file types can be protected when you define them in the registry. For instructions, see [File API configuration](../develop/file-api-configuration.md) from the developer guidance.
    
    - By default, the scanner now runs with a low integrity level for higher security in case you run the scanner with an account that has privileged rights. When the service account that runs the scanner has only the rights documented in the [scanner prerequisites](../deploy-aip-scanner.md#prerequisites-for-the-azure-information-protection-scanner), the low integrity level is not necessary and is not recommended because it negatively affects performance. You can use an advanced client setting to disable the low integrity level. [More information](client-admin-guide-customizations.md#disable-the-low-integrity-level-for-the-scanner) 
    
- For [Get-AIPFileStatus](/powershell/module/azureinformationprotection/Get-AIPFileStatus), the output now includes the Rights Management owner and Rights Management issuer, and the date that the content was protected.
 
**Additional changes**:

- For the Azure Information Protection scanner: 
    
    - If you installed a previous version of the scanner, rerun the scanner installation command with [Install-AIPScanner](/powershell/module/azureinformationprotection/Install-AIPScanner) after you have upgraded the Azure Information Protection client. Your configuration settings for the scanner and repositories will be retained. Reinstalling the scanner grants the scanner service account delete permissions for the scanner database, which will be required for reports.    
    
    - The *ScanMode* parameter from [Set-AIPScannerConfiguration](/powershell/module/azureinformationprotection/Set-AIPScannerConfiguration) is renamed to **Enforce**, with values of Off and On.
    
    - To use a default label, you no longer need to configure a default label as a policy setting. Instead, just specify this default label with the repository configuration. 

- Removed the "Congratulations!" welcome page and "What's new in Azure Information Protection" page, which displayed for first-time use in Office applications.

## Next steps

For more information about installing and using the client: 

- For users: [Download and install the client](install-client-app.md)

- For admins: [Azure Information Protection client administrator guide](client-admin-guide.md)

