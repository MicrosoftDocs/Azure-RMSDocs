---
# required metadata

title: Administering protection from Azure Information Protection by using PowerShell
description: Learn how you can use the PowerShell module for the protection service from Azure Information Protection, to administer this service for your tenant.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 09/13/2018
ms.topic: conceptual
ms.service: information-protection
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

# Administering protection from Azure Information Protection by using PowerShell

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Do you need to use PowerShell to administer the protection service from Azure Information Protection? You might not need to if all your configuration can be done in the Azure portal or the Office 365 portal. However, you need to use PowerShell for some advanced configurations and you might also prefer to use PowerShell for more efficient command-line control and scripting.

The table in the next section includes some of the advanced configuration scenarios that use PowerShell. When the configuration can also be completed without using PowerShell, this information is also included in the table.

For a complete list of the available cmdlets for this module, with more information about each one, see [AIP-Service](/powershell/module/aipservice/?view=azureipps#aipservice).

> [!NOTE]
> To install this PowerShell module, see [Installing the AIP-Service PowerShell module](install-powershell.md).

In addition to this service-side PowerShell module, the Azure Information Protection client installs a supplemental PowerShell module, **AzureInformationProtection**. This client module supports classifying and protecting multiple files so that, for example, you can bulk-protect all files in a folder. For more information, see [Using PowerShell with the Azure Information Protection client](./rms-client/client-admin-guide-powershell.md) from the admin guide.

## Cmdlets grouped by administration task

|If you need to…|…use the following cmdlets|
|-------------------|------------------------------|
|Migrate from on-premises Rights Management (AD RMS or Windows RMS) to Azure Information Protection.|[Import-AipServiceTpd](/powershell/aipservice/import-aipservicetpd)<br /><br />[Set-AipServiceKeyProperties](/powershell/module/aipservice/setaipservicekeyproperties)|
|Connect to or disconnect from the Rights Management service for your organization.|[Connect-AipServiceService](/powershell/aipservice/connect-aipservice)<br /><br />[Disconnect-AipServiceService](/powershell/aipservice/disconnect-aipservice)|
|Generate and manage your own tenant key – the bring your own key (BYOK) scenario.|[Set-AipServiceKeyProperties](/powershell/module/aipservice/set-aipservicekeyproperties)<br /><br />[Use-AipServiceKeyVaultKey](/powershell/aipservice/use-aipservicekeyvaultkey)<br /><br />[Get-AipServiceKeys](/powershell/aipservice/get-aipservicekeys)|
|Activate or deactivate the Rights Management service for your organization.<br /><br />You can also do these actions from the management portals. For more information, see [Activating the Azure Rights Management service](activate-service.md).|[Enable-AipService](/powershell/aipservice/enable-aipservice)<br /><br />[Disable-AipService](/powershell/aipservice/disable-aipservice)|
|Manage the document tracking site for Azure Information Protection.|[Disable-AipServiceDocumentTrackingFeature](/powershell/aipservice/disable-aipservicedocumenttrackingfeature)<br /><br />[Enable-AipServiceDocumentTrackingFeature](/powershell/aipservice/enable-aipservicedocumenttrackingfeature)<br /><br />[Get-AipServiceDocumentTrackingFeature](/powershell/aipservice/get-aipservicedocumenttrackingfeature)<br /><br />[Set-AipServiceDoNotTrackUserGroup](/powershell/module/aipservice/set-aipservicedonottrackusergroup)<br /><br />[Clear-AipServiceDoNotTrackUserGroup](/powershell/module/aipservice/Clear-AipServiceDoNotTrackUserGroup)<br /><br />[Get-AipServiceDoNotTrackUserGroup](/powershell/module/aipservice/get-AipServiceDoNotTrackUserGroup)<br /><br />[Get-AipServiceTrackingLog](/powershell/module/aipservice/Get-AipServiceTrackingLog)<br /><br />[Get-AipServiceDocumentLog](/powershell/module/aipservice/Get-AipServiceDocumentLog)|
|Configure onboarding controls for a phased deployment of the Azure Rights Management service.|[Get-AipServiceOnboardingControlPolicy](/powershell/aipservice/get-aipserviceonboardingcontrolpolicy)<br /><br />[Set-AipServiceOnboardingControlPolicy](/powershell/aipservice/set-aipserviceonboardingcontrolpolicy)|
|Create and manage Rights Management templates for your organization.<br /><br />You can also do most of these actions from the Azure portal, although PowerShell offers more fine-grain control. For more information, see [Configuring and managing templates for Azure Information Protection](configure-policy-templates.md).|[Add-AipServiceTemplate](/powershell/aipservice/addaipservicetemplate)<br /><br />[Export-AipServiceTemplate](/powershell/aipservice/export-aipservicetemplate)<br /><br />[Get-AipServiceTemplate](/powershell/aipservice/get-aipservicetemplate)<br /><br />[Get-AipServiceTemplateProperty](/powershell/aipservice/get-aipservicetemplateproperty)<br /><br />[Import-AipServiceTemplate](/powershell/aipservice/import-aipservicetemplate)<br /><br />[New-AipServiceRightsDefinition](/powershell/aipservice/new-aipservicerightsdefinition)<br /><br />[Remove-AipServiceTemplate](/powershell/aipservice/remove-aipservicetemplate)<br /><br />[Set-AipServiceTemplateProperty](/powershell/aipservice/set-aipservicetemplateproperty)|
|Configure the maximum number of days that content that your organization protects can be accessed without an Internet connection (the use license validity period).|[Get-AipServiceMaxUseLicenseValidityTime](/powershell/aipservice/get-aipservicemaxuselicensevaliditytime)<br /><br />[Set-AipServiceMaxUseLicenseValidityTime](/powershell/aipservice/set-aipservicemaxuselicensevaliditytime)|
|Manage the super user feature of Rights Management for your organization.|[Enable-AipServiceSuperUserFeature](/powershell/aipservice/enable-aipservicesuperuserfeature)<br /><br />[Disable-AipServiceSuperUserFeature](/powershell/aipservice/disable-aipservicesuperuserfeature)<br /><br />[Add-AipServiceSuperUser](/powershell/aipservice/add-aipservicesuperuser)<br /><br />[Get-AipServiceSuperUser](/powershell/aipservice/get-aipservicesuperuser)<br /><br />[Remove-AipServiceSuperUser](/powershell/aipservice/remove-aipservicesuperuser)<br /><br />[Set-AAipServiceSuperUserGroup](/powershell/aipservice/set-aipservicesuperusergroup)<br /><br />[Get-AipServiceSuperUserGroup](/powershell/aipservice/get-aipservicesuperusergroup)<br /><br />[Clear-AipServiceSuperUserGroup](/powershell/aipservice/clear-aipservicesuperusergroup)|
|Manage users and groups who are authorized to administer the Rights Management service for your organization.|[Add-Aip-ServiceRoleBasedAdministrator](/powershell/aipservice/add-Aip-Servicerolebasedadministrator)<br /><br />[Get-Aip-ServiceRoleBasedAdministrator](/powershell/aipservice/get-Aip-Servicerolebasedadministrator)<br /><br />[Remove-Aip-ServiceRoleBasedAdministrator](/powershell/aipservice/remove-Aip-Servicerolebasedadministrator)|
|Get a log of Rights Management administrative tasks for your organization.|[Get-AipServiceAdminLog](https://msdn.microsoft.com/library/azure/dn629430.aspx)|
|Log and analyze usage logging for Rights Management.|[Get-AipServiceUserLog](/powershell/aipservice/get-aipserviceuserlog)|
|Display the current Rights Management service configuration for your organization.|[Get-AipServiceConfiguration](/powershell/aipservice/get-aipserviceconfiguration)|
|Migrate your organization from Azure Information Protection to an on-premises AD RMS deployment.|[Set-AipServiceMigrationUrl](/powershell/aipservice/set-aipservicemigrationurl)<br /><br />[Get-AipServiceMigrationUrl](/powershell/aipservice/get-aipservicemigrationurl)|

