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

You can protect your most sensitive documents and emails by using a Rights Management service, which uses encryption, identity, and authorization policies to help prevent data loss. This  protection is applied when you configure a label to use a Rights Management template. 

This template can be one of the default templates that are automatically created when you activate Azure Rights Management, or a custom template. Azure Rights Management departmental templates are supported but apply the protection only when the document or email author is within the configured scope of the template. If the user is not within the scope, they see a message that Azure Information Protection cannot apply the label.

## How the protection works

When a document or email is protected by Rights Management, it is encrypted at rest and in transit and can only be decrypted by authorized users. This encryption stays with the document or email, even if it is renamed. In addition, you can configure usage rights and restrictions, such as the following examples:

- Only users within your organization can open the company-confidential document or email.

- Only users in the marketing department can edit and print the promotion announcement document or email while all other users in your organization can only read the document or email.

- Users cannot forward an email that contains news about an internal reorganization.

- The current price list that is sent to business partners cannot be opened after a specified date.

For more information about Azure Rights Management templates and how to configure these usage rights and restrictions, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

For more information about Azure Rights Management and how it works, see [What is Azure Rights Management?](../understand-explore/what-is-azure-rms.md)

> [!IMPORTANT]
> To configure a label to apply Azure Rights Management protection, the Azure Rights Management service must be activated for your organization. If you have not yet done this, see [Activating Azure Rights Management](../deploy-use/activate-service.md).


## To configure a label to apply Rights Management protection

1. Sign in to the [Azure portal](https://portal.azure.com).
 
2. On the hub menu, click **Browse** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

3. On the **Azure Information Protection** blade, select the label that you want to configure to apply Rights Management protection.

4. On the **Label** blade, in the **Set RMS template for protecting documents and emails containing this label** section, for **Select RMS template from**, select **Azure RMS** or **AD RMS (PREVIEW)**.
    
    Typically, you will select **Azure RMS** and select AD RMS only when you must protect documents and emails with a key that is hosted on-premises. For example, this might be required for specific types of documents, for regulatory reasons. This configuration is sometimes referred to as "hold your own key" (HYOK) and requires you to have a working Active Directory Rights Management Services (AD RMS) deployment that has a single AD RMS root cluster that is configured for rights policy templates, and users are configured for single sign-on. Office 2010 is not support for this hold your own key scenario.
    
    For documentation about AD RMS prerequisites and deployment information, see [Active Directory Rights Management Services](https://technet.microsoft.com/library/hh831364.aspx) in the Windows Server library. For more information about this hold your own key feature with Azure Information Protection, see the blog post [Azure Information Protection with HYOK (Hold Your Own Key)](https://blogs.technet.microsoft.com/enterprisemobility/).
    
5. If you selected Azure RMS: For **Select RMS template**, click the drop down box and select the template that you want to use to protect documents and emails with this label.

    > [!NOTE] 
    > If you create a new template after you open the **Label** blade, close this blade and return to step 3, so that your newly created template is retrieved from Azure for you to select.
    
6. If you selected AD RMS: Provide the template GUID and licensing URL of your AD RMS cluster.
    
    You can find both these values from the Active Directory Rights Management Sevices console:
    
    - To locate the template GUID: Expand the cluster and click **Rights Policy Templates**. From the **Distributed Rights Policy Templates** information, you can then copy the GUID from the template you want to use. For example: 82bf3474-6efe-4fa1-8827-d1bd93339119
    
    - To locate the licensing URL: Click the cluster name. From the **Cluster Details** information, copy the value for the **Intranet cluster URL**, minus the **/_wmcs/licensing** string. For example: https://rmscluster.contoso.com 

    > [!IMPORTANT] 
    > To succesfully apply an AD RMS template, make sure that the Azure Information Protection client is version **233** or later and that the Office version is at least Office 2013.
    > 
    >There are some important limitations that apply to documents and emails that are protected by AD RMS. For example, many Office 365 services and features will not be able to support this protected data. These limitations are listed and explained in the blog post [Azure Information Protection with HYOK (Hold Your Own Key)](https://blogs.technet.microsoft.com/enterprisemobility/).

5. Click **Save**.

6. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organization-s-policy) section.  
