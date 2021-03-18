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

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*
>
>***Relevant for**: [AIP unified labeling client and classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For more information, see also the [FAQs for the classic client only](faqs-classic.md).*

>[!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

Have a question about Azure Information Protection that is specifically about classification and labeling?  See if it's answered here. 

## Which client do I install for testing new functionality?

We recommend installing the **Azure Information Protection unified labeling client**. The unified labeling client downloads labels and policy settings from one of the following admin centers: 

- Office 365 Security & Compliance Center
- Microsoft 365 security center
- Microsoft 365 compliance center.

This client is now in general availability, and might have a preview version for you to test additional functionality for a future release.

If you still configured labels in the Azure portal that you haven't yet [migrated to the unified labeling store](configure-policy-migrate-labels.md), use the **Azure Information Protection classic client** instead.

For more information, including a feature and functionality comparison table, see [Choose your Windows labeling solution](rms-client/use-client.md#choose-your-windows-labeling-solution).

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