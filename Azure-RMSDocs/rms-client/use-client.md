---
# required metadata

title: The client for Azure Information Protection - AIP
description: Microsoft Azure Information Protection provides a client-server solution that helps to protect an organization's data. The client (the Azure Information Protection client or the Rights Management client) is integrated with applications that you run on computers and mobile devices.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 09/05/2021
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

>***Applies to**: Active Directory Rights Management Services, [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), Windows 11, Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
>***Relevant for**: [AIP unified labeling client and classic client](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

Sensitivity labels make it easier for your users to apply protection, and also provide classification so that you can track and manage your data.

The Azure Information Protection (AIP) unified labeling client provides a client-server solution that helps protect an organization's documents and emails, and is an alternative to the [built-in labeling solution for Microsoft Office](/microsoft-365/compliance/sensitivity-labels).

While the recommended solution is to use the built-in labeling provided by Microsoft Office, you may also continue to use the AIP unified labeling client for specific features it provides, such as support for the File Explorer and PowerShell, so that you can classify and protect files outside of office.

## AIP client timelines

As we continue to bring the customer labeling and protection experience to built-in applications like Office 365, the **Azure Information Protection unified labeling client** has moved into **maintenance mode** as of **January 1, 2022**. Moving forward, no new features will be added to the unified labeling client.

Additionally, the **Azure Information Protection classic client** and **Label Management** in the Azure Portal are **deprecated** as of **March 31, 2021**. No further support is provided for the classic client and maintenance versions will no longer be released. The classic client will be officially retired, and will stop functioning, on March 31, 2022.

All current Azure Information Protection classic client customers must [migrate to the Microsoft Information Protection unified labeling platform](../tutorial-migrating-to-ul.md) and upgrade to the [unified labeling client](../rms-client/clientv2-admin-guide-install.md).

For more information, see

- [Announcing AIP unified labeling client maintenance mode and sunset of mobile viewer](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/announcing-aip-unified-labeling-client-maintenance-mode-and/ba-p/3043613)
- [Final reminder to migrate from Azure Information Protection classic client to unified labeling](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/final-reminder-to-migrate-from-azure-information-protection/ba-p/2731734)
- The [built-in labeling documentation](/microsoft-365/compliance/sensitivity-labels)

## Choose your Windows labeling solution

When considering whether to use the recommended, built-in labeling solution for Office applications, or the additional AIP unified labeling client, consider the following:

- Both built-in labeling and the unified labeling client use sensitivity labels and label policies downloaded from the Microsoft 365 compliance center. These label and policy settings can be shared by macOS, iOS, and Android.

- Built-in labeling requires no extra installations, and only a Windows computer with Microsoft 365 applications, minimum version 1910.

- In contrast, AIP unified labeling client requires a separate installation to Office. Download and install the unified labeling client from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018). The service resides in the cloud or on-premises:

    - The cloud service is **Azure Information Protection**, and uses the Azure Rights Managements service for data protection
    - The on-premises service is **Active Directory Rights Management Services** (AD RMS)

- Built-in labeling also supports switching accounts and provides better performance in Office applications

- Built-in labeling cannot be disabled by users.

If you are still using the legacy, deprecated AIP classic client, your labels and label policies are managed by PowerShell only, as labels and label policies are deprecated from the Azure portal. If you need to download and install the legacy classic client, contact support and open a ticket to access the installation file.

For more information, see:
[Detailed comparisons for the AIP clients](#detailed-comparisons-for-the-azure-information-protection-clients) and [Features not planned for the unified labeling client](#features-not-planned-to-be-in-the-azure-information-protection-unified-labeling-client).


### Using multiple clients in the same environment

You can use different clients in the same environment to support different business requirements, as demonstrated in the following deployment example. In a mixed client environment, we recommend you use unified labels so that clients share the same set of labels for ease of administration. New customers have unified labels by default because their tenants are on the unified labeling platform. For more information, see [How can I determine if my tenant is on the unified labeling platform?](../faqs.md#how-can-i-determine-if-my-tenant-is-on-the-unified-labeling-platform)

When you have a Windows computer that runs Microsoft 365 apps that are a minimum version 1910 and one of the Azure Information Protection clients is installed, by default the built-in labeling solution is disabled in Office apps. However, you can change this behavior to use the built-in labeling solution for just your Office apps. With this configuration, the Azure Information Protection client remains available for labeling in File Explorer, PowerShell, and the scanner. For instructions to disable the Azure Information Protection client in Microsoft 365 apps, see the section [Office built-in labeling solution and the Azure Information Protection client](/microsoft-365/compliance/sensitivity-labels-office-apps#office-built-in-labeling-client-and-the-azure-information-protection-client) from the Microsoft 365 Compliance documentation.

### Rights Management client

The RMS client provides protection only, and is automatically installed with some applications, including Office applications, the AIP unified labeling and classic clients, and RMS-enlightened applications from other software vendors.

You can also [install the RMS client yourself](https://www.microsoft.com/download/details.aspx?id=38396), to support [synchronizing files from IRM-protected libraries and OneDrive](/onedrive/deploy-on-windows), and for developers who want to integrate rights management protection into line-of-business applications.

## Compare the labeling solutions for Windows computers

Use the following table to help compare which features are supported by the three labeling solutions for Windows computers.

To compare the Office built-in sensitivity labeling features across different operating system platforms (Windows, macOS, iOS, and Android) and for the web, see the Microsoft 365 Compliance documentation, [Support for sensitivity label capabilities in apps](/microsoft-365/compliance/sensitivity-labels-office-apps#support-for-sensitivity-label-capabilities-in-apps). This documentation also includes the Office build numbers or Office update channel information for the supported features.

For even more details, see also:
- [Detailed comparisons for the Azure Information Protection clients](#detailed-comparisons-for-the-azure-information-protection-clients)
- [Features not planned to be in the Azure Information Protection unified labeling client](#features-not-planned-to-be-in-the-azure-information-protection-unified-labeling-client)

|Feature|Classic client|Unified labeling client|Office built-in labeling solution|
|:------|:------------:|:---------------------:|:-----------------------------:|
|**Manual labeling**| ![yes](../media/yes-icon.png)   | ![yes](../media/yes-icon.png)   |![yes](../media/yes-icon.png) |
|**Default label**| ![yes](../media/yes-icon.png)| ![yes](../media/yes-icon.png)| ![yes](../media/yes-icon.png)|
|**Recommended or automatic labeling** <br />For Word, Excel, PowerPoint, Outlook|![yes](../media/yes-icon.png) |  ![yes](../media/yes-icon.png)  | ![yes, plus additional support](../media/yes-plus-icon.png) <sup>[11](#11)</sup> |
|**Mandatory labeling**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |  ![yes](../media/yes-icon.png)|
|**User-defined permissions for a label**: <br />Do Not Forward for emails| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |
|**User-defined permissions for a label**: <br />Custom permissions for Word, Excel, PowerPoint| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |
|**Multilanguage support for labels**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |![yes](../media/yes-icon.png) |
|**Label inheritance from email attachments**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png)  | ![no](../media/no-icon.png)|
|**Customizations, such as**:<br />- Default label for email<br />- Pop up messages in Outlook <br />- S/MIME support<br />- Report an Issue option| ![yes](../media/yes-icon.png) <sup>[1](#1)</sup> | ![yes](../media/yes-icon.png) <sup>[2](#2)</sup> |  ![partial](../media/half-support-icon.png) <sup>[9](#9)</sup>|
|**Scanner for on-premises data stores**| ![yes](../media/yes-icon.png) |  ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png)|
|**Central reporting**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |  ![partial](../media/half-support-icon.png) <sup>[10](#10)|
|**Custom permissions set independently from a label**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) <sup>[3](#3)</sup>|  ![no](../media/no-icon.png)|
|**Information Protection bar in Office apps**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png)|  ![no](../media/no-icon.png)|
|**Visual markings as a label action**<br> (header, footer, watermark)| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png)|
|**Per app visual markings**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) <sup>[8](#8)</sup>|
|**Dynamic visual markings with variables**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) <sup>[8](#8)</sup>|
|**Remove external content marking in app**| ![yes](../media/yes-icon.png)| ![yes](../media/yes-icon.png)| ![no](../media/no-icon.png)|
|**Label with File Explorer**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png)|
|**A viewer for protected files** <br> (text, images, PDF, .pfile)| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) | ![no](../media/no-icon.png)|
|**PPDF support for applying labels**| ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png)|  ![no](../media/no-icon.png)|
|**PowerShell labeling cmdlets**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png)  |  ![no](../media/no-icon.png)|
|**Offline support for protection actions**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) <sup>[4](#4)</sup> | ![yes](../media/yes-icon.png) |
|**Manual policy file management for disconnected computers**| ![yes](../media/yes-icon.png) |![yes](../media/yes-icon.png)|  ![no](../media/no-icon.png)|
|**HYOK support**| ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png)|  ![no](../media/no-icon.png)|
|**Usage logging in Event Viewer**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) | ![no](../media/no-icon.png)|
|**Display the Do Not Forward button in Outlook**| ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png)|  ![no](../media/no-icon.png)|
|**Track protected documents**| ![yes](../media/yes-icon.png) <sup>[5](#5)</sup> | ![yes](../media/yes-icon.png) <sup>[5](#5)</sup> |  ![no](../media/no-icon.png)|
|**Revoke protected documents**| ![yes](../media/yes-icon.png) <sup>[5](#5)</sup> |  ![yes](../media/yes-icon.png) <sup>[5](#5)</sup>|  ![no](../media/no-icon.png)|
|**Protection-only mode** (no labels)| ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png)|  ![no](../media/no-icon.png)|
|**Support for account switching**|  ![no](../media/no-icon.png)|  ![no](../media/no-icon.png)| ![yes](../media/yes-icon.png) |
|**Support for Remote Desktop Services**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |
|**Support for AD RMS**| ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png) <sup>[6](#6)</sup> |  ![no](../media/no-icon.png)|
|**Support for Microsoft Office 97-2003 formats**| ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png) <sup>[7](#7)</sup>|
|**Double Key Encryption**|  ![no](../media/no-icon.png)| ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png)|
|**Encrypt-Only**|  ![no](../media/no-icon.png)| ![no](../media/no-icon.png) | ![yes](../media/yes-icon.png)|
|**Government Community Cloud** | ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png)|
| | | | |

**Footnotes**:

<a name="1"></a><sup>1</sup>
These settings, and many more are supported as [advanced client settings that you configure in the Azure portal](client-admin-guide-customizations.md#how-to-configure-advanced-classic-client-configuration-settings-in-the-portal).

<a name="2"></a><sup>2</sup>
These settings, and many more are supported as [advanced settings that you configure with PowerShell](clientv2-admin-guide-customizations.md#configuring-advanced-settings-for-the-client-via-powershell).

<a name="3"></a><sup>3</sup>
Supported by File Explorer and PowerShell. In Office apps, users can select **File Info** > **Protect Document** > **Restrict Access**.

<a name="4"></a><sup>4</sup>
For File Explorer and PowerShell commands, the user must be connected to the internet to protect files.

<a name="5"></a><sup>5</sup>
For more information, see: **Unified labeling client**: [Admin guide](track-and-revoke-admin.md) |  [User guide](revoke-access-user.md). Tracking is supported for Global admins only. **Classic client**: [Admin guide](client-admin-guide-document-tracking.md) | [User guide](client-track-revoke.md). Administrators can also use [central reporting](../reports-aip.md) to identify whether protected documents are accessed from Windows computers, and whether access was granted or denied.

<a name="6"></a><sup>6</sup>
Labeling and protection actions aren't supported. However, for an AD RMS deployment, the viewer can open protected documents when you use the [Active Directory Rights Management Services Mobile Device Extension](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/dn673574\(v=ws.11\)).

<a name="7"></a><sup>7</sup>
While the AIP clients support both Microsoft Office 97-2003 file formats, such as **.doc**, as well as Office Open XML formats, such as **.docx**, the built-in labeling supports Open XML formats only.

<a name="8"></a><sup>8</sup>
For more information about support for dynamic content markings and per app content markings for the built-in labeling solution, see the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels-office-apps#dynamic-markings-with-variables).

<a name="9"></a><sup>9</sup>
Built-in labeling supports selected PowerShell advanced settings. For a list of these settings, see [New-Label](/powershell/module/exchange/new-label) or [Set-Label](/powershell/module/exchange/set-label), and [New-LabelPolicy](/powershell/module/exchange/new-labelpolicy) or [Set-LabelPolicy](/powershell/module/exchange/set-labelpolicy). However, many customizations are now supported by the wizards in the Microsoft 365 compliance center. For more information, see [Manage sensitivity labels in Office apps](/microsoft-365/compliance/sensitivity-labels-office-apps).

<a name="10"></a><sup>10</sup>
In the Azure portal, see [Azure Information Protection analytics](../reports-aip.md). In the Microsoft 365 compliance center, see the [activity explorer](/microsoft-365/compliance/data-classification-activity-explorer). For detailed support information, see the **Audit label-related user activity** row in the [capabilities tables](/microsoft-365/compliance/sensitivity-labels-office-apps) from the Microsoft 365 Compliance documentation.

<a name="11"></a><sup>11</sup>
While the Azure Information Protection unified labeling client supports automatic labeling for built-in and custom sensitive info types, built-in labeling also supports other information types, such as trainable classifiers or sensitive info types that use Exact Data Match (EDM). For more information, see [How to configure auto-labeling for Office apps](/microsoft-365/compliance/apply-sensitivity-label-automatically).

### Detailed comparisons for the Azure Information Protection clients

When the Azure Information Protection classic client and the Azure Information Protection unified labeling client both support the same feature, use the following lists to help identify some functional differences between the two clients:


|Functionality |Classic client|Unified labeling client|
|--------------|-----------------------------------|-----------------------------------------------------------|
|**Setup**| Option to install local demo policy | No local demo policy|
|**Label selection and display when applied in Office apps**|From the **Protect** button on the ribbon <br /><br /> From the Information Protection bar (horizontal bar under the ribbon)|From the **Sensitivity** button on the ribbon<br /><br /> From the Information Protection bar (horizontal bar under the ribbon)|
|**Manage the Information Protection bar in Office apps**|**For users**:<br />Option to show or hide the bar from the **Protect** button on the ribbon<br /><br>When a user selects to hide the bar, by default, the bar is hidden in that app, but continues to automatically display in newly opened apps <br /><br /> **For admins**: <br />Policy settings to automatically show or hide the bar when an app first opens, and control whether the bar automatically remains hidden for newly opened apps after a user selects to hide the bar|**For users**: <br />Option to show or hide the bar from the **Sensitivity** button on the ribbon. <br><br />When a user selects to hide the bar, the bar is hidden in that app and also in newly opened apps <br /><br />**For admins**: <br />PowerShell setting to manage the bar |
|**Label color**| Configure in the Azure portal | Retained after label migration and configurable with [PowerShell](clientv2-admin-guide-customizations.md#specify-a-color-for-the-label)|
|**Labels support different languages**| Configure in the Azure portal | Configure by using [Office 365 Security & Compliance PowerShell](/microsoft-365/compliance/create-sensitivity-labels#additional-label-settings-with-office-365-security--compliance-center-powershell)|
|**Policy update**| - When an Office app opens <br /> - When you right-click to classify and protect a file or folder <br />- When you run the PowerShell cmdlets for labeling and protection<br />- Every 24 hours <br />- For the scanner: Every hour and when the service starts and the policy is older than one hour| - When an Office app opens <br />- When you right-click to classify and protect a file or folder <br />- When you run the PowerShell cmdlets for labeling and protection<br />- Every 4 hours <br />- For the scanner: Every 4 hours|
|**Supported formats for PDF**| **Protection**: <br /> - ISO standard for PDF encryption (default) <br /> - .ppdf <br /><br> **Consumption**: <br /> - ISO standard for PDF encryption <br />- .ppdf<br />- SharePoint IRM protection| **Protection**: <br /> - ISO standard for PDF encryption <br /> <br /> **Consumption**: <br /> - ISO standard for PDF encryption <br />- .ppdf<br />- SharePoint IRM protection|
|**Generically protected files (.pfile) opened with the viewer**| File opens in the original app where it can then be viewed, modified, and saved without protection | File opens in the original app where it can then be viewed and modified, but not saved|
|**Supported cmdlets**| - Cmdlets for labeling <br> - Cmdlets for protection-only | **Cmdlets for labeling**:<br /> [Set-AIPFileClassification](/powershell/module/azureinformationprotection/get-aipfileclassification) and [Set-AIPFileLabel](/powershell/module/azureinformationprotection/get-aipfilelabel) don't support the **Owner** parameter <br /> In addition, there is a single comment of "No label to apply" for all scenarios where a label isn't applied <br /><br /> [Set-AIPFileClassification](/powershell/module/azureinformationprotection/get-aipfileclassification) supports the **WhatIf** parameter, so it can be run in discovery mode <br /><br /> [Set-AIPFileLabel](/powershell/module/azureinformationprotection/get-aipfilelabel) doesn't support the *EnableTracking* parameter <br /><br /> [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) doesn't return label information from other tenants and doesn't display the **RMSIssuedTime** parameter<br />In addition, the **LabelingMethod** parameter for [Get-AIPFileStatus](/powershell/module/azureinformationprotection/get-aipfilestatus) displays **Privileged** or **Standard**, instead of **Manual** or **Automatic**.|
|**Justification prompts (if configured) per action in Office** | - Frequency: Per file <br /> - Lowering the sensitivity level <br /> - Removing a label<br /> - Removing protection | - Frequency: Per session <br /> - Lowering the sensitivity level<br />-  Removing a label|
|**Remove applied label actions** | User is prompted to confirm <br /><br />The default label or an automatic label (if configured) is not automatically applied next time the Office app opens the file  | User is not prompted to confirm<br /><br /> The default label or an automatic label (if configured) is automatically applied next time the Office app opens the file|
|**Automatic and recommended labels** | Configured as [label conditions](../configure-policy-classification.md) in the Azure portal with built-in information types and custom conditions that use phrases or regular expressions <br /><br />Configuration options include: <br />- Unique / Not unique count <br /> - Minimum count| Configured in the Microsoft 365 compliance center with built-in sensitive information types and [custom information types](/microsoft-365/compliance/create-a-custom-sensitive-information-type)<br /><br />Configuration options include:  <br />- Unique count only <br />- Minimum and maximum count <br />- AND and OR support with information types <br />- Keyword dictionary<br />- Customizable confidence level and character proximity|
|**Order support for sublabels on attachments** | Enabled with an [advanced client setting](client-admin-guide-customizations.md#enable-order-support-for-sublabels-on-attachments) | Enabled by default, no configuration required|
|**Change the default protection behavior for file types**| Use [registry edits](client-admin-guide-file-types.md#changing-the-default-protection-level-of-files) to override the defaults of native and generic protection | Use [PowerShell](clientv2-admin-guide-customizations.md#change-which-file-types-to-protect) to change which file types get protected|
|**Automatic rescans** | Full rescans are automatically run every time the scanner detects a change in policy or labeling settings | Starting in version 2.8.85.0, administrators can choose to skip a full rescan after making changes to policy or content scan job settings. |
|**Network discovery** (Public preview) |Network discovery features are unavailable for the classic scanner | Administrators can discover additional risky repositories by scanning a specified IP address or range.|
| | | |

### Features not planned to be in the Azure Information Protection unified labeling client

Although the Azure Information Protection unified labeling client is still under development, the following features and behavior differences from the classic client are not currently planned to be available in future releases for the unified labeling client: 

- Custom permissions as a [separate option that users can select in Office apps: Word, Excel, and PowerPoint](client-classify-protect.md#set-custom-permissions-for-a-document)

- The Sensitivity toolbar does not show the **Sensitivity** title, nor a title tooltip. The bar itself is displayed in the unified labeling client.

- [Protection-only mode](client-protection-only-mode.md) (no labels) using templates

- Protect PDF document as [.ppdf (older format)](client-admin-guide-customizations.md#dont-protect-pdf-files-by-using-the-iso-standard-for-pdf-encryption)

- Display the **Do Not Forward** button in Outlook

- Demo policy

- Separate PowerShell cmdlets to connect to a Rights Management service

- Display of the user identity that applied a label


### Parent labels and their sublabels 

The Azure Information Protection classic client doesn't support configurations that specify a parent label that has sublabels. These configurations include specifying a default label, and a label for recommended or automatic classification. When a label has sublabels, you can specify one of the sublabels but not the parent label.

For parity, the Azure Information Protection unified labeling client also doesn't support applying parent labels that have sublabels, even though you can select these labels in the Microsoft 365 compliance center. In this scenario, the Azure Information Protection unified labeling client will not apply the parent label.

## Next steps

To install and configure the Azure Information Protection unified labeling client, see:

- [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)
- [Azure Information Protection unified labeling user guide](clientv2-user-guide.md)

For more information about using the built-in labeling solution for Microsoft 365 apps, see [Sensitivity labels in Office apps](/microsoft-365/compliance/sensitivity-labels-office-apps).
