---
# required metadata

title: Migrate Azure Information Protection labels to the Office 365 Security & Compliance Center - AIP
description: Migrate Azure Information Protection labels to the Office 365 Security & Compliance Center for client that support unified labeling. 
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 03/20/2019
ms.topic: article
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: demizets
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How to migrate Azure Information Protection labels to the Office 365 Security & Compliance Center

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

> [!IMPORTANT]
> This feature is in preview, and migrates your tenant to a new platform. The migration cannot be reversed. The new platform supports unified labeling so that labels that you create and manage can be used by clients and services that support [Microsoft Information Protection solutions](faqs.md#whats-the-difference-between-azure-information-protection-and-microsoft-information-protection).

Migrate your labels if you want to be able to use them as Office 365 sensitivity labels from the Office 365 Security & Compliance Center, to be used by [clients and services that support unified labeling](#clients-and-services-that-support-unified-labeling). After the migration, the Azure Information Protection client continues to download the labels with their Azure Information Protection policy from the Azure portal. 

Before you read detailed instructions about how to migrate your labels, you might find the following frequently asked questions useful:

- [What’s the difference between labels in Azure Information Protection and labels in Office 365?](faqs.md#whats-the-difference-between-labels-in-azure-information-protection-and-labels-in-office-365)

- [When is the right time to migrate my labels to Office 365?](faqs.md#when-is-the-right-time-to-migrate-my-labels-to-office-365)

- [After I've migrated my labels, which management portal do I use?](faqs.md?#after-ive-migrated-my-labels-which-management-portal-do-i-use )

### Important information about administrative roles

The [Azure AD roles](/azure/active-directory/active-directory-assign-admin-roles-azure-portal) of **Security Administrator** and **Information Protection Administrator** are not supported by the unified labeling platform. If these administrative roles are used in your organization, before you migrate your labels, add the users who have these roles to the **Compliance Administrator** or the **Organization Management** role groups for the Office 365 Security & Compliance Center. As an alternative, you can create a new role group for these users and add either **Retention Management** or **Organization Configuration** roles to this group. For instructions, see [Give users access to the Office 365 Security & Compliance Center](https://docs.microsoft.com/office365/securitycompliance/grant-access-to-the-security-and-compliance-center).

If you do not give these users access to the Security & Compliance Center by using one of these configurations, they will lose access to labels and policies in the Azure portal after your labels are migrated.

Global administrators for your tenant can continue to manage labels and policies in both the Azure portal and the Security & Compliance Center after your labels are migrated.


## Considerations for unified labels

Before you migrate your labels, make sure that you are aware of the following changes and considerations:

- Not all clients currently support unified labels. Make sure that you have [supported clients](#clients-and-services-that-support-unified-labeling) and be prepared for administration in both the Azure portal (for clients that don't support unified labels) and the Security & Compliance Center (for client that do support unified labels).

- If you are in the middle of defining and configuring the labels that you want to use, we recommend that you complete this process by using the Azure portal, and then migrate the labels. This strategy avoids duplicating labels during the migration process, that will then need to be edited in the Security & Compliance Center.

- Policies, including policy settings and who has access to them (scoped policies), and all advanced client settings are not migrated. For these changes that are not migrated, you will need to configure the relevant options in the Security & Compliance Center after the labels are migrated.
    
    For a more consistent user experience, we recommend you publish the same labels in the same scopes in the Security & Compliance Center.

- Not all settings from a migrated label are supported by the Security & Compliance Center. Use the table in the [Label settings that are not supported in the Security & Compliance Center](#label-settings-that-are-not-supported-in-the-security--compliance-center) section to help you identify these settings and the recommended course of action.

- Protection templates:
    
    - Templates that use a cloud-based key and that are part of a label configuration are also migrated with the label. Other protection templates are not migrated. 
    
    - If you have labels that are configured for a predefined template, edit these labels and select the **Set permissions** option to configure the same protection settings that you had in your template. Labels with predefined templates will not block label migration but this label configuration is not supported in the Security & Compliance Center.
    
    To help you reconfigure these labels, you might find it useful to have two browser windows: One window in which you select the **Edit Template** button for the label to view the protection settings, and the other window to configure the same settings when you select **Set permissions**.
    
    - After a label with cloud-based protection settings has been migrated, the resulting scope of the protection template is the scoped that is defined in the Azure portal (or by using the AADRM PowerShell module) and the scope that is defined in the Security & Compliance Center. 

- When you migrate your labels, you will see the migration results display whether a label was **created**, **updated**, or **renamed** because of duplication:

    - When a label is created, you must then publish it in the Security & Compliance Center to make it available to applications and services.
    
    - When a label is renamed, you must then edit it, which you can do in the Security & Compliance Center or the Azure portal. 

- For each label, the Azure portal displays only the label display name, which you can edit. The Security & Compliance Center shows both this display name for a label, and the label name. The label name is the initial name that you specified when the label was first created and this property is used by the back-end service for identification purposes.

- Any localized strings for the labels are not migrated. You must define new localized strings for the migrated labels in the Security & Compliance Center.

- After the migration, when you edit a migrated label in the Azure portal, the same change is automatically reflected in the Security & Compliance Center. However, when you edit a migrated label in the Security & Compliance Center, you must return to the Azure portal, **Azure Information Protection - Unified labeling** blade, and select **Publish**. This additional action is needed for Azure Information Protection clients to pick up the label changes.

### Label settings that are not supported in the Security & Compliance Center

Use the following table to identify which configuration settings of a migrated label are not supported by the Security & Compliance Center. If you have labels with these settings, when the migration is complete, use the administration guidance in the final column before you publish your labels in the Office 365 Security & Compliance Center.

Azure Information Protection clients can use all label settings listed without any problems because they continue to download the labels from the Azure portal.

|Label configuration|Supported by unified labeling clients| Guidance for the Security & Compliance Center|
|-------------------|---------------------------------------------|-------------------------|
|Status of enabled or disabled<br /><br />Notes: Not synchronized to the Security & Compliance Center |Not applicable|The equivalent is whether the label is published or not. |
|Label color that you select from list or specify by using RGB code |Yes|No configuration option for label colors. Instead, you can configure label colors in the Azure portal.|
|Cloud-based protection or HYOK-based protection using a predefined template |No|No configuration option for predefined templates. We do not recommend you publish a label with this configuration.|
|Cloud-based protection using user-defined permissions for Word, Excel, and PowerPoint |No|No configuration option for user-defined permissions for these Office apps. We do not recommend you publish a label with this configuration. If you do, the results of applying the label are listed in the [following table](#comparing-the-behavior-of-protection-settings-for-a-label).|
|HYOK-based protection using user-defined permissions for Outlook (Do Not Forward) |No|No configuration option for HYOK. We do not recommend you publish a label with this configuration. If you do, the results of applying the label are listed in the [following table](#comparing-the-behavior-of-protection-settings-for-a-label).|
|Remove protection |No|No configuration option to remove protection. We do not recommend you publish a label with this configuration.<br /><br /> If you do publish this label, when it is applied, protection will be removed if was previously applied by a label. If protection was previously applied independently from a label, the protection is preserved.|
|Custom font and custom font color by RGB code for visual markings (header, footer, watermark)|Yes|Configuration for visual markings is limited to a list of colors and font sizes. You can publish this label without changes although you cannot see the configured values in the Security & Compliance Center. <br /><br />To change these options, you can use the Azure portal. However, for easier administration, consider changing the color to one of the listed options in the Security & Compliance Center.|
|Variables in visual markings (header, footer)|No|If you publish this label without changes, variables display as text on clients rather than display the dynamic values. Before you publish the label, edit the strings to remove the variables.|
|Visual markings per app|No|If you publish this label without changes, the app variables display as text on clients in all apps rather than display your text strings on chosen apps. Publish this label only if it is suitable for all apps, and edit the strings to remove the app variables.|
|Conditions and associated settings <br /><br />Notes: Includes automatic and recommended labeling, and their tooltips|Not applicable|Reconfigure your conditions by using auto labeling as a separate configuration from label settings.|

### Comparing the behavior of protection settings for a label

Use the following table to identify how the same protection setting for a label behaves differently, depending on whether it's used by the Azure Information Protection client (general availability versions and current preview version), the current preview version of the Azure Information Protection unified labeling client, or by Office apps that have labeling built in (also known as "native Office labeling"). 

Protection settings that behave the same way are not listed.

|Protection setting for a label |Azure Information Protection client|Azure Information Protection unified labeling client| Office apps with built in labeling
|-------------------|-----------------------------------|-----------------------------------------------------------|---------------
|Azure (cloud key) with user-defined permissions for Word, Excel, PowerPoint, and File Explorer:| Visible in Word, Excel, PowerPoint, and File Explorer <br /><br /> When the label is applied:<br /><br /> - Users are prompted for custom permissions that are then applied as protection using a cloud-based key| Not visible |Visible in Word, Excel, PowerPoint, and Outlook: <br /><br /> When the label is applied:<br /><br /> - Users are not prompted for custom permissions and no protection is applied <br /><br /> - If protection was previously applied independently from a label, that protection is preserved [[1]](#footnote-1)|
|HYOK (AD RMS) with a template:| Visible in Word, Excel, PowerPoint, Outlook, and File Explorer<br /><br /> When this label is applied: <br /><br />- HYOK protection is applied to documents and emails | Visible in Word, Excel, PowerPoint, Outlook, and File Explorer  <br /><br /> When this label is applied: <br /><br />- No protection is applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved |Visible in Word, Excel, PowerPoint, and Outlook <br /><br /> When this label is applied: <br /><br />- No protection is applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved [[1]](#footnote-1) |
|HYOK (AD RMS) with user-defined permissions for Word, Excel, PowerPoint, and File Explorer:| Visible in Word, Excel, PowerPoint and File Explorer<br /><br /> When this label is applied:<br /><br /> - HYOK protection is applied to documents and emails| Visible in Word, Excel, and PowerPoint <br /><br /> When this label is applied: <br /><br />- Protection is not applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved|Visible in Word, Excel, and PowerPoint <br /><br /> When this label is applied: <br /><br />- Protection is not applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved |
|HYOK (AD RMS) with user-defined permissions for Outlook:|Visible in Outlook<br /><br />When this label is applied:<br /><br />- Do Not Forward using HYOK protection is applied to emails|Visible in Outlook<br /><br />When this label is applied:<br /><br /> - Protection is not applied and removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved|Visible in Outlook<br /><br />When this label is applied:<br /><br />- Protection is not applied and removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved [[1]](#footnote-1)|

###### Footnote 1

In Outlook for Mac, protection is preserved with one exception: When an email has been protected with the Encrypt-Only option, that protection is removed.


###### Footnote 2

Protection is removed if the user has a usage right or role that supports this action:
- The [usage right](configure-usage-rights.md#usage-rights-and-descriptions) Export or Full Control.
- The role of [Rights Management issuer or Rights Management owner](configure-usage-rights.md#rights-management-issuer-and-rights-management-owner), or [super user](configure-super-users.md).

If the user doesn't have one of these usage rights or roles, the label is not applied and the original protection is preserved.


## To migrate Azure Information Protection labels

Use the following instructions to migrate your tenant and Azure Information Protection labels to use the new unified labeling store.

You must be a global administrator to migrate your labels.

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** blade.
    
    For example, on the hub menu, click **All services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. From the **Manage** menu option, select **Unified labeling (Preview)**.

3. On the **Azure Information Protection - Unified labeling** blade, select **Activate** and follow the online instructions.

For the labels that successfully migrated, they can now be used by [clients and services that support unified labeling](#clients-and-services-that-support-unified-labeling). However, you must first publish these labels in the Security & Compliance Center.

> [!IMPORTANT]
> If you edit the labels outside the Azure portal, for Azure Information Protection clients, return to this **Azure Information Protection - Unified labeling** blade, and select **Publish**.

### Clients and services that support unified labeling

To confirm whether the clients and services you use support unified labeling, refer to their documentation to check whether they can use sensitivity labels that are published from the Office 365 Security & Compliance Center. 

##### Clients that currently support unified labeling include:

- The [Azure Information Protection unified labeling client for Windows](./rms-client/unifiedlabelingclient-version-release-history.md) - in preview

- Apps from Office that are in different stages of availability. For more information, see the **Where the feature is available today?** section from [Apply sensitivity labels to your documents and email within Office](https://support.office.com/en-us/article/apply-sensitivity-labels-to-your-documents-and-email-within-office-2f96e7cd-d5a4-403b-8bd7-4cc636bae0f9) in the Office documentation.
    
- Apps from software vendors and developers that use the [Microsoft Information Protection SDK](https://docs.microsoft.com/en-us/information-protection/develop/overview).

##### Services that currently support unified labeling include:

- Windows Defender Azure Threat Protection

- Microsoft Cloud App Security
    
    This service supports labels both before the migration to the unified labeling store, and after the migration, using the following logic:
    
    - If the Office 365 Security & Compliance Center has the same labels as those in the Azure portal: Unified labels are retrieved from the Office 365 Security & Compliance Center. To select these labels in Cloud App Security, at least one label must be published to at least one user.
    
    - If the Office 365 Security & Compliance Center doesn't have the same labels as those in the Azure portal: Unified labels are not used from the Office 365 Security & Compliance Center, and instead, labels are retrieved from the Azure portal.

- Services from software vendors and developers that use the [Microsoft Information Protection SDK](https://docs.microsoft.com/en-us/information-protection/develop/overview).

## Next steps

For more information about your migrated labels that can now be configured and published in the Office 365 Security & Compliance Center, see [Overview of sensitivity labels](/Office365/SecurityCompliance/sensitivity-labels).

To read the announcement blog post: [Announcing the availability of unified labeling management in the Security & Compliance Center](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Announcing-the-availability-of-unified-labeling-management-in/ba-p/262492).
