---
# required metadata

title: Change an Azure Information Protection label - AIP
description: You can change or refine any of the labels that users see on the Information Protection bar, by configuring them in the Azure Information Protection policy.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 03/16/2020
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: e3b6d95f-334b-4d17-80a9-7d5487ab5d32
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
#ms.reviewer: eymanor
ms.subservice: aiplabels
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# How to change or customize an existing label for Azure Information Protection

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) from the Microsoft 365 documentation.*

[!INCLUDE [classic-client-deprecation-extended-support](../includes/classic-client-deprecation-extended-support.md)]

You can change or refine any of the labels that users see on the Information Protection bar or from the **Protect** button on the Office ribbon, by configuring the labels in the Azure portal.

For example, you can change a label or sublabel name, tooltip, color, and order. You can change whether the label applies visual markings such as a footer or watermark. You can also change whether the label applies protection, and recommended or automatic classification.

To change a label, use the following instructions:

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** pane. 
    
    For example, in the search box for resources, services, and docs: Start typing **Information** and select **Azure Information Protection**.

2. From the **Classifications** > **Labels** menu option: On the **Azure Information Protection - Labels** pane, select the label you want to change.

    The exception is if you want to reorder a label: Instead of selecting the label, either right-click the label or select the context menu for the label. Then, select the **Move up** or **Move down** options.

3. Whenever you make changes on a new pane, click **Save** on that pane if you want to keep your changes.
    
    When you click **Save**, your changes are automatically available to users and services. There's no longer a separate publish option.

4. If you changed the label display name or description and you have configured these for additional languages: Export your Azure Information Protection policy again, provide new translations, and import the changes. For more information, see [How to configure labels for different languages](configure-policy-languages.md).

> [!TIP]
>If you want to return one of the default labels to the default values, use the information in [The default Information Protection policy](configure-policy-default.md).

## Next steps

For more information about configuring the options that you can make for a label, and other settings for your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.



