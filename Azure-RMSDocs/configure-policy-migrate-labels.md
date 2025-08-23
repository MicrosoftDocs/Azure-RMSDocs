---
# required metadata

title: Migrate Azure Information Protection labels to unified sensitivity labels - AIP
description: Migrate Azure Information Protection labels to unified sensitivity labels for clients and services that support the Microsoft Purview Information Protection framework. 
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 04/06/2021
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


Migrate Azure Information Protection labels to the unified labeling platform so that you can use them as sensitivity labels by [clients and services that support unified labeling](#clients-and-services-that-support-unified-labeling).

> [!NOTE]
> If your Azure Information Protection subscription is fairly new, you might not need to migrate labels because your tenant is already on the unified labeling platform. 

After you migrate your labels, you won't see any difference with the Azure Information Protection classic client, because this client continues to download the labels with the Azure Information Protection policy from the Azure portal. However, you can now use the labels with the Azure Information Protection unified labeling client and other clients and services that use sensitivity labels.

Before you read the instructions to migrate your labels, you might find the following frequently asked questions useful:

- [What's the difference between labeling with the built-in labeling solution and labeling with the AIP Office add-in?](rms-client/use-client.md#whats-the-difference-between-labeling-with-the-built-in-labeling-solution-and-labeling-with-the-aip-office-add-in)

## Administrative roles that support the unified labeling platform

If you use admin roles for delegated administration in your organization, you might need to do some changes for the unified labeling platform:

The [Microsoft Entra role](/azure/active-directory/active-directory-assign-admin-roles-azure-portal) of **Azure Information Protection administrator** (formerly **Information Protection administrator**) is not supported by the unified labeling platform. If this administrative role is used in your organization to manage Azure Information Protection, add the users who have this role to the Microsoft Entra roles of **Compliance administrator**, **Compliance data administrator**, or **Security administrator**. If you need help with this step, see [Give users access to the Microsoft Purview compliance portal](/microsoft-365/security/office-365-security/grant-access-to-the-security-and-compliance-center). You can also assign these roles in the Microsoft Entra admin center and the Microsoft Purview compliance portal.

Alternatively to using roles, in the Microsoft Purview compliance portal, you can create a new role group for these users and add either **Sensitivity Label Administrator** or **Organization Configuration** roles to this group.

If you do not give these users access to the Microsoft Purview compliance portal by using one of these configurations, they won't be able to configure Azure Information Protection in the Azure portal after your labels are migrated.

Global administrators for your tenant can continue to manage labels and policies in both the Azure portal and the Microsoft Purview compliance portal after your labels are migrated.

## Before you begin

Label migration has many benefits, but is irreversible. Before you migrate, make sure that you are aware of the following changes and considerations:

- [Client support for unified labeling](#client-support-for-unified-labeling)
- [Policy configuration](#policy-configuration)
- [Protection templates](#protection-templates)
- [Display names](#display-names)
- [Localized strings in labels](#localized-strings-in-labels)
- [Editing migrated labels in the Microsoft Purview compliance portal](#editing-migrated-labels-in-the-microsoft-purview-compliance-portal)
- [Label settings that are not supported in the Microsoft Purview compliance portal](#label-settings-that-are-not-supported-in-the-microsoft-purview-compliance-portal)
- [Comparing the behavior of protection settings for a label](#comparing-the-behavior-of-protection-settings-for-a-label)

### Client support for unified labeling

Make sure that you have [clients that support unified labels](#clients-and-services-that-support-unified-labeling) and if necessary, be prepared for administration in both the Azure portal (for clients that don't support unified labels) and the Microsoft Purview compliance portal (for client that do support unified labels).

### Policy configuration

Policies, including policy settings and who has access to them (scoped policies), and all advanced client settings are not migrated. Your options to configure these settings after your label migration include the following:

- The Microsoft Purview compliance portal
- [Security & Compliance PowerShell](/powershell/exchange/office-365-scc/office-365-scc-powershell), which you must use to [configure advanced client settings](rms-client/clientv2-admin-guide-customizations.md#configuring-advanced-settings-for-the-client-via-powershell).

> [!IMPORTANT]
> Not all settings from a migrated label are supported by the Microsoft Purview compliance portal. Use the table in the [Label settings that are not supported in the Microsoft Purview compliance portal](#label-settings-that-are-not-supported-in-the-microsoft-purview-compliance-portal) section to help you identify these settings and the recommended course of action.
>

### Protection templates

- Templates that use a cloud-based key and that are part of a label configuration are also migrated with the label. Other protection templates are not migrated.

- If you have labels that are configured for a predefined template, edit these labels and select the **Set permissions** option to configure the same protection settings that you had in your template. Labels with predefined templates will not block label migration but this label configuration is not supported in the Microsoft Purview compliance portal.

    > [!TIP]
    > To help you reconfigure these labels, you might find it useful to have two browser windows: One window in which you select the **Edit Template** button for the label to view the protection settings, and the other window to configure the same settings when you select **Set permissions**.

- After a label with cloud-based protection settings has been migrated, the resulting scope of the protection template is the scoped that is defined in the Azure portal (or by using the AIPService PowerShell module) and the scope that is defined in theMicrosoft Purview compliance portal.

### Display names

For each label, the Azure portal displays only the label display name, which you can edit. Users see this label name in their apps.

The Microsoft Purview compliance portal shows both this display name for a label, and the label name. The label name is the initial name that you specify when the label is first created and this property is used by the back-end service for identification purposes. When you migrate your labels, the display name remains the same and the label name is renamed to the label ID from the Azure portal.

#### Conflicting display names

Before migrating, ensure that you would not have conflicting display names after migration is complete. Display names in the same place in the labeling hierarchy must be unique.

For example, consider the following list of labels:

- **Public**
- **General**
- **Confidential**
    - **Confidential\HR**
    - **Confidential\Finance**
- **Secret**
    - **Secret\HR**
    - **Secret\Finance**

In this list, **Public**, **General**, **Confidential**, and **Secret** are all parent labels, and cannot have duplicate names. Additionally, **Confidential\HR** and **Confidential\Finance** are at the same place in the hierarchy, and also cannot have duplicate names.

However, sub-labels across different parents, such as **Confidential\HR** and **Secret\HR** are not at the same place in the hierarchy, and therefore can have the same individual names.

### Localized strings in labels

Any localized strings for the labels are not migrated. Define new localized strings for the migrated labels by using Security & Compliance PowerShell and the *LocaleSettings* parameter for [Set-Label](/powershell/module/exchange/policy-and-compliance/set-label).

### Editing migrated labels in the Microsoft Purview compliance portal

After the migration, when you edit a migrated label in the Azure portal, the same change is automatically reflected in the Microsoft Purview compliance portal.

However, when you edit a migrated label in the Microsoft Purview compliance portal, you must return to the Azure portal, **Azure Information Protection - Unified labeling** pane, and select **Publish**.

This additional action is needed for the Azure Information Protection clients (classic) to pick up the label changes.

### Label settings that are not supported in the Microsoft Purview compliance portal

Use the following table to identify which configuration settings of a migrated label are not supported by the Microsoft Purview compliance portal. If you have labels with these settings, when the migration is complete, use the administration guidance in the final column before you publish your labels in the Microsoft Purview compliance portal.

If you are not sure how your labels are configured, view their settings in the Azure portal. If you need help with this step, see [Configuring the Azure Information Protection policy](/previous-versions/azure/information-protection/configure-policy).

Azure Information Protection clients (classic) can use all label settings listed without any problems because they continue to download the labels from the Azure portal.

|Label configuration|Supported by unified labeling clients| Guidance for the Microsoft Purview compliance portal|
|-------------------|---------------------------------------------|-------------------------|
|**Status of enabled or disabled**<br /><br />This status is not synchronized to the Microsoft Purview compliance portal |Not applicable|The equivalent is whether the label is published or not. |
|**Label color that you select from list or specify by using RGB code** |Yes|No configuration option for label colors. Instead, you can configure label colors in the Azure portal or use [PowerShell](./rms-client/clientv2-admin-guide-customizations.md#specify-a-color-for-the-label).|
|**Cloud-based protection or HYOK-based protection using a predefined template** |No|No configuration option for predefined templates. We do not recommend you publish a label with this configuration.|
|**Cloud-based protection using user-defined permissions for Word, Excel, and PowerPoint** |Yes|The Microsoft Purview compliance portal supports a configuration option for user-defined permissions. <br /><br /> If you publish a label with this configuration, check the results of applying the label from the [following table](#comparing-the-behavior-of-protection-settings-for-a-label).|
|**HYOK-based protection using user-defined permissions for Outlook** (Do Not Forward) |No|No configuration option for HYOK. We do not recommend you publish a label with this configuration. If you do, the results of applying the label are listed in the [following table](#comparing-the-behavior-of-protection-settings-for-a-label).|
|**Custom font name, size, and custom font color by RGB code for visual markings** (header, footer, watermark)  |Yes|Configuration for visual markings is limited to a list of colors and font sizes. You can publish this label without changes although you cannot see the configured values in the Microsoft Purview compliance portal. <br /><br />To change these options, use the [**New-Label**](/powershell/module/exchange/new-label) Office 365 Security & Compliance Center cmdlet. For easier administration, consider changing the color to one of the listed options in the Microsoft Purview compliance portal. <br /><br />**Note**: The Microsoft Purview compliance portal supports a predefined list of font definitions. Custom fonts and colors are supported only via the [**New-Label**](/powershell/module/exchange/new-label) cmdlet. <br><br>If you are working with the classic client, make these changes to your label in the Azure portal.|
|**Variables in visual markings** (header, footer) |Yes|This label configuration is supported by the AIP clients and Office built-in labeling for select apps. <br /><br />If you are working with built-in labeling using an app that does not support this configuration and publish this label without changes, variables display as text on clients, instead of displaying the dynamic value.<br /><br />For more information, see the [Microsoft 365 documentation](/microsoft-365/compliance/sensitivity-labels-office-apps#dynamic-markings-with-variables). |
|**Visual markings per app**|Yes|This label configuration is supported only by the AIP clients, and not by Office built-in labeling. <br /><br />If you are working with built-in labeling, and publish this label without changes, the visual marking configuration displays as variable text instead of the visual markings you've configured to display in each app.  |
|**"Just for me" protection**|Yes|The Microsoft Purview compliance portal do not let you save encryption settings that you apply now, without specifying any users. In the Azure portal, this configuration results in a label that applies ["Just for me" protection](/previous-versions/azure/information-protection/configure-policy-protection#example-6-label-that-applies-just-for-me-protection). <br /><br /> As an alternative, create a label that applies encryption and specify a user with any permissions, and then edit the associated protection template by using PowerShell. First, use the [New-AipServiceRightsDefinition](/powershell/module/aipservice/new-aipservicerightsdefinition) cmdlet (see Example 3), and then [Set-AipServiceTemplateProperty](/powershell/module/aipservice/set-aipservicetemplateproperty#examples) with the *RightsDefinitions* parameter.|
|**Conditions and associated settings** <br /><br /> Includes automatic and recommended labeling, and their tooltips|Not applicable|Reconfigure your conditions by using auto labeling as a separate configuration from label settings.|

### Comparing the behavior of protection settings for a label

Use the following table to identify how the same protection setting for a label behaves differently, depending on whether it's used by the Azure Information Protection classic client, the Azure Information Protection unified labeling client, or by Office apps that have labeling built in (also known as "native Office labeling"). The differences in label behavior might change your decision whether to publish the labels, especially when you have a mix of clients in your organization.

If you are not sure how your protection settings are configured, view their settings in the **Protection** pane, in the Azure portal. If you need help with this step, see [To configure a label for protection settings](/previous-versions/azure/information-protection/configure-policy-protection#to-configure-a-label-for-protection-settings).

Protection settings that behave the same way are not listed in the table, with the following exceptions:

- When you use Office apps with built-in labeling, labels are not visible in File Explorer unless you also install the Azure Information Protection unified labeling client.
- When you use Office apps with built-in labeling, if protection was previously applied independently from a label, that protection is preserved [[1]](#footnote-1).

|Protection setting for a label |Azure Information Protection classic client |Azure Information Protection unified labeling client| Office apps with built-in labeling
|-------------------|-----------------------------------|-----------------------------------------------------------|---------------
|HYOK (AD RMS) with a template:| Visible in Word, Excel, PowerPoint, Outlook, and File Explorer<br /><br /> When this label is applied: <br /><br />- HYOK protection is applied to documents and emails | Visible in Word, Excel, PowerPoint, Outlook, and File Explorer  <br /><br /> When this label is applied: <br /><br />- No protection is applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved |Visible in Word, Excel, PowerPoint, and Outlook <br /><br /> When this label is applied: <br /><br />- No protection is applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved [[1]](#footnote-1) |
|HYOK (AD RMS) with user-defined permissions for Word, Excel, PowerPoint, and File Explorer:| Visible in Word, Excel, PowerPoint, and File Explorer<br /><br /> When this label is applied:<br /><br /> - HYOK protection is applied to documents and emails| Visible in Word, Excel, and PowerPoint <br /><br /> When this label is applied: <br /><br />- Protection is not applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved|Visible in Word, Excel, and PowerPoint <br /><br /> When this label is applied: <br /><br />- Protection is not applied and protection is removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved |
|HYOK (AD RMS) with user-defined permissions for Outlook:|Visible in Outlook<br /><br />When this label is applied:<br /><br />- Do Not Forward using HYOK protection is applied to emails|Visible in Outlook<br /><br />When this label is applied:<br /><br /> - Protection is not applied and removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved|Visible in Outlook<br /><br />When this label is applied:<br /><br />- Protection is not applied and removed [[2]](#footnote-2) if it was previously applied by a label <br /><br />- If protection was previously applied independently from a label, that protection is preserved [[1]](#footnote-1)|

###### Footnote 1

In Outlook, protection is preserved with one exception: When an email has been protected with the encrypt-only option (**Encrypt**), that protection is removed.

###### Footnote 2

Protection is removed if the user has a usage right or role that supports this action:

- The [usage right](configure-usage-rights.md#usage-rights-and-descriptions) Export or Full Control.
- The role of [Rights Management issuer or Rights Management owner](configure-usage-rights.md#rights-management-issuer-and-rights-management-owner), or [super user](/purview/encryption-super-users).

If the user doesn't have one of these usage rights or roles, the label is not applied and the original protection is preserved.

## To migrate Azure Information Protection labels

Use the following instructions to migrate your tenant and Azure Information Protection labels to use the unified labeling store.

You must be a Compliance administrator, Compliance data administrator, Security administrator, or Global administrator to migrate your labels.

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](/previous-versions/azure/information-protection/configure-policy#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** pane.

    For example, in the search box for resources, services, and docs: Start typing **Information** and select **Azure Information Protection**.

2. From the **Manage** menu option, select **Unified labeling**.

3. On the **Azure Information Protection - Unified labeling** pane, select **Activate** and follow the online instructions.

    If the option to activate is not available, check the **Unified labeling status**: If you see **Activated**, your tenant is already using the unified labeling store and there is no need to migrate your labels.

For the labels that successfully migrated, they can now be used by [clients and services that support unified labeling](#clients-and-services-that-support-unified-labeling). However, you must first [publish these labels](/microsoft-365/compliance/create-sensitivity-labels#publish-sensitivity-labels-by-creating-a-label-policy) in the Microsoft Purview compliance portal.

> [!IMPORTANT]
> If you edit the labels outside the Azure portal, for Azure Information Protection clients (classic), return to this **Azure Information Protection - Unified labeling** pane, and select **Publish**.

### Copy policies

After you have migrated your labels, you can select an option to copy policies. If you select this option, a one-time copy of your policies with their [policy settings](/previous-versions/azure/information-protection/configure-policy-settings) and any [advanced client settings](/previous-versions/azure/information-protection/rms-client/client-admin-guide-customizations#available-advanced-classic-client-settings) is sent to the Microsoft Purview compliance portal.

Successfully copied policies with their settings and labels are then automatically published to the users and groups that were assigned to the policies in the Azure portal. Note that for the Global policy, this means all users. If you're not ready for the migrated labels in the copied policies to be published, after the policies are copied, you can remove the labels from the label policies in your admin labeling center.

Before you select the **Copy policies (preview)** option on the **Azure Information Protection - Unified labeling** pane, be aware of the following:

- The **Copy policies (Preview)** option is not available until unified labeling is activated for your tenant.

- You cannot selectively choose policies and settings to copy. All policies (the **Global** policy and any scoped policies) are automatically selected to be copied, and all settings that are supported as label policy settings are copied. If you already have a label policy with the same name, it will be overwritten with the policy settings in the Azure portal.

- Some advanced client settings are not copied because for the Azure Information Protection unified labeling client, these are supported as *label advanced settings* rather than policy settings. You can configure these label advanced settings with [Security & Compliance PowerShell](rms-client/clientv2-admin-guide-customizations.md#configuring-advanced-settings-for-the-client-via-powershell). The advanced client settings that are not copied:

    - [LabelbyCustomProperty](/previous-versions/azure/information-protection/rms-client/client-admin-guide-customizations#migrate-labels-from-secure-islands-and-other-labeling-solutions)
    - [LabelToSMIME](/previous-versions/azure/information-protection/rms-client/client-admin-guide-customizations#configure-a-label-to-apply-smime-protection-in-outlook)

- Unlike label migration where subsequent changes to labels are synchronized, the **Copy policies** action doesn't synchronize any subsequent changes to your policies or policy settings. You can repeat the copy policy action after making changes in the Azure portal, and any existing policies and their settings will be overwritten again. Or, use the Set-LabelPolicy or Set-Label cmdlets with the *AdvancedSettings* parameter from Security & Compliance PowerShell.

- The **Copy policies** action verifies the following for each policy before it is copied:

    - Users and groups assigned to the policy are currently in Microsoft Entra ID. If one or more account is missing, the policy is not copied. Group membership is not checked.

    - The Global policy contains at least one label. Because the admin labeling centers don't support label policies without labels, a Global policy without labels is not copied.

- If you copy policies and then delete them from your admin labeling center, wait at least two hours before you use the **Copy policies** action again to ensure sufficient time for the deletion to replicate.

- Policies copied from Azure Information Protection will not have the same name, they will instead be named with a prefix of **AIP_**. Policy names cannot be subsequently changed.

For more information about configuring the policy settings, advanced client settings, and label settings for the Azure Information Protection unified labeling client, see [Custom configurations for the Azure Information Protection unified labeling client](./rms-client/clientv2-admin-guide-customizations.md) from the admin guide.

> [!NOTE]
> Azure Information Protection support for copying policies is currently in PREVIEW. The [Azure Preview Supplemental Terms](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) include additional legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability. 

### Clients and services that support unified labeling

To confirm whether the clients and services you use support unified labeling, refer to their documentation to check whether they can use sensitivity labels that are published from the Microsoft Purview compliance portal.

##### Clients that currently support unified labeling include

- **The [Azure Information Protection unified labeling client for Windows](/purview/information-protection-client-relnotes)**. For more information, see [Compare Azure Information Protection and MIP built-in labeling](rms-client/use-client.md).

- **Apps from Office that are in different stages of availability**

    For more information, see [Support for sensitivity label capabilities in apps](/microsoft-365/compliance/sensitivity-labels-office-apps#support-for-sensitivity-label-capabilities-in-apps) from the Microsoft 365 Compliance documentation.

- **Apps from software vendors and developers** that use the [Microsoft Information Protection SDK](/information-protection/develop/overview).

##### Services that currently support unified labeling include

- **[Power BI](/power-bi/admin/service-security-data-protection-overview)**

- **[Endpoint data loss prevention (DLP)](/microsoft-365/compliance/endpoint-dlp-getting-started)**

- **Office Online and Outlook on the web**

    For more information, see [Enable sensitivity labels for Office files in SharePoint and OneDrive](/microsoft-365/compliance/sensitivity-labels-sharepoint-onedrive-files).

- **Microsoft SharePoint, OneDrive for work or school, OneDrive for home, Teams, and Microsoft 365 groups**

    For more information, see [Use sensitivity labels to protect content in Microsoft Teams, Microsoft 365 groups, and SharePoint sites](/microsoft-365/compliance/sensitivity-labels-teams-groups-sites).

- **Microsoft Defender for Cloud Apps**

    This service supports labels both before the migration to the unified labeling store, and after the migration, using the following logic:

    - If the Microsoft Purview compliance portal has sensitivity labels, these labels are retrieved from the Microsoft Purview compliance portal. To select these labels in Microsoft Defender for Cloud Apps, at least one label must be published to at least one user.

    - If the Microsoft Purview compliance portal doesn't have sensitivity labels, Azure Information Protection labels are retrieved from the Azure portal.

- **Services from software vendors and developers** that use the [Microsoft Information Protection SDK](/information-protection/develop/overview).

## Management portals to use after migrating your labels

After you've migrated your labels in the Azure portal, continue managing them in one of the following locations, depending on the clients you have installed:

|Client  |Description  |
|---------|---------|
|[Unified labeling clients and services](configure-policy-migrate-labels.md#clients-and-services-that-support-unified-labeling) only    |  If you only have unified labeling clients installed, manage your labels in the Microsoft Purview compliance portal, which is where unified  labeling clients download the labels and their policy settings.<br /><br />For instructions, see [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels).     |
|[Classic client](/previous-versions/azure/information-protection/rms-client/aip-client) only  | If you've migrated your labels, but still have the classic client installed, continue to use the Azure portal to edit labels and policy settings. The classic client continues to download labels and policy settings from Azure.
|Both the AIP [classic client](/previous-versions/azure/information-protection/rms-client/aip-client) and [unified labeling](configure-policy-migrate-labels.md#clients-and-services-that-support-unified-labeling) clients     | If you have both of the clients installed, use the Microsoft Purview compliance portal or the Azure portal to make label changes. <br /><br />For the classic clients to pick up label changes made in the Microsoft Purview compliance portal, return to the Azure portal to publish them. In the Azure portal > **Azure Information Protection - Unified labeling** pane, select **Publish**.  <br /><br /> Continue to use the Azure portal for [central reporting](reports-aip.md) and the [scanner](/microsoft-365/compliance/deploy-scanner).     |
| | |

## Next steps

**Guidance and tips from our Customer Experience team**:

- Blog post: [Understanding Unified Labeling Migration](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Understanding-Unified-Labeling-migration/ba-p/783185)

**About sensitivity labels**:

- [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels)
- [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels).

**Deploy the AIP unified labeling client**:

If you haven't already done so, install the Azure Information Protection unified labeling client.

For more information, see:

- [Azure Information Protection unified labeling client - Version release history and support policy](/purview/information-protection-client-relnotes)
- [Azure Information Protection unified labeling client administrator guide](rms-client/clientv2-admin-guide.md)
- [Azure Information Protection unified labeling user guide](rms-client/clientv2-user-guide.md)
