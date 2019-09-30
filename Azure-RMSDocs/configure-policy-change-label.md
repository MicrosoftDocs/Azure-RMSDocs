---
# required metadata

title: Change an Azure Information Protection label - AIP
description: You can change or refine any of the labels that users see on the Information Protection bar, by configuring them in the Azure Information Protection policy.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 09/17/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: e3b6d95f-334b-4d17-80a9-7d5487ab5d32

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
ms.subservice: aiplabels
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# How to change or customize an existing label for Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

You can change or refine any of the labels that users see on the Information Protection bar or from the **Protect** button on the Office ribbon, by configuring the labels in the Azure portal.

For example, you can change a label or sublabel name, tooltip, color, and order. You can change whether the label applies visual markings such as a footer or watermark. You can also change whether the label applies protection, and recommended or automatic classification.

To change a label, use the following instructions:

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **All services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. From the **Classifications** > **Labels** menu option: On the **Azure Information Protection - Labels** blade, select the label you want to change.

    The exception is if you want to reorder a label: Instead of selecting the label, either right-click the label or select the context menu for the label. Then, select the **Move up** or **Move down** options.

3. Whenever you make changes on a new blade, click **Save** on that blade if you want to keep your changes.
    
    When you click **Save**, your changes are automatically available to users and services. There's no longer a separate publish option.

4. If you changed the label display name or description and you have configured these for additional languages: Export your Azure Information Protection policy again, provide new translations, and import the changes. For more information, see [How to configure labels for different languages](configure-policy-languages.md).

> [!TIP]
>If you want to return one of the default labels to the default values, use the information in [The default Information Protection policy](configure-policy-default.md).

## Next steps

For more information about configuring the options that you can make for a label, and other settings for your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.



