---
# required metadata

title: How to configure a label to apply Rights Management protection | Azure Information Protection
description: You can protect your most sensitive documents and emails by using a Rights Management service, which uses encryption, identity, and authorization policies to help prevent data loss. This protection is applied when you configure a label to use a Rights Management template. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/16/2017
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

2. If the label that you want to configure will apply to all users, select **Global** from the **Azure Information Protection** blade. However, if the label that you want to configure is in a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, select that scoped policy instead.

3. On the **Policy** blade, select the label that you configure, which opens the **Label** blade. 

4. On the **Label** blade, locate **Set permissions for documents and emails containing this label**, select **Protect** to apply protection, or select **Remove Protection** to remove protection that might be applied to an email or document:

    - If you selected **Protect**, go to step x.
    - If you selected **Remove Protection**, go to step x.

5. If you selected **Protect**, now click the **Protection** bar to open the **Permissions** blade.

6. On the **Permissions** blade, select **Azure RMS** or **HYOK (AD RMS)**. 
    
    In most cases, you will select **Azure RMS** for your permission settings. Do not select **HYOK (AD RMS)** unless you have read and understood the prerequisites and restrictions that accompany this "*hold your own key*" (HYOK) configuration. For more information, see [Hold your own key (HYOK) requirements and restrictions for AD RMS protection](configure-adrms-restrictions.md).
    
7. Select either **Do not forward** if you want to set this Outlook option for emails, or **Select template**. 
    
8. If you selected **Select template** for **Azure RMS**, click the drop down box and select the [template](../deploy-use/configure-custom-templates.md) that you want to use to protect documents and emails with this label.
    
    More information about the templates:
    
    - If you select a **departmental template** or if you have configured [onboarding controls](../deploy-use/activate-service.md#configuring-onboarding-controls-for-a-phased-deployment):
    
        - Users who are outside the configured scope of the template or who are excluded from applying Azure Rights Management protection will still see the label but cannot apply it. If they select the label, they see the following message: **Azure Information Protection cannot apply this label. If this problem persists, contact your administrator.**
        
            Note that all templates are always shown, even if you are configuring a scoped policy. For example, you are configuring a scoped policy for the Marketing group. The Azure RMS templates that you can select will not be restricted to templates that are scoped to the Marketing group and it's possible to select a departmental template that your selected users cannot use. For ease of configuration and to minimize troubleshooting, consider naming the departmental template to match the label in your scoped policy. 
            
9. If you selected **Select template** for **HYOK (AD RMS)**: Provide the template GUID and licensing URL of your AD RMS cluster. [More information](configure-adrms-restrictions.md#locating-the-information-to-specify-ad-rms-protection-with-an-azure-information-protection-label)

10. Click **Done** to close the **Permissions** blade and see your choice of **Do not forward** or your chosen template display on the **Protection** bar in the **Label** blade.

11. If you selected **Remove Protection**, note the following:
    
    - Users must have permissions to remove Rights Management protection to apply a label that has this option. This option requires them to have the **Export** (for Office documents) or **Full Control** [usage right](../deploy-use/configure-usage-rights.md), or be the Rights Management owner (automatically grants the Full Control usage right), or be a [super user for Azure Rights Management](../deploy-use/configure-super-users.md). The default rights management templates do not include the usage rights that lets users remove protection. 
    
        If users do not have permissions to remove Rights Management protection and select this label with the **Remove Protection** option, they see the following message: **Azure Information Protection cannot apply this label. If this problem persists, contact your administrator.**

6. On the **Label** blade, click **Save**.

7. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  

[!INCLUDE[Commenting house rules](../includes/houserules.md)]