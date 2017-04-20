---
# required metadata

title: Configure scoped policies for Azure Information Protection
description: To configure different settings and labels for specific users, you must configure a scoped policy for Azure Information Protection. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/25/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 4b134785-0353-4109-8fa7-096d1caa2242

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to configure the Azure Information Protection policy for specific users by using scoped policies

>*Applies to: Azure Information Protection*

When the Azure Information Protection policy downloads to computers that have installed the [Azure Information Protection client](https://www.microsoft.com/en-us/download/details.aspx?id=53018), all users get the settings and labels from the default policy or the changes that you configured for the global policy. If you want to supplement these for specific users, by having different settings and labels, you must create a **scoped policy** that's configured for those users.

All users receive the global policy, which contains the Information Protection bar title and tooltip, global settings, and global labels. If you have configured scoped policies for specific users, those users then receive those additional settings and labels. 

Scoped policies, just like labels, are ordered in the Azure portal. If a user is configured for multiple scopes, an effective policy is computed for that user before it is downloaded. According to the order of the polices, the last policy setting is applied. The labels that the user sees are from the global policy and any additional labels from scoped policies that the user belongs to. 

Because a scoped policy always inherits the labels and settings and from the global policy, the labels from the global policy are displayed when you create or edit a scoped policy. However, you cannot edit the labels from the global policy when you edit a scoped policy. You can however, add sub-labels to these inherited labels.

For example, if you have a label named **Confidential** in the global policy, all users see this label. You cannot remove or re-order it with a scoped policy. But you might want to create a scoped policy for the Marketing department that adds a new sub-label to Confidential, so that these users see **Confidential \ Promotions**. You also create another scoped policy for the Sales department that adds a new sub-label to Confidential, so that these users see **Confidential \ Partners**. Each sub-label can then be configured for different settings and the sub-label is visible only to the users in the respective departments.


To configure a scoped policy for Azure Information Protection:

1. In a new browser window, sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin.

2. Navigate to the **Azure Information Protection** blade: For example, on the hub menu, click **More services** and start typing **Information Protection** in the Filter box. From the results, select **Azure Information Protection**. 

    On the initial **Azure Information Protection** blade, select **Add a new policy**. You'll then see the second blade that used to show the global policy refresh, so that you can now configure your new, scoped policy.

3. Specify a policy name and description that only administrators see in the Azure portal. The name must be unique to your tenant. Then click **Specify which users/groups get this policy** and in the subsequent blades, you can search and select the users and groups for this policy. The labels and settings that you configure in this scoped policy will be applied to these users only.

4. Now create new labels or configure the scoped policy settings. The global policy is always applied first, so you can supplement the global policy with new labels and you can override the global settings. For example, the global policy might have no default label specified and you configure a different default label in different scoped policies for specific departments.

    If you need help configuring the labels or settings, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.

5. Just as when you edit the global policy, when you make any changes on an Azure Information Protection blade, click **Save** to save the changes, or click **Discard** to revert to the last saved settings. 

6. When you have finished making the changes that you want for this scoped policy, on the initial **Azure Information Protection** blade, make sure that this scoped policy is in the order that you want it applied. This is important when you have selected the same user for multiple scoped policies. Then click **Publish**. 

The Azure Information Protection client checks for any changes whenever a supported Office application starts or File Explorer is opened. The client downloads any changes to the global policy or scoped policies that apply to that user.

> [!TIP]
> After you have saved your scoped policy, you can use the **Cross Policy Editor** on the initial **Azure Information Protection** blade, to view and reconfigure all the labels from your Azure Information Protection policy. This method provides an easy way to compare labels from multiple policies (your global policy and all scoped policies). However, this editor doesn't let you add or reorder labels, or view or configure the policy settings.

## Next steps

For an example of how to customize the default policy, and see the resulting behavior in an Office application, try the [Quick start tutorial for Azure Information Protection](../get-started/infoprotect-quick-start-tutorial.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
