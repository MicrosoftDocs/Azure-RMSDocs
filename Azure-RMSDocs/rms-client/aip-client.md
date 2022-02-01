---
# required metadata

title: Azure Information Protection classic client for Windows
description: Information resources for the Azure Information Protection classic client for Windows.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 02/01/2022
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: f9b61b6b-05ba-4422-b8b0-cd20af774a2b
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.subservice: v1client
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Azure Information Protection classic client for Windows

>***Applies to**: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
> ***Relevant for**: [Azure Information Protection classic client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see the unified labeling client [admin guide](clientv2-admin-guide.md) and [user guide](clientv2-user-guide.md).*

[!INCLUDE [AIP classic client is deprecated](../includes/classic-client-deprecation.md)]

The Azure Information Protection classic client is the original downloadable client for organizations that use Azure Information Protection to classify and protect documents and emails, or use a Rights Management service to protect their data. This client also has a viewer for organizations that don't have their own information protection infrastructure but want to consume content that has been protected by other organizations that use a Rights Management service from Microsoft.

Use the following resources for the classic client:

- [Azure Information Protection client: Version release history](client-version-release-history.md)

- [Azure Information Protection client administrator guide](client-admin-guide.md)

- [Azure Information Protection user guide](client-user-guide.md)

> [!TIP]
> There's also an Azure Information Protection app for iOS and Android. For more information, see [FAQs for Azure Information Protection app for iOS and Android](mobile-app-faq.md )
> 
> For Mac computers: Use the RMS sharing app and read the [FAQ for Rights Management Sharing Application for Mobile and Mac Platforms](/previous-versions/msdn10/dn451248(v=msdn.10)).


## Supported features

The this section lists the features supported by the classic client, in parallel with the comparison sections for the unified labeling client and built-in labeling solution in [Learn about about built-in labeling and the AIP unified labeling client](use-client.md).

This section also provides a more detailed comparison of supported features between the classic and unified labeling clients.

### Classic client features for Office applications

|Feature area  |Supported by the classic client  |
|---------|---------|
|**User experience**     | - Multi-language support <br> - Information Protection bar in Office apps  <br>     |
|**Enforcement**   |  - Manual labeling <br> - Mandatory labeling   <br>- PowerShell labeling cmdlets <br>- Customizations, such as default labels for emails, pop-up messages in Outlook, S/MIME support, and a Report an Issue option <br><br> **Note**: Customization settings are supported as [advanced client settings that you configure in the Azure portal](client-admin-guide-customizations.md#how-to-configure-advanced-classic-client-configuration-settings-in-the-portal)   |
|**Automation**     |  - Default labeling   <br>- Label inheritance from email attachments    |
|**Encryption and protection**     | - Recommended or automatic labeling <br>- User-defined permissions for a label: *Do Not Forward* for emails and custom permissions for Word, Excel, PowerPoint <br> - Display the *Do Not Forward* button in Outlook <br>- Custom permissions set independently from a label <br> - Protection-only mode (no labels)<br> - Support for AD RMS <br>- Track and revoke protected documents: [Admin docs](client-admin-guide-document-tracking.md) / [User docs](client-track-revoke.md) <br><br>**Note**: Administrators can also use [central reporting](../reports-aip.md) to identify whether protected documents are accessed from Windows computers, and whether access was granted or denied. |
|**Logging and analytics**     |   - Central reporting<br>  - Usage logging in Event Viewer      |
|**Visual markings**     | - Visual markings as a label action (header, footer, watermark)<br>    - Per-app visual markings<br>  - Dynamic visual markings with variables<br>    - Remove external content marking in apps        |
|**Identity**     |   - HYOK support       |
|**Workload environment**     |       - Support for Microsoft Office 97-2003 formats  <br>- Government Community Cloud <br>- Offline support for protection actions<br>    - Manual policy file management for disconnected computers<br>    - Support for Remote Desktop services   |
|     |         |

### Classic client features for outside Office applications

The following features are supported by the classic client outside of Office applications:

- Scanner for on-premises data stores
- Label with File Explorer
- A viewer for protected files (text, image, PDF, .pfile)
- PPDF support for applying labels


## Detailed comparisons for the AIP clients

When the Azure Information Protection classic client and the Azure Information Protection unified labeling client both support the same feature, use the following lists to help identify some functional differences between the two clients:

### AIP client feature comparisons in Office applications

#### User experience features

|Functionality |Classic client|Unified labeling client|
|--------------|-----------------------------------|-----------------------------------------------------------|
|**Remove applied label actions** | User is prompted to confirm <br /><br />The default label or an automatic label (if configured) is not automatically applied next time the Office app opens the file  | User is not prompted to confirm<br /><br /> The default label or an automatic label (if configured) is automatically applied next time the Office app opens the file|
|**Label selection and display when applied in Office apps**|From the **Protect** button on the ribbon <br /><br /> From the Information Protection bar (horizontal bar under the ribbon)|From the **Sensitivity** button on the ribbon<br /><br /> From the Information Protection bar (horizontal bar under the ribbon)|
|**Manage the Information Protection bar in Office apps**|**For users**:<br />Option to show or hide the bar from the **Protect** button on the ribbon<br /><br>When a user selects to hide the bar, by default, the bar is hidden in that app, but continues to automatically display in newly opened apps <br /><br /> **For admins**: <br />Policy settings to automatically show or hide the bar when an app first opens, and control whether the bar automatically remains hidden for newly opened apps after a user selects to hide the bar|**For users**: <br />Option to show or hide the bar from the **Sensitivity** button on the ribbon. <br><br />When a user selects to hide the bar, the bar is hidden in that app and also in newly opened apps <br /><br />**For admins**: <br />PowerShell setting to manage the bar |
|**Label color**| Configure in the Azure portal | Retained after label migration and configurable with [PowerShell](clientv2-admin-guide-customizations.md#specify-a-color-for-the-label)|
|**Labels support different languages**| Configure in the Azure portal | Configure by using [Office 365 Security & Compliance PowerShell](/microsoft-365/compliance/create-sensitivity-labels#additional-label-settings-with-office-365-security--compliance-center-powershell)|
|**Justification prompts (if configured) per action in Office** | - Frequency: Per file <br /> - Lowering the sensitivity level <br /> - Removing a label<br /> - Removing protection | - Frequency: Per session <br /> - Lowering the sensitivity level<br />-  Removing a label|
| | | |

#### Enforcement features

|Functionality |Classic client|Unified labeling client|
|--------------|-----------------------------------|-----------------------------------------------------------|
|**Setup**| Option to install local demo policy | No local demo policy|
|**Policy update**| - When an Office app opens <br /> - When you right-click to classify and protect a file or folder <br />- When you run the PowerShell cmdlets for labeling and protection<br />- Every 24 hours <br />- For the scanner: Every hour and when the service starts and the policy is older than one hour| - When an Office app opens <br />- When you right-click to classify and protect a file or folder <br />- When you run the PowerShell cmdlets for labeling and protection<br />- Every 4 hours <br />- For the scanner: Every 4 hours|
|**Order support for sublabels on attachments** | Enabled with an [advanced client setting](client-admin-guide-customizations.md#enable-order-support-for-sublabels-on-attachments) | Enabled by default, no configuration required|
| | | |

#### Automation features

|Functionality |Classic client|Unified labeling client|
|--------------|-----------------------------------|-----------------------------------------------------------|
|**Automatic and recommended labels** | Configured as [label conditions](../configure-policy-classification.md) in the Azure portal with built-in information types and custom conditions that use phrases or regular expressions <br /><br />Configuration options include: <br />- Unique / Not unique count <br /> - Minimum count| Configured in the Microsoft 365 compliance center with built-in sensitive information types and [custom information types](/microsoft-365/compliance/create-a-custom-sensitive-information-type)<br /><br />Configuration options include:  <br />- Unique count only <br />- Minimum and maximum count <br />- AND and OR support with information types <br />- Keyword dictionary<br />- Customizable confidence level and character proximity|
|**Change the default protection behavior for file types**| Use [registry edits](client-admin-guide-file-types.md#changing-the-default-protection-level-of-files) to override the defaults of native and generic protection | Use [PowerShell](clientv2-admin-guide-customizations.md#change-which-file-types-to-protect) to change which file types get protected|
| | | |

### AIP client feature comparisons outside of Office applications

|Functionality |Classic client|Unified labeling client|
|--------------|-----------------------------------|-----------------------------------------------------------|
|**Supported formats for PDF**| **Protection**: <br /> - ISO standard for PDF encryption (default) <br /> - .ppdf <br /><br> **Consumption**: <br /> - ISO standard for PDF encryption <br />- .ppdf<br />- SharePoint IRM protection| **Protection**: <br /> - ISO standard for PDF encryption <br /> <br /> **Consumption**: <br /> - ISO standard for PDF encryption <br />- .ppdf<br />- SharePoint IRM protection|
|**Generically protected files (.pfile) opened with the viewer**| File opens in the original app where it can then be viewed, modified, and saved without protection | File opens in the original app where it can then be viewed and modified, but not saved|
|**Supported cmdlets**| - Cmdlets for labeling <br> - Cmdlets for protection-only | **Cmdlets for labeling**:<br /> [Set-AIPFileClassification](/powershell/module/azureinformationprotection/get-aipfileclassification) and [Set-AIPFileLabel](/powershell/module/azureinformationprotection/get-aipfilelabel) don't support the **Owner** parameter <br /> In addition, there is a single comment of "No label to apply" for all scenarios where a label isn't applied <br /><br /> [Set-AIPFileClassification](/powershell/module/azureinformationprotection/get-aipfileclassification) supports the **WhatIf** parameter, so it can be run in discovery mode <br /><br /> [Set-AIPFileLabel](/powershell/module/azureinformationprotection/get-aipfilelabel) doesn't support the *EnableTracking* parameter <br /><br /> [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) doesn't return label information from other tenants and doesn't display the **RMSIssuedTime** parameter<br />In addition, the **LabelingMethod** parameter for [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) displays **Privileged** or **Standard**, instead of **Manual** or **Automatic**.|
|**Automatic rescans** | Full rescans are automatically run every time the scanner detects a change in policy or labeling settings | Starting in version 2.8.85.0, administrators can choose to skip a full rescan after making changes to policy or content scan job settings. |
|**Network discovery** (Public preview) |Network discovery features are unavailable for the classic scanner | Administrators can discover additional risky repositories by scanning a specified IP address or range.|
| | | |



### Features provided for the classic client that are not planned for the unified labeling client

The following features and behavior differences from the classic client are not currently planned to be available in future releases for the unified labeling client:

- Custom permissions as a [separate option that users can select in Office apps: Word, Excel, and PowerPoint](client-classify-protect.md#set-custom-permissions-for-a-document)

- The Sensitivity toolbar does not show the **Sensitivity** title, nor a title tooltip. The bar itself is displayed in the unified labeling client.

- [Protection-only mode](client-protection-only-mode.md) (no labels) using templates

- Protect PDF document as [.ppdf (older format)](client-admin-guide-customizations.md#dont-protect-pdf-files-by-using-the-iso-standard-for-pdf-encryption)

- Display the **Do Not Forward** button in Outlook

- Demo policy

- Separate PowerShell cmdlets to connect to a Rights Management service

- Display of the user identity that applied a label

## Install instructions

- [Administrators](client-admin-guide-install.md)

- [End users](install-client-app.md)