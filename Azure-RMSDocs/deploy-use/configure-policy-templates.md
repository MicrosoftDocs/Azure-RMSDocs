---
# required metadata

title: Configure and manage templates in the Azure Information Protection policy
description: Currently in preview, you can now configure and manage rights management templates from the Azure Information Protection policy. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/23/2017
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
>This functionality is currently in preview and subject to frequent changes. For custom templates that you use in production environments, continue to create and manage them from the [Azure classic portal](configure-custom-templates.md). 
>
>Before you test this preview capability with custom templates that you created in the Azure classic portal, consider whether you have a recent backup of your templates. You can back up your custom templates by using the [Export-​Aadrm​Template](/powershell/module/aadrm/export-aadrmtemplate) PowerShell cmdlet, and if necessary, use the [Import-​Aadrm​Template](/powershell/module/aadrm/import-aadrmtemplate) to restore them.
>
>Because of differences in implementation, we do not recommend that you manage the same templates from the Azure classic portal and the Azure portal.


Rights management templates are now integrated with the Azure Information Protection policy. 

**When you have a subscription that includes classification, labeling, and protection (Azure Information Protection P1 or P2):**

- Rights management templates for your tenant are displayed in the new **Templates** section after the labels. You can convert these templates to labels or you can continue to manage them as separate templates and link to them when you configure protection for your labels. 

**When you have a subscription that includes protection only (an Office 365 subscription that includes the Azure Rights Management service):**

- Right management templates for your tenant are displayed as labels and currently, configuration settings that are specific to classification and labeling are also available. 


## Considerations for templates in the Azure portal

Before you edit these templates or convert them to labels in the Azure portal, be aware of the following changes in implementation from managing templates in the Azure classic portal. Some limitations are expected to be addressed during the preview:

- After you edit or convert a template and save the Azure Information Protection policy, the following changes are made to the original [usage rights](configure-usage-rights.md). If required, you can add or remove individual usage rights by using PowerShell with the [New-​Aadrm​Rights​Definition](/powershell/module/aadrm/set-aadrmtemplateproperty) and [Set-​Aadrm​Template​Property](/powershell/module/aadrm/new-aadrmrightsdefinition) cmdlets.
    
    - **Save As, Export** (common name) is removed. In the Azure portal, you cannot manually specify this usage right but it is included with the Full Control usage right, which you can add if appropriate.
    
    - **Allow Macros** (common name) is automatically added. This usage right is required for the Azure Information Protection bar in Office apps.
    
- Currently, the default templates are not displayed and cannot be edited or converted. However, they are still available to select for labels and by users and services.

- You cannot copy or delete a template. To remove a template, use the PowerShell [Remove-AadrmTemplate](/powershell/module/aadrm/remove-aadrmtemplate) cmdlet. 

- Currently, templates that were configured for languages by using the Azure classic portal or PowerShell do not retain those languages for the name and descriptions.

- **Published** and **Archived** settings display as **Enabled**: **On** and **Enabled**: **Off** respectively on the **Label** blade.

- Departmental templates (templates that are configured for a scope) display in the Global policy. Currently, if you edit and save a departmental template, it removes the scope configuration. The equivalent of a scoped template in the Azure Information Protection policy is a [scoped policy](configure-policy-scope.md). If you convert the template to a label, you can select an existing scope.
    
    In addition, you cannot currently set the Application compatibility setting for a departmental template. If necessary, you can set this by using PowerShell with the [Set-​Aadrm​Template​Property](/powershell/module/aadrm/set-aadrmtemplateproperty) cmdlet.


## To configure the templates in the Azure Information Protection policy

1. In a new browser window, sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin.

2. Navigate to the **Azure Information Protection** blade: For example, on the hub menu, click **More services** and start typing **Information Protection** in the Filter box. From the results, select **Azure Information Protection**. 

2. If the template that you want to configure will apply to all users, select **Global** from the **Azure Information Protection** blade. However, if the template that you want to configure is in a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, select that scoped policy instead.

3. On the policy blade, locate the template that you want to configure:
    
    - When you have a subscription that includes classification, labeling, and protection: Expand **Templates** after your labels.
    
    - When you have a subscription that includes protection only: Templates display as labels.

4. Select the template, and on the **Label** blade, you can change the template name and description if required, by editing the **Label name** and **Description**. Then, select **Protection** that has a value of **Azure RMS**, to open the **Protection** blade.

5. On the **Protection** blade, you can change the permissions, content expiration, and offline access settings. For more information about configuring the protection settings, see [How to configure a label for Rights Management protection](configure-policy-protection.md)
    
    Click **OK** to keep your changes, and on the **Label** blade, click **Save**.

6. To make your changes available to users, on the **Azure Information Protection** blade, click **Publish**.

## To convert templates to labels

When you have a subscription that includes classification, labeling, and protection, you can convert a template to a label. When you do this, the original template is retained but in the Azure portal, it now displays as included in a new label.

For example, if you convert a label named **Marketing** that grants usage rights to the marketing group, in the Azure portal it will display as a label named **Marketing** that has the same protection settings. If you now change the protection settings in this newly created label, you're changing them in the template and any user or service that uses this template will get the new protection settings with the next template refresh. 

There is no requirement to convert all your templates to labels, but when you do, the protection settings are fully integrated with the full functionality of labels so that you do not have to maintain the settings separately.

To convert a template into a label, right-click the template, and select **Convert to label**. Alternatively, use the context-menu to select this option.

When you convert a template to a label:

- The name of the template is converted to a new label name, and the template description is converted to the label tooltip. If the template was published, this setting maps to **Enabled**: **On** for the label, which now displays as this label to users when you next publish the Azure Information Protection policy. If the template was archived, this setting maps to **Enabled**: **Off** for the label and does not display as an available label to users.

- The protection settings are retained, and you can edit these if required, and also add other label settings such as visual markers and conditions.

- The original template is no longer displayed under **Templates** and to edit it in the Azure portal, you now edit the label that was created. The template remains available for the Azure Rights Management service, and can still be managed by using [PowerShell commands](administer-powershell.md).  


## Next steps

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
