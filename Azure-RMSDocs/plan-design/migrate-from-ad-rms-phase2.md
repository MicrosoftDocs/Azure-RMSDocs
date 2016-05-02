---
# required metadata

title: Migrating from AD RMS to Azure Rights Management - Phase 2 | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
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

*Applies to: Active Directory Rights Management Services, Azure Rights Management*

Use the following information for Phase 2 of migrating from AD RMS to Azure Rights Management (Azure RMS). These procedures cover step 5 from [Migrating from AD RMS to Azure Rights Management](migrate-from-ad-rms-to-azure-rms.md).


## Step 5. Reconfigure clients to use Azure RMS
For Windows clients:

1.  [Download the migration scripts](http://go.microsoft.com/fwlink/?LinkId=524619):

    -   CleanUpRMS_RUN_Elevated.cmd

    -   Redirect_OnPrem.cmd

    These scripts reset the configuration on Windows computers so that they will use the Azure RMS service rather than AD RMS.

2.  Follow the instructions in the redirection script (Redirect_OnPrem.cmd) to modify the script to point to your new Azure RMS tenant.

3.  On the Windows computers, run these scripts with elevated privileges in the user’s context.

For mobile device clients and Mac computers:

-   Remove the DNS SRV records that you created when you deployed the [AD RMS mobile device extension](http://technet.microsoft.com/library/dn673574.aspx).

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

-   Delete the following registry values:

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