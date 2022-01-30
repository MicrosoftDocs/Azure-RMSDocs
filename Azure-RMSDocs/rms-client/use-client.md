---
# required metadata

title: Compare Azure Information Protection and the built-in labeling solution for Office apps - AIP
description: Learn about the differences between Azure Information Protection and Microsoft Information Protection's built-in labeling solution for Office apps.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 01/20/2022
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

# Compare Azure Information Protection and MIP built-in labeling

>***Applies to**: Active Directory Rights Management Services, [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), Windows 11, Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
>*If you have Windows 7, see [AIP and legacy Windows and Office versions](../known-issues.md#aip-and-legacy-windows-and-office-versions).*
>

Sensitivity labels make it easier for your users to apply protection, and also provide classification so that you can track and manage your data.

The Azure Information Protection (AIP) unified labeling client can be installed over the [built-in labeling solution for Microsoft Office](/microsoft-365/compliance/sensitivity-labels), and provides extra features such as support for classifying and protecting files outside of Office using the File Explorer or PowerShell.

This article describes the differences between built-in labeling and AIP and highlights the scenarios where you might want to install the AIP client in your environment.

## AIP client timelines

As we continue to bring the customer labeling and protection experience to built-in applications like Office 365, the **Azure Information Protection unified labeling client** has moved into **maintenance mode** as of **January 1, 2022**. Moving forward, no new features will be added to the unified labeling client.

For more information, see

- [Announcing AIP unified labeling client maintenance mode and sunset of mobile viewer](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/announcing-aip-unified-labeling-client-maintenance-mode-and/ba-p/3043613)

- [Final reminder to migrate from Azure Information Protection classic client to unified labeling](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/final-reminder-to-migrate-from-azure-information-protection/ba-p/2731734)

- The [built-in labeling documentation](/microsoft-365/compliance/sensitivity-labels)

## Understand more about labeling solution options

Whether you are an existing customer with AIP unified labeling deployed, or a new customer looking for a labeling and protection solution, we recommend enabling built-in labeling for Office apps. Built-in labeling provides automatic updates, account switching, increased performance and more.

- Both built-in labeling and the unified labeling client use sensitivity labels and label policies downloaded from the Microsoft 365 compliance center. These label and policy settings can be shared by macOS, iOS, and Android.

- Built-in labeling requires no extra installations, and only a Windows computer with Microsoft 365 applications minimum version 1910. In contrast, the AIP unified labeling client requires a separate [installation](https://www.microsoft.com/download/details.aspx?id=53018) on each client machine.

    After installing, use the AIP client with a cloud or on-premises service:

    - The cloud service is **Azure Information Protection**, and uses the Azure Rights Managements service for data protection
    - The on-premises service is **Active Directory Rights Management Services** (AD RMS)

- Built-in labeling cannot be disabled by users.

Use the following sections to understand when you might want to install the AIP client, such as for support from the File Explorer, PowerShell, or to use the AIP scanner.

> [!TIP]
> Microsoft 365 is constantly developing new features for sensitivity labels with built-in labeling. We recommend checking for updates in the information protection sections of [What's new in Microsoft 365 compliance](/microsoft-365/compliance/whats-new) and the [Microsoft 365 Roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap?rtc=1&filters=&searchterms=compliance).
>
## Labeling features for Office applications

The following features are only available when using **built-in labeling**:

- **Account switching**

- The **Encrypt-Only** option

- **Extra support for recommended / automatic labeling**. While the Azure Information Protection unified labeling client supports automatic labeling for built-in and custom sensitive info types, built-in labeling also supports other information types, such as trainable classifiers or sensitive info types that use Exact Data Match (EDM). 

    For more information, see [How to configure auto-labeling for Office apps](/microsoft-365/compliance/apply-sensitivity-label-automatically).

> [!TIP]
> To compare the Office built-in sensitivity labeling features across different operating system platforms (Windows, macOS, iOS, and Android) and for the web, see the Microsoft 365 Compliance documentation, [Support for sensitivity label capabilities in apps](/microsoft-365/compliance/sensitivity-labels-office-apps#support-for-sensitivity-label-capabilities-in-apps). This documentation also includes the Office build numbers or Office update channel information for the supported features.
>

The following features are currently only available with the **AIP plugin for Office applications**, provided with the AIP unified labeling client:

- Support for Office 97-2003 formats, such as **.doc** files

- Revoking access to protected documents

- Labeling inheritance from email attachments

- Per-app visual marking

- Removing external content marking in app

- The Information Protection bar displayed in Office apps

If you need features available only from the AIP plugin, [install the AIP unified labeling client](clientv2-admin-guide-install.md) across your network.

## Labeling features for Windows desktops

The following features are provided only with the **AIP unified labeling client**:

- Labeling via right-click in the File Explorer.

- A viewer for protected, non-Office files, such as text, image, PDF, and .file.

- Custom permissions set independently from a label via the File Explorer, PowerShell, or in Office apps. In Office apps, users can select **File Info** > **Protect Document** > **Restrict Access**.

> [!NOTE]
> Offline support for protection actions is supported for both built-in labeling and the AIP unified labeling client from Office apps. However, if you have AIP deployed, offline support for protection actions is not available for the File Explorer or PowerShell.
>
## Labeling features for admins and servers

The following features are provided only with the **AIP unified labeling client**:

- A scanner for on-premises data stores.

- Double Key Encryption.

- PowerShell labeling cmdlets.

- Usage logging in the Windows Event Viewer.

- Manual policy file management for disconnected computers.

- Track and revoke support for protected documents. Tracking is supported for Global admins only.

The following features are supported differently by the **AIP unified labeling client** and **built-in labeling**:

- **Central reporting**.  Built-in labeling provides partial support for central reporting via Microsoft 365 compliance center's [activity explorer](/microsoft-365/compliance/data-classification-activity-explorer).For more information, see the **Audit label-related user activity** row in the compliance center [capabilities tables](/microsoft-365/compliance/sensitivity-labels-office-apps).

    The AIP client provides central reporting from the Azure portal, under [Azure Information Protection analytics](../reports-aip.md).

- **Labeling customization**, such as configuring default labels for email, pop up messages in Outlook, S/MIME support, or the Report an Issue option.   Built-in labeling provides partial support for labeling customization by [Microsoft 365 compliance center](/microsoft-365/compliance/sensitivity-labels-office-apps) wizards, and support for select settings via PowerShell. For more information, see: [New-Label](/powershell/module/exchange/new-label) / [Set-Label](/powershell/module/exchange/set-label) /[New-LabelPolicy](/powershell/module/exchange/new-labelpolicy) /[Set-LabelPolicy](/powershell/module/exchange/set-labelpolicy) 

    The AIP client supports labeling customization via [PowerShell](clientv2-admin-guide-customizations.md#configuring-advanced-settings-for-the-client-via-powershell).

## The Rights Management client for protection only

The RMS client provides protection only, and is automatically installed with some applications, including Office applications, the AIP unified labeling client, and RMS-enlightened applications from other software vendors.

You can also [install the RMS client yourself](https://www.microsoft.com/download/details.aspx?id=38396), to support [synchronizing files from IRM-protected libraries and OneDrive](/onedrive/deploy-on-windows), and for developers who want to integrate rights management protection into line-of-business applications.

## Next steps

To install and configure the Azure Information Protection unified labeling client, see:

- [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)
- [Azure Information Protection unified labeling user guide](clientv2-user-guide.md)

For more information about using the built-in labeling solution for Microsoft 365 apps, see [Sensitivity labels in Office apps](/microsoft-365/compliance/sensitivity-labels-office-apps).


## Other content options
### Option 2 - tables Choose your Windows labeling solution

If you are a new customer looking for a labeling and protection solution, you may be considering whether to use built-in labeling for Office apps or the AIP unified labeling client.

Similarly, if you are an existing customer with AIP unified labeling deployed, you may be considering whether to completely move over to built-in labeling for Office apps.

#### Use both solutions simultaneously

- Use built-in labeling for all default scenarios in Office apps, taking advantage of automatic updates, account switching, and better performance.
- Check the sections below for the extra features supported by the AIP unified labeling client and its plugin for Office applications.
- If your organization requires the extra features supported by AIP, such as PowerShell or File Explorer support, or the AIP scanner, install the unified labeling client in addition to built-in labeling.

#### Microsoft 365 sensitivity labels and labeling policies

Both built-in labeling and the unified labeling client use sensitivity labels and label policies downloaded from the Microsoft 365 compliance center. These label and policy settings can be shared by macOS, iOS, and Android.

#### Installation requirement comparison

Built-in labeling requires no extra installations, and only a Windows computer with Microsoft 365 applications minimum version 1910. In contrast, the AIP unified labeling client requires a separate [installation](https://www.microsoft.com/download/details.aspx?id=53018) on each client machine.

After installing, use the AIP client with a cloud or on-premises service:

- The cloud service is **Azure Information Protection**, and uses the Azure Rights Managements service for data protection
- The on-premises service is **Active Directory Rights Management Services** (AD RMS)

For more information, see [Office built-in labeling solution and the Azure Information Protection client](/microsoft-365/compliance/sensitivity-labels-office-apps#office-built-in-labeling-client-and-the-azure-information-protection-client) from the Microsoft 365 Compliance documentation.

### Option 2 - tables Gap analysis between built-in labeling and the AIP client

This section highlights the additional features available with the AIP plugin for Office apps provided by unified labeling.

If your organization needs any of the features listed only for the AIP plugin for Office apps, [install the AIP unified labeling client](clientv2-admin-guide-install.md) across your network, in addition to using built-in labeling.

For more information and updates for built-in labeling support, see the information protection sections of [What's new in Microsoft 365 compliance](/microsoft-365/compliance/whats-new) and the [Microsoft 365 Roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap?rtc=1&filters=&searchterms=compliance)


#### User feature gap analysis

The following table lists features for end-users, where the AIP plugin for Office provides additional features to built-in labeling. **All other features are considered to be at parity.**

|Feature|Office built-in labeling |AIP plugin for Office (unified labeling client)|
|:------|:---------------------:|:-----------------------------:|
| **General features** | | |
|Support for account switching|![yes-account-switch](../media/yes-icon.png) |  ![no-account-switch](../media/no-icon.png)|
|Encrypt-Only|  ![yes-encrypt-only](../media/yes-icon.png)|![no-encrypt-only](../media/no-icon.png) |
|Support for Microsoft Office 97-2003 formats, such as **.doc** files| ![no-legacy-file-types](../media/no-icon.png) | ![yes-legacy-file-types](../media/yes-icon.png) |
|Information Protection bar display in Office apps|  ![no-info-bar](../media/no-icon.png)| ![yes-info-bar](../media/yes-icon.png)|
|Support for revoking access to protected documents.  |![no-revoke](../media/no-icon.png) | ![yes-revoke](../media/yes-icon.png)|
|**Labeling** | | |
|Recommended or automatic labeling for Word, Excel, PowerPoint, Outlook |  ![yes-autolabels-built-in](../media/yes-icon.png) <br>[Learn more](#extra-user-support-for-recommended--automation-labeling-with-built-in-labeling) | ![yes-autolabels-ul](../media/yes-plus-icon.png) |
|Label inheritance from email attachments | ![no-inheritance](../media/no-icon.png)|![yes-inheritance](../media/yes-icon.png)  |
| **Visual markings** | | |
|Per app visual marking| ![partial-per-app](../media/half-support-icon.png)<br>[Learn more](/microsoft-365/compliance/sensitivity-labels-office-apps#dynamic-markings-with-variables)| ![yes-remove-external](../media/yes-icon.png)|
|Remove external content marking in app| ![no-remove-external](../media/no-icon.png)| ![yes-remove-external](../media/yes-icon.png)|
|**Outside of Office apps** | | |
|Labeling with the File Explorer |![no-file-explorer](../media/no-icon.png)| ![yes-file-explorer](../media/yes-icon.png)|
|Viewer for protected, non-Office files: <br>text, image, PDF, .file |![no-viewer](../media/no-icon.png)| ![yes-viewer](../media/yes-icon.png)|
|Custom permissions set independently from a label <br>Via File Explorer / PowerShell <br> In Office apps, users can select **File Info** > **Protect Document** > **Restrict Access**.|![no-custom](../media/no-icon.png)| ![yes-custom](../media/yes-icon.png)|
| | | |

##### Extra user support for recommended / automation labeling with built-in labeling

While the Azure Information Protection unified labeling client supports automatic labeling for built-in and custom sensitive info types, built-in labeling also supports other information types, such as trainable classifiers or sensitive info types that use Exact Data Match (EDM). For more information, see [How to configure auto-labeling for Office apps](/microsoft-365/compliance/apply-sensitivity-label-automatically).

To compare the Office built-in sensitivity labeling features across different operating system platforms (Windows, macOS, iOS, and Android) and for the web, see the Microsoft 365 Compliance documentation, [Support for sensitivity label capabilities in apps](/microsoft-365/compliance/sensitivity-labels-office-apps#support-for-sensitivity-label-capabilities-in-apps). This documentation also includes the Office build numbers or Office update channel information for the supported features.

#### Gap analysis for admin features and server support

The following table lists features for administrators and server support, where the AIP unified labeling client provides additional features to built-in labeling. **All other features are considered to be at parity.**

|Feature|Office built-in labeling solution|Unified labeling client|
|:------|:---------------------:|:-----------------------------:|
| **General** | | |
| Can be disabled | ![no-account-switch](../media/no-icon.png) | ![yes-account-switch](../media/yes-icon.png)|
| **Scanning** | | |
|A scanner for on-premises data stores | ![no-account-switch](../media/no-icon.png) | ![yes-account-switch](../media/yes-icon.png)|
|**Key management** | | |
|Double Key Encryption | ![no-account-switch](../media/no-icon.png) | ![yes-account-switch](../media/yes-icon.png)|
|**Monitoring** | | |
| Central reporting |![partial-central-reporting](../media/half-support-icon.png)<br> Partial support from the Microsoft 365 compliance center's [activity explorer](/microsoft-365/compliance/data-classification-activity-explorer). See the **Audit label-related user activity** row in the compliance center [capabilities tables](/microsoft-365/compliance/sensitivity-labels-office-apps).  | ![yes-central-reporting](../media/yes-icon.png) <br>View reports in the Azure portal, under [Azure Information Protection analytics](../reports-aip.md).
|Usage logging in the Windows Event Viewer | ![no-account-switch](../media/no-icon.png) | ![yes-account-switch](../media/yes-icon.png)|
|Track and revoke support for protected documents. Tracking is supported for Global admins only. |![no-account-switch](../media/no-icon.png) | ![yes-account-switch](../media/yes-icon.png)|
|**Labeling** | |
| PowerShell labeling cmdlets| ![no-account-switch](../media/no-icon.png) | ![yes-account-switch](../media/yes-icon.png)|
| Labeling customization <br><br>Examples: configuring default labels for email, pop up messages in Outlook, S/MIME support, or the Report an Issue option| ![partial-labeling-custom](../media/half-support-icon.png)<br>Partially supported by [Microsoft 365 compliance center](/microsoft-365/compliance/sensitivity-labels-office-apps) wizards.<br><br>Select settings supported via PowerShell cmdlets:<br>[New-Label](/powershell/module/exchange/new-label) / [Set-Label](/powershell/module/exchange/set-label) / [New-LabelPolicy](/powershell/module/exchange/new-labelpolicy) / [Set-LabelPolicy](/powershell/module/exchange/set-labelpolicy) | ![yes-labeling-custom](../media/yes-icon.png)<br>Supported via [PowerShell](clientv2-admin-guide-customizations.md#configuring-advanced-settings-for-the-client-via-powershell)  |
| | | |

#### Gap analysis for remote / disconnected computers

The following table lists features for remote or disconnected computers, where the built-in labeling solution differs to the unified labeling client. **All other features are considered to be at parity.**

- **Offline support for protection actions**. Supported for both built-in labeling and the unified labeling client. For the unified labeling client, when using the File Explorer and PowerShell commands, users must be connected to the internet to protect files.

- **Manual policy file management for disconnected computers**. Supported for the unified labeling client only.

### Option 3 User feature gap analysis

The following table lists compares features for end-users between the built-in labeling solution and the AIP Office plugin provided by the unified labeling client.


|Feature|Office built-in labeling solution|Unified labeling client|
|:------|:---------------------:|:-----------------------------:|
| **General features** | | |
|Government Community Cloud| ![yes-gcc-built-in](../media/yes-icon.png) | ![yes-gcc-ul](../media/yes-icon.png)|
|Support for account switching|![yes-account-switch](../media/yes-icon.png) |  ![no-account-switch](../media/no-icon.png)|
|Encrypt-Only|  ![yes-encrypt-only](../media/yes-icon.png)|![no-encrypt-only](../media/no-icon.png) |
|Information Protection bar display in Office apps|  ![no-info-bar](../media/no-icon.png)| ![yes-info-bar](../media/yes-icon.png)|
|Support for account switching|![yes-account-switch](../media/yes-icon.png) |  ![no-account-switch](../media/no-icon.png)|
|Encrypt-Only|  ![yes-encrypt-only](../media/yes-icon.png)|![no-encrypt-only](../media/no-icon.png) |
|Support for Microsoft Office 97-2003 formats, such as **.doc** files| ![no-legacy-file-types](../media/no-icon.png) | ![yes-legacy-file-types](../media/yes-icon.png) |
|Information Protection bar display in Office apps|  ![no-info-bar](../media/no-icon.png)| ![yes-info-bar](../media/yes-icon.png)|
|Support for revoking access to protected documents.  |![no-account-switch](../media/no-icon.png) | ![yes-account-switch](../media/yes-icon.png)|
|**Labeling** | | |
|Manual labeling| ![yes-manual-labeling-built-in](../media/yes-icon.png)   |![yes-manual-labeling-ul](../media/yes-icon.png) |
|Default label| ![yes-default-label-built-in](../media/yes-icon.png)| ![yes-default-label-ul](../media/yes-icon.png)|
|Recommended or automatic labeling for Word, Excel, PowerPoint, Outlook |  ![yes-autolabels-built-in](../media/yes-icon.png) <br>[Learn more](#extra-user-support-for-recommended--automation-labeling-with-built-in-labeling) | ![yes-autolabels-ul](../media/yes-plus-icon.png) |
|Mandatory labeling| ![yes-mandatory-built-in](../media/yes-icon.png) |  ![yes-mandatory-ul](../media/yes-icon.png)|
|User-defined permissions for a label: <br />Do Not Forward for emails<br />Custom permissions for Word, Excel, PowerPoint | ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |
|Multi-language support for labels | ![yes-mult-lang-built-in](../media/yes-icon.png) |![yes-mult-lang-ul](../media/yes-icon.png) |
|Label inheritance from email attachments | ![no-inheritance](../media/no-icon.png)|![yes-inheritance](../media/yes-icon.png)  |
|Label inheritance from email attachments | ![no-inheritance](../media/no-icon.png)|![yes-inheritance](../media/yes-icon.png)  |
| **Visual markings** | | |
|Visual markings as a label action<br> (header, footer, watermark)| ![yes-visual-marking-built-in](../media/yes-icon.png) | ![yes-visual-marking-ul](../media/yes-icon.png)|
|Per app visual markings| ![yes-marking-per-app-built-in](../media/yes-icon.png)<br>[Learn more](/microsoft-365/compliance/sensitivity-labels-office-apps#dynamic-markings-with-variables) | ![yes-marking-per-app-ul](../media/yes-icon.png) |
|Dynamic visual markings with variables | ![yes-dynamic-built-in](../media/yes-icon.png)<br>[Learn more](/microsoft-365/compliance/sensitivity-labels-office-apps#dynamic-markings-with-variables) | ![yes-dynamic-ul](../media/yes-icon.png)|
|Remove external content marking in app| ![no-remove-external](../media/no-icon.png)| ![yes-remove-external](../media/yes-icon.png)|
|Per app visual marking| ![partial-per-app](../media/half-support-icon.png)<br>[Learn more](/microsoft-365/compliance/sensitivity-labels-office-apps#dynamic-markings-with-variables)| ![yes-remove-external](../media/yes-icon.png)|
|Remove external content marking in app| ![no-remove-external](../media/no-icon.png)| ![yes-remove-external](../media/yes-icon.png)|
|**Outside of Office apps** | | |
|Labeling with the File Explorer |![no-file-explorer](../media/no-icon.png)| ![yes-file-explorer](../media/yes-icon.png)|
|Viewer for protected, non-Office files: <br>text, image, PDF, .file |![no-viewer](../media/no-icon.png)| ![yes-viewer](../media/yes-icon.png)|
|Custom permissions set independently from a label <br>Via File Explorer / PowerShell <br> In Office apps, users can select **File Info** > **Protect Document** > **Restrict Access**.|![no-custom](../media/no-icon.png)| ![yes-custom](../media/yes-icon.png)|
| | | |
