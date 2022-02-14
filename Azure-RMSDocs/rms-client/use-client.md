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

