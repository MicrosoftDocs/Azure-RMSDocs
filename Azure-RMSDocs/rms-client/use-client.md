---
# required metadata

title: Learn about built-in labeling and the AIP unified labeling client - AIP
description: Learn about the differences between the Azure Information Protection client and built-in labeling from Microsoft Purview Information Protection.
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

Both the Azure Information Protection (AIP) unified labeling client and labels built into Office apps use [sensitivity labels](/microsoft-365/compliance/sensitivity-labels) that make it easier for users to protect their data.

For example, if you've applied sensitivity labels in Outlook for the web, or in Office for Mac, these apps use built-in labels rather than the AIP unified labeling client.

Although you can use the AIP unified labeling client for your Office apps on Windows computers, we recommend you use the labels that are built into Office apps, rather than the Office Add-in provided by the unified labeling client. For more information, see [Why choose built-in labeling over the AIP add-in for Office apps](/microsoft-365/compliance/sensitivity-labels-aip).

The AIP unified labeling client provides labeling support outside Office apps by using File Explorer, PowerShell, and a scanner.

## AIP client support and timelines

The **Azure Information Protection unified labeling client** has moved into **maintenance mode** as of **January 1, 2022**. Moving forward, no new features will be added to the unified labeling client. Instead, new features are being added to labeling built into Office apps that are supported across multiple platforms. You might find it helpful to reference [Features supported only by built-in labeling for Office apps](/microsoft-365/compliance/sensitivity-labels-aip#features-supported-only-by-built-in-labeling-for-office-apps).

Additionally, we have retired the **Azure Information Protection classic client** and **Label Management** in the Azure portal as of **March 31, 2022**. No further support is provided for the classic client and maintenance versions will no longer be released.

All current Azure Information Protection classic client customers must [migrate to the unified labeling platform](../tutorial-migrating-to-ul.md) and upgrade to the [unified labeling client](../rms-client/clientv2-admin-guide-install.md).

For more information, see

- [Announcing AIP unified labeling client maintenance mode and sunset of mobile viewer](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/announcing-aip-unified-labeling-client-maintenance-mode-and/ba-p/3043613)

- [Final reminder to migrate from Azure Information Protection classic client to unified labeling](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/final-reminder-to-migrate-from-azure-information-protection/ba-p/2731734)

- [Azure Information Protection servicing information timelines](unifiedlabelingclient-version-release-history.md#servicing-information-and-timelines)


## Latest labeling features 

Although no new features will be added for the unified labeling client, we're constantly developing new features and improvements for sensitivity labels that use built-in labeling. Check for updates in the following locations:

- [Features supported only by built-in labeling](/microsoft-365/compliance/sensitivity-labels-aip#features-supported-only-by-built-in-labeling-for-office-apps)
- [Feature parity for built-in labeling and the AIP Add-in for Office](/microsoft-365/compliance/sensitivity-labels-aip#feature-parity-for-built-in-labeling-and-the-aip-add-in-for-office)
- [What's new in Microsoft Purview risk and compliance solutions](/microsoft-365/compliance/whats-new)
- [Microsoft 365 Roadmap](https://www.microsoft.com/microsoft-365/roadmap?rtc=1&filters=&searchterms=compliance)

## Labeling outside Office apps

Outside Office apps, the AIP unified labeling client provides the following extra features:

- [A scanner for on-premises data stores](../deploy-aip-scanner.md)
- [PowerShell labeling cmdlets](clientv2-admin-guide-powershell.md)
- [Labeling with right-click options from File Explorer](clientv2-classify-protect.md#use-the-file-explorer-to-classify-and-protect-files)
- [A viewer for protected files](clientv2-view-use-files.md), such as text, images, PDF, .pfile

For File Explorer and PowerShell commands, the user must be connected to the internet to protect files.

For more information, see [Admin Guide: Install the Azure Information Protection unified labeling client for users](clientv2-admin-guide-install.md).

## The Rights Management client

The Rights Management Service (RMS) client provides protection only, and is automatically installed with some applications. For example, this client is included in Office apps where it's implemented as Information Rights Management (IRM) with protection templates, restrict access options, and Encrypt menu options for Outlook. It can also be included in [RMS-enlightened applications](../requirements-applications.md) from other software vendors.

We recommend you use sensitivity labels to apply protection, rather than the Rights Management Service client. Labels abstract the complexity of encryption for users, and can offer other benefits, such as visual markings, and metadata that can be read by other apps and services.

For Office apps, you might find it helpful to read how the two methods of applying encryption interact, and how to disable IRM options for Outlook:

- [Protection templates and sensitivity labels](/microsoft-365/compliance/sensitivity-labels-office-apps#protection-templates-and-sensitivity-labels)
- [Information Rights Management (IRM) options and sensitivity labels](/microsoft-365/compliance/sensitivity-labels-office-apps#information-rights-management-irm-options-and-sensitivity-labels)

## FAQs

### Can AIP and built-in labeling function side-by-side?

Yes. We recommend that you use built-in labeling for Office apps to benefit from features such as automatic updates and increased performance. But you can deploy the AIP unified labeling client across your network to use the additional File Explorer support, PowerShell cmdlets, and the AIP Viewer.

### What's the difference between Azure Information Protection and Microsoft Purview Information Protection?

[Microsoft Purview Information Protection](https://www.microsoft.com/security/business/information-protection) is a framework for products and integrated capabilities that help you protect your organization's sensitive information. Azure Information Protection is only one of the Microsoft components that provide information protection.

**Microsoft Purview Information Protection products include**:

- Microsoft Purview Data Loss Prevention
- Microsoft Defender for Cloud Apps
- Azure Information Protection

**Microsoft Purview Information Protection capabilities include**:

- Unified label management for multiple apps and services
- End-user labeling experiences built into Office apps
- The Microsoft Information Protection SDK
- Functionality in Adobe Acrobat Reader to view labeled and protected PDFs

For more information, see [Protect your sensitive data with Microsoft Purview](/microsoft-365/compliance/information-protection).

### What's the difference between labeling with the built-in labeling solution and labeling with the AIP Office Add-in?

Unlike the AIP Office Add-in, labels built into Office apps require no extra installation and are automatically maintained as part of your existing Office deployment update strategy. Built-in labels are supported by not just Windows, but also macOS, iOS, Android, and the web.

The latest labeling features are [supported only by built-in labeling](/microsoft-365/compliance/sensitivity-labels-aip#features-supported-only-by-built-in-labeling-for-office-apps). If users are already using the AIP Office Add-in, use the [feature parity information](/microsoft-365/compliance/sensitivity-labels-aip#feature-parity-for-built-in-labeling-and-the-aip-add-in-for-office) to identify whether there's a required feature that isn't yet supported by built-in labeling.

For more information, see [Why choose built-in labeling over the AIP add-in for Office apps](/microsoft-365/compliance/sensitivity-labels-aip).

## Next steps

If you have the AIP unified labeling client installed and want to benefit from the extra stability, better performance, and latest labeling features for your Office apps, you'll need to [disable the AIP add-in for Office apps](/microsoft-365/compliance/sensitivity-labels-aip#how-to-disable-the-aip-add-in-to-use-built-in-labeling).

To learn more about labeling outside Office apps, see the [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md).
