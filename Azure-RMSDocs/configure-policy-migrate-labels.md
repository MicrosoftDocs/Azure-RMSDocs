---
# required metadata

title: Migrate Azure Information Protection labels to unified sensitivity labels - AIP
description: Migrate Azure Information Protection labels to unified sensitivity labels for clients and services that support the Microsoft Information Protection framework. 
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 09/25/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: labelmigrate
ms.reviewer: demizets
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# How to migrate Azure Information Protection labels to unified sensitivity labels

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*
>
> *Instructions for: [Azure Information Protection client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

Migrate Azure Information Protection labels to the unified labeling platform so that you can use them as sensitivity labels by [clients and services that support unified labeling](#clients-and-services-that-support-unified-labeling).

> [!IMPORTANT]
> If you have fairly recently got your subscription for Azure Information Protection, you might not need to migrate labels because your tenant is already on the unified labeling platform. For more information, see [How can I determine if my tenant is on the unified labeling platform?](faqs.md#how-can-i-determine-if-my-tenant-is-on-the-unified-labeling-platform)

After you migrate your labels, you won't see any difference with the Azure Information Protection client (classic) because this client continues to download the labels with the Azure Information Protection policy from the Azure portal. However, you can now use the labels with the Azure Information Protection unified labeling client and other clients and services that use sensitivity labels

Before you read the instructions to migrate your labels, you might find the following frequently asked questions useful:

- [What’s the difference between labels in Azure Information Protection and labels in Office 365?](faqs.md#whats-the-difference-between-labels-in-azure-information-protection-and-labels-in-office-365)

- [When is the right time to migrate my labels?](faqs.md#when-is-the-right-time-to-migrate-my-labels)

- [After I've migrated my labels, which management portal do I use?](faqs.md?#after-ive-migrated-my-labels-which-management-portal-do-i-use )

### Administrative roles that support the unified labeling platform

If you use admin roles for delegated administration in your organization, you might need to do some changes for the unified labeling platform:

The [Azure AD role](/azure/active-directory/active-directory-assign-admin-roles-azure-portal) of **Azure Information Protection administrator** (formerly **Information Protection administrator**) is not supported by the unified labeling platform. If this administrative role is used in your organization, add the users who have this role to the Azure AD roles of **Compliance administrator**, **Compliance data administrator**, or **Security administrator**. If you need help with this step, see [Give users access to the Office 365 Security & Compliance Center](https://docs.microsoft.com/office365/securitycompliance/grant-access-to-the-security-and-compliance-center). You can also assign these roles in the Azure AD portal, the Microsoft 365 security center, and the Microsoft 365 compliance center.

Alternatively to using roles, in the admin centers, you can create a new role group for these users and add either **Sensitivity Label Administrator** or **Organization Configuration** roles to this group.

If you do not give these users access to the admin centers by using one of these configurations, they won't be able to configure Azure Information Protection in the Azure portal after your labels are migrated.

Global administrators for your tenant can continue to manage labels and policies in both the Azure portal and the admin centers after your labels are migrated.

## Before you begin

Label migration has many benefits but is irreversible, so make sure that you are aware of the following changes and considerations:

- Make sure that you have [clients that support unified labels](#clients-and-services-that-support-unified-labeling) and if necessary, be prepared for administration in both the Azure portal (for clients that don't support unified labels) and the admin centers (for client that do support unified labels).

- Policies, including policy settings and who has access to them (scoped policies), and all advanced client settings are not migrated. Your options to configure these settings after your label migration include the following:
    - Your admin center for sensitivity labels.
    - [Office 365 Security & Compliance PowerShell](https://docs.microsoft.com/powershell/exchange/office-365-scc/office-365-scc-powershell?view=exchange-ps), which you must use to configure [advanced client settings](./rms-client/clientv2-admin-guide-customizations.md#how-to-configure-advanced-settings-for-the-client-by-using-office-365-security--compliance-center-powershell).
    

- Not all settings from a migrated label are supported by the admin centers. Use the table in the [Label settings that are not supported in the admin centers](#label-settings-that-are-not-supported-in-the-admin-centers) section to help you identify these settings and the recommended course of action.

- Protection templates:
    
    - Templates that use a cloud-based key and that are part of a label configuration are also migrated with the label. Other protection templates are not migrated. 
    
    - If you have labels that are configured for a predefined template, edit these labels and select the **Set permissions** option to configure the same protection settings that you had in your template. Labels with predefined templates will not block label migration but this label configuration is not supported in the admin centers.
        
        Tip: To help you reconfigure these labels, you might find it useful to have two browser windows: One window in which you select the **Edit Template** button for the label to view the protection settings, and the other window to configure the same settings when you select **Set permissions**.
    
    - After a label with cloud-based protection settings has been migrated, the resulting scope of the protection template is the scoped that is defined in the Azure portal (or by using the AIPService PowerShell module) and the scope that is defined in the admin centers. 

- For each label, the Azure portal displays only the label display name, which you can edit. Users see this label name in their apps. The admin centers show both this display name for a label, and the label name. The label name is the initial name that you specify when the label is first created and this property is used by the back-end service for identification purposes. When you migrate your labels, the display name remains the same and the label name is renamed to the label ID from the Azure portal.

- Any localized strings for the labels are not migrated. Define new localized strings for the migrated labels by using Office 365 Security & Compliance PowerShell and the *LocaleSettings* parameter for [Set-Label](https://docs.microsoft.com/powershell/module/exchange/policy-and-compliance/set-label?view=exchange-ps).

- After the migration, when you edit a migrated label in the Azure portal, the same change is automatically reflected in the admin centers. However, when you edit a migrated label in one of the admin centers, you must return to the Azure portal, **Azure Information Protection - Unified labeling** blade, and select **Publish**. This additional action is needed for the Azure Information Protection clients (classic) to pick up the label changes.

### Label settings that are not supported in the admin centers

Use the following table to identify which configuration settings of a migrated label are not supported by the Office 365 Security & Compliance Center, the Microsoft 365 security center, or the Microsoft compliance center. If you have labels with these settings, when the migration is complete, use the administration guidance in the final column before you publish your labels in one of the referenced admin centers.

If you are not sure how your labels are configured, view their settings in the Azure portal. If you need help with this step, see [Configuring the Azure Information Protection policy](configure-policy.md).

Azure Information Protection clients (classic) can use all label settings listed without any problems because they continue to download the labels from the Azure portal.

|Label configuration|Supported by unified labeling clients| Guidance for the admin centers|
|-------------------|---------------------------------------------|-------------------------|
|Status of enabled or disabled<br /><br />This status is not synchronized to the admin centers |Not applicable|The equivalent is whether the label is published or not. |
|Label color that you select from list or specify by using RGB code |Yes|No configuration option for label colors. Instead, you can configure label colors in the Azure portal or use [PowerShell](./rms-client/clientv2-admin-guide-customizations.md#specify-a-color-for-the-label).|
|Cloud-based protection or HYOK-based protection using a predefined template |No|No configuration option for predefined templates. We do not recommend you publish a label with this configuration.|
|Cloud-based protection using user-defined permissions for Word, Excel, and PowerPoint |Yes|The admin centers now have a configuration option for user-defined permissions. <br /><br /> If you publish a label with this configuration, check the results of applying the label from the [following table](#comparing-the-behavior-of-protection-settings-for-a-label).|
|HYOK-based protection using user-defined permissions for Outlook (Do Not Forward) |No|No configuration option for HYOK. We do not recommend you publish a label with this configuration. If you do, the results of applying the label are listed in the [following table](#comparing-the-behavior-of-protection-settings-for-a-label).|
|Remove protection |No|No configuration option to remove protection. We do not recommend you publish a label with this configuration.<br /><br /> If you do publish a label with this configuration, when it is applied, protection is always removed, whether the protection was previously applied by a label or independently from a label.|
|Custom font and custom font color by RGB code for visual markings (header, footer, watermark)|Yes|Configuration for visual markings is limited to a list of colors and font sizes. You can publish this label without changes although you cannot see the configured values in the admin centers. <br /><br />To change these options, you can use the Azure portal. However, for easier administration, consider changing the color to one of the listed options in the admin centers.|
|Variables in visual markings (header, footer)|No|If you publish this label without changes, variables display as text on clients rather than display the dynamic values. Before you publish the label, edit the strings to remove the variables.|
|Visual markings per app|No|If you publish this label without changes, the app variables display as text on clients in all apps rather than display your text strings on chosen apps. Publish this label only if it is suitable for all apps, and edit the strings to remove the app variables.|
|Conditions and associated settings <br /><br /> Includes automatic and recommended labeling, and their tooltips|Not applicable|Reconfigure your conditions by using auto labeling as a separate configuration from label settings.|

### Comparing the behavior of protection settings for a label

Use the following table to identify how the same protection setting for a label behaves differently, depending on whether it's used by the Azure Information Protection client (classic), the Azure Information Protection unified labeling client, or by Office apps that have labeling built in (also known as "native Office labeling"). The differences in label behavior might change your decision whether to publish the labels, especially when you have a mix of clients in your organization.

If you are not sure how your protection settings are configured, view their settings in the **Protection** blade, in the Azure portal. If you need help with this step, see [To configure a label for protection settings](configure-policy-protection.md#to-configure-a-label-for-protection-settings).

Protection settings that behave the same way are not listed in the table, with the following exceptions:
- When you use Office apps with built-in labeling, labels are not visible in File Explorer unless you also install the Azure Information Protection unified labeling client.
- When you use Office apps with built-in labeling, if protection was previously applied independently from a label, that protection is preserved [[1]](#footnote-1).

|Protection setting for a label |Azure Information Protection client (classic) |Azure Information Protection unified labeling client| Office apps with built-in labeling
|-------------------|-----------------------------------|-----------------------------------------------------------|---------------
|Azure (cloud key) with user-defined permissions for Word, Excel, PowerPoint, and File Explorer:| Visible in Word, Excel, PowerPoint, and File Explorer <br /><br /> When the label is applied:<br /><br /> - Users are prompted for custom permissions that are then applied as protection using a cloud-based key| Visible in Word, Excel, PowerPoint, and File Explorer <br /><br /> When the label is applied:<br /><br /> - Users are prompted for custom permissions that are then applied as protection using a cloud-based key|Visible in Word, Excel, PowerPoint, and Outlook: <br /><br /> When the label is applied:<br /><br /> - Users are not prompted for custom permissions and no protection is applied <br /><br /> - If protection was previously applied independently from a label, that protection is preserved [[1]](#footnote-1)|
|HYOK (AD RMS) with a template:| Visible in Word, Excel, PowerPoint, Outlook, and File Explorer<br /><br /> When this label is applied: <br /><br />- HYOK protection is applied to documents and emails | Visible in Word, Excel, PowerPoint, Outlook, and File Explorer  <br /><br /> When this label is applied: <br /><br />- No protection is applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved |Visible in Word, Excel, PowerPoint, and Outlook <br /><br /> When this label is applied: <br /><br />- No protection is applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved [[1]](#footnote-1) |
|HYOK (AD RMS) with user-defined permissions for Word, Excel, PowerPoint, and File Explorer:| Visible in Word, Excel, PowerPoint, and File Explorer<br /><br /> When this label is applied:<br /><br /> - HYOK protection is applied to documents and emails| Visible in Word, Excel, and PowerPoint <br /><br /> When this label is applied: <br /><br />- Protection is not applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved|Visible in Word, Excel, and PowerPoint <br /><br /> When this label is applied: <br /><br />- Protection is not applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved |
|HYOK (AD RMS) with user-defined permissions for Outlook:|Visible in Outlook<br /><br />When this label is applied:<br /><br />- Do Not Forward using HYOK protection is applied to emails|Visible in Outlook<br /><br />When this label is applied:<br /><br /> - Protection is not applied and removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved|Visible in Outlook<br /><br />When this label is applied:<br /><br />- Protection is not applied and removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved [[1]](#footnote-1)|

###### Footnote 1

In Outlook for Mac, protection is preserved with one exception: When an email has been protected with the Encrypt-Only option, that protection is removed.


###### Footnote 2

Protection is removed if the user has a usage right or role that supports this action:
- The [usage right](configure-usage-rights.md#usage-rights-and-descriptions) Export or Full Control.
- The role of [Rights Management issuer or Rights Management owner](configure-usage-rights.md#rights-management-issuer-and-rights-management-owner), or [super user](configure-super-users.md).

If the user doesn't have one of these usage rights or roles, the label is not applied and the original protection is preserved.


## To migrate Azure Information Protection labels

Use the following instructions to migrate your tenant and Azure Information Protection labels to use the unified labeling store.

You must be a Compliance administrator, Compliance data administrator, Security administrator, or Global administrator to migrate your labels.

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** blade.
    
    For example, on the hub menu, click **All services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. From the **Manage** menu option, select **Unified labeling**.

3. On the **Azure Information Protection - Unified labeling** blade, select **Activate** and follow the online instructions.
    
    If the option to activate is not available, check the **Unified labeling status**: If you see **Activated**, your tenant is already using the unified labeling store and there is no need to migrate your labels.

For the labels that successfully migrated, they can now be used by [clients and services that support unified labeling](#clients-and-services-that-support-unified-labeling). However, you must first publish these labels in one of the admin centers: Office 365 Security & Compliance Center, Microsoft 365 security center, or Microsoft 365 compliance center.

> [!IMPORTANT]
> If you edit the labels outside the Azure portal, for Azure Information Protection clients (classic), return to this **Azure Information Protection - Unified labeling** blade, and select **Publish**.

### Clients and services that support unified labeling

To confirm whether the clients and services you use support unified labeling, refer to their documentation to check whether they can use sensitivity labels that are published from one of the admin centers: Office 365 Security & Compliance Center, Microsoft 365 security center, or Microsoft 365 compliance center. 

##### Clients that currently support unified labeling include:

- The [Azure Information Protection unified labeling client for Windows](./rms-client/unifiedlabelingclient-version-release-history.md). For a comparison of this client with the Azure Information Protection client (classic), see [Compare the clients](./rms-client/use-client.md#compare-the-clients).

- Apps from Office that are in different stages of availability. For more information, see the **Where the feature is available today?** section from [Apply sensitivity labels to your documents and email within Office](https://support.office.com/en-us/article/apply-sensitivity-labels-to-your-documents-and-email-within-office-2f96e7cd-d5a4-403b-8bd7-4cc636bae0f9) in the Office documentation.
    
- Apps from software vendors and developers that use the [Microsoft Information Protection SDK](https://docs.microsoft.com/en-us/information-protection/develop/overview).

##### Services that currently support unified labeling include:

- Microsoft Defender Advanced Threat Protection

- Microsoft Cloud App Security
    
    This service supports labels both before the migration to the unified labeling store, and after the migration, using the following logic:
    
    - If the admin centers have the same labels as those in the Azure portal: Unified labels are retrieved from the admin centers. To select these labels in Cloud App Security, at least one label must be published to at least one user.
    
    - If the admin centers don't have the same labels as those in the Azure portal: Unified labels are not used from the admin centers, and instead, labels are retrieved from the Azure portal.

- Services from software vendors and developers that use the [Microsoft Information Protection SDK](https://docs.microsoft.com/en-us/information-protection/develop/overview).

## Next steps

For additional guidance and tips from our Customer Experience team, see the following blog post: [Understanding Unified Labeling Migration](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Understanding-Unified-Labeling-migration/ba-p/783185).

For more information about your migrated labels that can now be configured and published in one of the admin centers, see [Overview of sensitivity labels](/Office365/SecurityCompliance/sensitivity-labels).

If you haven't already done so, install the Azure Information Protection unified labeling client. For release information, an admin guide, and user guide, see [Azure Information Protection unified labeling client for Windows](./rms-client/aip-clientv2.md).
