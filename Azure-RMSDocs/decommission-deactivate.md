---
# required metadata

title: Decommission & deactivate Azure RMS
description: Information and instructions if you decide you no longer want to use the cloud-based protection service from Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/20/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 0b1c2064-0d01-45ae-a541-cebd7fd762ad

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Decommissioning and deactivating protection for Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

You are always in control of whether your organization protects content by using the Azure Rights Management service from Azure Information Protection. If you decide you no longer want to use this information protection service, you have the assurance that you won’t be locked out of content that was previously protected.

If you don’t need continued access to previously protected content, deactivate the service and let your subscription for Azure Information Protection expire. For example, this would be appropriate for when you have completed testing Azure Information Protection before you deploy it in a production environment.

However, if you have deployed Azure Information Protection in production and protected documents and emails, make sure that you have a copy of your Azure Information Protection tenant key before you deactivate the Azure Rights Management service. Make sure that you have a copy of your key before your subscription expires to ensure that you can retain access to content that was protected by Azure Rights Management after the service is deactivated. If you used the bring your own key solution (BYOK) where you generate and manage your own key in an HSM, you already have your Azure Information Protection tenant key. But if it was managed by Microsoft (the default), see the instructions for exporting your tenant key in [Operations for your Azure Information Protection tenant key](operations-tenant-key.md) article.

> [!TIP]
> Even after your subscription expires, your Azure Information Protection tenant remains available for consuming content for an extended period. However, you will no longer be able to export your tenant key.

When you have your Azure Information Protection tenant key, you can deploy Rights Management on premises (AD RMS) and import your tenant key as a trusted publishing domain (TPD). You then have the following options for decommissioning your Azure Information Protection deployment:

|If this applies to you …|… do this:|
|----------------------------|--------------|
|You want all users to continue using Rights Management, but use an on-premises solution rather than using Azure Information Protection    →|Redirect your clients to the on-premises deployment by using the **LicensingRedirection** registry key for Office 2016 or Office 2013. For instructions, see the [service discovery section](./rms-client/client-deployment-notes.md) in the RMS client deployment notes. For Office 2010, use the **LicenseServerRedirection** registry key for Office 2010, as described in [Office Registry Settings](https://technet.microsoft.com/library/dd772637%28v=ws.10%29.aspx).|
|You want to stop using Rights Management technologies completely    →|Grant a designated administrator [super user rights](configure-super-users.md) and install the [Azure Information Protection client](./rms-client/client-admin-guide-install.md) for this user.<br /><br />This administrator can then use the PowerShell module from this client to bulk-decrypt files in folders that were protected by Azure Information Protection. Files revert to being unprotected and can therefore be read without a Rights Management technology such as Azure Information Protection or AD RMS. Because this PowerShell module can be used with both Azure Information Protection and AD RMS, you have the choice of decrypting files before or after you deactivate the protection service from Azure Information Protection, or a combination.|
|You are not able to identify all the files that were protected by Azure Information Protection. Or, you want all users to be able to automatically read any protected files that were missed    →|Deploy a registry setting on all client computers by using the **LicensingRedirection** registry key for Office 2016 and Office 2013, as described in the [service discovery section](./rms-client/client-deployment-notes.md) in the RMS client deployment notes. For Office 2010, use the **LicenseServerRedirection** registry key, as described in [Office Registry Settings](https://technet.microsoft.com/library/dd772637%28v=ws.10%29.aspx).<br /><br />Also deploy another registry setting to prevent users from protecting new files by setting **DisableCreation** to **1**, as described in [Office Registry Settings](https://technet.microsoft.com/library/dd772637%28v=ws.10%29.aspx).|
|You want a controlled, manual recovery service for any files that were missed    →|Grant designated users in a data recovery group [super user rights](configure-super-users.md) and install the [Azure Information Protection client](./rms-client/client-admin-guide-install.md) for these users so that they can unprotect files when this action is requested by standard users.<br /><br />On all computers, deploy the registry setting to prevent users from protecting new files by setting **DisableCreation** to **1**, as described in [Office Registry Settings](https://technet.microsoft.com/library/dd772637%28v=ws.10%29.aspx).|
For more information about the procedures in this table, see the following resources:

- For information about AD RMS and deployment references, see [Active Directory Rights Management Services Overview](https://technet.microsoft.com/library/hh831364.aspx).

- For instructions to import your Azure Information Protection tenant key as a TPD file, see [Add a Trusted Publishing Domain](https://technet.microsoft.com/library/cc771460.aspx).

- To use PowerShell with the Azure Information Protection client, see [Using PowerShell with the Azure Information Protection client](./rms-client/client-admin-guide-powershell.md).

When you are ready to deactivate the protection service from Azure Information Protection, use the following instructions.

## Deactivating Rights Management
Use one of the following procedures to deactivate the protection service, Azure Rights Management.

> [!TIP]
> You can also use the PowerShell cmdlet, [Disable-AipService](/powershell/module/aipservice/disable-aipservice), to deactivate Rights Management.

#### To deactivate Rights Management from the Office 365 admin center

1. Go to the [Rights Management page](https://account.activedirectory.windowsazure.com/RmsOnline/Manage.aspx) for Office 365 administrators.
    
    If you are prompted to sign in, use an account that is a global administrator for Office 365.

2. On the **rights management** page, click **deactivate**.

3.  When prompted **Do you want to deactivate Rights Management?** click **deactivate**.

You should now see **Rights Management is not activated** and the option to activate.

#### To deactivate Rights Management from the Azure portal

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** blade.
    
    For example, on the hub menu, click **All services** and start typing **Information** in the Filter box. Select **Azure Information Protection**.

2. On the initial **Azure Information Protection** blade, select **Protection activation**. 

3.  On the **Azure Information Protection - Protection activation** blade, select **Deactivate**. Select **Yes** to confirm your choice.

The information bar displays **Deactivation finished successfully** and **Deactivate** is now replaced with **Activate**. 

