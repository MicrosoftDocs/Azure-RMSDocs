---
# required metadata

title: Configure scoped policies for Azure Information Protection - AIP
description: To configure different settings and labels for specific users, you must configure a scoped policy for Azure Information Protection. 
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 07/23/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 4b134785-0353-4109-8fa7-096d1caa2242

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: aiplabels
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to configure the Azure Information Protection policy for specific users by using scoped policies

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

When the Azure Information Protection policy downloads to computers that have installed the [Azure Information Protection client](https://www.microsoft.com/en-us/download/details.aspx?id=53018), all users get the settings and labels from the default policy or the changes that you configured for the global policy. If you want to supplement this configuration for specific users, by having different settings and labels, you must create a **scoped policy** that's configured for those users.

## How scoped policies work

For applications that support the Azure Information Protection client, all users receive the global policy, which contains the Information Protection bar title and tooltip, global settings, and global labels. If you have configured scoped policies for specific users, those users then receive those additional settings and labels. 

Note that in addition to the Office desktop applications that support the Azure Information Protection client, labels are also supported with PowerShell, and the Azure Information Protection scanner. This means that you can create and configure scoped policies for accounts that run PowerShell commands, or the scanner. 

Scoped policies, just like labels, are ordered in the Azure portal. If a user is configured for multiple scopes, an effective policy is computed for that user before it is downloaded. According to the order of the policies, the last policy setting is applied. The labels that the user sees are from the global policy and any additional labels from scoped policies that the user belongs to.

The exception is when a user from your tenant opens a labeled document or email and that user is not in the label's scope. In this scenario, the user sees the name of the label set but the label isn't displayed as available to select.  

Because a scoped policy always inherits the labels and settings and from the global policy, the labels from the global policy are displayed when you create or edit a scoped policy. However, you cannot edit the labels from the global policy when you edit a scoped policy. You can however, add sublabels to these inherited labels.

For example, if you have a label named **Confidential** in the global policy, all users see this label. You cannot remove or reorder it with a scoped policy. But you might want to create a scoped policy for the Marketing department that adds a new sublabel to Confidential, so that these users see **Confidential \ Promotions**. You also create another scoped policy for the Sales department that adds a new sublabel to Confidential, so that these users see **Confidential \ Partners**. Each sublabel can then be configured for different settings and the sublabel is visible only to the users in the respective departments.

## Configure a scoped policy

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** blade.

    For example, on the hub menu, click **All services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. From the **Classifications** > **Policies** menu option: On the **Azure Information Protection - Policies** blade, select **Add a new policy**. You then see the **Policy** blade that displays your existing global policy, where you can now configure your new, scoped policy.

3. Specify a policy name and description that only administrators see in the Azure portal. The name must be unique to your tenant. Then select **Specify which users/groups get this policy**, and in the subsequent blades, you can search and select the users and groups for this policy. The labels and settings that you configure in this scoped policy will be applied to these users only.
    
    For performance reasons, group membership for scoped policies is [cached](prepare.md#group-membership-caching-by-azure-information-protection).

4. Now add new labels or configure the scoped policy settings. The global policy is always applied first, so you can supplement the global policy with new labels and you can override the global settings. For example, the global policy might have no default label specified and you configure a different default label in different scoped policies for specific departments.

    If you need help with configuring the labels or settings, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.

6. Just as when you edit the global policy, when you make any changes on an Azure Information Protection blade, click **Save** to save the changes, or click **Discard** to revert to the last saved settings. 

7. When you have finished making the changes that you want for this scoped policy, on the initial **Azure Information Protection - Policies** blade, make sure that this scoped policy is in the order that you want it applied. This is important when you have selected the same user for multiple scoped policies. To change the order, select the context menu (**...**) and select **Move up** or **Move down**. 

The Azure Information Protection client checks for any changes whenever a supported Office application starts or File Explorer is opened. The client downloads any changes to the global policy or scoped policies that apply to that user.

## Next steps

For an example of how to customize the default policy, and see the resulting behavior in an Office application, try the [Edit the policy and create a new label](infoprotect-quick-start-tutorial.md) tutorial.
