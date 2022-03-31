---
# required metadata

title: FAQs for classification & labeling - AIP
description: Have a question that is specifically about classification and labeling using Azure Information Protection? See if it's answered here. 
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 03/07/2021
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 4b595b6a-7eb0-4438-b49a-686431f95ddd

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: adhall
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Frequently asked questions about classification and labeling in Azure Information Protection

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

Have a question about Azure Information Protection that is specifically about classification and labeling?  See if it's answered here.

## Which client do I install for testing new functionality?

We recommend using the built-in labeling solution for Office apps by default, and then installing the Azure Information Protection unified labeling client in parallel if you need the extra features supported by AIP.

You can use the AIP client's extra functionality and built-in labeling simultaneously, and the unified labeling client downloads labels and policy settings from the Microsoft 365 compliance center.

For more information, see [Learn about about built-in labeling and the AIP unified labeling client](rms-client/use-client.md).

> [!TIP]
> The Azure Information Protection client is supported on Windows only.
>
> To classify and protect documents and emails on iOS, Android, macOS, and the web, use [Office apps that support built-in labeling](/microsoft-365/compliance/sensitivity-labels-office-apps#support-for-sensitivity-label-capabilities-in-apps).
>

## Where can I find information about using sensitivity labels for Office apps?

See the following documentation resources:

- [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels)

- [Use sensitivity labels in Office apps](/microsoft-365/compliance/sensitivity-labels-office-apps)

- [Enable sensitivity labels for Office files in SharePoint and OneDrive](/microsoft-365/compliance/sensitivity-labels-sharepoint-onedrive-files)

- [Apply sensitivity labels to your documents and email within Office](https://support.office.com/article/Apply-sensitivity-labels-to-your-documents-and-email-within-Office-2f96e7cd-d5a4-403b-8bd7-4cc636bae0f9#ID0EBFAAA=Office_365)

For information about other scenarios that support sensitivity labels, see [Common scenarios for sensitivity labels](/microsoft-365/compliance/get-started-with-sensitivity-labels#common-scenarios-for-sensitivity-labels).

## How do I prevent somebody from removing or changing a label?

To prevent users from removing or changing a label, the content must already be protected and the protection permissions do not grant the user the Export or Full Control [usage right](configure-usage-rights.md).

## When an email is labeled, do any attachments automatically get the same labeling?

No. When you label an email message that has attachments, those attachments do not inherit the same label. The attachments remain either without a label or retain a separately applied label. However, if the label for the email applies protection, that protection is applied to Office attachments.

## How can DLP solutions and other applications integrate with Azure Information Protection?

Because Azure Information Protection uses persistent metadata for classification, which includes a clear-text label, this information can be read by DLP solutions and other applications.

For examples of using this metadata with Exchange Online mail flow rules, see [Configuring Exchange Online mail flow rules for Azure Information Protection labels](configure-exo-rules.md).
