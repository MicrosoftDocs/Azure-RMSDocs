---
# required metadata

title: Delete or reorder an Azure Information Protection label
description: You can delete or re-order the labels that users see on the Information Protection bar by configuring this in the Azure Information Protection policy.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/25/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: ae0f603f-a632-4ac5-a3f7-6358d4255eff

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to delete or reorder a label for Azure Information Protection

>*Applies to: Azure Information Protection*

You can delete or re-order the labels that users see on the Information Protection bar by configuring this in the Azure Information Protection policy.

![Delete or reorder labels in the Azure Information Protection policy](../media/info-protect-contextmenu.png)

When you delete a label that has been applied to documents and emails, and then publish the Azure Information Protection policy, that label will be automatically removed from these documents or emails when they are next opened by the Azure Information Protection client.

Before you delete a label, consider whether to disable it, instead. When you disable a label that has been applied to documents and emails, the applied label will not be removed from these documents and emails but it no longer displays as a label that users can select on the Information Protection bar. Disabling a label also lets you keep the original configuration for when you might want users to select the label at a later time, when you simply re-enable it.

Order the labels so that users see them in a logical progression in the Information Protection bar. For example, order the labels in increasing sensitivity so that users see the least sensitive label first and the most sensitive label last. The [default policy](configure-policy-default.md) uses this configuration and reflects the increasing sensitivity in the label names.

> [!IMPORTANT]
>If you configure [conditions](configure-policy-classification.md) for your labels that might apply to more than one label, you must order the labels from least sensitive to most sensitive. This ordering ensures that the most sensitive label is applied when the conditions are evaluated.


Use the following instructions to make these changes.

1. If you haven't already done so, in a new browser window, sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin, and then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. If the label that you want to delete, disable, or reorder applies to all users, do one of the following from the **Policy: Global** blade. 

    - To delete a label: Right-click or select the context menu (**...**) for the label that you want to delete, click **Delete this label**, and click **Yes** to confirm. Then click **Save**. 

    - To disable a label: Select the label that you want to disable. On the **Label** blade, for **Enabled**, click **Off**, and then click **Save**.

    - To re-order a label: Right-click or select the context menu (**...**) for the label that you want to re-order, click **Move up** or **Move down** until the label is in the order that you want. Then click **Save**. 

     If the label that you want to delete, disable, or reorder is in a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, first select that scoped policy from the initial **Azure Information Protection** blade.

3. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  

[!INCLUDE[Commenting house rules](../includes/houserules.md)]

