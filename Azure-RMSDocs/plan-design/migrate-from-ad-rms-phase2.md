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

Use the following information for Phase 2 of migrating from AD RMS to Azure Information Protection. These procedures cover step 6 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).

When you cannot migrate all clients at once, run these procedures for batches of clients. For each user who has a Windows computer that want to migrate, add the user to the **AIPMigrated** group that you created earlier.

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

1. Create a DNS SRV record in the forward lookup zone for the AD RMS cluster, using the following format: 

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

1. Return to the migration scripts,**MigrateClient.cmd** and **CleanUpRMS.cmd**, which you extracted previously.

    These scripts reset the configuration on Windows computers so that they will use the Azure Rights Management service rather than AD RMS.

2.  Follow the instructions in the MigrateClient.cmd script to modify the script to point to your tenant's Azure Rights Management service URL and your server names for your AD RMS cluster extranet licensing URL and AD RMS cluster intranet licensing URL.

    > [!IMPORTANT]
    > As before, be careful not to introduce additional spaces before or after your addresses, and include the port number **443** if it is used. For example: https://rms.treyresearch.net:443/_wmcs/licensing. 

    If you need to retrieve your Azure Information Protection tenant URL for *&lt;YourTenantURL&gt;*, refer back to [To identify your Azure Information Protection tenant URL](migrate-from-ad-rms-phase1.md#to-identify-your-azure-information-protection-tenant-url).


4.  Run **CleanUpRMS.cmd** and then **MigrateClient.cmd** on the client computers that the members of the AIPMigrated group use. For example, create a Group Policy to run these scripts and assign it to this group.


#### Changes made by the migration scripts

CleanUpRMS.cmd:

-  Delete the contents of all registry keys and folders used by the AD RMS client to store its configuration. This includes the location of the client's AD RMS cluster.

MigrateClient.cmd:

-   Configures the client to bootstrap against Azure RMS.

-  Configures the client to connect to your Azure Rights Management service to get licenses for content that is protected by AD RMS. 


## Next steps
To continue the migration, go to [phase 3 -supporting services configuration](migrate-from-ad-rms-phase3.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]