---
# required metadata

title: Azure Information Protection deployment roadmap
description: Use these steps to prepare for, implement, and manage Azure Information Protection for your organization.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 06/10/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 086600c2-c5d8-47ec-a4c0-c782e1797486

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Azure Information Protection deployment roadmap

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

>[!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

> [!TIP]
> Alternatively, you may be looking for one of the following articles:
> - [How-to guides for common scenarios that use Azure Information Protection](how-to-guides.md)
>- [Azure Information Protection release roadmap](information-support.md#information-about-new-releases-and-updates)

Use the steps in the following roadmap pages as recommendations to help you prepare for, implement, and manage Azure Information Protection for your organization.

## Identify your deployment roadmap

Before deploying AIP, review the [AIP system requirements](./requirements.md).

Then, choose one of the following roadmaps, depending on your organization's needs and [subscription](https://azure.microsoft.com/pricing/details/information-protection/):

- **Use classification, labeling, and protection**:

    Recommended for any customers with a supporting subscription. Additional capabilities include both discovering sensitive information and labeling documents and emails for classification. 

    Labels can also apply protection, simplifying this step for your users. 

    This roadmap is supported for both AIP labels created with the classic client, and sensitivity labels that use the [unified labeling platform](faqs.md#how-can-i-determine-if-my-tenant-is-on-the-unified-labeling-platform).

    For more information, see [AIP roadmap to classify, label, and protect your data](deployment-roadmap-classify-label-protect.md).

- **Use protection only**: 

    Recommended for customers with a subscription that doesn't support both classification and labels, but does support protection without labels. You must have the classic client installed.

    For more information, see [AIP roadmap for data protection only](deployment-roadmap-protect-only.md).

## Next steps

As you deploy Azure Information Protection, you might find it helpful to check the [frequently asked questions](faqs.md), and the [information and support](information-support.md) page for additional resources.