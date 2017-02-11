---
# required metadata

title: Migrating from AD RMS to Azure Information Protection - Phase 2 | Azure Information Protection
description: Phase 2 of migrating from AD RMS to Azure Information Protection, covering step 5 from Migrating from AD RMS to Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 10/12/2016
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


## Step 5. Reconfigure clients to use Azure Information Protection

For Windows computers that use Office 2016:

- You can reconfigure these clients to use Azure Information Protection by using DNS redirection. This is the preferred method for client migration because it is the simplest, but it is restricted to Office 2016 (or later).
    
    This method requires you to create a new SRV record, and set an NTFS deny permission for users on the AD RMS publishing endpoint.

- For Windows computers that don't use Office 2016:
    
    You cannot use DNS redirection and instead, must use registry edits. If you have a mix of Office 2016 and other versions of Office, you can use this single method for all Windows computers, or a combination of DNS redirection and editing the registry. 
    
    The registry changes are made easier for you by editing and deploying scripts that you can download. 

For mobile device clients and Mac computers:

- Remove the DNS SRV records that you created when you deployed the [AD RMS mobile device extension](http://technet.microsoft.com/library/dn673574.aspx)

See the following sections for more information about how to reconfigure Windows clients.

## Client reconfiguration by using DNS redirection 

This method is suitable only for Windows clients that run Office 2016 (or later).

1. Create a DNS SRV record:

2. Set a deny permission for the Office 2016 users on the AD RMS publishing endpoint:

    a. On one of your AD RMS servers in the cluster, start the Internet Information Services (IIS) Manager console.

    b. Navigate to **Default Web Site** > **_wmcs** > **licensing** > **publish.asmx**

    c. Right-click **publish.asmx** > **Properties** > **Edit**

    d. In the **Permissions for publish.asmx** dialog box, either select **Users** if you want to set redirection for all users, or click **Add** and the specify a group that contains the users that you want to redirect.
    
    Even if all your users are using Office 2016, you might prefer to initially specify a subset of users for a phased migration.
    
    e. For your selected group, select **Deny** for the **Read & Execute** and the **Read** permission, and then click **OK** twice.


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

3. If users have Office 2016: The scripts are not yet updated to include configuration for Office 2016, so if you will deploy this script for users who have this version of Office, you must manually update the scripts:

	- For **CleanUpRMS.cmd** - search for the line `reg delete HKCU\Software\Microsoft\Office\15.0\Common\DRM /f` and immediately below it, add the following line:

			reg delete HKCU\Software\Microsoft\Office\16.0\Common\DRM /f

	- For **Redirect_Onprem.cmd** - search for the line `reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\DRM" /t REG_SZ /v "DefaultServer" /d "%CloudRMS%" /F` and immediately below it, add the following two lines:

			reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\DRM" /t REG_SZ /v "DefaultServerUrl" /d "https://%CloudRMS%/_wmcs/licensing" /F 

			reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\DRM" /t REG_SZ /v "DefaultServer" /d "%CloudRMS%" /F

	Optional: The scripts do not reference Office 2016 in the comments. If you want to update the comments to reflect these additions for Office 2016, make the following changes to **Redirect_Onprem.cmd**:

	- Search for `::     or MSIPC (Office 2013) with on-premises AD RMS` and replace this with the following:
	
			::     or MSIPC (Office 2013 and 2016) with on-premises AD RMS

	- Search for `echo Redirect SCP for Office 2013` and replace this with the following:
	
			echo Redirect SCP for Office versions based on MSIPC

	- Search for `echo Redirect MSIPC for Office 2013` and replace with the following:
	
			echo Redirect MSIPC for Office versions based on MSIPC

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
    > *&lt;YourTenantURL&gt;* has the following format: **{GUID}.rms.[Region].aadrm.com**.
    > 
    > For example:  5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com
    > 
    > You can find this value by identifying the **RightsManagementServiceId** value when you run the [Get-AadrmConfiguration](http://msdn.microsoft.com/library/windowsazure/dn629410.aspx) cmdlet for Azure RMS.


## Next steps
To continue the migration, go to [phase 3 -supporting services configuration](migrate-from-ad-rms-phase3.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]