---
# required metadata

title: Overview of the Azure Information Protection policy
description: Understand labels and settings in an Azure Information Protection policy that gets downloaded to the Azure Information Protection client. 
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/04/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: aiplabels
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Overview of the Azure Information Protection policies

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) from the Microsoft 365 documentation.*

> [!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).
>

An Azure Information Protection policy contains the following elements that you can configure:
    
- Which labels are included that let administrators and users classify (and optionally, protect) documents and emails.

- Title and tooltip for the Information Protection bar that users see in their Office applications.

- The option to set a default label as a starting point for classifying documents and emails.

- The option to enforce classification when users save documents and send emails.

- The option to prompt users to provide a reason when they select a label that has a lower sensitivity level than the original.

- The option to automatically label an email message, based on its attachments.

- The option to control whether the Information Protection bar is displayed in Office applications.

- The option to control whether the Do Not Forward button is displayed in Outlook.

- The option to let users specify their own permissions for documents.

- The option to provide a custom help link for users.

Azure Information Protection comes with a [default policy](configure-policy-default.md), which contains five main labels. Two of these labels contain sublabels to provide subcategories, when needed. 

When a label is configured for sublabels, users cannot select the main label but must select one of the sublabels. In this scenario, the main label is supported as a display container only for the name and color.

The Azure Information Protection labels can be used with the full range of data that an organization typically creates and stores, from the lowest classification of personal data, to the highest classification of highly confidential data. 

You can use the default labels without changes, or you can customize them, or you can delete them, and you can create new labels. For full instructions, see [Configuring the Azure Information Protection policy](configure-policy.md).

## Next steps

For examples of how to customize the Azure Information Protection policy, and see the resulting behavior for users, try the following tutorials:

- [Edit the Azure Information Protection policy and create a new label and create a new label](infoprotect-quick-start-tutorial.md)

- [Configure Azure Information Protection policy settings that work together](infoprotect-settings-tutorial.md)