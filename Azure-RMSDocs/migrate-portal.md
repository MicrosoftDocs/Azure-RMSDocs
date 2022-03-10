---
# required metadata

title: Migrating from the Azure classic portal - AIP
description: At-a-glance admin tasks in the Azure portal that you used to do in the Azure classic portal
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 03/16/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 57a1073c-02e0-441b-bf49-c6b72fdba24f
ROBOTS: NOINDEX


# optional metadata

#audience:
#ms.devlang:
ms.reviewer: demizets
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---


# Tasks that you used to do with the Azure classic portal

>***Applies to**: Azure Information Protection, [Office 365](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4Dz8M)*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see [Learn about sensitivity labels](/microsoft-365/compliance/sensitivity-labels) from the Microsoft 365 documentation.*

[!INCLUDE [AIP classic client is sunset](includes/classic-client-sunset.md)]
>

Used to the Azure classic portal for managing the Azure Rights Management service, and need some help transitioning to the Azure portal?

The Azure classic portal retired **January 08, 2018**. After this date, you will not be able to manage the Azure Rights Management service and custom templates from the classic portal. If you try to access the classic portal, you see a link that takes you to the new Azure portal.

For more information about the classic portal retirement, see the blog post announcement: [Marching into the future of the Azure AD admin experience: retiring the Azure classic portal](https://cloudblogs.microsoft.com/enterprisemobility/2017/09/18/marching-into-the-future-of-the-azure-ad-admin-experience-retiring-the-azure-classic-portal/). For the temporary extension to the original retirement date, see [Update on retirement of Azure AD classic portal experience and migration of conditional access policies](https://cloudblogs.microsoft.com/enterprisemobility/2017/11/29/update-on-retirement-of-azure-ad-classic-portal-experience-and-migration-of-conditional-access-policies/).

## How to do your familiar admin tasks

Use the following information to help you quickly transition to the current portal.

|Azure classic portal|How to do this task in the Azure portal
|-----------|--------------------|
|Access the configuration settings for the first time|1. [Sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal).<br /><br />2. Follow the instructions for [To access the Azure Information Protection pane for the first time](configure-policy.md#to-access-the-azure-information-protection-pane-for-the-first-time).
|Create a new template|Create a label that applies protection, and use **Set permissions** to define the permissions, expiration, and offline access. <br /><br />Under the covers, this configuration creates a new custom template that can then be accessed by services and applications that integrate with Rights Management templates.<br /><br />For more information, see [To create a new template](configure-policy-templates.md#to-create-a-new-template).
|Edit the template properties: <br /><br />- Template name and description<br /><br />- Usage rights, content expiration, and offline access settings|If you haven't already done so, [convert the template to a label](configure-policy-templates.md#to-convert-templates-to-labels), and then do the following<br /><br />1. Change the label name and description<br /><br />2. Change the protection settings on the label to update the permissions, expiration, and offline access settings.<br /><br />For more information, see [To configure a label for protection settings](configure-policy-protection.md#to-configure-a-label-for-protection-settings).
|Archive a template|Set the label status to **Disabled**.
|Create a scoped template|Create a scoped policy and create a label in this scope that applies protection. <br /><br />For more information, see [How to configure the Azure Information Protection policy for specific users by using scoped policies](configure-policy-scope.md).
|Copy a template|You can't copy a template in the Azure portal. If you want two labels to have the same protection settings, you must set the permissions on each label. <br /><br />For more information, see [To configure a label for protection settings](configure-policy-protection.md#to-configure-a-label-for-protection-settings).
|Delete a template|Deleting templates can result in inaccessible data, so the Azure portal doesn't support this action. However, you can delete the label and then use the PowerShell [Remove-AipServiceTemplate](/powershell/module/aipservice/remove-aipservicetemplate) cmdlet to remove the template. <br /><br />For more information, see [How to delete or reorder a label for Azure Information Protection](configure-policy-delete-reorder.md).
|Multi-language support|From the **Manage** menu selection, select **Languages** to export the customizable fields that include the template name and description. Translate the strings, and then import these strings into the portal. <br /><br />For more information, see [How to configure labels and templates for different languages in Azure Information Protection](configure-policy-languages.md).
|Rights Management web reports|[Centralized reporting for Azure Information Protection](reports-aip.md) is now in preview.<br /><br />You can also use the PowerShell [Get-AipServiceUsageLog](/powershell/module/aipservice/get-aipserviceuserlog) cmdlet to download usage logs for the Azure Rights Management service. You can then use this data to create customized reports. For more information, see [Logging and analyzing the protection usage from Azure Information Protection](log-analyze-usage.md).
|Activate and deactivate the Rights Management service|From the **Manage** menu options, select **Protection activation**.<br /><br />For more information, see [How to activate the Rights Management protection service from the Azure portal](/azure/information-protection/activate-service#activate-protection-from-the-azure-portalactivate-protection-from-the-azure-portal).

Before you edit your templates or convert them to labels in the Azure portal, see [Considerations for templates in the Azure portal](configure-policy-templates.md#considerations-for-templates-in-the-azure-portal).


## What else has changed

New functionality in the Azure portal:

- You can edit the [default templates](configure-policy-templates.md#default-templates) that are automatically created for your organization.

- You can convert templates to labels, so that you manage a single object rather than manage a template and label independently. For instructions, see [To convert templates to labels](configure-policy-templates.md#to-convert-templates-to-labels).

- Support for other admin roles: Whereas you had to sign in to the Azure classic portal as a Global administrator to configure Azure Rights Management, you can sign in to the Azure portal to manage Azure Information Protection by using many other administrative roles that include **Compliance administrator** and **Compliance data administrator**. The full list of roles supported are included in the [Signing in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal) section.

The PowerShell cmdlets to create and manage templates, and to activate or deactivate the service, remain supported without changes.

## See also
For more detailed information, see [Configuring and managing templates in the Azure Information Protection policy](configure-policy-templates.md).