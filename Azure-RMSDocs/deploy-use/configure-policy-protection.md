---
# required metadata

title: Configure an Azure Information Protection label for protection
description: You can protect your most sensitive documents and emails when you configure a label to use Rights Management protection. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 09/18/2017
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

# How to configure a label for Rights Management protection

>*Applies to: Azure Information Protection*

You can protect your most sensitive documents and emails by using a Rights Management service. This service uses encryption, identity, and authorization policies to help prevent data loss. The protection is applied with a label that is configured to use Rights Management protection for documents and emails, and users can also select the **Do not forward** button in Outlook. 

## How the protection works

When a document or email is protected by Rights Management, it is encrypted at rest and in transit. It can then be decrypted only by authorized users. This encryption stays with the document or email, even if it is renamed. In addition, you can configure usage rights and restrictions, such as the following examples:

- Only users within your organization can open the company-confidential document or email.

- Only users in the marketing department can edit and print the promotion announcement document or email, while all other users in your organization can only read this document or email.

- Users cannot forward an email or copy information from it that contains news about an internal reorganization.

- The current price list that is sent to business partners cannot be opened after a specified date.

For more information about the Azure Rights Management protection and how it works, see [What is Azure Rights Management?](../understand-explore/what-is-azure-rms.md)

> [!IMPORTANT]
> To configure a label to apply this protection, the Azure Rights Management service must be activated for your organization. If you have not yet done this, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

When the label applies protection, a protected document is not suitable to be saved on SharePoint or OneDrive. These locations do not support the following for protected files: Co-authoring, Office Online, search, document preview, thumbnail, eDiscovery, and data loss prevention (DLP). 

Exchange does not have to be configured for Information Rights Management (IRM) before users can apply labels in Outlook to protect their emails. However, until Exchange is configured for IRM, you will not get the full functionality of using Azure Rights Management protection with Exchange. For example, users will not be able to view protected emails on mobile phones or with Outlook on the web, protected emails cannot be indexed for search, and you will not be able to configure Exchange Online DLP for Rights Management protection. To configure Exchange to support these additional scenarios, see the following resources:

- For Exchange Online, see the instructions for [Exchange Online: IRM Configuration](../deploy-use/configure-office365.md#exchange-online-irm-configuration).

- For Exchange on-premises, you must deploy the [RMS connector and configure your Exchange servers](../deploy-use/deploy-rms-connector.md). 

## To configure a label for Rights Management protection

1. If you haven't already done so, open a new browser window and sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin. Then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. If the label that you want to configure will apply to all users, stay on the **Azure Information Protection - Global policy** blade. However, if the label that you want to configure is in a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, from the **POLICIES** menu selection, select **Scoped policies**. Then select your scoped policy from the **Azure Information Protection - Scoped polices** blade.

3. Select the label that you want to configure, which opens the **Label** blade. 

4. On the **Label** blade, locate **Set permissions for documents and emails containing this label** and select one of the following options:
    
    - **Not configured**: Select this option if the label is currently configured to apply protection and you no longer want the selected label to apply protection. Then go to step 11.
    
    - **Protect**: Select this option to apply protection, and then go to step 5.
    
    - **Remove Protection**: Select this option to remove protection if a document or email is protected. Then go to step 11.
        
        Note that for users to apply a label that has this option, they must have permissions to remove Rights Management protection. This requirement means that users must have the **Export** or **Full Control** [usage right](../deploy-use/configure-usage-rights.md). Or, they must be the Rights Management owner (which automatically grants the Full Control usage right), or be a [super user for Azure Rights Management](../deploy-use/configure-super-users.md). The default Azure Rights Management templates do not include the usage rights that let users remove protection. 
        
        If users do not have permissions to remove Rights Management protection, and they select a label that is configured with this **Remove Protection** option, they see the following message: **Azure Information Protection cannot apply this label. If this problem persists, contact your administrator.**

5. If you selected **Protect**, now select **Protection** to open the **Protection** blade:
    
    ![Configure protection for an Azure Information Protection label](../media/info-protect-protection-bar-configured.png)

6. On the **Protection** blade, select **Azure RMS** or **Azure (cloud key)**, or select **HYOK (AD RMS)**. The first option is in the process of being renamed.
    
    In most cases, select **Azure RMS** or **Azure (cloud key)** for your permission settings. Do not select **HYOK (AD RMS)** unless you have read and understood the prerequisites and restrictions that accompany this "*hold your own key*" (HYOK) configuration. For more information, see [Hold your own key (HYOK) requirements and restrictions for AD RMS protection](configure-adrms-restrictions.md). To continue the configuration for HYOK (AD RMS), go to step 10.
    
7. Select one of the following options:
    
    - **Select a predefined template**: To use one of the default templates or a custom template that you've configured. This template must be published (not archived) and must not be linked already to another label. When you select this option, you can use the **Edit Template** button to [convert the template into a label](configure-policy-templates.md#to-convert-templates-to-labels).
    
    - **Set permissions**: To define new protection settings in this portal.
    
    - **Set user defined permissions (Preview)**: To let users specify who should be granted permissions and what those permissions are. You can then refine this option and choose Outlook only (the default), or Word, Excel, PowerPoint, and File Explorer. 
        
        If you choose the option for Outlook: The label is displayed in Outlook and the resulting behavior when users apply the label is the same as the Do Not Forward option.
        
        If you choose the option for Word, Excel, PowerPoint, and File Explorer: When this option is set, the label is displayed in these applications. The resulting behavior when users apply the label is to display the dialog box for users to select custom permissions. In this dialog box, users must specify the permissions, the users or groups, and any expiry date. Make sure that users have instructions and guidance how to supply these values.

8. If you selected **Select a predefined template** for **Azure RMS** or **Azure (cloud key)**, click the drop-down box and select the [template](../deploy-use/configure-policy-templates.md) that you want to use to protect documents and emails with this label. You do not see archived templates or templates that are already selected for another label.
    
    If you select a **departmental template**, or if you have configured [onboarding controls](../deploy-use/activate-service.md#configuring-onboarding-controls-for-a-phased-deployment):
    
    - Users who are outside the configured scope of the template or who are excluded from applying Azure Rights Management protection will still see the label but cannot apply it. If they select the label, they see the following message: **Azure Information Protection cannot apply this label. If this problem persists, contact your administrator.**
        
        Note that all published templates are always shown, even if you are configuring a scoped policy. For example, you are configuring a scoped policy for the Marketing group. The templates that you can select are not restricted to templates that are scoped to the Marketing group and it's possible to select a departmental template that your selected users cannot use. For ease of configuration and to minimize troubleshooting, consider naming the departmental template to match the label in your scoped policy. 
            
9. If you selected **Set permissions** for **Azure RMS** or **Azure (cloud key)**, this option lets you configure the same settings that you can configure in a template. 
    
    Select **Add permissions**, and on the **Add permissions** blade, select the first set of users and groups who will have rights to use the content that will be protected by the selected label:
    
    - Choose **Select from the list** to add all users from your organization or browse the directory.
        
        The users or groups must have an email address. In a production environment, this is nearly always be the case, but in a simple testing environment, you might need to add email addresses to user accounts or groups.
        
    - Choose **Enter details** to manually specify email addresses for individual users or groups (internal or external). Or, to specify all users in another organization by entering a domain name from that organization. 
        
    >[!NOTE]
    >If an email address changes after you select the user or group, see the [Considerations if email addresses change](../plan-design/prepare.md#considerations-for-azure-information-protection-if-email-addresses-change) section from the planning documentation.
    
    As a best practice, use groups rather than users. This stratetegy keeps your configuration simpler and makes it less likely that you have to update your label configuration later and then reprotect content. However, if you make changes to the group, keep in mind that for performance reasons, Azure Rights Management [caches the group membership](../plan-design/prepare.md#group-membership-caching-by-azure-rights-management ). 
    
    When you have specified the first set of users and groups, select the permissions to grant these users and groups. For more information about the permissions that you can select, see [Configuring usage rights for Azure Rights Management](configure-usage-rights.md). However, applications that support this protection might vary in how they implement these permissions. Consult their documentation and do your own testing with the applications that users use to check the behavior before you deploy the template for users.
    
    If required, you can now add a second set of users and groups with usage rights. Repeat until you have specified all the users and groups with their respective permissions.

    >[!TIP]
    >Consider adding the **Copy and extract content** custom permission and grant this to data recovery administrators or personnel in other roles that have responsibilities for information recovery. If needed, these users can then remove protection from files and emails that will be protected by using this label or template. This ability to remove protection at the permission level for a document or email provides more fine-grained control than the [super user feature](configure-super-users.md).
    
    For all the users and groups that you specified, on the **Protection** blade, now check whether you want to make any changes to the following settings. Note that these settings, as with the permissions, do not apply to the [Rights Management issuer or Rights Management owner](configure-usage-rights.md#rights-management-issuer-and-rights-management-owner), or any [super user](configure-super-users.md) that you have assigned.
    
    |Setting|More information|Recommended setting
    |-----------|--------------------|--------------------|
    |**content expiration**|Define a date or number of days for this template when documents or emails that are protected by the template should not open for the selected users. You can specify a date or specify a number of days starting from the time that the protection is applied to the content.<br /><br />When you specify a date, it is effective midnight, in your current time zone.|**Content never expires** unless the content has a specific time-bound requirement.|
    |**Allow offline access**|Use this setting to balance any security requirements that you have (includes access after revocation) with the ability for the selected users to open protected content when they don't have an Internet connection.<br /><br />If you specify that content is not available without an Internet connection or that content is only available for a specified number of days, when that threshold is reached, these users must be reauthenticated and their access is logged. When this happens, if their credentials are not cached, the users are prompted to sign in before they can open the document or email.<br /><br />In addition to reauthentication, the policy and the user group membership is re-evaluated. This means that users could experience different access results for the same document or email if there are changes in the policy or group membership from when they last accessed the content. That could include no access if the document has been [revoked](../rms-client/client-track-revoke.md).|Depending on how sensitive the content is:<br /><br />- **Number of days the content is available without an Internet connection** = **7** for sensitive business data that could cause damage to the business if shared with unauthorized people. This recommendation offers a balanced compromise between flexibility and security. Examples include contracts, security reports, forecast summaries, and sales account data.<br /><br />- **Never** for very sensitive business data that would cause damage to the business if it was shared with unauthorized people. This recommendation prioritizes security over flexibility, and ensures that if the document is revoked, all authorized users immediately cannot open the document. Examples include employee and customer information, passwords, source code, and pre-announced financial reports.|
    
    When you have finished configuring the permissions, click **OK**. 
    
    This grouping of settings creates a custom template for the Azure Rights Management service. These templates can be used with applications and services that integrate with Azure Rights Management. For information about how computers and services download and refresh these templates, see [Refreshing templates for users and services](refresh-templates.md).

10. If you selected **HYOK (AD RMS)**, select either **Set AD RMS templates details** or **Set user defined permissions (Preview)**, and then specify the licensing URL of your AD RMS cluster.
    
    For instructions to specify a template GUID and your licensing URL, see [Locating the information to specify AD RMS protection with an Azure Information Protection label](configure-adrms-restrictions.md#locating-the-information-to-specify-ad-rms-protection-with-an-azure-information-protection-label).
    
    The user defined permissions option lets users specify who should be granted permissions and what those permissions are. You can then refine this option and choose Outlook only (the default), or Word, Excel, PowerPoint, and File Explorer. 
    
    If you choose the option for Outlook: The label is displayed in Outlook and the resulting behavior when users apply the label is the same as the Do Not Forward option.
    
    If you choose the option for Word, Excel, PowerPoint, and File Explorer: The label is displayed in these applications. The resulting behavior when users apply the label is to display the dialog box for users to select custom permissions. In this dialog box, users must specify the permissions, the users or groups, and any expiry date. Make sure that users have instructions and guidance how to supply these values. Note that unless you have the preview version of the client, this option for File Explorer always uses Azure RMS protection rather than HYOK (AD RMS) protection.

11. Click **OK** to close the **Protection** blade and see your choice of **User defined** or your chosen template display for the **Protection** option in the **Label** blade.

12. On the **Label** blade, click **Save**.

13. On the **Azure Information Protection** blade, use the **PROTECTION** column to confirm that your label now displays the protection setting that you want:
    
    - **Azure RMS** or **HYOK (AD RMS)**, or a check mark if you have configured protection. 
    
    - **Remove Protection** or an x mark to denote cancellation if you have configured a label to remove protection.
    
    - A blank field when protection is not set. 

13. To make your changes available to users, click **Publish**.

## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  

[!INCLUDE[Commenting house rules](../includes/houserules.md)]