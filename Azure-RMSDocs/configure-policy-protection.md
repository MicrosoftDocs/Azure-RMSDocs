---
# required metadata

title: Configure an Azure Information Protection label for protection
description: You can protect your most sensitive documents and emails when you configure a label to use Rights Management protection. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/24/2018
ms.topic: conceptual
ms.service: information-protection
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

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*

You can protect your most sensitive documents and emails by using a Rights Management service. This service uses encryption, identity, and authorization policies to help prevent data loss. The protection is applied with a label that is configured to use Rights Management protection for documents and emails, and users can also select the **Do not forward** button in Outlook.

When your label is configured with the protection setting of **Azure (cloud key)**, under the covers, this action creates and configures a protection template that can then be accessed by services and applications that integrate with Rights Management templates. For example, Exchange Online and mail flow rules, and Outlook on the web. 

## How the protection works

When a document or email is protected by a Rights Management service, it is encrypted at rest and in transit. It can then be decrypted only by authorized users. This encryption stays with the document or email, even if it is renamed. In addition, you can configure usage rights and restrictions, such as the following examples:

- Only users within your organization can open the company-confidential document or email.

- Only users in the marketing department can edit and print the promotion announcement document or email, while all other users in your organization can only read this document or email.

- Users cannot forward an email or copy information from it that contains news about an internal reorganization.

- The current price list that is sent to business partners cannot be opened after a specified date.

For more information about the Azure Rights Management protection and how it works, see [What is Azure Rights Management?](what-is-azure-rms.md)

> [!IMPORTANT]
> To configure a label to apply this protection, the Azure Rights Management service must be activated for your organization. For more information, see [Activating Azure Rights Management](activate-service.md).

When the label applies protection, a protected document is not suitable to be saved on SharePoint or OneDrive. These locations do not support the following features for protected files: Co-authoring, Office Online, search, document preview, thumbnail, eDiscovery, and data loss prevention (DLP). 

Exchange does not have to be configured for Azure Information Protection before users can apply labels in Outlook to protect their emails. However, until Exchange is configured for Azure Information Protection, you do not get the full functionality of using Azure Rights Management protection with Exchange. For example, users cannot view protected emails on mobile phones or with Outlook on the web, protected emails cannot be indexed for search, and you cannot configure Exchange Online DLP for Rights Management protection. To ensure that Exchange can support these additional scenarios, see the following resources:

- For Exchange Online, see the instructions for [Exchange Online: IRM Configuration](configure-office365.md#exchange-online-irm-configuration).

- For Exchange on-premises, you must deploy the [RMS connector and configure your Exchange servers](deploy-rms-connector.md). 

## To configure a label for protection settings

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **All services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. From the **Classifications** > **Labels** menu option: On the **Azure Information Protection - Labels** blade, select the label you want to change. 

3. On the **Label** blade, locate **Set permissions for documents and emails containing this label**, and select one of the following options:
    
    - **Not configured**: Select this option if the label is currently configured to apply protection and you no longer want the selected label to apply protection. Then go to step 11.
        
        The previously configured protection settings are retained as an archived protection template, and will be displayed again if you change the option back to **Protect**. You do not see this template in the Azure portal but if necessary, you can still manage the template by using [PowerShell](configure-templates-with-powershell.md). This behavior means that content remains accessible if it has this label with the previously applied protection settings.
    
    - **Protect**: Select this option to apply protection, and then go to step 4.
    
    - **Remove Protection**: Select this option to remove protection if a document or email is protected. Then go to step 11.
        
        The previously configured protection settings are retained as an archived protection template, and will be displayed again if you change the option back to **Protect**. You do not see this template in the Azure portal but if necessary, you can still manage the template by using [PowerShell](configure-templates-with-powershell.md). This behavior means that content remains accessible if it has this label with the previously applied protection settings.
        
        Note that for users to apply a label that has this option, they must have permissions to remove Rights Management protection. This requirement means that users must have the **Export** or **Full Control** [usage right](configure-usage-rights.md). Or, they must be the Rights Management owner (which automatically grants the Full Control usage right), or be a [super user for Azure Rights Management](configure-super-users.md). The default Azure Rights Management templates do not include the usage rights that let users remove protection. 
        
        If users do not have permissions to remove Rights Management protection, and they select a label that is configured with this **Remove Protection** option, they see the following message: **Azure Information Protection cannot apply this label. If this problem persists, contact your administrator.**

4. If you selected **Protect**, now select **Protection** to open the **Protection** blade:
    
    ![Configure protection for an Azure Information Protection label](./media/info-protect-protection-bar-configured.png)

5. On the **Protection** blade, select **Azure (cloud key)** or **HYOK (AD RMS)**.
    
    In most cases, select **Azure (cloud key)** for your permission settings. Do not select **HYOK (AD RMS)** unless you have read and understood the prerequisites and restrictions that accompany this "*hold your own key*" (HYOK) configuration. For more information, see [Hold your own key (HYOK) requirements and restrictions for AD RMS protection](configure-adrms-restrictions.md). To continue the configuration for HYOK (AD RMS), go to step 9.
    
6. Select one of the following options:
    
    - **Set permissions**: To define new protection settings in this portal.
    
    - **Set user-defined permissions (Preview)**: To let users specify who should be granted permissions and what those permissions are. You can then refine this option and choose Outlook only, or Word, Excel, PowerPoint, and File Explorer. This option is not supported, and does not work, when a label is configured for [automatic classification](configure-policy-classification.md).
        
        If you choose the option for Outlook: The label is displayed in Outlook and the resulting behavior when users apply the label is the same as the [Do Not Forward](configure-usage-rights.md#do-not-forward-option-for-emails) option.
        
        If you choose the option for Word, Excel, PowerPoint, and File Explorer: When this option is set, the label is displayed in these applications. The resulting behavior when users apply the label is to display the dialog box for users to select custom permissions. In this dialog box, users choose one of the [predefined permissions levels](configure-usage-rights.md#rights-included-in-permissions-levels), browse to or specify the users or groups, and optionally, set an expiry date. Make sure that users have instructions and guidance how to supply these values.
    
    - **Select a predefined template**: To use one of the default templates or a custom template that you've configured. Note that this option does not display for new labels, or if you are editing a label that previously used the **Set permissions** option.
    
    To select a predefined template, the template must be published (not archived) and must not be linked already to another label. When you select this option, you can use an **Edit Template** button to [convert the template into a label](configure-policy-templates.md#to-convert-templates-to-labels).
    
    Tip: If you are used to creating and editing custom templates, you might find it useful to reference [Tasks that you used to do with the Azure classic portal](migrate-portal.md).

7. If you selected **Set permissions** for **Azure (cloud key)**, this option lets you configure the same settings that you can configure in a template. 
    
    Select **Add permissions**, and on the **Add permissions** blade, select the first set of users and groups who will have rights to use the content that will be protected by the selected label:
    
    - Choose **Select from the list** where you can then add all users from your organization by selecting **Add \<organization name> - All members**. This setting excludes guest accounts. Or, you can select **Add any authenticated users (Preview)**, or browse the directory.
        
        When you choose all members or browse the directory, the users or groups must have an email address. In a production environment, users and groups nearly always have an email address, but in a simple testing environment, you might need to add email addresses to user accounts or groups.
        
        ###### More information about **Add any authenticated users** 
        This setting doesn't restrict who can access the content that the label protects, while still encrypting the content and providing you with options to restrict how the content can be used (permissions), and accessed (expiry and offline access). However, the application opening the protected content must be able to support the authentication being used. For this reason, federated social providers such as Google, and onetime passcode authentication should be used for email only, and only when you use Exchange Online and the new capabilities from Office 365 Message Encryption. Microsoft accounts can be used with the Azure Information Protection viewer and Office 2016 Click-to-Run. 
          
        Some typical scenarios for the any authenticated users setting:
            - You don't mind who views the content, but you want to restrict how it is used. For example, you do not want the content to be edited, copied, or printed.  
            - You don't need to restrict who accesses the content, but you want to be able to track who opens it and potentially, revoke it.  
            - You have a requirement that the content must be encrypted at rest and in transit, but it doesn't require access controls.
        
    - Choose **Enter details** to manually specify email addresses for individual users or groups (internal or external). Or, use this option to specify all users in another organization by entering any domain name from that organization. You can also use this option for social providers, by entering their domain name such as **gmail.com**, **hotmail.com**, or **outlook.com**.
        
    >[!NOTE]
    >If an email address changes after you select the user or group, see the [Considerations if email addresses change](prepare.md#considerations-for-azure-information-protection-if-email-addresses-change) section from the planning documentation.
    
    As a best practice, use groups rather than users. This strategy keeps your configuration simpler and makes it less likely that you have to update your label configuration later and then reprotect content. However, if you make changes to the group, keep in mind that for performance reasons, Azure Rights Management [caches the group membership](prepare.md#group-membership-caching-by-azure-information-protection). 
    
    When you have specified the first set of users and groups, select the permissions to grant these users and groups. For more information about the permissions that you can select, see [Configuring usage rights for Azure Rights Management](configure-usage-rights.md). However, applications that support this protection might vary in how they implement these permissions. Consult their documentation and do your own testing with the applications that users use to check the behavior before you deploy the template for users.
    
    If required, you can now add a second set of users and groups with usage rights. Repeat until you have specified all the users and groups with their respective permissions.

    >[!TIP]
    >Consider adding the **Save As, Export (EXPORT)** custom permission and grant this permission to data recovery administrators or personnel in other roles that have responsibilities for information recovery. If needed, these users can then remove protection from files and emails that will be protected by using this label or template. This ability to remove protection at the permission level for a document or email provides more fine-grained control than the [super user feature](configure-super-users.md).
    
    For all the users and groups that you specified, on the **Protection** blade, now check whether you want to make any changes to the following settings. Note that these settings, as with the permissions, do not apply to the [Rights Management issuer or Rights Management owner](configure-usage-rights.md#rights-management-issuer-and-rights-management-owner), or any [super user](configure-super-users.md) that you have assigned.
    
    ###### Information about the protection settings
    
    |Setting|More information|Recommended setting
    |-----------|--------------------|--------------------|
    |**content expiration**|Define a date or number of days for when documents or emails that are protected by these settings should not open for the selected users. You can specify a date or specify a number of days starting from the time that the protection is applied to the content.<br /><br />When you specify a date, it is effective midnight, in your current time zone.|**Content never expires** unless the content has a specific time-bound requirement.|
    |**Allow offline access**|Use this setting to balance any security requirements that you have (./includes access after revocation) with the ability for the selected users to open protected content when they don't have an Internet connection.<br /><br />If you specify that content is not available without an Internet connection or that content is only available for a specified number of days, when that threshold is reached, these users must be reauthenticated and their access is logged. When this happens, if their credentials are not cached, the users are prompted to sign in before they can open the document or email.<br /><br />In addition to reauthentication, the policy and the user group membership is reevaluated. This means that users could experience different access results for the same document or email if there are changes in the policy or group membership from when they last accessed the content. That could include no access if the document has been [revoked](./rms-client/client-track-revoke.md).|Depending on how sensitive the content is:<br /><br />- **Number of days the content is available without an Internet connection** = **7** for sensitive business data that could cause damage to the business if shared with unauthorized people. This recommendation offers a balanced compromise between flexibility and security. Examples include contracts, security reports, forecast summaries, and sales account data.<br /><br />- **Never** for very sensitive business data that would cause damage to the business if it was shared with unauthorized people. This recommendation prioritizes security over flexibility, and ensures that if the document is revoked, all authorized users immediately cannot open the document. Examples include employee and customer information, passwords, source code, and pre-announced financial reports.|
    
    When you have finished configuring the permissions and settings, click **OK**. 
    
    This grouping of settings creates a custom template for the Azure Rights Management service. These templates can be used with applications and services that integrate with Azure Rights Management. For information about how computers and services download and refresh these templates, see [Refreshing templates for users and services](refresh-templates.md).

8. If you selected **Select a predefined template** for **Azure (cloud key)**, click the drop-down box and select the [template](configure-policy-templates.md) that you want to use to protect documents and emails with this label. You do not see archived templates or templates that are already selected for another label.
    
    If you select a **departmental template**, or if you have configured [onboarding controls](activate-service.md#configuring-onboarding-controls-for-a-phased-deployment):
    
    - Users who are outside the configured scope of the template or who are excluded from applying Azure Rights Management protection still see the label but cannot apply it. If they select the label, they see the following message: **Azure Information Protection cannot apply this label. If this problem persists, contact your administrator.**
        
        Note that all published templates are always shown, even if you are configuring a scoped policy. For example, you are configuring a scoped policy for the Marketing group. The templates that you can select are not restricted to templates that are scoped to the Marketing group and it's possible to select a departmental template that your selected users cannot use. For ease of configuration and to minimize troubleshooting, consider naming the departmental template to match the label in your scoped policy. 

9. If you selected **HYOK (AD RMS)**, select either **Set AD RMS templates details** or **Set user defined permissions (Preview)**. Then specify the licensing URL of your AD RMS cluster.
    
    For instructions to specify a template GUID and your licensing URL, see [Locating the information to specify AD RMS protection with an Azure Information Protection label](configure-adrms-restrictions.md#locating-the-information-to-specify-ad-rms-protection-with-an-azure-information-protection-label).
    
    The user-defined permissions option lets users specify who should be granted permissions and what those permissions are. You can then refine this option and choose Outlook only (the default), or Word, Excel, PowerPoint, and File Explorer. This option is not supported, and does not work, when a label is configured for [automatic classification](configure-policy-classification.md).
    
    If you choose the option for Outlook: The label is displayed in Outlook and the resulting behavior when users apply the label is the same as the [Do Not Forward](configure-usage-rights.md#do-not-forward-option-for-emails) option.
    
    If you choose the option for Word, Excel, PowerPoint, and File Explorer: When this option is set, the label is displayed in these applications. The resulting behavior when users apply the label is to display the dialog box for users to select custom permissions. In this dialog box, users choose one of the [predefined permissions levels](configure-usage-rights.md#rights-included-in-permissions-levels), browse to or specify the users or groups, and optionally, set an expiry date. Make sure that users have instructions and guidance how to supply these values.

10. Click **OK** to close the **Protection** blade and see your choice of **User defined** or your chosen template display for the **Protection** option in the **Label** blade.

11. On the **Label** blade, click **Save**.

12. On the **Azure Information Protection** blade, use the **PROTECTION** column to confirm that your label now displays the protection setting that you want:
    
    - A check mark if you have configured protection. 
    
    - An x mark to denote cancellation if you have configured a label to remove protection.
    
    - A blank field when protection is not set. 

When you clicked **Save**, your changes are automatically available to users and services. There's no longer a separate publish option.


## Example configurations

The **All Employees** and **Recipients Only** sublabels from the **Confidential** and **High Confidential** labels from the [default policy](configure-policy-default.md) provide examples of how you can configure labels that apply protection. You can also use the following examples to help you configure protection for different scenarios. 

For each example that follows, on your \<*label name*> blade, select **Protect** and then select **Protection** to open the **Protection** blade.

### Example 1: Label that applies Do Not Forward to send a protected email to a Gmail account

This label is available only in Outlook and is suitable when Exchange Online is configured for the [new capabilities in Office 365 Message Encryption](https://support.office.com/article/7ff0c040-b25c-4378-9904-b1b50210d00e). Instruct users to select this label when they need to send a protected email to people using a Gmail account (or any other email account outside your organization). 

Your users type the Gmail email address in the **To** box.  Then, they select the label and the Do Not Forward option is automatically added to the email. The result is that recipients cannot forward the email, or print it, copy from it, or save attachments, or save the email as a different name. 

1. On the **Protection** blade, make sure that **Azure (cloud key)** is selected.
    
2. Select **Set user-defined permissions (Preview)**.

3. Make sure that the following option is selected: **In Outlook apply Do Not Forward**.

4. If selected, clear the following option: **In Word, Excel, PowerPoint and File Explorer prompt user for custom permissions**.

5. Click **OK** on the **Protection** blade, and then click **Save** on the **Label** blade.


### Example 2: Label that restricts read-only permission to all users in another organization, and that supports immediate revocation

This label is suitable for sharing (read-only) very sensitive documents that always require an Internet connection to view it. If revoked, users will not be able to view the document the next time they try to open it.

This label is not suitable for emails.

1. On the **Protection** blade, make sure that **Azure (cloud key)** is selected.
    
2. Make sure that the **Set permissions** option is selected, and then select **Add permissions**.

3. On the **Add permissions** blade, select **Enter details**.

4. Enter the name of a domain from the other organization, for example, **fabrikam.com**. Then select **Add**.

5. From **Choose permissions from preset**, select **Viewer**, and then select **OK**.

6. Back on the **Protection** blade, for **Allow offline access setting**, select **Never**.

7. Click **OK** on the **Protection** blade, and then click **Save** on the **Label** blade.


### Example 3: Add external users to an existing label

The new users that you add will be able open documents and emails that have already been protected with this label. The permissions that you grant these users can be different from the permissions that the existing users have.

1. On the **Protection** blade, make sure **Azure (cloud key)** is selected.
    
2. Ensure that **Set permissions** is selected, and then select **Add permissions**.

3. On the **Add permissions** blade, select **Enter details**.

4. Enter the email address of the first user (or group) to add, and then select **Add**.

5. Select the permissions for this user (or group).

6. Repeat steps 4 and 5 for each user (or group) that you want to add to this label. Then click **OK**.

7. Click **OK** on the **Protection** blade, and then click **Save** on the **Label** blade.

### Example 4: Label for protected email that supports less restrictive permissions than Do Not Forward

This label cannot be restricted to Outlook but does provide less restrictive controls than using Do Not Forward. For example, you want the recipients to be able to copy from the email or an attachment, or save and edit an attachment.

If you specify external users who do not have an account in Azure AD:

- The label is suitable for email when Exchange Online is using the [new capabilities in Office 365 Message Encryption](https://support.office.com/article/7ff0c040-b25c-4378-9904-b1b50210d00e). 
 
- For Office attachments that are automatically protected, these documents are available to view in a browser. To edit these documents, download and edit them with Office 2016 Click-to-Run, and a Microsoft account that uses the same email address. [More information](secure-collaboration-documents.md#supported-scenarios-for-opening-protected-documents)


> [!NOTE]
> Exchange Online is rolling out a new option, [Encrypt-Only](configure-usage-rights.md#encrypt-only-option-for-emails). This option is not available for label configuration. However, when you know who the recipients will be, you can use this example to configure a label with the same set of usage rights. 

When your users specify the email addresses in the **To** box, the addresses must be for the same users that you specify for this label configuration. Because users can belong to groups and have more than one email address, the email address that they specify does not have to match the email address that you specify for the permissions. However, specifying the same email address is the easiest way to ensure that the recipient will be successfully authorized. For more information about how users are authorized for permissions, see [Preparing users and groups for Azure Information Protection](prepare.md). 

1. On the **Protection** blade, make sure that **Azure (cloud key)** is selected.
    
2. Make sure **Set permissions** is selected, and select **Add permissions**.

3. On the **Add permissions** blade: To grant permissions to users in your organization, select **Add \<organization name> - All members** to select all users in your tenant. This setting excludes guest accounts. Or, select **Browse directory** to select a specific group. To grant permissions to external users or if you prefer to type the email address, select **Enter details** and type the email address of the user, or Azure AD group, or a domain name.
    
    Repeat this step to specify additional users who should have the same permissions.

4. For **Choose permissions from preset**, select **Co-Owner**, **Co-Author**, **Reviewer**, or **Custom** to select the permissions that you want to grant.
    
    Note: Do not select **Viewer** for emails and if you do select **Custom**, make sure that you include **Edit and Save**.
    
    To select the same permissions that match the new **Encrypt-Only** option from Exchange Online, select **Custom**. Then select all permissions except **Save As, Export (EXPORT)** and **Full Control (OWNER)**.

5. To specify additional users who should have different permissions, repeat steps 3 and 4.

6. Click **OK** on the **Add permissions** blade.

7. Click **OK** on the **Protection** blade, and then click **Save** on the **Label** blade.


### Example 5: Label that encrypts content but doesn't restrict who can access it

This configuration has the advantage that you don't need to specify users, groups, or domains to protect an email or document. The content will still be encrypted and you can still specify usage rights, an expiry date, and offline access. Use this configuration only when you do not need to restrict who can open the protected document or email. [More information about this setting](#more-information-about-add-any-authenticated-users)

1. On the **Protection** blade, make sure **Azure (cloud key)** is selected.
    
2. Make sure **Set permissions** is selected, and then select **Add permissions**.

3. On the **Add permissions** blade, on the **Select from the list** tab, select **Add any authenticated users (Preview)**.

4. Select the permissions you want, and click **OK**.

5. Back on the **Protection** blade, configure settings for **Content expiration** and **Allow offline access**, if needed, and then click **OK**.

6. On the **Label** blade, select **Save**.


## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section. 

Exchange mail flow rules can also apply protection, based on your labels. For more information and examples, see [Configuring Exchange Online mail flow rules for Azure Information Protection labels](configure-exo-rules.md).  
