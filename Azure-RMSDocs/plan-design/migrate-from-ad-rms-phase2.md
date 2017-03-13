---
# required metadata

title: Migrate AD RMS-Azure Information Protection - Phase 2
description: Phase 2 of migrating from AD RMS to Azure Information Protection, covering step 5 from Migrating from AD RMS to Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: e3fd9bd9-3638-444a-a773-e1d5101b1793


# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---
# Migration phase 2 - client-side configuration

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Office 365*

Use the following information for Phase 2 of migrating from AD RMS to Azure Information Protection. These procedures cover step 5 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).


## Step 5. Prepare clients for migration

For most migrations, it is not practical to migrate all clients at once, so you will likely migrate clients in batches. This means that for a period of time, some clients will be using Azure Information Protection and some will still be using AD RMS. 

If you cannot migrate all users at the same time, deploy a pre-migration script to all Windows computers.

You can use Group Policy or another software deployment mechanism to deploy this script.


1. Create a new Active Directory security group, named **AIPMigrated**. Do not assign any 



## Step 6. Reconfigure clients to use Azure Information Protection

For Windows computers that use Office 2016 click-to-run desktop apps:

- You can reconfigure these clients to use Azure Information Protection by using DNS redirection. This is the preferred method for client migration because it is the simplest, but it is restricted to Office 2016 (or later) click-to-run desktop apps for Windows computers.
    
    This method requires you to create a new SRV record, and set an NTFS deny permission for users on the AD RMS publishing endpoint.

- For Windows computers that don't use Office 2016:
    
    You cannot use DNS redirection and instead, must use registry edits. If you have a mix of Office 2016 and other versions of Office, you can use this single method for all Windows computers, or a combination of DNS redirection and editing the registry. 
    
    The registry changes are made easier for you by editing and deploying scripts that you can download. 

For mobile device clients and Mac computers:

- Remove the DNS SRV records that you created when you deployed the [AD RMS mobile device extension](http://technet.microsoft.com/library/dn673574.aspx)

See the following sections for more information about how to reconfigure Windows clients.

## Client reconfiguration by using DNS redirection 

This method is suitable only for Windows clients that run Office 2016 (or later) click-to-run desktop apps.

1. Create a DNS SRV record for clients in their forward lookup zone, using the following format: 

	**_rmsredir._http._tcp.\<portnumber\>\<RMSClusterFQDN\>**

	For this record, specify the port number that your AD RMS cluster is using (for example, 443) and your own cluster name (for example, rmsserver.contoso.com). 

	If you use the DNS Server role on Windows Server, use the following tables as a guide for the SRV record properties in the DNS Manager console:

	|Field|Value|  
	|-----------|-----------|  
	|**Domain**|_tcp.contoso.com|  
	|**Service**|_rmsredir|  
	|**Protocol**|_http|  
	|**Priority**|0|  
	|**Weight**|0|  
	|**Port number**|443|  
	|**Host offering this service**|rmsserver.contoso.com|  

2. Set a deny permission for the Office 2016 users on the AD RMS publishing endpoint:

    a. On one of your AD RMS servers in the cluster, start the Internet Information Services (IIS) Manager console.

    b. Navigate to **Default Web Site** > **_wmcs** > **licensing** > **publish.asmx**

    c. Right-click **publish.asmx** > **Properties** > **Edit**

    d. In the **Permissions for publish.asmx** dialog box, either select **Users** if you want to set redirection for all users, or click **Add** and the specify a group that contains the users that you want to redirect.
    
    Even if all your users are using Office 2016, you might prefer to initially specify a subset of users for a phased migration.
    
    e. For your selected group, select **Deny** for the **Read & Execute** and the **Read** permission, and then click **OK** twice.

    f. To confirm this configuration is working as expected, try to connect to that file directly from a browser. You should see the following, which will prompt the client running Office 2016 to look for the SRV record:
    
    **Error message 401.3: You do not have permissions to view this diectory or page using the credentials you supplied (access denied due to Access Control Lists).**


## Client reconfiguration by using registry edits

This method is suitable for all Windows clients and should be used if they do not run Office 2016 but an earlier version.

1.  [Download the migration scripts](https://go.microsoft.com/fwlink/?LinkId=524619):

    -   CleanUpRMS_RUN_Elevated.cmd

    -   Redirect_OnPrem.cmd

    These scripts reset the configuration on Windows computers so that they will use the Azure Information Protection service rather than AD RMS.

2.  Follow the instructions in the redirection script (Redirect_OnPrem.cmd) to modify the script to point to your new Azure Information Protection tenant.

    > [!IMPORTANT]
    > The instructions include replacing example addresses of **adrms** and **adrms.contoso.com** with the addresses of your own AD RMS servers. When you do this, be careful that there are no additional spaces before or after your addresses, which will break the migration script and is very hard to identify as the root cause of the problem. Some editing tools automatically add a space after pasting text.
    >
    > In addition, if your AD RMS servers use SSL/TLS server certificates, check whether the licensing URL values include the port number **443** in the string. For example: https:// rms.treyresearch.net:443/_wmcs/licensing. You’ll find this information in the Active Directory Rights Management Services console when you click the cluster name and view the **Cluster Details** information. If you see the port number 443 included in the URL, include this value when you modify the script. For example, https://rms.treyresearch.net**:443**.

4.  On the Windows client computers, run these scripts with elevated privileges in the user’s context.


#### Changes made by the migration scripts
This section documents the changes that the migration scripts make. You can use this information for reference purposes only, or for troubleshooting, or if you prefer to make these changes yourself.

CleanUpRMS_RUN_Elevated.cmd:

-   Delete the contents of the %userprofile%\AppData\Local\Microsoft\DRM and %userprofile%\AppData\Local\Microsoft\MSIPC folders, including any subfolders and any files with long file names.

-   Delete the contents of the following registry keys:

    -   HKEY_LOCAL_MACHINE\Software\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM

    -   HKEY_CURRENT_USER\Software\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM

    -   HKEY_LOCAL_MACHINE\Software\WoW6432Node\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM

    -   HKEY_CURRENT_USER\Software\WoW6432Node\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM

    -   HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSIPC\ServiceLocation

    -   HKEY_LOCAL_MACHINE\SOFTWARE\WoW6432Node\Microsoft\MSIPC\ServiceLocation

    -   HKEY_LOCAL_MACHINE\Software\Microsoft\MSDRM\ServiceLocation

-   Add the following registry values:

    -   HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\DRM\DefaultServerURL

    -   HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\DRM\DefaultServer

Redirect_OnPrem.cmd:

-   Create the following registry values for each URL supplied as a parameter under each of the following locations:

    -   HKEY_CURRENT_USER\Software\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM\LicenseServerRedirection

    -   HKEY_CURRENT_USER\Software\WoW6432Node\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM\LicenseServerRedirection

    -   HKEY_LOCAL_MACHINE\Software\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM\LicenseServerRedirection

    -   HKEY_LOCAL_MACHINE\Software\WoW6432Node\Microsoft\Office\(11.0|12.0|14.0)\Common\DRM\LicenseServerRedirection

    -   HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\MSIPC\LicensingRedirection

    Each entry has a REG_SZ value of **https://OldRMSserverURL/_wmcs/licensing** with the data in the following format: **https://&lt;YourTenantURL&gt;/_wmcs/licensing**.

    > [!NOTE]
    > If you need to retrieve your Azure Information Protection tenant URL for *&lt;YourTenantURL&gt;*, refer back to [To identify your Azure Information Protection tenant URL](migrate-from-ad-rms-phase1.md#to-identify-your-azure-information-protection-tenant-url).


## Next steps
To continue the migration, go to [phase 3 -supporting services configuration](migrate-from-ad-rms-phase3.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]