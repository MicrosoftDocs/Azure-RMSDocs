---
# required metadata

title: Change an Azure Information Protection label
description: You can change or refine any of the labels that users see on the Information Protection bar, by configuring them in the Azure Information Protection policy.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/23/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: e3b6d95f-334b-4d17-80a9-7d5487ab5d32

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to change or customize an existing label for Azure Information Protection

>*Applies to: Azure Information Protection*

You can change or refine any of the labels that users see on the Information Protection bar, by configuring them in the Azure Information Protection policy.

For example, you can change a label or sub-label name, tooltip, color, order, whether it applies visual markings such as a footer or watermark, whether it applies Azure Rights Management protection, and recommended or automatic classification.

To change a label, use the following instructions.

1. If you haven't already done so, open a new browser window and sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin. Then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. To change a label from the global policy so that it applies to all users, select the label to change from the **Azure Information Protection - Global policy** blade, and any subsequent blades as required. To change a label from a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, first select **Scoped policies** from the **POLICIES** menu selection. Then select your scoped policy from the **Azure Information Protection - Scoped polices** blade.

    The exception is if you want to reorder a label, which you do on the policy blade from the global policy or your selected scoped policy: Either right-click the label or select the context menu for the label, and then select the **Move up** or **Move down** options.

3. Whenever you make changes on a blade, click **Save** on that blade if you want to keep your changes.

4. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

5. If you changed the label name or description and you have configured these for additional languages, you must export your Azure Information Protection policy again, provide new translations, and import the changes. For more information, see [How to configure labels for different languages](configure-policy-languages.md).

> [!TIP]
>If you want to return one of the default labels to the default values, use the information in [The default Information Protection policy](configure-policy-default.md).

## Next steps

For more information about configuring the options that you can make for a label, and other settings for your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


