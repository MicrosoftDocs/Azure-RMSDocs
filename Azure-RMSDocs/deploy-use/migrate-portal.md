---
# required metadata

title: Migrating from the Azure classic portal - AIP
description: At-a-glance admin tasks in the Azure portal that you used to do in the Azure classic portal
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 09/20/2017
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

Used to the Azure classic portal for managing the Azure Rights Management service and need some help transitioning to the Azure portal? 

Use the following information to help you get up and running quickly.

|Task in the Azure classic portal|Use the Azure portal
|-----------|--------------------|
|Activate and deactivate the Rights Management service|From the **MANAGE** menu options, select **RMS Settings** or **Protection activation**. This option is in the process of being renamed.<br /><br />For more information, see [How to activate Azure Rights Management from the Azure portal](activate-azure.md).
|Create a new template|Create a label that applies protection, and use **Set permissions** to define the permissions, expiration, and offline access. <br /><br />For more information, see [To create a new template](configure-policy-templates.md#to-create-a-new-template).
|Edit a template name, description, usage rights, expiration, and offline access settings|Change the label name and description, and then change the protection settings on the label to update the permissions, expiration, and offline access settings.<br /><br />For more information, see [To create a new template](configure-policy-templates.md#to-create-a-new-template).
|Archive a template|Set the labels status to **Disabled**.
|Create a scoped template|Create a scoped policy and create a label in this scope that applies protection. <br /><br />For more information, see [How to configure the Azure Information Protection policy for specific users by using scoped policies](configure-policy-scope.md).
|Copy a template|You can't copy a template in the Azure portal. If you want two labels to have the same protection settings, you must set the permissions on each label. <br /><br />For more information, see [To configure a label for Rights Management protection](configure-policy-protection.md#to-configure-a-label-for-rights-management-protection).
|Delete a template|Deleting templates can result in inaccessible data, so the Azure portal doesn't support this action. You can delete the label and then use the PowerShell [Remove-AadrmTemplate](/powershell/module/aadrm/remove-aadrmtemplate) cmdlet to remove the template. <br /><br />For more information, see [How to delete or reorder a label for Azure Information Protection](configure-policy-delete-reorder.md).
|Multi-language support|From the **MANAGE** menu selection, select **Languages (Preview)** to export the customizable fields that include the template name and description. Translate the strings, and then import these into the portal. <br /><br />For more information, see [How to configure labels and templates for different languages in Azure Information Protection](configure-policy-languages.md).
|Rights Management web reports|Use the PowerShell [Get-AadrmUsageLog](/powershell/module/aadrm/Get-AadrmUsageLog) cmdlet to download usage logs for the Azure Rights Management service. You can then use this data to create customized reports. However, look out for announcements on the [Enterprise Mobility and Security Blog](https://blogs.technet.microsoft.com/enterprisemobility/?product=azure-information-protection) for a new, centralized reporting solution for Azure Information Protection. <br /><br />For more information, see [Logging and analyzing usage of the Azure Rights Management service](log-analyze-usage.md).


## See also
[Configuring and managing templates in the Azure Information Protection policy](../deploy-use/configure-policy-templates.md)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]