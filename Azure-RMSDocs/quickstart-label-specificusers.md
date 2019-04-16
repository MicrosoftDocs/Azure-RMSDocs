---
title: Quickstart - Create a new Azure Information Protection label for specific users - AIP
description: Create and configure a new label that classifies documents & emails for specific users by using a scoped policy.
author: cabailey
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 04/17/2019
ms.topic: quickstart
ms.collection: M365-security-compliance
ms.service: information-protection


# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: demizets
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:
#Customer intent: As an administrator, I want to create a new label for specific users only.
---

# Quickstart: Create a new Azure Information Protection label for specific users

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

In this quickstart, you'll create a new label that only specific users can see and apply to classify and protect their documents and emails.

This configuration uses a scoped policy.

You can finish this configuration in less than 10 minutes.

## Prerequisites

To complete this quickstart, you need:

1. A subscription that includes Azure Information Protection Plan 1 or Plan 2.
    
    If you don't have one of these subscriptions, you can create a [free](https://admin.microsoft.com/Signup/Signup.aspx?OfferId=87dd2714-d452-48a0-a809-d2f58c4f68b7) account for your organization.

2. You've added the Azure Information Protection blade to the Azure portal, and confirmed that the protection service is activated.

    If you need help with these actions, see [Quickstart: Get started in the Azure portal](quickstart-viewpolicy.md).

3. An emailed-enabled group in Azure AD that contains the users who will see and apply the new label.
    
    If you don't have a suitable group, create one named **Sales Team** and add at least one user.

4. To test the new label: The Azure Information Protection client must be installed on computers for users. 
    
    To try the label for yourself, you can install the client by going to the [Microsoft download center](https://www.microsoft.com/en-us/download/details.aspx?id=53018) and download **AzInfoProtection.exe** from the Azure Information Protection page.

For a full list of prerequisites to use Azure Information Protection, see [Requirements for Azure Information Protection](requirements.md).
    
## Create a new label

First, create your new label.

1. If you haven't already done so, open a new browser window and sign in to the [Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** blade.
    
    For example, on the hub menu, click **All services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.
    
    If you are not the global admin, use the following link for alternative roles: [Signing in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal)

2. From the **Classifications** > **Labels** menu option: On the **Azure Information Protection - Labels** blade, click **Add a new label**.

3. On the **Label** blade, specify at least the following:
    
    - **Label display name**: A name for the new label that users will see, and that identifies the classification for the content. For example: `Sales - Restricted`.
    
    - **Description**: A tooltip to help users identify when to select this new label. For example: `Business data that is restricted to the Sales Team.`

4. Make sure that **Enabled** is set to **On** (the default), and select **Save**.

## Add the label to a new scoped policy

Now, add your newly created label to a new scoped policy.

1. From the **Classifications** > **Policies** menu option: On the **Azure Information Protection - Policies** blade, select **Add a new policy**. 

2. On the **Policy** blade, for the **Policy name** box, enter a name that identifies the group of users who will see your new created label. For example, `Sales`.

3. Select the option **Select which users or groups get this policy**.

4. On the **AAD users and Groups** blade, select **Users/Groups**. Then on the new **Users/Groups** blade, search for and select the group that you identified in the prerequisites. For example, **Sales Team**. Click **Select** on that blade, and then **OK**.

5. Back on the **Policy** blade, select **Add or remove labels**.

6. On the **Policy: Add or remove labels** blade, select the label that you created, for example, **Sales - Restricted**, and then select **OK**.

7. Back on the **Policy** blade, select **Save**. 

Your new label is now published just to the members of the group that you specified. 

## Test your new label

To test this label, you need a minimum of two computers because the Azure Information Protection client does not support multiple users on the same computer:

 - On your first computer, sign in as a member of the Sales Team group. Open Word and confirm that you can see the new label. If Word is already open, restart it to force a policy refresh.

- On your second computer, sign in as a user who isn't a member of the Sales Team group. Open Word and confirm that you can't see the new label. As before, if Word is already open, restart it.

## Clean up resources

Do the following if you do not want to keep this label and scoped policy:

1. From the **Classifications** > **Policies** menu option: On the **Azure Information Protection - Policies** blade, select the context menu (**...**) for the scoped policy you just created. For example, **Sales**.

2. Select **Delete policy** and if you're asked to confirm, select **OK**.

3. From the **Classifications** > **Label** menu option: On the **Azure Information Protection - Label** blade, select the context menu (**...**) for the label you just created.  For example, **Sales - Restricted**.

4.  Select **Delete this label** and if you're asked to confirm, select **OK**.


## Next steps

This quickstart includes the minimum options so that you can quickly create a new label for specific users. For full instructions, see the following articles:

- [How to create a new label](configure-policy-new-label.md)

- [How to configure the policy for specific users by using scoped policies](configure-policy-scope.md)

In addition, if you want the label to protect the content such that only members of the Sales Team could open it, you will need to configure the label to apply protection. For instructions, see [How to configure a label for Rights Management protection](configure-policy-protection.md).

