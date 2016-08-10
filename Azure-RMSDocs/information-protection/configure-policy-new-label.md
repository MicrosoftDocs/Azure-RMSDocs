---
# required metadata

title: How to create a new label for Azure Information Protection | Azure Rights Management
description:
author: cabailey
manager: mbaldwin
ms.date: 08/10/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 1b45faa5-0c9c-40d6-910a-f117e7b6e8a3

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to create a new label for Azure Information Protection

>*Applies to: Azure Information Protection preview*

**[ This information is preliminary and subject to change. ]**

Although Azure Information Protection comes with default labels that you can customize, you can also create your own labels that users see on the Information Protection bar.

You can add a new label, or add a new sub-label to an existing label when you need a further level of classification. For example, the **Secret** label, which is in the [default policy](configure-policy-default.md), contains sub-labels.

Use the following instructions to add a new label to the Azure Information Protection policy.

1. If you haven't already done so, sign in to the [Azure portal](https://portal.azure.com) and then navigate to the **Azure Information Protection** blade. For example, on the hub menu, click **Browse** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. On the **Azure Information Protection** blade, do one of the following:

	- To create a new label: Click **Add a new label**.

	- To create a new sub-label: Right-click or select the context menu (**...**) for the label that you want to create a sub-label for, and then click **Add a sub-label**.

3. On the **Label** or **Sub-label** blade, select the options that you want for this new label, and then click **Save**.

	> [!NOTE]
	>For information about setting protection, see [How to configure a label to apply protection](configure-policy-protection.md).

4. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organization-s-policy) section.  


