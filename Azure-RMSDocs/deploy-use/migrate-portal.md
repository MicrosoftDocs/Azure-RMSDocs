---
# required metadata

title: Migrating from the Azure classic portal - AIP
description: At-a-glance admin tasks in the Azure portal that you used to do in the Azure classic portal
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 09/19/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 57a1073c-02e0-441b-bf49-c6b72fdba24f

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: demizets
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Tasks that you used to do with the Azure classic portal

>*Applies to: Azure Information Protection, Office 365*

Used to the Azure classic portal for managing the Azure Rights Management service, and need some help transitioning to the Azure portal? 

> [!NOTE]
> The Azure classic portal will be retired on **November 30, 2017**. For more information, see the blog post announcement: [Marching into the future of the Azure AD admin experience: retiring the Azure classic portal](https://blogs.technet.microsoft.com/enterprisemobility/2017/09/18/marching-into-the-future-of-the-azure-ad-admin-experience-retiring-the-azure-classic-portal/).

Use the following information to help you get up and running quickly with the newer portal.

|Azure classic portal|How to do this task in the Azure portal
|-----------|--------------------|
|Create a new template|Create a label that applies protection, and use **Set permissions** to define the permissions, expiration, and offline access. <br /><br />Under the covers, this configuration creates a new custom template that can then be accessed by services and applications that integrate with Rights Management templates.<br /><br />For more information, see [To create a new template](configure-policy-templates.md#to-create-a-new-template).
|Edit the template properties: <br /><br />- Template name and description<br /><br />- Usage rights, content expiration, and offline access settings|If you haven't already done so, [convert the template to a label](configure-policy-templates.md#to-convert-templates-to-labels), and then do the following<br /><br />1. Change the label name and description<br /><br />2. Change the protection settings on the label to update the permissions, expiration, and offline access settings.<br /><br />For more information, see [To configure a label for Rights Management protection](configure-policy-protection.md#to-configure-a-label-for-rights-management-protection).
|Archive a template|Set the label status to **Disabled**.
|Create a scoped template|Create a scoped policy and create a label in this scope that applies protection. <br /><br />For more information, see [How to configure the Azure Information Protection policy for specific users by using scoped policies](configure-policy-scope.md).
|Copy a template|You can't copy a template in the Azure portal. If you want two labels to have the same protection settings, you must set the permissions on each label. <br /><br />For more information, see [To configure a label for Rights Management protection](configure-policy-protection.md#to-configure-a-label-for-rights-management-protection).
|Delete a template|Deleting templates can result in inaccessible data, so the Azure portal doesn't support this action. However, you can delete the label and then use the PowerShell [Remove-AadrmTemplate](/powershell/module/aadrm/remove-aadrmtemplate) cmdlet to remove the template. <br /><br />For more information, see [How to delete or reorder a label for Azure Information Protection](configure-policy-delete-reorder.md).
|Multi-language support|From the **MANAGE** menu selection, select **Languages (Preview)** to export the customizable fields that include the template name and description. Translate the strings, and then import these strings into the portal. <br /><br />For more information, see [How to configure labels and templates for different languages in Azure Information Protection](configure-policy-languages.md).
|Rights Management web reports|Use the PowerShell [Get-AadrmUsageLog](/powershell/module/aadrm/Get-AadrmUsageLog) cmdlet to download usage logs for the Azure Rights Management service. You can then use this data to create customized reports. <br /><br />For more information, see [Logging and analyzing usage of the Azure Rights Management service](log-analyze-usage.md).<br /><br />Tip: Look out for announcements on the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-information-protection) for a new, centralized reporting solution for Azure Information Protection. 
|Activate and deactivate the Rights Management service|From the **MANAGE** menu options, select **RMS Settings** or **Protection activation**. This option is in the process of being renamed.<br /><br />For more information, see [How to activate Azure Rights Management from the Azure portal](activate-azure.md).

Before you edit your templates or convert them to labels in the Azure portal, see [Considerations for templates in the Azure portal](configure-policy-templates.md#considerations-for-templates-in-the-azure-portal).


New functionality in the Azure portal:

- You can edit the [default templates](configure-policy-templates.md#default-templates) that are automatically created for your organization.

- You can convert templates to labels, so that you manage a single object rather than manage a template and label independently. For instructions, see [To convert templates to labels](configure-policy-templates.md#to-convert-templates-to-labels).

The [PowerShell cmdlets](configure-templates-with-powershell.md) to create and manage templates remain supported without changes.


## See also
For more detailed information, see [Configuring and managing templates in the Azure Information Protection policy](../deploy-use/configure-policy-templates.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]