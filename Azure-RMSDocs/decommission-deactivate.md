---
# required metadata

title: Decommission & deactivate Azure RMS
description: Information and instructions if you decide you no longer want to use the cloud-based protection service from Azure Information Protection.
author: batamig
ms.author: bagol
manager: rkarlin
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

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), [Office 365](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4Dz8M)*
>
>***Relevant for**: [AIP unified labeling client and classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

[!INCLUDE [AIP classic client is sunset](includes/classic-client-sunset.md)]


You are always in control of whether your organization protects content by using the Azure Rights Management service from Azure Information Protection. If you decide you no longer want to use this information protection service, you have the assurance that you won’t be locked out of content that was previously protected.

If you don’t need continued access to previously protected content, deactivate the service and let your subscription for Azure Information Protection expire. For example, this would be appropriate for when you have completed testing Azure Information Protection before you deploy it in a production environment.

However, if you have deployed Azure Information Protection in production and protected documents and emails, make sure that you have a copy of your Azure Information Protection tenant key and suitable trusted publishing domain (TPD) before you deactivate the Azure Rights Management service. Make sure that you have a copy of your key and the TPD before your subscription expires to ensure that you can retain access to content that was protected by Azure Rights Management after the service is deactivated. 

If you used the bring your own key solution (BYOK) where you generate and manage your own key in an HSM, you already have your Azure Information Protection tenant key. You will also have a suitable TPD if you followed the instructions that [prepare for a future cloud exit](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/How-to-prepare-an-Azure-Information-Protection-Cloud-Exit-plan/ba-p/382631). However, if your tenant key was managed by Microsoft (the default), see the instructions for exporting your tenant key in [Operations for your Azure Information Protection tenant key](operations-tenant-key.md) article.

> [!TIP]
> Even after your subscription expires, your Azure Information Protection tenant remains available for consuming content for an extended period. However, you will no longer be able to export your tenant key.

When you have your Azure Information Protection tenant key and the TPD, you can deploy Rights Management on premises (AD RMS) and import your tenant key as a trusted publishing domain (TPD). You then have the following options for decommissioning your Azure Information Protection deployment:

|If this applies to you …|… do this:|
|----------------------------|--------------|
|You want all users to continue using Rights Management, but use an on-premises solution rather than using Azure Information Protection    →|Redirect your clients to the on-premises deployment by using the **LicensingRedirection** registry key for Office 2016 or Office 2013. For instructions, see the [service discovery section](./rms-client/client-deployment-notes.md) in the RMS client deployment notes. <br><br>For Office 2010, use the **LicenseServerRedirection** registry key for Office 2010, as described in [Office Registry Settings](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd772637(v=ws.10)). <br><br>**Important**: Office 2010 extended support ended on October 13, 2020. For more information, see [AIP and legacy Windows and Office, SharePoint, and Exchange versions](removed-sunset-services.md#aip-and-legacy-windows-and-office-sharepoint-and-exchange-versions).|
|You want to stop using Rights Management technologies completely    →|Grant a designated administrator [super user rights](configure-super-users.md) and install the [Azure Information Protection client](./rms-client/client-admin-guide-install.md) for this user.<br /><br />This administrator can then use the PowerShell module from this client to bulk-decrypt files in folders that were protected by Azure Information Protection. Files revert to being unprotected and can therefore be read without a Rights Management technology such as Azure Information Protection or AD RMS. Because this PowerShell module can be used with both Azure Information Protection and AD RMS, you have the choice of decrypting files before or after you deactivate the protection service from Azure Information Protection, or a combination.|
|You are not able to identify all the files that were protected by Azure Information Protection. Or, you want all users to be able to automatically read any protected files that were missed    →|Deploy a registry setting on all client computers by using the **LicensingRedirection** registry key for Office 2016 and Office 2013, as described in the [service discovery section](./rms-client/client-deployment-notes.md) in the RMS client deployment notes. <br><br>**For Office 2010**: <br>- Use the **LicenseServerRedirection** registry key, as described in [Office Registry Settings](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd772637(v=ws.10)). <br>- Deploy another registry setting to prevent users from protecting new files by setting **DisableCreation** to **1**, as described in [Office Registry Settings](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd772637(v=ws.10)). <br><br>**Important**: Office 2010 extended support ended on October 13, 2020. For more information, see [AIP and legacy Windows and Office, SharePoint, and Exchange versions](removed-sunset-services.md#aip-and-legacy-windows-and-office-sharepoint-and-exchange-versions).|
|You want a controlled, manual recovery service for any files that were missed    →|Grant designated users in a data recovery group [super user rights](configure-super-users.md) and install the [Azure Information Protection client](./rms-client/client-admin-guide-install.md) for these users so that they can unprotect files when this action is requested by standard users.<br /><br />On all computers, deploy the registry setting to prevent users from protecting new files by setting **DisableCreation** to **1**, as described in [Office Registry Settings](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd772637(v=ws.10)).|
| | |

For more information about the procedures in this table, see the following resources:

- For information about AD RMS and deployment references, see [Active Directory Rights Management Services Overview](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/hh831364(v=ws.11)).

- For instructions to import your Azure Information Protection tenant key as a TPD file, see [Add a Trusted Publishing Domain](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc771460(v=ws.11)).

- To use PowerShell with the Azure Information Protection client, see [Using PowerShell with the Azure Information Protection client](./rms-client/client-admin-guide-powershell.md).

When you are ready to deactivate the protection service from Azure Information Protection, use the following instructions.

## Deactivating Rights Management
Use one of the following procedures to deactivate the protection service, Azure Rights Management.

> [!TIP]
> You can also use the PowerShell cmdlet, [Disable-AipService](/powershell/module/aipservice/disable-aipservice), to deactivate Rights Management.

#### To deactivate Rights Management from the Microsoft 365 admin center

1. Go to the [Rights Management page](https://account.activedirectory.windowsazure.com/RmsOnline/Manage.aspx) for Microsoft 365 administrators.
    
    If you are prompted to sign in, use an account that is a global administrator for Microsoft 365.

2. On the **rights management** page, click **deactivate**.

3.  When prompted **Do you want to deactivate Rights Management?** click **deactivate**.

You should now see **Rights Management is not activated** and the option to activate.

#### To deactivate Rights Management from the Azure portal

1. If you haven't already done so, open a new browser window and [sign in to the Azure portal](configure-policy.md#signing-in-to-the-azure-portal). Then navigate to the **Azure Information Protection** pane.

    For example, in the search box for resources, services, and docs: Start typing **Information** and select **Azure Information Protection**.

2. On the initial **Azure Information Protection** pane, select **Protection activation**. 

3.  On the **Azure Information Protection - Protection activation** pane, select **Deactivate**. Select **Yes** to confirm your choice.

The information bar displays **Deactivation finished successfully** and **Deactivate** is now replaced with **Activate**.
