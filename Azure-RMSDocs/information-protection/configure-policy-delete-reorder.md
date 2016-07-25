---
# required metadata

title: How to delete or reorder a label for Azure Information Protection | Azure Rights Management
description:
author: cabailey
manager: mbaldwin
ms.date: 07/24/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
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

*Applies to: Azure Information Protection preview*

You can delete or re-order the labels that users see on the Information Protection bar by configuring this in the Azure Information Protection policy.

![Delete or reorder labels in the Azure Information Protection policy](../media/info-protect-contextmenu.png)

Instead of deleting a label, you might simply want to disable it if you want to keep the label configuration but prevent it from displaying in the Information Protection bar.

Order the labels so that users see them in a logical progression in the Information Protection bar. For example, order the labels in increasing sensitivity so that users see the least sensitive label first and the most sensitive label last. The [default policy](configure-policy-default.md) uses this configuration.

> [!IMPORTANT]
>If you configure [conditions](configure-policy-classification.md) for your labels that might apply to more than one label, you must order the labels from least sensitive to most sensitive. This ordering ensures that the most sensitive label is applied when the conditions are evaluated.


Use the following instructions to make these changes.

1. Make sure that you are signed in to the Azure portal by using this special link for Azure Information Protection: https://portal.azure.com/?microsoft_azure_informationprotection=true
 
2. On the hub menu, click **Browse** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

3. On the **Azure Information Protection** blade, do one of the following actions, depending on whether you want to delete, disable, or reorder a label:

    - To delete a label: Right-click or select the context menu (**...**) for the label that you want to delete, click **Delete this label**, and click **Yes** to confirm. Then click **Save**. 

    - To disable a label: Select the label that you want to disable. On the **Label** blade, for **Enabled**, click **Off**, and then click **Save**.

    - To re-order a label: Right-click or select the context menu (**...**) for the label that you want to re-order, click **Move up** or **Move down** until the label is in the order that you want. Then click **Save**. 

4. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organization-s-policy) section.  


