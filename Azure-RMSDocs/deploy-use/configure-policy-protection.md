---
# required metadata

title: How to configure a label to apply Rights Management protection | Azure Information Protection
description: You can protect your most sensitive documents and emails by using a Rights Management service, which uses encryption, identity, and authorization policies to help prevent data loss. This protection is applied when you configure a label to use a Rights Management template. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/07/2016
ms.topic: article
ms.prod:
ms.service: information-protection
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

>*Applies to: Azure Information Protection*

You can protect your most sensitive documents and emails by using a Rights Management service, which uses encryption, identity, and authorization policies to help prevent data loss. This  protection is applied when you configure a label to use a Rights Management template. 

This template can be one of the default templates that are automatically created when you activate Azure Rights Management, or a custom template. Azure Rights Management departmental templates are supported but apply the protection only when the document or email author is within the configured scope of the template. If the user is not within the scope, they see a message that Azure Information Protection cannot apply the label.

## How the protection works

When a document or email is protected by Rights Management, it is encrypted at rest and in transit and can only be decrypted by authorized users. This encryption stays with the document or email, even if it is renamed. In addition, you can configure usage rights and restrictions, such as the following examples:

- Only users within your organization can open the company-confidential document or email.

- Only users in the marketing department can edit and print the promotion announcement document or email while all other users in your organization can only read the document or email.

- Users cannot forward an email that contains news about an internal reorganization.

- The current price list that is sent to business partners cannot be opened after a specified date.

For more information about Azure Rights Management templates and how to configure these usage rights and restrictions, see [Configuring custom templates for the Azure Rights Management service](../deploy-use/configure-custom-templates.md).

For more information about Azure Rights Management and how it works, see [What is Azure Rights Management?](../understand-explore/what-is-azure-rms.md)

> [!IMPORTANT]
> To configure a label to apply Azure Rights Management protection, the Azure Rights Management service must be activated for your organization. If you have not yet done this, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

Exchange does not have to be configured for information rights management (IRM) before users can apply labels in Outlook to protect their emails. However, until Exchange is configured for IRM, you will not get the full functionality of using Azure Rights Management protection with Exchange. For example, users will not be able to view protected emails on mobile phones or with Outlook Web Access, protected emails cannot be indexed for search, and you will not be able to configure Exchange Online DLP for rights management protection. To configure Exchange to support these additional scenarios, see the following resources:

- For Exchange Online, see the instructions for [Exchange Online: IRM Configuration](../deploy-use/configure-office365.md#exchange-online-irm-configuration).

- For Exchange on-premises, you must deploy the [RMS connector and configure your Exchange servers](../deploy-use/deploy-rms-connector.md). 


## To configure a label to apply Rights Management protection

1. If you haven't already done so, open a new browser window and sign in to the [Azure portal](https://portal.azure.com) as a global admin, and then navigate to the **Azure Information Protection** blade. 

    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. If the label that you want to configure will apply to all users, select the label to change from the **Policy:Global** blade. 

     If the label that you want to configure is in a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, first select that scoped policy from the initial **Azure Information Protection** blade.

3. On the **Label** blade, in the **Set RMS template for protecting documents and emails containing this label** section, for **Select RMS template from**, select **Azure RMS** or **AD RMS**.
    
    In most cases, you will select **Azure RMS**. Do not select AD RMS unless you have read and understood the prerequisites and restrictions that accompany this configuration, which is sometimes referred to as "*hold your own key*" (HYOK). For more information, see [Hold your own key (HYOK) requirements and restrictions for AD RMS protection](configure-adrms-restrictions.md).
    
4. If you selected Azure RMS: For **Select RMS template**, click the drop down box and select the [template](../deploy-use/configure-custom-templates.md) or rights management option that you want to use to protect documents and emails with this label.
    
    More information about the options:
    
    - Have you created a new template after you opened the **Label** blade? Close this blade and return to step 2, so that your newly created template is retrieved from Azure for you to select.
    
    - If you select a **departmental template** or if you have configured [onboarding controls](../deploy-use/activate-service.md#configuring-onboarding-controls-for-a-phased-deployment):
    
        - Users who are outside the configured scope of the template or who are excluded from applying Azure Rights Management protection will still see the label but cannot apply it. If they select the label, they see the following message: **Azure Information Protection cannot apply this label. If this problem persists, contact your administrator.**
        
            Note that all templates are always shown, even if you are configuring a scoped policy. For example, you are configuring a scoped policy for the Marketing group. The Azure RMS templates that you can select will not be restricted to templates that are scoped to the Marketing group and it's possible to select a departmental template that your selected users cannot use. For ease of configuration and to minimize troubleshooting, consider naming the departmental template to match the label in your scoped policy. 
            
    - If you select **Remove Protection**:
        
        - Users must have permissions to remove Rights Management protection to apply a label that has this option. This option requires them to have the **Export** (for Office documents) or **Full Control** [usage right](../deploy-use/configure-usage-rights.md), or be the Rights Management owner (automatically grants the Full Control usage right), or be a [super user for Azure Rights Management](../deploy-use/configure-super-users.md). The default rights management templates do not include the usage rights that lets users remove protection. 

            If users do not have permissions to remove Rights Management protection and select this label with the **Remove Protection** option, they see the following message: **Azure Information Protection cannot apply this label. If this problem persists, contact your administrator.**

5. If you selected AD RMS: Provide the template GUID and licensing URL of your AD RMS cluster. [More information](configure-adrms-restrictions.md#locating-the-information-to-specify-ad-rms-protection-with-an-azure-information-protection-label)

6. Click **Save**.

7. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  
