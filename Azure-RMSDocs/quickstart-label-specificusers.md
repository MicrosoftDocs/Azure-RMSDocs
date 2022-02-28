---
title: Quickstart - New Azure Information Protection label for specific users - AIP
description: Create & configure a new label that classifies documents & emails for a subset of users by using a scoped policy.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 07/19/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.subservice: aiplabels
#ms.reviewer: demizets
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
#Customer intent: As an administrator, I want to create a new Azure Information Protection label for specific users only.
---

# Quickstart: Create a new Azure Information Protection label for specific users

>***Applies to**: Azure Information Protection*
>
> ***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

[!INCLUDE [AIP classic client is sunset - extended support customers](includes/classic-client-sunset-extended-support.md)]

In this quickstart, you'll create a new Azure Information Protection label that only specific users can see and apply to classify and protect their documents and emails.

This configuration uses a scoped policy.

**Time required**: You can finish this configuration in less than 10 minutes.

## Prerequisites

To complete this quickstart, you need:

|Requirement  |Description  |
|---------|---------|
|**A supporting subscription**     |  You'll need a subscription that includes Azure Information Protection.       |
|**AIP added to the Azure portal**    |  You've added the Azure Information Protection pane to the Azure portal, and confirmed that the protection service is activated. </br></br>For more information, see [Quickstart: Get started in the Azure portal](quickstart-viewpolicy.md).       |
|**An emailed-enabled group in Azure AD**     | You'll need an emailed-enabled group in Azure AD that contains the users who will see and apply the new label. </br></br>If you don't have a suitable group, create one named **Sales Team** and add at least one user. |
|**Classic client installed**    |   To test the new label, you'll need the classic client installed on your computer. </br></br>The Azure Information Protection classic client is being sunset in March  2021. To deploy the AIP classic client, open a support ticket to get download access.  |
| | |

For a full list of prerequisites to use Azure Information Protection, see [Requirements for Azure Information Protection](requirements.md).

## Create a new label

First, create your new label.

1. If you haven't already done so, open a new browser window and sign in to the [Azure portal](https://portal.azure.com). Then navigate to the **Azure Information Protection** pane.

    For example, in the search box for resources, services, and docs, start typing **Information** and select **Azure Information Protection**.

    If you are not the global admin, use the following link for alternative roles: [Signing in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal)

1. Under **Classifications**, select **Labels**, and then click **+ Add a new label**.

1. On the **Label** pane, specify at least the following fields:

    |Field  |Description  |
    |---------|---------|
    |**Label display name**     |    A name for the new label that users will see, and that identifies the classification for the content. </br>For example: **Sales - Restricted**    |
    |**Description**     |   A tooltip to help users identify when to select this new label. </br> For example: **Business data that is restricted to the Sales Team.**     |
    | | | 

1. Make sure that **Enabled** is set to **On** (the default), and select  **Save** ![Save](media/qs-tutor/save-icon.png "Save").

    Select the **X** at the top-right to close the **New label** pane.

## Add the label to a new scoped policy

Now, add your newly created label to a new scoped policy.

1. At the left again, under **Classifications**, select **Policies**, and then click **Add a new policy**.

1. In the **Policy name** field, enter a meaningful value that describes the users who will see your new label.

    For example, **Sales**.

1. Select the **Select which users or groups get this policy** row to open the **AAD Users and Groups** pane.

1. On the **AAD users and Groups** pane, search for and select the group that you identified in the prerequisites, such as **Sales Team**.

    Click **Select** to close the pane.

1. Back on the **Policy** pane, under **Label display name**, click **Add or remove labels**.

1. On the **Policy: Add or remove labels** pane, select the label that you created, for example, **Sales - Restricted**, and then select **OK**.

1. Back on the **Policy** pane, select  **Save** ![Save](media/qs-tutor/save-icon.png "Save").

Your new label is now published just to the members of the group that you specified.

## Test your new label

To test this label, you need a minimum of two computers because the Azure Information Protection client does not support multiple users on the same computer:

- **On your first computer**, sign in as a member of the Sales Team group. Open Word and confirm that you can see the new label. If Word is already open, restart it to force a policy refresh.

- **On your second computer**, sign in as a user who *isn't* a member of the Sales Team group. Open Word and confirm that you can't see the new label. As before, if Word is already open, restart it.

## Clean up resources

Do the following if you do not want to keep this label and scoped policy:

1. From the **Classifications** > **Policies** area: On the **Azure Information Protection - Policies** pane, select the context menu (**...**) for the scoped policy you've created. For example, **Sales**.

1. Select **Delete policy** and if you're asked to confirm, select **OK**.

1. From the **Classifications** > **Label** area: On the **Azure Information Protection - Label** pane, select the context menu (**...**) for the label you've created.  For example, **Sales - Restricted**.

1. Select **Delete this label** and if you're asked to confirm, select **OK**.

## Next steps

This quickstart includes the minimum options so that you can quickly create a new label for specific users, using the classic client. For full instructions, see the following articles:

- [How to create a new label](configure-policy-new-label.md)

- [How to configure the policy for specific users by using scoped policies](configure-policy-scope.md)

In addition, if you want the label to protect the content such that only members of the Sales Team could open it, you will need to configure the label to apply protection. For instructions, see [How to configure a label for Rights Management protection](configure-policy-protection.md).
