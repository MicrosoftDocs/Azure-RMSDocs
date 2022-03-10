---
# required metadata

title: Configure scoped policies for Azure Information Protection - AIP
description: To configure different settings and labels for specific users, you must configure a scoped policy for Azure Information Protection. 
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 08/17/2020
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 4b134785-0353-4109-8fa7-096d1caa2242
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.subservice: aiplabels
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# How to configure the Azure Information Protection policy for specific users by using scoped policies

>***Applies to**: Azure Information Protection*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) from the Microsoft 365 documentation.*

[!INCLUDE [AIP classic client is sunset - extended support customers](includes/classic-client-sunset-extended-support.md)]

When the Azure Information Protection policy downloads to computers that have installed the Azure Information Protection client, all users get the settings and labels from the default policy or the changes that you configured for the global policy. If you want to supplement this configuration for specific users, by having different settings and labels, you must create a **scoped policy** that's configured for those users.

## How scoped policies work

For applications that support the Azure Information Protection client, all users receive the global policy, which contains the Information Protection bar title and tooltip, global settings, and global labels. If you have configured scoped policies for specific users, those users then receive those additional settings and labels. 

Note that in addition to the Office desktop applications that support the Azure Information Protection client, labels are also supported with PowerShell, and the Azure Information Protection scanner. This means that you can create and configure scoped policies for accounts that run PowerShell commands, or the scanner. 

Scoped policies, just like labels, are ordered in the Azure portal. If a user is configured for multiple scopes, an effective policy is computed for that user before it is downloaded. According to the order of the policies, the last policy setting is applied. The labels that the user sees are from the global policy and any additional labels from scoped policies that the user belongs to.

The exception is when a user from your tenant opens a labeled document or email and that user is not in the label's scope. In this scenario, the user sees the name of the label set but the label isn't displayed as available to select.  

Because a scoped policy always inherits the labels and settings and from the global policy, the labels from the global policy are displayed when you create or edit a scoped policy. However, you cannot edit the labels from the global policy when you edit a scoped policy. You can however, add sublabels to these inherited labels.

For example, if you have a label named **Confidential** in the global policy, all users see this label. You cannot remove or reorder it with a scoped policy. But you might want to create a scoped policy for the Marketing department that adds a new sublabel to Confidential, so that these users see **Confidential \ Promotions**. You also create another scoped policy for the Sales department that adds a new sublabel to Confidential, so that these users see **Confidential \ Partners**. Each sublabel can then be configured for different settings and the sublabel is visible only to the users in the respective departments.

## Configure a scoped policy

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** pane.

    For example, in the search box for resources, services, and docs: Start typing **Information** and select **Azure Information Protection**.

2. From the **Classifications** > **Policies** menu option: On the **Azure Information Protection - Policies** pane, select **Add a new policy**. You then see the **Policy** pane that displays your existing global policy, where you can now configure your new, scoped policy.

3. Specify a policy name and description that only administrators see in the Azure portal. The name must be unique to your tenant. Then select **Specify which users/groups get this policy**, and in the subsequent panes, you can search and select the users and groups for this policy. The labels and settings that you configure in this scoped policy will be applied to these users only.
    
    For performance reasons, group membership for scoped policies is [cached](prepare.md#group-membership-caching-by-azure-information-protection).

    > [!NOTE]
    > Select up to 200 users or groups. If more than 200 users are needed to get the scoped policy, create a new group, add relevant users to the group, and then set the policy scope to the new group. 

4. Now add new labels or configure the scoped policy settings. The global policy is always applied first, so you can supplement the global policy with new labels and you can override the global settings. For example, the global policy might have no default label specified and you configure a different default label in different scoped policies for specific departments.

    If you need help with configuring the labels or settings, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.

6. Just as when you edit the global policy, when you make any changes on an Azure Information Protection pane, click **Save** to save the changes, or click **Discard** to revert to the last saved settings. 

7. When you have finished making the changes that you want for this scoped policy, on the initial **Azure Information Protection - Policies** pane, make sure that this scoped policy is in the order that you want it applied. This is important when you have selected the same user for multiple scoped policies. To change the order, select the context menu (**...**) and select **Move up** or **Move down**. 

The Azure Information Protection client checks for any changes whenever a supported Office application starts or File Explorer is opened. The client downloads any changes to the global policy or scoped policies that apply to that user.

## Next steps

For an example of how to customize the default policy, and see the resulting behavior in an Office application, try the [Edit the policy and create a new label](infoprotect-quick-start-tutorial.md) tutorial.
