---
# required metadata

title: Administering the Azure Rights Management service by using Windows PowerShell | Azure Information Protection
description: Learn how you can use the Windows PowerShell module for the Azure Rights Management service (AADRM) for Azure Information Protection, to administer this service for your organization.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/30/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: a890e04a-4b70-41b5-8d5f-3c210a669faa

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Administering the Azure Rights Management service by using Windows PowerShell

>*Applies to: Azure Information Protection, Office 365*

Although you can activate the Azure Rights Management service for Azure Information Protection by using the [!INCLUDE[o365_2](../includes/o365_2_md.md)] admin center or the Azure classic portal, you can also use the Windows PowerShell module for [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] (AADRM) to do this.

When the Azure Rights Management service is activated, further administration for the service might not be required. However, some advanced configuration scenarios might require you to use the Windows PowerShell module for [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)]. The following table lists some of the advanced configuration scenarios that use Windows PowerShell. For a complete list of the available cmdlets with more information about each one, see [Azure Rights Management Cmdlets](http://msdn.microsoft.com/library/azure/dn629398.aspx).

> [!NOTE]
> If you need to install the Windows PowerShell module for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)], see [Installing Windows PowerShell for Azure Rights Management](install-powershell.md).

The Azure Information Protection client installs a supplemental Windows PowerShell module, **AIP**, which supports Azure Information Protection, the Azure Rights Management service (Azure RMS), and Active Directory Rights Management Services (AD RMS). This module supports classifying and protecting multiple files so that, for example, you can bulk-protect all files in a folder. This module replaces the RMSProtection module that shipped with the RMS Protection Tool. For more information, see [Using PowerShell with the Azure Information Protection client](../rms-client/client-admin-guide-powershell.md) from the admin guide, and [Scripting options for super users](configure-super-users.md#scripting-options-for-super-users) section in the [Configuring super users for Azure Rights Management and discovery services or data recovery](configure-super-users.md) article.

|If you need to…|…use the following cmdlets|
|-------------------|------------------------------|
|Migrate from on-premises Rights Management (AD RMS or Windows RMS) to Azure Information Protection.|[Import-AadrmTpd](http://msdn.microsoft.com/library/azure/dn857523.aspx)|
|Connect to or disconnect from the [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] service for your organization.|[Connect-AadrmService](http://msdn.microsoft.com/library/azure/dn629415.aspx)<br /><br />[Disconnect-AadrmService](http://msdn.microsoft.com/library/azure/dn629416.aspx)|
|Generate and manage your own tenant key – the bring your own key (BYOK) scenario.|[Use-AadrmKeyVaultKey](https://msdn.microsoft.com/library/azure/mt759829.aspx)<br /><br />[Get-AadrmKeys](http://msdn.microsoft.com/library/azure/dn629420.aspx)|
|Activate or deactivate the [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] service for your organization.|[Enable-Aadrm](http://msdn.microsoft.com/library/azure/dn629412.aspx)<br /><br />[Disable-Aadrm](http://msdn.microsoft.com/library/azure/dn629422.aspx)|
|Disable or enable the document tracking site for Azure Information Protection.|[Disable-AadrmDocumentTrackingFeature](https://msdn.microsoft.com/library/azure/mt548471.aspx)<br /><br />[Enable-AadrmDocumentTrackingFeature](https://msdn.microsoft.com/library/azure/mt548469.aspx)<br /><br />[Get-AadrmDocumentTrackingFeature](https://msdn.microsoft.com/library/azure/mt548470.aspx)|
|Configure onboarding controls for a phased deployment of the Azure Rights Management service.|[Get-AadrmOnboardingControlPolicy](http://msdn.microsoft.com/library/azure/dn857522.aspx)<br /><br />[Set-AadrmOnboardingControlPolicy](http://msdn.microsoft.com/library/azure/dn857521.aspx)|
|Create and manage rights policy templates for your organization.|[Add-AadrmTemplate](http://msdn.microsoft.com/library/azure/dn727075.aspx)<br /><br />[Export-AadrmTemplate](http://msdn.microsoft.com/library/azure/dn727078.aspx)<br /><br />[Get-AadrmTemplate](http://msdn.microsoft.com/library/azure/dn727079.aspx)<br /><br />[Get-AadrmTemplateProperty](http://msdn.microsoft.com/library/azure/dn727081.aspx)<br /><br />[Import-AadrmTemplate](http://msdn.microsoft.com/library/azure/dn727077.aspx)<br /><br />[New-AadrmRightsDefinition](http://msdn.microsoft.com/library/azure/dn727080.aspx)<br /><br />[Remove-AadrmTemplate](http://msdn.microsoft.com/library/azure/dn727082.aspx)<br /><br />[Set-AadrmTemplateProperty](http://msdn.microsoft.com/library/azure/dn727076.aspx)|
|Configure the maximum number of days that content that your organization protects can be accessed without an Internet connection (the use license validity period).|[Get-AadrmMaxUseLicenseValidityTime](https://msdn.microsoft.com/library/azure/dn932062.aspx)<br /><br />[Set-AadrmMaxUseLicenseValidityTime](https://msdn.microsoft.com/library/azure/dn932063.aspx)|
|Manage the super user feature of [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] for your organization.|[Enable-AadrmSuperUserFeature](https://msdn.microsoft.com/library/azure/dn629400.aspx)<br /><br />[Disable-AadrmSuperUserFeature](https://msdn.microsoft.com/library/azure/dn629428.aspx)<br /><br />[Add-AadrmSuperUser](http://msdn.microsoft.com/library/azure/dn629411.aspx)<br /><br />[Get-AadrmSuperUser](https://msdn.microsoft.com/library/azure/dn629408.aspx)<br /><br />[Remove-AadrmSuperUser](https://msdn.microsoft.com/library/azure/dn629405.aspx)<br /><br />[Set-AadrmSuperUserGroup](https://msdn.microsoft.com/library/azure/mt653943.aspx)<br /><br />[Get-AadrmSuperUserGroup](https://msdn.microsoft.com/library/azure/mt653942.aspx)<br /><br />[Clear-AadrmSuperUserGroup](https://msdn.microsoft.com/library/azure/mt653944.aspx)|
|Manage users and groups who are authorized to administer the [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] service for your organization.|[Add-AadrmRoleBasedAdministrator](http://msdn.microsoft.com/library/azure/dn629417.aspx)<br /><br />[Get-AadrmRoleBasedAdministrator](https://msdn.microsoft.com/library/azure/dn629407.aspx)<br /><br />[Remove-AadrmRoleBasedAdministrator](https://msdn.microsoft.com/library/azure/dn629424.aspx)|
|Get a log of [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] administrative tasks for your organization.|[Get-AadrmAdminLog](https://msdn.microsoft.com/library/azure/dn629430.aspx)|
|Log and analyze usage logging for [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)].|[Get-AadrmUserLog](https://msdn.microsoft.com/library/azure/mt653941.aspx)|
|Display the current [!INCLUDE[aad_rightsmanagement_2](../includes/aad_rightsmanagement_2_md.md)] service configuration for your organization.|[Get-AadrmConfiguration](http://msdn.microsoft.com/library/azure/dn629410.aspx)|
|Migrate your organization from Azure Information Protection to an on-premises AD RMS deployment.|[Set-AadrmMigrationUrl](https://msdn.microsoft.com/library/azure/dn629429.aspx)<br /><br />[Get-AadrmMigrationUrl](http://msdn.microsoft.com/library/azure/dn629403.aspx)|

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


