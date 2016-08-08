---
# required metadata

title: How to configure a label to apply Rights Management protection | Azure Rights Management
description:
author: cabailey
manager: mbaldwin
ms.date: 08/08/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: df26430b-315a-4012-93b5-8f5f42e049cc

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to configure a label to apply Rights Management protection

>*Applies to: Azure Information Protection preview*

**[ This information is preliminary and subject to change. ]**

You can protect your most sensitive documents and emails by using Azure Rights Management, which uses encryption, identity, and authorization policies to help prevent data loss. This  protection is applied when you configure a label to use a Rights Management template. 

This template can be one of the default templates that are automatically created when you activate Azure Rights Management, or a custom template. Departmental templates are supported but apply the protection only when the document or email author is within the configured scope of the template. If the user is not within the scope, they see a message that Azure Information Protection cannot apply the label.

## How the protection works

When a document or email is protected by Azure Rights Management, it is encrypted at rest and in transit and can only be decrypted by authorized users. This encryption stays with the document or email, even if it is renamed. In addition, you can configure usage rights and restrictions, such as the following examples:

- Only users within your organization can open the company-confidential document or email.

- Only users in the marketing department can edit and print the promotion announcement document or email while all other users in your organization can only read the document or email.

- Users cannot forward an email that contains news about an internal reorganization.

- The current price list that is sent to business partners cannot be opened after a specified date.

For more information about Azure Rights Management templates and how to configure these usage rights and restrictions, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

For more information about Azure Rights Management and how it works, see [What is Azure Rights Management?](../understand-explore/what-is-azure-rms.md)

> [!IMPORTANT]
> To configure a label to apply Rights Management protection, the Azure Rights Management service must be activated for your organization. If you have not yet done this, see [Activating Azure Rights Management](../deploy-use/activate-service.md).


## To configure a label to apply Rights Management protection

1. Sign in to the [Azure portal](https://portal.azure.com) as a global admin so that you can retrieve the Azure Rights Management templates.
 
2. Navigate to the **Azure Information Protection** blade: For example, on the hub menu, click **Browse** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

3. On the **Azure Information Protection** blade, select the label that you want to configure to apply Rights Management protection.

4. On the **Label** blade, in the **Set RMS template for protecting documents and emails containing this label** section, configure the following:

    - If you see **Select RMS template from**: Select **Azure RMS**. 
    
        Do not select **AD RMS** and the associated configuration options without assistance from Microsoft. If you are interested in testing Azure Information Protection with Active Directory Rights Management Services, send an email to askipteam@microsoft.com. 
    
    - For **Select RMS template**: Click the drop down box and select the template that you want to use to protect documents and emails with this label.

        > [!NOTE] 
        > If you create a new template after you open the **Label** blade, close this blade and return to step 3, so that your newly created template is retrieved from Azure for you to select.

5. Click **Save**.

6. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organization-s-policy) section.  
