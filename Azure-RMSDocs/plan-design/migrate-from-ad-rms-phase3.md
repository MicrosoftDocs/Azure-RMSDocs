---
# required metadata

title: Migrate AD RMS-Azure Information Protection - Phase 3
description: Phase 3 of migrating from AD RMS to Azure Information Protection, covering step 7 from Migrating from AD RMS to Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/18/2017
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

When you cannot migrate all clients at once, run these procedures for batches of clients. For each user who has a Windows computer that you want to migrate in your batch, add the user to the **AIPMigrated** group that you created earlier.

## Step 7. Reconfigure clients to use Azure Information Protection

This step uses migration scripts to reconfigure AD RMS clients. The scripts reset the configuration on Windows computers to use the Azure Rights Management service rather than AD RMS: 

**CleanUpRMS.cmd**:

- Deletes the contents of all folders and registry keys used by the AD RMS client to store its configuration. This information includes the location of the client's AD RMS cluster.

**MigrateClient.cmd**:

- Configures the client to initialize the user environment (bootstrap) for the Azure Rights Management service.

-  Configures the client to connect to your Azure Rights Management service to get use licenses for content that is protected by your AD RMS cluster. 


### Client reconfiguration by using registry edits

1. Return to the migration scripts, **CleanUpRMS.cmd** and **MigrateClient.cmd**, which you extracted previously.

2.  Follow the instructions in **MigrateClient.cmd** to modify the script so that it contains your tenant's Azure Rights Management service URL, and also your server names for your AD RMS cluster extranet licensing URL and intranet licensing URL.

    > [!IMPORTANT]
    > As before, be careful not to introduce additional spaces before or after your addresses.
    > 
    > In addition, if your AD RMS servers use SSL/TLS server certificates, check whether the licensing URL values include the port number **443** in the string. For example: https:// rms.treyresearch.net:443/_wmcs/licensing. You’ll find this information in the Active Directory Rights Management Services console when you click the cluster name and view the **Cluster Details** information. If you see the port number 443 included in the URL, include this value when you modify the script. For example, https://rms.treyresearch.net:**443**. 

    If you need to retrieve your Azure Rights Management service URL for *&lt;YourTenantURL&gt;*, refer back to [To identify your Azure Rights Management service URL](migrate-from-ad-rms-phase1.md#to-identify-your-azure-rights-management-service-url).

3.  Run **CleanUpRMS.cmd** and then **MigrateClient.cmd** on the client computers that are used by the members of the **AIPMigrated** group. For example, create a group policy object that runs these scripts and assign it to this user group.


## Next steps
To continue the migration, go to [phase 4 -supporting services configuration](migrate-from-ad-rms-phase3.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]