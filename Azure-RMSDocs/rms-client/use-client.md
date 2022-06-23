---
# required metadata

title: Learn about built-in labeling and the AIP unified labeling client - AIP
description: Learn about the differences between Azure Information Protection and Microsoft Purview Information Protection's built-in labeling solution for Office apps.
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

# Learn about built-in labeling and the AIP unified labeling client

[!INCLUDE [looking-for-mip](../includes/looking-for-mip.md)]


Sensitivity labels make it easier for your users to apply protection, and also provide classification so that you can track and manage your data.

The Azure Information Protection (AIP) unified labeling client can be installed over the [built-in labeling solution for Microsoft Office](/microsoft-365/compliance/sensitivity-labels), and provides extra features such as support for classifying and protecting files outside of Office using the File Explorer or PowerShell.

While the recommended solution is to use the built-in labeling provided by Microsoft Office 365, you may also continue to use the AIP unified labeling client for specific features it provides, such as support for the File Explorer and PowerShell, so that you can classify and protect files outside of office.

## AIP client timelines

As we continue to bring the customer labeling and protection experience to built-in applications like Office 365, the **Azure Information Protection unified labeling client** has moved into **maintenance mode** as of **January 1, 2022**. Moving forward, no new features will be added to the unified labeling client.

Additionally, we have retired the **Azure Information Protection classic client** and **Label Management** in the Azure Portal as of **March 31, 2022**. No further support is provided for the classic client and maintenance versions will no longer be released.

All current Azure Information Protection classic client customers must [migrate to the Microsoft Purview Information Protection unified labeling platform](../tutorial-migrating-to-ul.md) and upgrade to the [unified labeling client](../rms-client/clientv2-admin-guide-install.md).

We also recommend that you use the default labeling that's built-in to Office apps for the extra stability, better performance, and latest features. If you have the AIP unified labeling client installed, you'll need to [disable the AIP add-in for Office apps](/microsoft-365/compliance/sensitivity-labels-aip#how-to-disable-the-aip-add-in-to-use-built-in-labeling).

For more information, see

- [Announcing AIP unified labeling client maintenance mode and sunset of mobile viewer](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/announcing-aip-unified-labeling-client-maintenance-mode-and/ba-p/3043613)

- [Final reminder to migrate from Azure Information Protection classic client to unified labeling](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/final-reminder-to-migrate-from-azure-information-protection/ba-p/2731734)

- The [built-in labeling documentation](/microsoft-365/compliance/sensitivity-labels)
- [Learn about MIP and the AIP client](/microsoft-365/compliance/sensitivity-labels-aip)
- [Azure Information Protection servicing information timelines](unifiedlabelingclient-version-release-history.md#servicing-information-and-timelines)

## Understand more about labeling solution options

Whether you are an existing customer with AIP unified labeling deployed, or a new customer looking for a labeling and protection solution, we recommend enabling built-in labeling for Office apps.

Built-in labeling provides more stability than the AIP add-in for Office apps, better performance, and the latest features, such as advanced classifiers.

- **Both built-in labeling and the unified labeling client use sensitivity labels and label policies downloaded from the Microsoft Purview compliance portal.** These label and policy settings can be shared by macOS, iOS, and Android.

- **Built-in labeling requires no extra installations** and provides automatic updates. You only need a Windows computer with Microsoft 365 applications minimum version 1910. In contrast, the AIP unified labeling client requires a separate [installation](https://www.microsoft.com/download/details.aspx?id=53018) on each client machine.

If you already have the AIP unified labeling client installed, you'll need to disable it to use built-in labeling with Office apps. For more information, see the [Microsoft 365 compliance documentation](/microsoft-365/compliance/sensitivity-labels-aip#how-to-disable-the-aip-add-in-to-use-built-in-labeling).

Use the AIP add-in for your Office apps only if:

- You've already deployed it to users and you need time to migrate them to built-in labeling.
- When users need a feature that isn't supported by built-in labeling.

You may also want to use the AIP unified labeling client for [labeling features used outside of Office apps](#labeling-functionality-outside-of-office-applications).


### Updates for Microsoft Purview Information Protection in Microsoft 365

Microsoft 365 is constantly developing new features for sensitivity labels with built-in labeling. We recommend checking for updates in the following locations:

- [Feature parity for built-in labeling and the AIP add-in for Office](/microsoft-365/compliance/sensitivity-labels-aip#feature-parity-for-built-in-labeling-and-the-aip-add-in-for-office)
- [What's new in Microsoft 365 compliance](/microsoft-365/compliance/whats-new)
- The [Microsoft 365 Roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap?rtc=1&filters=&searchterms=compliance)

### The Rights Management client

The Rights Management Service (RMS) client provides protection only, and is automatically installed with some applications, including Office applications, the AIP unified labeling client, and [RMS-enlightened applications](../requirements-applications.md) from other software vendors.

- **Extra support for recommended / automatic labeling**. While the Azure Information Protection unified labeling client supports automatic labeling for built-in and custom sensitive info types, built-in labeling also supports other information types, such as trainable classifiers or sensitive info types that use Exact Data Match (EDM). 

## Labeling functionality outside of Office applications

Outside of Office applications, the AIP unified labeling client provides the following extra features:

- [A scanner for on-premises data stores](../deploy-aip-scanner.md)
- [PowerShell labeling cmdlets](clientv2-admin-guide-powershell.md)
- [Labeling with right-click options from the File Explorer](clientv2-classify-protect.md#use-the-file-explorer-to-classify-and-protect-files)
- [A viewer for protected files](clientv2-view-use-files.md), such as text, images, PDF, .pfile

For File Explorer and PowerShell commands, the user must be connected to the internet to protect files.

For more information, see [Admin Guide: Install the Azure Information Protection unified labeling client for users](clientv2-admin-guide-install.md).

## FAQs

### Can AIP and built-in labeling function side-by-side?

Yes. We recommend that you use the built-in labeling solution for Office apps to benefit from features such as automatic updates and increased performance. You can also deploy the AIP unified labeling client across your network to use the additional File Explorer support, PowerShell cmdlets, and the AIP Viewer.

### What's the difference between Azure Information Protection and Microsoft Purview Information Protection?

[Microsoft Purview Information Protection](https://www.microsoft.com/security/business/information-protection) is a framework for products and integrated capabilities that help you protect your organization's sensitive information. Azure Information Protection is only one of the Microsoft services that provide information protection.

**Microsoft Purview Information Protection products include**:

- Microsoft 365 Information Protection, such as Microsoft 365 DLP
- Windows Information Protection
- Microsoft Defender for Cloud Apps
- Azure Information Protection

**Microsoft Purview Information Protection capabilities include**:

- Unified label management
- End-user labeling experiences built into Office apps
- The ability for Windows to understand unified labels and apply protection to data
- The Microsoft Information Protection SDK
- Functionality in Adobe Acrobat Reader to view labeled and protected PDFs

For more information, see [Information protection capabilities to help protect your sensitive data](https://techcommunity.microsoft.com/t5/Enterprise-Mobility-Security/Announcing-availability-of-information-protection-capabilities/ba-p/261967).

### What's the difference between labeling with the built-in labeling solution and labeling with the AIP Office add-in?

Unlike the AIP Office add-in, the built-in labeling solution provided by [Microsoft Purview Information Protection](https://www.microsoft.com/security/business/information-protection) is part of your Office applications, and will be maintained as part of the Office update strategy.

From a functional perspective, the [feature parity section](/microsoft-365/compliance/sensitivity-labels-aip#feature-parity-for-built-in-labeling-and-the-aip-add-in-for-office) in the Microsoft 365 compliance documentation to understand the similarities and differences between the two services.

Keep the AIP client installed, but disabled in Office apps in order benefit from right-click options from the File Explorer, the AIP Viewer, PowerShell support, and the AIP scanner.

For more information, see [Learn about MIP and the AIP client](/microsoft-365/compliance/sensitivity-labels-aip) and the [Microsoft 365 roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap?rtc=1&filters=&searchterms=compliance).

## Next steps

If you haven't yet enabled the built-in labeling solution for Microsoft 365, we recommend that you analyze the [feature parity information](/microsoft-365/compliance/sensitivity-labels-aip#feature-parity-for-built-in-labeling-and-the-aip-add-in-for-office) in the Microsoft 365 compliance documentation and the [Microsoft 365 roadmap](https://www.microsoft.com/en-us/microsoft-365/roadmap?rtc=1&filters=&searchterms=compliance) for updates in the compliance center.

Disable the AIP add-in for Office apps to use built-in labeling across your network, with continued enhancements and a unified and streamlined customer experience.

For the [extra features provided outside of Office apps](#labeling-functionality-outside-of-office-applications), install and configure the Azure Information Protection unified labeling client. For more information, see:

- [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)
- [Azure Information Protection unified labeling user guide](clientv2-user-guide.md)
