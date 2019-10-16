---
# required metadata

title: The client for Azure Information Protection - AIP
description: Microsoft Azure Information Protection provides a client-server solution that helps to protect an organization's data. The client (the Azure Information Protection client or the Rights Management client) is integrated with applications that you run on computers and mobile devices.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 10/23/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#audience:
#ms.devlang:
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
search.appverid:
- MET150

---

# The client side of Azure Information Protection

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Azure Information Protection provides a client-server solution that helps to protect an organization's documents and emails:

- The client can be the built-in labeling client for Office, the Azure Information Protection unified labeling client for Windows, the Azure Information Protection client (classic) for Windows, or the Rights Management client.
    
    These clients are often referred to as the **Office built-in labeling client**, the **unified labeling client**, the **classic client**, and the **RMS client**, respectively. Whichever client you use, it integrates with applications that you run on computers and mobile devices.

- The service resides in the cloud or on-premises. The cloud service is Azure Information Protection, which uses the Azure Rights Management service for the data protection. The on-premises service is Active Directory Rights Management Services, more commonly known as AD RMS. 

All these clients integrate with Office applications but the unified labeling client and the classic client must be installed separately and support additional features and components. For example, these clients include support for File Explorer, so you can classify and protect files outside Office. Additional components include a viewer for protected PDF documents and protected images, and a scanner for on-premises data stores.

The RMS client provides protection only. This client is automatically installed with some applications, such as Office applications, the Azure Information Protection clients, and RMS-enlightened applications from software vendors. However, it can also be [installed by itself](https://www.microsoft.com/en-us/download/details.aspx?id=38396), to support [synchronizing files from IRM-protected libraries and OneDrive for Business](https://support.office.com/article/Deploy-the-new-OneDrive-sync-client-in-an-enterprise-environment-3f3a511c-30c6-404a-98bf-76f95c519668), and for developers who want to integrate rights management protection into line-of-business applications.

## Choose which labeling client to use for Windows computers

Where possible, use one of the labeling clients because labels abstract the complexity of applying protection for users, and labels also provide classification so you can track and manage your data.

Your choice of labeling client for your Windows computers might be influenced by which management portal you use:

- The Office built-in labeling client and the Azure Information Protection unified labeling client download labels and policy settings from the following admin centers: 
    - Office 365 Security & Compliance Center
    - Microsoft 365 security center
    - Microsoft 365 compliance center

- The Azure Information Protection client (classic) downloads label and policy settings from the Azure portal.

Because the unified labeling client and the classic client require a separate installation to Office, you must download and install these clients from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018). 

Which client should you use?

- Use the **labeling client built in to Office** for your Windows computers when you have Office 365 apps that are a minimum version 1910, you want to use the same labels and policy settings that can also be used by MacOS, iOS, and Android, and you don't need features in your Office apps that require the unified labeling client or classic client. These features currently include automatic and recommended labeling, and the Information Protection bar under the ribbon for easier label selection and visibility.

- Use the **Azure Information Protection unified labeling client** on Windows computers for labels and policy settings that can also be used by MacOS, iOS, and Android, you want to label files independently from Office 365 apps, and you don’t need features that are only supported by the classic client. These features currently include protecting content with an on-premises key (HYOK) and a general availability version of the scanner for on-premises data stores.
    
    You can use both the labeling client built into Office 365 apps and the Azure Information Protection unified labeling client on the same computer. By default, if you install the unified labeling client on a computer that uses Office 365 apps with the built-in labeling client, the unified labeling client is enabled in your Office apps. However, you can change this behavior to use the built-in labeling client for just your Office apps. With this configuration, the unified labeling client remains available for labeling in File Explorer, PowerShell, and the scanner. For instructions to disable the unified labeling client in Office 365 apps, see the section "Will the built-in Sensitivity feature run alongside the Azure Information Protection client in Office for Windows?" from the Office documentation, [Apply sensitivity labels to your documents and email within Office](https://support.office.com/article/Apply-sensitivity-labels-to-your-documents-and-email-within-Office-2f96e7cd-d5a4-403b-8bd7-4cc636bae0f9).

- Install the **Azure Information Protection client (classic)** on Windows computers if you need a version of the client that has features that are not yet available with the unified labeling client. This client doesn't use labels and policy settings that can also be used by MacOS, iOS, and Android, so your tradeoff is administration using another management portal and a different user experience for users.

The latest version of the unified labeling client brings it to close parity in features with the classic client. As this gap closes, you can expect new features to be added only to the unified labeling client. For this reason, we recommend you deploy the unified labeling client if its current feature set and functionality meet your business requirements. If not, or if you have configured labels in the Azure portal that you haven't yet [migrated to the unified labeling store](../configure-policy-migrate-labels.md), use the classic client.

You can use different clients in the same environment to support different business requirements, as demonstrated in the following deployment example. In a mixed client environment, we recommend you use unified labels so that clients share the same set of labels for ease of administration. New customers have unified labels by default because their tenants are on the unified labeling platform. For more information, see [How can I determine if my tenant is on the unified labeling platform?](../faqs.md#how-can-i-determine-if-my-tenant-is-on-the-unified-labeling-platform)

### Example deployment strategy:

- For the majority of users, you deploy the Azure Information Protection unified labeling client because this client meets the business needs for these users. 
    
    For these users, their labeling experience is very similar across Windows, Mac, iOS, and Android because they have the same labels published to them and the same policy settings. As an admin, you manage these labels and policy settings in the same management center.

- You also install the unified labeling client for yourself, to test the preview version of the Azure Information Protection scanner.

- For a subset of users, you deploy the classic client because these users require labels that apply hold your own key (HYOK) protection.
    
    For these users, they have a slightly different labeling experience when they use this client. For example, they see a **Protect** button rather than a **Sensitivity** button in Office apps. As an admin, you need to manage their labels for HYOK settings and policy settings in a different management center to the labels and settings for the other client platforms.

- You have on-premises data stores with documents that need to be scanned for sensitive information, or classified and protected. For production use, you deploy the classic client on servers to run the Azure Information Protection scanner.

## Compare the labeling clients for Windows computers

Use the following table to help compare which features are supported by the three labeling clients for Windows computers.

To compare the Office built-in sensitivity labeling features across different operating system platforms (Windows, MacOS, iOS, and Android) and for the web, see the Office documentation, [What sensitivity label capabilities are supported in Office today?](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels-office-apps#what-sensitivity-label-capabilities-are-supported-in-office-today)

|Feature|Classic client|Unified labeling client|Office built-in labeling client|
|:------|:------------:|:---------------------:|:-----------------------------:|
|Manual labeling:| **Yes** | **Yes** |**Yes** |
|Default label:| **Yes** | **Yes** | **Yes** |
|Recommended or automatic labeling:| **Yes** | **Yes** | No |
|Mandatory labeling:| **Yes** | **Yes** | No |
|User-defined permissions for a label:<br />- Do Not Forward for emails<br />- Custom permissions for Word, Excel, PowerPoint, File Explorer| **Yes** | **Yes** | No |
|Multilanguage support for labels:| **Yes** | **Yes** |**Yes** |
|Label inheritance from email attachments:| **Yes** | **Yes**  |No |
|Customizations that include:<br />- Default label for email<br />- Pop-up messages in Outlook <br />- S/MIME support<br />- Report an Issue option| **Yes** <sup>1</sup> | **Yes** <sup>2</sup> | No |
|Scanner for on-premises data stores:| **Yes** | **Yes <br />(preview)** | No |
|Central reporting (analytics):| **Yes** | **Yes** | No |
|Custom permissions set independently from a label:| **Yes** | **Yes** <sup>3</sup>| No |
|Information Protection bar in Office apps:| **Yes** | **Yes**| No |
|Visual markings as a label action (header, footer, watermark):| **Yes** | **Yes** | **Yes**|
|Per app visual markings:| **Yes** | No | No |
|Dynamic visual markings with variables:| **Yes** | No | No |
|Label with File Explorer:| **Yes** | **Yes** | No |
|A viewer for protected files (text, images, PDF, .pfile):| **Yes** | **Yes** | No|
|PPDF support for applying labels:| **Yes** | No | No |
|PowerShell labeling cmdlets:| **Yes** | **Yes** <sup>4</sup> | No |
|Manual policy file management for disconnected computers:| **Yes** |**Yes** | No |
|Offline support for protection actions:| **Yes** | **Yes** <sup>5</sup> | **Yes** |
|HYOK support:| **Yes** | No | No |
|Usage logging in Event Viewer:| **Yes** | No |No |
|Display the Do Not Forward button in Outlook:| **Yes** | No | No |
|Track protected documented:| **Yes** | **Yes** <sup>6</sup> | No |
|Revoke protected documents:| **Yes** | No | No |
|Protection-only mode (no labels):| **Yes** | No | No |
|Support for AD RMS:| **Yes** | No <sup>7</sup> | No |

Footnotes:

<sup>1</sup>
These settings, and many more are supported as [advanced client settings that you configure in the Azure portal](client-admin-guide-customizations.md#how-to-configure-advanced-client-configuration-settings-in-the-portal).

<sup>2</sup>
These settings, and many more are supported as [advanced settings that you configure with PowerShell](clientv2-admin-guide-customizations.md#how-to-configure-advanced-settings-for-the-client-by-using-office-365-security--compliance-center-powershell).

<sup>3</sup>
Supported by File Explorer and PowerShell. In Office apps, users can select **File Info** > **Protect Document** > **Restrict Access**.

<sup>4</sup>
No support to remove protection from container files (zip, .rar, .7z, .msg, and .pst).

<sup>5</sup>
For File Explorer and PowerShell commands, the user must be connected to the Internet to protect files.

<sup>6</sup>
The document tracking site that's supported by the classic client isn't supported by the unified labeling client. However, without the need to first register the document for tracking, administrators can use [central reporting](../reports-aip.md) to identify whether protected documented are accessed from Windows computers, and whether access was granted or denied. 

<sup>7</sup>
Labeling and protection actions aren't supported. However, for an AD RMS deployment, the viewer can open protected documents when you use the [Active Directory Rights Management Services Mobile Device Extension](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/dn673574\(v=ws.11\)).


### Detailed comparisons for the Azure Information Protection clients

When the Azure Information Protection client (classic) and the Azure Information Protection unified labeling client both support the same feature, use the following table to help identify some functional differences between the two clients.

|Functionality |Classic client|Unified labeling client|
|--------------|-----------------------------------|-----------------------------------------------------------|
|Setup:| Option to install local demo policy | No local demo policy|
|Label selection and display when applied in Office apps:|From the **Protect** button on the ribbon <br /><br /> From the Information Protection bar (horizontal bar under the ribbon)|From the **Sensitivity** button on the ribbon<br /><br /> From the Information Protection bar (horizontal bar under the ribbon)|
|Manage the Information Protection bar in Office apps:|For users: <br /><br />- Option to show or hide the bar from the **Protect** button on the ribbon<br /><br />- When a user selects to hide the bar, by default, the bar is hidden in that app, but continues to automatically display in newly opened apps <br /><br /> For admins: <br /><br />- Policy settings to automatically show or hide the bar when an app first opens, and control whether the bar automatically remains hidden for newly opened apps after a user selects to hide the bar|For users: <br /><br />- Option to show or hide the bar from the **Sensitivity** button on the ribbon<br /><br />- When a user selects to hide the bar, the bar is hidden in that app and also in newly opened apps <br /><br />For admins: <br /><br />- PowerShell setting to manage the bar |
|Label color: | Configure in the Azure portal | Retained after label migration to Office 365 and configurable with PowerShell <br /><br /> Colors can be configured by using [PowerShell](clientv2-admin-guide-customizations.md#specify-a-color-for-the-label)|
|Labels support different languages:| Configure in the Azure portal | Configure by using Office 365 Security & Compliance PowerShell and the *LocaleSettings* parameter for [New-Label](https://docs.microsoft.com/powershell/module/exchange/policy-and-compliance/new-label?view=exchange-ps) and [Set-Label](https://docs.microsoft.com/powershell/module/exchange/policy-and-compliance/set-label?view=exchange-ps)|
|Policy update: | When an Office app opens <br /><br /> When you right-click to classify and protect a file or folder <br /><br />When you run the PowerShell cmdlets for labeling and protection<br /><br />Every 24 hours | When an Office app opens <br /><br /> When you right-click to classify and protect a file or folder <br /><br />When you run the PowerShell cmdlets for labeling and protection<br /><br />Every 4 hours|
|Supported formats for PDF:| Protection: <br /><br /> - ISO standard for PDF encryption (default) <br /><br /> - .ppdf <br /><br /> Consumption: <br /><br /> - ISO standard for PDF encryption <br /><br />- .ppdf<br /><br />- SharePoint IRM protection| Protection: <br /><br /> - ISO standard for PDF encryption <br /><br /> <br /><br /> Consumption: <br /><br /> - ISO standard for PDF encryption <br /><br />- .ppdf<br /><br />- SharePoint IRM protection|
|Generically protected files (.pfile) opened with the viewer:| File opens in the original app where it can then be viewed, modified, and saved without protection | File opens in the original app where it can then be viewed and modified, but not saved|
|Supported cmdlets:| Cmdlets for labeling and cmdlets for protection-only | Cmdlets for labeling:<br /><br /> Set-AIPFileClassification and Set-AIPFileLabel don't support the *Owner* parameter <br /><br /> In addition, there is a single comment of "No label to apply" for all scenarios where a label isn't applied <br /><br /> Set-AIPFileClassification supports the *WhatIf* parameter, so it can be run in discovery mode <br /><br /> Set-AIPFileLabel doesn't support the *EnableTracking* parameter <br /><br /> Get-AIPFileStatus doesn't return label information from other tenants and doesn't display the *RMSIssuedTime* parameter<br /><br />In addition, the *LabelingMethod* parameter for Get-AIPFileStatus displays **Privileged** or **Standard** instead of **Manual** or **Automatic**. For more information, see the [online documentation](/powershell/module/azureinformationprotection/get-aipfilestatus).|
|Justification prompts (if configured) per action in Office: | Frequency: Per file <br /><br /> Lowering the sensitivity level <br /><br /> Removing a label<br /><br /> Removing protection | Frequency: Per session <br /><br /> Lowering the sensitivity level<br /><br /> Removing a label|
|Remove applied label actions: | User is prompted to confirm <br /><br />Default label or automatic label (if configured) isn't automatically applied next time the Office app opens the file  <br /><br />| User isn't prompted to confirm<br /><br /> Default label or automatic label (if configured) is automatically applied next time the Office app opens the file|
|Automatic and recommended labels: | Configured as [label conditions](../configure-policy-classification.md) in the Azure portal with built-in information types and custom conditions that use phrases or regular expressions <br /><br />Configuration options include: <br /><br />- Unique / Not unique count <br /><br /> - Minimum count| Configured in the admin centers with built-in sensitive information types and [custom information types](https://docs.microsoft.com/office365/securitycompliance/create-a-custom-sensitive-information-type)<br /><br />Configuration options include:  <br /><br />- Unique count only <br /><br />- Minimum and maximum count <br /><br />- AND and OR support with information types <br /><br />- Keyword dictionary<br /><br />- Customizable confidence level and character proximity|
|Customizable policy tip for automatic and recommended labels: | Yes <br /><br />Use the Azure portal to replace the default message to users | No <br /><br /> Although the admin centers have an option to supply a customized policy tip, this option is not currently supported by the unified labeling client|
|Change the default protection level of files: | Yes <br /><br />You can use [registry edits](client-admin-guide-file-types.md#changing-the-default-protection-level-of-files) to override the defaults of native and generic protection | No |

For a detailed comparison of behavior differences for specific protection settings, see [Comparing the behavior of protection settings for a label](../configure-policy-migrate-labels.md#comparing-the-behavior-of-protection-settings-for-a-label).

### Features not planned to be in the Azure Information Protection unified labeling client

Although the Azure Information Protection unified labeling client is still under development, the following features and behavior differences from the classic client are not currently planned to be available in future releases for the unified labeling client: 

- Support Office apps for disconnected computers with manual policy file management

- Custom permissions as a separate option that users can select in Office apps: Word, Excel, and PowerPoint

- Track and revoke from Office apps and File Explorer

- Information Protection bar title and tooltip

- Protection-only mode (no labels) using templates

- Protect PDF document as .ppdf format

- Display the Do Not Forward button in Outlook

- Demo policy

- Justification for removing protection

- Confirmation prompt **Do you want to delete this label?** for users when you don't use the policy setting for justification

- Separate PowerShell cmdlets to connect to a Rights Management service


### Parent labels and their sublabels 

The Azure Information Protection client (classic) doesn't support configurations that specify a parent label that has sublabels. These configurations include specifying a default label, and a label for recommended or automatic classification. When a label has sublabels, you can specify one of the sublabels but not the parent label.

For parity, the Azure Information Protection unified labeling client also doesn't support applying parent labels that have sublabels, even though you can select these labels in the admin centers. In this scenario, the Azure Information Protection unified labeling client will not apply the parent label.

## Next steps

To install and configure the Azure Information Protection clients, use the following documentation:

- [Azure Information Protection client](AIP-client.md)

- [Azure Information Protection unified labeling client](unifiedlabelingclient-version-release-history.md)

For more information about using the built-in labeling client for Office 365 apps, see [Sensitivity labels in Office apps](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels-office-apps).
