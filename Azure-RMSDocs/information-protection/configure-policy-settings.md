---
# required metadata

title: How to configure the global policy settings for Azure Information Protection | Azure Rights Management
description:
author: cabailey
manager: mbaldwin
ms.date: 07/25/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 629815c0-457d-4697-a4cc-df0e6cc0c1a6

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to configure the global policy settings for Azure Information Protection

*Applies to: Azure Information Protection preview*

There are 3 settings in the Azure Information Protection policy that apply to all users, all devices:

![Azure Information Protection policy global settings](../media/info-protect-policy-settings.png)


To configure these settings:

1. Make sure that you are signed in to the Azure portal by using this special link for Azure Information Protection: https://portal.azure.com/?microsoft_azure_informationprotection=true
 
2. On the hub menu, click **Browse** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

3. On the **Azure Information Protection** blade, configure these global settings:

    - **All documents and emails must have a label**: When you set this option to **On**, all saved documents and sent emails must have a label applied. The labeling might be manually assigned by a user, automatically as a result of a [condition](configure-policy-classification.md), or be assigned by default (by setting the **Select the default label** option). 

    If a label is not assigned when a user saves a document or sends an email, they are prompted to select a label:

    ![Azure Information Protection prompt if new classification is lower](../media/info-protect-enforce-label.png)

    - **Select the default label**: When you set this option, select the label to assign to documents and emails that do not have a label. You cannot set a label as the default if it has sub-labels. 

    - **Users must provide justification when lowering the sensitivity level**: When you set this option to **On** and a user changes the label of an existing document or email to a label that has a lower sensitivity level (for example, from **Secret** to **Public**), the user is prompted to provide an explanation for this action. For example, the user might explain that the document no longer contains sensitive information. The action and their justification reason is logged in their local Windows event log: **Application** > **Microsoft Azure Information Protection**.  

    ![Azure Information Protection prompt if new classification is lower](../media/info-protect-lower-justification.png)

    This option is not applicable for sub-labels.

4. To save your changes, click **Save**.

5. To make your changes available to users, click **Publish**.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organization-s-policy) section.  









