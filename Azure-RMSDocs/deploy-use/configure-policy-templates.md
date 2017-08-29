---
# required metadata

title: Configure and manage templates for Azure Information Protection
description: Configure and manage rights management templates from the Azure portal. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/30/2017
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

# Configuring and managing templates for Azure Information Protection

>*Applies to: Azure Information Protection*

>[!NOTE]
>This functionality replaces configuring custom templates in the Azure classic portal.
>
>Although you can still create and manage templates in the Azure classic portal, we do not recommend that you manage the same templates from the Azure classic portal and the Azure portal. The implementation for configuring templates in these different portals has changed, so configuring the same template in different portals can result in an unreliable configuration.


Rights Management templates are now integrated with the Azure Information Protection policy. 

**When you have a subscription that includes classification, labeling, and protection (Azure Information Protection P1 or P2):**

- Rights Management templates that are not integrated with your labels for your tenant are displayed in the **Templates** section after the labels in the **Azure Information Protection - Global policy** blade. You can convert these templates to labels, or you can link to them when you configure protection for your labels. 

**When you have a subscription that includes protection only (an Office 365 subscription that includes the Azure Rights Management service):**

- Rights Management templates for your tenant are displayed in the **Azure Information Protection - Global policy** blade, in the **Templates** section. No labels are displayed. You also see configuration settings that are specific to classification and labeling but these either have no effect on your templates or cannot be configured. 

## Default templates

When you obtain your subscription for Azure Information Protection or for an Office 365 subscription that includes the Azure Rights Management service, two default templates are automatically created for your tenant that restrict access to authorized users in your organization. When these two templates are created, they have the following restrictions: 

- Read or Modify permissions for the protected content
    
    - **Specific permissions**: View Content, Save File, Edit Content, View Assigned Rights, Allow Macros, Forward, Reply, Reply All

- Read-only viewing for the protected content
    
    - **Specific permission**: View Content

In addition, the templates are configured to allow offline access for seven days and do not have an expiration date.

>[!NOTE]
> You can change these settings, and the names and descriptions of the default templates. This ability was not possible with the Azure classic portal and remains unsupported for PowerShell.

These default templates make it easy for you and others to immediately start protecting your organization's sensitive data. These templates can be used with Azure Information Protection labels, or by themselves with [applications and services](../understand-explore/applications-support.md) that can use Rights Management templates.

You can also create your own custom templates. Although you probably require only a few templates, you can have a maximum of 500 custom templates saved in Azure.

### Default template names

If you recently obtained a subscription for Azure Information Protection, your default templates are created with the following names:

- **Confidential \ All Employees** for Read or Modify permissions for the protected content.

- **Highly Confidential \ All Employees** for Read-only viewing for the protected content.

If you obtained your Azure Information Protection subscription some time ago, or if you don't have an Azure Information Protection subscription but have an Office 365 subscription that includes Azure Rights Management, your default templates are created with the following names:

- **\<organization name> - Confidential** for Read or Modify permissions for the protected content.

- **\<organization name> - Confidential View Only**, for Read-only viewing for the protected content. 

You can rename (and reconfigure) these default templates when you use the Azure portal.

>[!NOTE]
>If you don't see your default templates in the **Azure Information Protection - Global policy** blade, they are converted to labels, or linked to a label. They still exist as templates, but in the Azure portal, you see them as part of a label configuration that includes Azure RMS protection. You can always confirm what templates your tenant has, by running the [Get-AadrmTemplate](/powershell/module/aadrm/get-aadrmtemplate) from the [AADRM PowerShell module](administer-powershell.md).
>
>You can manually convert templates, as explained in the later section, [To convert templates to labels](#to-convert-templates-to-labels), and then rename them if you want. Or they will be converted automatically for you if your default Azure Information Protection policy was recently created and the Azure Rights Management service for your tenant was activated at that time.

Templates that are archived display as unavailable in the **Azure Information Protection - Global policy** blade. These templates cannot be selected for labels but they can be converted to labels.

## Considerations for templates in the Azure portal

Before you edit these templates or convert them to labels, make sure that you are aware of the following changes and considerations. Because of implementation changes, the following list is especially important if you previously managed templates in the Azure classic portal.

- After you edit or convert a template and save the Azure Information Protection policy, the following changes are made to the original [usage rights](configure-usage-rights.md). If required, you can add or remove individual usage rights by using PowerShell with the [New-​Aadrm​Rights​Definition](/powershell/module/aadrm/set-aadrmtemplateproperty) and [Set-​Aadrm​Template​Property](/powershell/module/aadrm/new-aadrmrightsdefinition) cmdlets.
    
    - **Save As, Export** (common name) is removed. In the Azure portal, you cannot manually specify this usage right but it is included with the Full Control usage right, which you can add if appropriate.
    
    - **Allow Macros** (common name) is automatically added. This usage right is required for the Azure Information Protection bar in Office apps.
    

- **Published** and **Archived** settings display as **Enabled**: **On** and **Enabled**: **Off** respectively on the **Label** blade. For templates that you want to retain but not be visible to users or services, set them to **Enabled**: **Off**.

- You cannot copy or delete a template in the Azure portal. When the template is converted to a label, you can configure the label to stop using the template by selecting  **Not configured** for the **Set permissions for documents and emails containing this label** option. Or, you can delete the label. In both scenarios however, the template is not deleted and remains in an archived state.
    
    You could now delete the template by using the PowerShell [Remove-AadrmTemplate](/powershell/module/aadrm/remove-aadrmtemplate) cmdlet. You can also use this PowerShell cmdlet for templates that are not converted to labels. However, if you delete a template that has been used to protect content, that content can no longer be opened. Delete templates only if you are sure they were not used to protect documents or emails in production. As a precaution, you might want to consider first exporting the template as a back up, by using the [Export-AadrmTemplate](/powershell/module/aadrm/export-aadrmtemplate) cmdlet. 

- Departmental templates (templates that are configured for a scope) display in the Global policy. Currently, if you edit and save a departmental template, it removes the scope configuration. The equivalent of a scoped template in the Azure Information Protection policy is a [scoped policy](configure-policy-scope.md). If you convert the template to a label, you can select an existing scope.
    
    In addition, you cannot currently set the application compatibility setting for a departmental template. If necessary, you can set this by using PowerShell with the [Set-​Aadrm​Template​Property](/powershell/module/aadrm/set-aadrmtemplateproperty) cmdlet.

- When you convert or link a template to a label, it can no longer be used by other labels. It no longer displays under the **Templates** container.

- You do not create a new template from the **Templates** container. Instead, create a label that has the **Protect** setting, and configure the usage rights and settings from the **Protection** blade. For full instructions, see [To create a new template](#to-create-a-new-template).

## To configure the templates in the Azure Information Protection policy

1. If you haven't already done so, open a new browser window and sign in to the [Azure portal](https://portal.azure.com) as a security admin or global admin. Then navigate to the **Azure Information Protection** blade. 
    
    For example, on the hub menu, click **More services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. If the template that you want to configure is for all users, stay on the **Azure Information Protection - Global policy** blade.
    
    If the template that you want to configure is in a [scoped policy](configure-policy-scope.md) so that it applies to selected users only, from the **POLICIES** menu selection, select **Scoped policies**. Then select your scoped policy from the **Azure Information Protection - Scoped polices** blade.

3. From the **Azure Information Protection - Global policy** blade, or the **Policy:\<name>** blade, locate the template that you want to configure:
    
    - When you have a subscription that includes classification, labeling, and protection: Expand **Templates** after your labels.
    
    - When you have a subscription that includes protection only: Templates display as labels.

4. Select the template, and on the **Label** blade, you can change the template name and description if required, by editing the **Label name** and **Description**. Then, select **Protection** that has a value of **Azure RMS**, to open the **Protection** blade.

5. On the **Protection** blade, you can change the permissions, content expiration, and offline access settings. For more information about configuring the protection settings, see [How to configure a label for Rights Management protection](configure-policy-protection.md)
    
    Click **OK** to keep your changes, and on the **Label** blade, click **Save**.

6. To make your changes available to user applications and services, on the initial **Azure Information Protection** blade, click **Publish**.

> [!NOTE]
> You can also edit a template by using the **Edit Template** button on the **Protection** blade if you have configured a label to use a predefined template. Providing no other label also uses the selected template, this button converts the template into a label, and takes you to step 5. For more information about what happens when templates are converted to labels, see the next section.

## To convert templates to labels

When you have a subscription that includes classification, labeling, and protection, you can convert a template to a label. When you do this, the original template is retained but in the Azure portal, it now displays as included in a new label.

For example, if you convert a label named **Marketing** that grants usage rights to the marketing group, in the Azure portal it now displays as a label named **Marketing** that has the same protection settings. If you change the protection settings in this newly created label, you're changing them in the template and any user or service that uses this template will get the new protection settings with the next template refresh. 

There is no requirement to convert all your templates to labels, but when you do, the protection settings are fully integrated with the full functionality of labels so that you do not have to maintain the settings separately.

To convert a template into a label, right-click the template, and select **Convert to label**. Alternatively, use the context-menu to select this option. 

You can also convert a template to a label when you configure a label for protection and a predefined template, by using the **Edit Template** button. 

When you convert a template to a label:

- The name of the template is converted to a new label name, and the template description is converted to the label tooltip. 

- If the status of the template was published, this setting maps to **Enabled**: **On** for the label, which now displays as this label to users when you next publish the Azure Information Protection policy. If the the status of the template was archived, this setting maps to **Enabled**: **Off** for the label and does not display as an available label to users.

- The protection settings are retained, and you can edit these if required, and also add other label settings such as visual markers and conditions.

- The original template is no longer displayed under **Templates** and cannot be selected as a predefined template when you configure protection for a label. To edit this template in the Azure portal, you now edit the label that was created when you converted the template. The template remains available for the Azure Rights Management service, and can still be managed by using [PowerShell commands](administer-powershell.md).  

## To create a new template

When you create a new label with the protection setting of **Azure RMS**, under the covers, this creates a new custom template that can then be accessed by services and applications that integrate with Rights Management templates.

1. If the new template is for all users, stay on the **Azure Information Protection - Global policy** blade.
    
     If the new template will be a departmental template so that it applies to selected users only, from the **POLICIES** menu selection, select **Scoped policies**. Then create or select your [scoped policy](configure-policy-scope.md) from the **Azure Information Protection - Scoped polices** blade.

2. From the **Azure Information Protection - Global policy** blade, or the **Policy:\<name>** blade, click  **Add a new label**.

3. On the **Label** blade, keep the default of **Enabled**: **On** to publish this new template, or change this setting to **Off** to create the template as archived. Then enter a label name and description for the template name and description.

4. For **Set permissions for documents and emails containing this label**, select **Protect**, and then select **Protection**:
    
     ![Configure protection for an Azure Information Protection label](../media/info-protect-protection-bar.png)

5. On the **Protection** blade, you can change the permissions, content expiration, and offline access settings. For more information about configuring these protection settings, see [How to configure a label for Rights Management protection](configure-policy-protection.md)
    
    Click **OK** to keep your changes, and on the **Label** blade, click **Save**.

6. To make these templates available to user applications and services, on the initial **Azure Information Protection** blade, click **Publish**.


## Next steps

As with all changes to the Azure Information Protection policy, it can take up to 15 minutes for a computer running the Azure Information Protection client to complete downloading these templates. For information about how computers and services download and refresh templates, see [Refreshing templates for users and services](refresh-templates.md).

Everything that you can configure in the Azure portal to create and manage your templates, you can do by using PowerShell. In addition, PowerShell provides more options that are not available in the portal. For more information, see [PowerShell reference for protection templates](configure-templates-with-powershell.md). 

For more information about configuring your Azure Information Protection policy, use the links in the [Configuring your organization's policy](configure-policy.md#configuring-your-organizations-policy) section.  

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
