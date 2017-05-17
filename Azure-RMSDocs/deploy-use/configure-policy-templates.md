---
# required metadata

title: Configure and manage templates in the Azure Information Protection policy
description: Currently in preview, you can now configure and manage rights management templates from the Azure Information Protection policy. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/22/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 8301aabb-047d-4892-935c-7574f6af8813

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Configuring and managing templates in the Azure Information Protection policy

>*Applies to: Azure Information Protection*

>[!NOTE]
>This functionality is currently in preview. For production environments, continue to create and manage [custom templates from the Azure classic portal](configure-custom-templates.md). 
>
>If you test this preview capability with custom templates that you use in production, consider whether you have a recent backup of your templates. You can back up your custom templates by using the [Export-​Aadrm​Template](/powershell/module/aadrm/export-aadrmtemplate) PowerShell cmdlet, and if necessary, use the [Import-​Aadrm​Template](/powershell/module/aadrm/import-aadrmtemplate) to restore them. 

Rights management templates are now integrated with the Azure Information Protection policy. Templates that are not configured for a scope are included in the global policy, which is applied to all users. Departmental templates (templates that are configured for a scope) are included as a scoped policy.

**When you have a subscription that includes classification, labeling, and protection (Azure Information Protection P1 or P2):**

- Right management templates for your tenant are displayed in the new **Templates** section after the labels. You can convert these templates to labels or you can continue to manage them as templates that you include in the configuration of your labels. 

**When you have a subscription that includes protection only (an Office 365 subscription that includes the Azure Rights Management service):**

- Right management templates for your tenant are displayed as labels and all configuration settings that are specific to classification and labeling are not available. 

## Considerations for templates in the Azure portal

Before you edit these templates or convert them to labels in the Azure portal, be aware of the following:

- After you edit or convert a template and save the Azure Information Protection policy, the following changes are made to the original [usage rights](configure-usage-rights.md). If required, you can add or remove individual usage rights by using PowerShell with the [New-​Aadrm​Rights​Definition](/powershell/module/aadrm/set-aadrmtemplateproperty) and [Set-​Aadrm​Template​Property](/powershell/module/aadrm/new-aadrmrightsdefinition) cmdlets.
    
    - **Save As, Export** (common name) is removed. In the Azure portal, you cannot manually specify this usage right but it is included with the Full Control usage right, which you can add if appropriate.
    
    - **Allow Macros** (common name) is automatically added. This usage right is required for the Azure Information Protection bar in Office apps.
    
- The default templates are not displayed and cannot be edited or converted. However, they are still available to select for labels and by users and services.

- You cannot copy a template.

- Templates that were configured for languages by using the Azure classic portal or PowerShell retain those languages and localized strings for the name and descriptions. However, these languages are not automatically displayed as a supported language in the **Languages** blade. To change the localized templates names and descriptions, you must add the languages and export the Azure Information Protection policy, as if you are specifying these languages for the first time.

- **Published** and **Archived** settings display as **Enabled**: **On** and **Enabled**: **Off** respectively on the **Label** blade.

- You cannot set the Application compatibility setting for a departmental template. If necessary, you can set this by using PowerShell with the [Set-​Aadrm​Template​Property](/powershell/module/aadrm/set-aadrmtemplateproperty) cmdlet.


## To configure the templates in the Azure Information Protection policy

1. In a new browser window, sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin.

2. Navigate to the **Azure Information Protection** blade: For example, on the hub menu, click **More services** and start typing **Information Protection** in the Filter box. From the results, select **Azure Information Protection**. 

2. If the template that you want to configure will apply to all users, select **Global** from the **Azure Information Protection** blade. However, if the template that you want to configure is in a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, select that scoped policy instead.

3. On the policy blade, locate the template that you want to configure:
    
    - When you have a subscription that includes classification, labeling, and protection: Expand **Templates** after your labels.
    
    - When you have a subscription that includes protection only: Templates display as labels.

4. Select the template, and on the **Label** blade, you can change the template name and description if required, by editing the **Label name** and **Description**. Then, select **Protection** that has a value of **Azure RMS**, to open the **Protection** blade.

5. On the **Protection** blade, you can change the permissions, content expiration, and offline access settings. Click **OK** to keep your changes, and on the **Label** blade, click **Save**.

6. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## To convert templates to labels

When you have a subscription that includes classification, labeling, and protection, you can convert a template to a label. To do this, right-click the template, and select **Convert to label**. Alternatively, use the context-menu to select this option.

When you convert a template to a label:

- The name of the template is converted to a new label name, and the template description is converted to the label tooltip. If the template was published (**Enabled**: **On**) it now displays as this label to users when you next publish the Azure Information Protection policy.

- The protection settings are retained, and you can edit these if required, and also add other label settings such as visual markers and conditions.

- The original template is no longer displayed under **Templates**. However, it remains available as published to users and services to ensure service continuity. 

There is no requirement to convert all your templates to labels, but when you do, the protection settings are fully integrated with the full functionality of labels rather than maintaining them separately.

Do not convert templates to labels if you need to maintain them for users or services that depend on rights management templates. For example:

- Users who have a subscription for protection only and do not have a subscription for classification and labeling.

- Exchange Online DLP and mail flow rules that use Azure Rights Management protection.

- The Rights Management connector for Windows Server FCI, or scripts that use the Protect-RMSFile cmdlet for protecting files non-interactively.


## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
