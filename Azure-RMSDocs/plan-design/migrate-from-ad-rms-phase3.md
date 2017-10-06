---
# required metadata

title: Migrate AD RMS-Azure Information Protection - Phase 3
description: Phase 3 of migrating from AD RMS to Azure Information Protection, covering step 7 from Migrating from AD RMS to Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 10/06/2017
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
# Migration phase 3 - client-side configuration

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Office 365*

Use the following information for Phase 3 of migrating from AD RMS to Azure Information Protection. These procedures cover step 7 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).

## Step 7. Reconfigure Windows computers to use Azure Information Protection

For Windows computers, use two migration scripts to reconfigure AD RMS clients:

- Migrate-Client.cmd

- Migrate-User.cmd

The client configuration script (Migrate-Client.cmd) configures computer-level settings in the registry, which means that it must run in a security context that can make those changes. This typically means one of the following methods:

- Use group policy to run the script as a computer startup script.

- Use group policy software installation to assign the script to the computer.

- Use a software deployment solution to deploy the script to the computers. For example, use System Center Configuration Manager [packages and programs](/sccm/apps/deploy-use/packages-and-programs). In the properties of the package and program, under **Run mode**, specify that the script runs with administrative permissions on the device. 

- Use a logon script if the user has local administrator privileges.

The user configuration script (Migrate-User.cmd) configures user-level settings and cleans up the client license store. This means that this script must run in the context of the actual user. For example:

- Use a logon script.

- Use group policy software installation to publish the script for the user to run.

- Use a software deployment solution to deploy the script to the users. For example, use System Center Configuration Manager [packages and programs](/sccm/apps/deploy-use/packages-and-programs). In the properties of the package and program, under **Run mode**, specify that the script runs with the permissions of the user. 

- Ask the user to run the script when they are signed in to their computer.

The two scripts include a version number and do not rerun until this version number is changed. This means that you can leave the scripts in place until the migration is complete. However, if you do make changes to the scripts that you want computers and users to rerun on their Windows computers, update the following line in both scripts to a higher value:

	SET Version=20170427

The user configuration script is designed to run after the client configuration script, and uses the version number in this check. It will stop if the client configuration script with the same version has not run. This check ensures that the two scripts are run in the right sequence. 

When you cannot migrate all your Windows clients at once, run the following procedures for batches of clients. For each user who has a Windows computer that you want to migrate in your batch, add the user to the **AIPMigrated** group that you created earlier.

### Windows client reconfiguration by using registry edits

1. Return to the migration scripts, **Migrate-Client.cmd** and **Migrate-User.cmd**, which you extracted previously when you downloaded these scripts in the [preparation phase](migrate-from-ad-rms-phase1.md#step-2-prepare-for-client-migration).

2.  Follow the instructions in **Migrate-Client.cmd** to modify the script so that it contains your tenant's Azure Rights Management service URL, and also your server names for your AD RMS cluster extranet licensing URL and intranet licensing URL. Then, increment the script version, which was previously explained. A good practice for tracking script versions is to use today’s date in the following format: YYYYMMDD

    > [!IMPORTANT]
    > As before, be careful not to introduce additional spaces before or after your addresses.
    > 
    > In addition, if your AD RMS servers use SSL/TLS server certificates, check whether the licensing URL values include the port number **443** in the string. For example: https:// rms.treyresearch.net:443/_wmcs/licensing. You’ll find this information in the Active Directory Rights Management Services console when you click the cluster name and view the **Cluster Details** information. If you see the port number 443 included in the URL, include this value when you modify the script. For example, https://rms.treyresearch.net:**443**. 

    If you need to retrieve your Azure Rights Management service URL for *&lt;YourTenantURL&gt;*, refer back to [To identify your Azure Rights Management service URL](migrate-from-ad-rms-phase1.md#to-identify-your-azure-rights-management-service-url).

3. Using the instructions at the beginning of this step, configure your script deployment methods to run **Migrate-Client.cmd** and **Migrate-User.cmd** on the Windows client computers that are used by the members of the AIPMigrated group. 

## Next steps
To continue the migration, go to [phase 4 -supporting services configuration](migrate-from-ad-rms-phase3.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]