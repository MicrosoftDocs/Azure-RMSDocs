---
# required metadata

title: The client for Azure Information Protection - AIP
description: Microsoft Azure Information Protection provides a client-server solution that helps to protect an organization's data. The client (the Azure Information Protection client or the Rights Management client) is integrated with applications that you run on computers and mobile devices.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 02/01/2022
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

# Learn about about built-in labeling and the AIP unified labeling client

>***Applies to**: Active Directory Rights Management Services, [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), Windows 11, Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
>*If you have Windows 7 or Office 2010, see [AIP and legacy Windows and Office versions](../known-issues.md#aip-and-legacy-windows-and-office-versions).*
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
## Understand more about labeling solution options

Whether you are an existing customer with AIP unified labeling deployed, or a new customer looking for a labeling and protection solution, we recommend enabling built-in labeling for Office apps.

Built-in labeling provides automatic updates, account switching, increased performance, and more.

- **Both built-in labeling and the unified labeling client use sensitivity labels and label policies downloaded from the Microsoft 365 compliance center.** These label and policy settings can be shared by macOS, iOS, and Android.

- **Built-in labeling requires no extra installations**, and only a Windows computer with Microsoft 365 applications minimum version 1910. In contrast, the AIP unified labeling client requires a separate [installation](https://www.microsoft.com/download/details.aspx?id=53018) on each client machine.

    After installing, use the AIP client with a cloud or on-premises service:

    - The cloud service is *Azure Information Protection*, and uses the Azure Rights Managements service for data protection
    - The on-premises service is *Active Directory Rights Management Services* (AD RMS)

- **Built-in labeling cannot be disabled by users.**


> [!TIP]
> Microsoft 365 is constantly developing new features for sensitivity labels with built-in labeling. We recommend checking for updates in the information protection sections of [What's new in Microsoft 365 compliance](/microsoft-365/compliance/whats-new) and the [Microsoft 365 Roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap?rtc=1&filters=&searchterms=compliance).
>

Use the following sections to understand when you might want to install the AIP client, such as for support from the File Explorer, PowerShell, or to use the AIP scanner.

## Learn about labeling in Office applications

Use the following table to understand about the features supported for Office applications, with built-in labeling and with the AIP Office add-in provided by the AIP unified labeling client.

To compare features for built-in sensitivity labeling across different platforms, including Windows, macOS, iOS, and Android, and for the web, see [Support for sensitivity label capabilities in apps](/microsoft-365/compliance/sensitivity-labels-office-apps#support-for-sensitivity-label-capabilities-in-apps) in the Microsoft 365 compliance documentation. This documentation also includes the Office build numbers or Office update channel information for the supported features.

<!--
|**Support for Remote Desktop Services**|  ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |
-->

### Supported with both the AIP Office add-in and the built-in labeling solution

|Feature|AIP Office add-in|Office built-in labeling solution|
|:------|:---------------------:|:-----------------------------:|
|**Manual labeling**| ![yes](../media/yes-icon.png)   |![yes](../media/yes-icon.png) |
|**Mandatory labeling**|  ![yes](../media/yes-icon.png) |  ![yes](../media/yes-icon.png)|
|**Default label**| ![yes](../media/yes-icon.png)| ![yes](../media/yes-icon.png)|
|**Recommended or automatic labeling** <br />For Word, Excel, PowerPoint, Outlook|  ![yes](../media/yes-icon.png)  | ![yes, plus additional support](../media/yes-plus-icon.png) <br>[Learn more](/microsoft-365/compliance/apply-sensitivity-label-automatically) |
|**Track protected documents**|  ![yes](../media/yes-icon.png) <br>Global admins only.<br>[Learn more](track-and-revoke-admin.md) | ![yes](../media/yes-icon.png) <br>Global admins only.|
|**User-defined permissions for a label**: <br />Do Not Forward for emails|  ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |
|**User-defined permissions for a label**: <br />Custom permissions for Word, Excel, PowerPoint|  ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) |
|**Visual markings as a label action**<br> (header, footer, watermark)|  ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png)|
|**Per app visual markings**|  ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) <br>[Learn more](/microsoft-365/compliance/sensitivity-labels-office-apps#dynamic-markings-with-variables)|
|**Dynamic visual markings with variables**|  ![yes](../media/yes-icon.png) | ![yes](../media/yes-icon.png) <br>[Learn more](/microsoft-365/compliance/sensitivity-labels-office-apps#dynamic-markings-with-variables)|
|**Government Community Cloud** |![yes](../media/yes-icon.png) <br>[Learn more](/azure/security/fundamentals/feature-availability#azure-information-protection) | ![yes](../media/yes-icon.png)|
|**Multilanguage support for labels**|  ![yes](../media/yes-icon.png) |![yes](../media/yes-icon.png) |
|**Offline support for protection actions**|  ![yes](../media/yes-icon.png)  | ![yes](../media/yes-icon.png) |
| | | |

While the Azure Information Protection unified labeling client supports automatic labeling for built-in and custom sensitive info types, built-in labeling also supports other information types, such as trainable classifiers or sensitive info types that use Exact Data Match (EDM).

For more information, see [How to configure auto-labeling for Office apps](/microsoft-365/compliance/apply-sensitivity-label-automatically).

### Supported differently with the AIP Office add-in and the built-in labeling solution

CONSIDERATIONS - pull this out of a table into two sections, about customizations + reporting? 

|Feature|AIP Office add-in|Office built-in labeling solution|
|:------|:---------------------:|:-----------------------------:|
|**Customizations, such as**:<br />- Default label for email<br />- Pop up messages in Outlook <br />- S/MIME support<br />- Report an Issue option|  ![yes](../media/yes-icon.png) <br>[Learn more](clientv2-admin-guide-customizations.md#configuring-advanced-settings-for-the-client-via-powershell) |  ![partial](../media/half-support-icon.png) <br>[Learn more](/microsoft-365/compliance/sensitivity-labels-office-apps)|
|**Central reporting**|  ![yes](../media/yes-icon.png) <br>[Learn more](../reports-aip.md) |  ![partial](../media/half-support-icon.png) <br>[Learn more](/microsoft-365/compliance/data-classification-activity-explorer) |
| | | |

Built-in labeling supports selected PowerShell advanced settings for customizations. For more information, see [New-Label](/powershell/module/exchange/new-label), [Set-Label](/powershell/module/exchange/set-label), [New-LabelPolicy](/powershell/module/exchange/new-labelpolicy), and [Set-LabelPolicy](/powershell/module/exchange/set-labelpolicy). Many customizations are also supported by the wizards in the Microsoft 365 compliance center. For more information, see [Manage sensitivity labels in Office apps](/microsoft-365/compliance/sensitivity-labels-office-apps).

For central reporting from the Azure portal, see [Azure Information Protection analytics](../reports-aip.md). In the Microsoft 365 compliance center, see the [activity explorer](/microsoft-365/compliance/data-classification-activity-explorer). For detailed support information, see the **Audit label-related user activity** row in the [capabilities tables](/microsoft-365/compliance/sensitivity-labels-office-apps) from the Microsoft 365 Compliance documentation.

### Supported only with the built-in labeling solution

CONSIDERATIONS - Do we really need a table here? Or is a bulleted list enough (similar to [Learn about labeling outside of Office applications](#learn-about-labeling-outside-of-office-applications))

|Feature|AIP Office add-in|Office built-in labeling solution|
|:------|:---------------------:|:-----------------------------:|
|**Encrypt-Only**|  ![no](../media/no-icon.png) | ![yes](../media/yes-icon.png)|
|**Support for account switching**|   ![no](../media/no-icon.png)| ![yes](../media/yes-icon.png) |
| | | |

The Azure Information Protection unified labeling client doesn't support applying parent labels that have [sublabels](/microsoft-365/compliance/sensitivity-labels), even though you can select these labels in the Microsoft 365 compliance center.

In this scenario, the Azure Information Protection unified labeling client will not apply the parent label.


### Supported only with the AIP Office add-in

CONSIDERATIONS - Do we really need a table here? Or is a bulleted list enough (similar to [Learn about labeling outside of Office applications](#learn-about-labeling-outside-of-office-applications))

|Feature|AIP Office add-in|Office built-in labeling solution|
|:------|:---------------------:|:-----------------------------:|
|**Highly-visible labeling experience** <!--Information Protection bar in Office apps**-->|  ![yes](../media/yes-icon.png)|  ![no](../media/no-icon.png)|
|**Label inheritance from email attachments**|  ![yes](../media/yes-icon.png)  | ![no](../media/no-icon.png)|
|**Revoke protected documents**|  ![yes](../media/yes-icon.png) <br>[Learn more](revoke-access-user.md)|  ![no](../media/no-icon.png)|
|**Double Key Encryption**|  ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png)|
|**Usage logging in Event Viewer**| ![yes](../media/yes-icon.png) <br>[Learn more](../log-analyze-usage.md) | ![no](../media/no-icon.png)|
|**Remove external content marking in app**|  ![yes](../media/yes-icon.png)| ![no](../media/no-icon.png)|
|**Support for Microsoft Office 97-2003 formats**|  ![yes](../media/yes-icon.png) |  ![no](../media/no-icon.png)|
|**Manual policy file management for disconnected computers**| ![yes](../media/yes-icon.png)|  ![no](../media/no-icon.png)|
| | | |

## Learn about labeling outside of Office applications

The following labeling features, used outside of Office applications, are available only when you've deployed the AIP unified labeling client:

- [A scanner for on-premises data stores](../deploy-aip-scanner.md)
- [PowerShell labeling cmdlets](clientv2-admin-guide-powershell.md)
- [Labeling with right-click options from the File Explorer](clientv2-classify-protect.md#use-the-file-explorer-to-classify-and-protect-files)
- [A viewer for protected files](clientv2-view-use-files.md), such as text, images, PDF, .pfile

For File Explorer and PowerShell commands, the user must be connected to the internet to protect files.

For more information, see [Admin Guide: Install the Azure Information Protection unified labeling client for users](clientv2-admin-guide-install.md).

## FAQs

### Can AIP and built-in labeling function side-by-side?

Yes. We recommend that you use the built-in labeling solution for Office apps to benefit from features such as automatic updates and increased performance. You can also deploy the AIP unified labeling client across your network to use the additional File Explorer support, PowerShell cmdlets, and the AIP scanner.

MORE TBD

### What's the difference between Azure Information Protection and Microsoft Information Protection?

[Microsoft Information Protection](https://www.microsoft.com/security/business/information-protection) is a framework for products and integrated capabilities that help you protect your organization's sensitive information. Azure Information Protection is only one of the Microsoft services that provide information protection.

**Microsoft Information Protection products include**:

- Microsoft 365 Information Protection, such as Microsoft 365 DLP
- Windows Information Protection
- Microsoft Defender for Cloud Apps
- Azure Information Protection

**Microsoft Information Protection capabilities include**:

- Unified label management
- End-user labeling experiences built into Office apps
- The ability for Windows to understand unified labels and apply protection to data
- The Microsoft Information Protection SDK
- Functionality in Adobe Acrobat Reader to view labeled and protected PDFs

For more information, see [Information protection capabilities to help protect your sensitive data](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/Announcing-availability-of-information-protection-capabilities/ba-p/261967).

### What's the difference between labeling with the built-in labeling solution and labeling with the AIP Office add-in?

THIS NEEDS TO BE RE-WRITTEN

Originally, Microsoft 365 had only [retention labels](https://support.office.com/article/af398293-c69d-465e-a249-d74561552d30), which enabled you to classify documents and emails for auditing and retention when that content was stored in Microsoft 365 services.

In contrast, Azure Information Protection labels, configured at the time using the AIP classic client in the Azure portal, enabled you to apply a consistent classification and protection policy for documents and emails whether they were stored on-premises or in the cloud.

Microsoft 365 supports [sensitivity labels](/microsoft-365/compliance/sensitivity-labels) in addition to retention labels. Sensitivity labels can be created and configured in the Microsoft 365 compliance center.

If you have legacy AIP labels configured in the Azure portal, we recommend migrating them to sensitivity labels and unified labeling client. For more information, see [Tutorial: Migrating from the Azure Information Protection (AIP) classic client to unified labeling solution](../tutorial-migrating-to-ul.md).

For more information, see [Announcing availability of information protection capabilities to help protect your sensitive data](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/Announcing-availability-of-information-protection-capabilities/ba-p/261967).

## The Rights Management client

The RMS client provides protection only, and is automatically installed with some applications, including Office applications, the AIP unified labeling and classic clients, and RMS-enlightened applications from other software vendors.

You can also [install the RMS client yourself](https://www.microsoft.com/download/details.aspx?id=38396), to support [synchronizing files from IRM-protected libraries and OneDrive](/onedrive/deploy-on-windows), and for developers who want to integrate rights management protection into line-of-business applications.

## Next steps

If you haven't yet enabled the built-in labeling solution for Microsoft 365, we recommend that you analyze the support information in this article and the [Microsoft 365 roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap?rtc=1&filters=&searchterms=compliance) for updates in the compliance center.

Enable built-in labeling across your network to benefit from continued enhancements and a unified and streamlined customer experience.

For more information about using the built-in labeling solution, see [Sensitivity labels in Office apps](/microsoft-365/compliance/sensitivity-labels-office-apps).

To install and configure the Azure Information Protection unified labeling client, see:

- [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)
- [Azure Information Protection unified labeling user guide](clientv2-user-guide.md)
