---
# required metadata

title: Decommission & deactivate Azure RMS
description: Information and instructions if you decide you no longer want to use the cloud-based protection service from Azure Information Protection.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/03/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 0b1c2064-0d01-45ae-a541-cebd7fd762ad

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: azurerms
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Decommissioning and deactivating protection for Azure Information Protection

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

You are always in control of whether your organization protects content by using the Azure Rights Management service from Azure Information Protection. If you decide you no longer want to use this information protection service, you have the assurance that you won’t be locked out of content that was previously protected.

If you don’t need continued access to previously protected content, deactivate the service and let your subscription for Azure Information Protection expire. For example, this would be appropriate for when you have completed testing Azure Information Protection before you deploy it in a production environment.

However, if you have deployed Azure Information Protection in production and protected documents and emails, make sure that you have a copy of your Azure Information Protection tenant key and suitable trusted publishing domain (TPD) before you deactivate the Azure Rights Management service. Make sure that you have a copy of your key and the TPD before your subscription expires to ensure that you can retain access to content that was protected by Azure Rights Management after the service is deactivated. 

If you used the bring your own key solution (BYOK) where you generate and manage your own key in an HSM, you already have your Azure Information Protection tenant key. You will also have a suitable TPD if you followed the instructions that [prepare for a future cloud exit](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/How-to-prepare-an-Azure-Information-Protection-Cloud-Exit-plan/ba-p/382631). However, if your tenant key was managed by Microsoft (the default), see the instructions for exporting your tenant key in [Operations for your Azure Information Protection tenant key](operations-tenant-key.md) article.

> [!TIP]
> Even after your subscription expires, your Azure Information Protection tenant remains available for consuming content for an extended period. However, you will no longer be able to export your tenant key.

When you have your Azure Information Protection tenant key and the TPD, you can deploy Rights Management on premises (AD RMS) and import your tenant key as a trusted publishing domain (TPD). You then have the following options for decommissioning your Azure Information Protection deployment:

|If this applies to you …|… do this:|
|----------------------------|--------------|
|You want all users to continue using Rights Management, but use an on-premises solution rather than using Azure Information Protection    →|Redirect your clients to the on-premises deployment by using the **LicensingRedirection** registry key for Office 2016 or Office 2013. For instructions, see the [service discovery section](./rms-client/client-deployment-notes.md) in the RMS client deployment notes. 
|You want to stop using Rights Management technologies completely    →|Grant a designated administrator [super user rights](/purview/encryption-super-users) and install the [Azure Information Protection client](/previous-versions/azure/information-protection/rms-client/client-admin-guide-install) for this user.<br /><br />This administrator can then use the PowerShell module from this client to bulk-decrypt files in folders that were protected by Azure Information Protection. Files revert to being unprotected and can therefore be read without a Rights Management technology such as Azure Information Protection or AD RMS. Because this PowerShell module can be used with both Azure Information Protection and AD RMS, you have the choice of decrypting files before or after you deactivate the protection service from Azure Information Protection, or a combination.|
|You are not able to identify all the files that were protected by Azure Information Protection. Or, you want all users to be able to automatically read any protected files that were missed    →|Deploy a registry setting on all client computers by using the **LicensingRedirection** registry key for Office 2016 and Office 2013, as described in the [service discovery section](./rms-client/client-deployment-notes.md) in the RMS client deployment notes. 
|You want a controlled, manual recovery service for any files that were missed    →|Grant designated users in a data recovery group [super user rights](/purview/encryption-super-users) and install the [Azure Information Protection client](/previous-versions/azure/information-protection/rms-client/client-admin-guide-install) for these users so that they can unprotect files when this action is requested by standard users.<br /><br />On all computers, deploy the registry setting to prevent users from protecting new files by setting **DisableCreation** to **1**, as described in [Office Registry Settings](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd772637(v=ws.10)).|

For more information about the procedures in this table, see the following resources:

- For information about AD RMS and deployment references, see [Active Directory Rights Management Services Overview](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/hh831364(v=ws.11)).

- For instructions to import your Azure Information Protection tenant key as a TPD file, see [Add a Trusted Publishing Domain](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc771460(v=ws.11)).

- To use PowerShell with the Azure Information Protection client, see [Using PowerShell with the Azure Information Protection client](/previous-versions/azure/information-protection/rms-client/client-admin-guide-powershell).

When you are ready to deactivate the protection service from Azure Information Protection, use the following instructions.

## Deactivating the protection service

You must use PowerShell to deactivate the protection service from Azure Information Protection. You can no longer activate or deactivate this service from admin portals.

1. Install the AIPService module, to configure and manage the protection service. For instructions, see [Installing the AIPService PowerShell module](install-powershell.md).

2. From a PowerShell session, run [Connect-AipService](/powershell/module/aipservice/connect-aipservice), and when prompted, provide the Global Administrator account details for your Azure Information Protection tenant.

3. Run [Get-AipService](/powershell/module/aipservice/get-aipservice) to confirm the current status of the protection service. A status of **Enabled** confirms activation; **Disabled** indicates that the service is deactivated.

4. To deactivate the service, run [Disable-AipService](/powershell/module/aipservice/disable-aipservice).

5. Run [Get-AipService](/powershell/module/aipservice/get-aipservice) again to confirm the protection service is now deactivated. This time, the status should display **Disabled**.

6. Run [Disconnect-AipService](/powershell/module/aipservice/disconnect-aipservice) to disconnect from the service, and close your PowerShell session.
