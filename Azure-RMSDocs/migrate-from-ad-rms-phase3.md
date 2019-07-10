---
# required metadata

title: Migrate AD RMS-Azure Information Protection - Phase 3
description: Phase 3 of migrating from AD RMS to Azure Information Protection, covering step 7 from Migrating from AD RMS to Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 07/03/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
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

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Use the following information for Phase 3 of migrating from AD RMS to Azure Information Protection. These procedures cover step 7 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).

## Step 7. Reconfigure Windows computers to use Azure Information Protection

For Windows computers that use Office 365 apps, Office 2019, or Office 2016 click-to-run desktop apps:

- You can reconfigure these clients to use Azure Information Protection by using DNS redirection. This is the preferred method for client migration because it is the simplest. However, this method is restricted to Office 2016 (or later) click-to-run desktop apps for Windows computers.
    
    This method requires you to create a new SRV record, and set an NTFS deny permission for users on the AD RMS publishing endpoint.

- For Windows computers that don't use Office 2019 or Office 2016 click-to-run:
    
    You cannot use DNS redirection and instead, must use registry edits. If you have a mix of Office versions that can and cannot use DNS redirection, you can use this single method for all Windows computers, or a combination of DNS redirection and editing the registry. 
    
    The registry changes are made easier for you by editing and deploying scripts that you can download. 

See the following sections for more information about how to reconfigure Windows clients.

## Client reconfiguration by using DNS redirection

This method is suitable only for Windows clients that run Office 365 apps and Office 2016 (or later) click-to-run desktop apps. 

1. Create a DNS SRV record using the following format:
    
    `_rmsredir._http._tcp.<AD RMS cluster>. <TTL> IN SRV <priority> <weight> <port> <your tenant URL>.`
    
    For *\<AD RMS cluster>*, specify the FQDN of your AD RMS cluster. For example, **rmscluster.contoso.com**.
    
    Alternatively, if you have just one AD RMS cluster in that domain, you can specify just the domain name of the AD RMS cluster. In our example, that would be **contoso.com**. When you specify the domain name in this record, the redirection applies to any and all AD RMS clusters in that domain.
    
    The *\<port>* number is ignored.
    
    For *\<your tenant URL\>*, specify your own [Azure Rights Management service URL for your tenant](migrate-from-ad-rms-phase1.md#to-identify-your-azure-rights-management-service-url).
    
    If you use the DNS Server role on Windows Server, you can use the following table as an example how to specify the SRV record properties in the DNS Manager console.
    
	|Field|Value|  
	|-----------|-----------|  
	|**Domain**|_tcp.rmscluster.contoso.com|  
	|**Service**|_rmsredir|  
	|**Protocol**|_http|  
	|**Priority**|0|  
	|**Weight**|0|  
	|**Port number**|80|  
	|**Host offering this service**|5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com|  

2. Set a deny permission on the AD RMS publishing endpoint for users running Office 365 apps or Office 2016 (or later):

    a. On one of your AD RMS servers in the cluster, start the Internet Information Services (IIS) Manager console.

    b. Navigate to **Default Web Site** > **_wmcs** > **licensing** > **licensing.asmx**

    c. Right-click **licensing.asmx** > **Properties** > **Edit**

    d. In the **Permissions for licensing.asmx** dialog box, either select **Users** if you want to set redirection for all users, or click **Add** and then specify a group that contains the users that you want to redirect.
    
    Even if all your users are using a version of Office that supports DNS redirection, you might prefer to initially specify a subset of users for a phased migration.
    
    e. For your selected group, select **Deny** for the **Read & Execute** and the **Read** permission, and then click **OK** twice.

    f. To confirm this configuration is working as expected, try to connect to the licensing.asmx file directly from a browser. You should see the following error message, which triggers the client running Office 365 apps or Office 2019 or Office 2016 to look for the SRV record:
    
    **Error message 401.3: You do not have permissions to view this directory or page using the credentials you supplied (access denied due to Access Control Lists).**


## Client reconfiguration by using registry edits

This method is suitable for all Windows clients and should be used if they do not run Office 365 apps, or Office 2019. or Office 2016, but instead, an earlier version of Office. This method uses two migration scripts to reconfigure AD RMS clients:

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

The user configuration script is designed to run after the client configuration script, and uses the version number in this check. It stops if the client configuration script with the same version has not run. This check ensures that the two scripts run in the right sequence. 

When you cannot migrate all your Windows clients at once, run the following procedures for batches of clients. For each user who has a Windows computer that you want to migrate in your batch, add the user to the **AIPMigrated** group that you created earlier.

### Modifying the scripts for registry edits

1. Return to the migration scripts, **Migrate-Client.cmd** and **Migrate-User.cmd**, which you extracted previously when you downloaded these scripts in the [preparation phase](migrate-from-ad-rms-phase1.md#step-2-prepare-for-client-migration).

2. Follow the instructions in **Migrate-Client.cmd** to modify the script so that it contains your tenant's Azure Rights Management service URL, and also your server names for your AD RMS cluster extranet licensing URL and intranet licensing URL. Then, increment the script version, which was previously explained. A good practice for tracking script versions is to use today’s date in the following format: YYYYMMDD
    
   > [!IMPORTANT]
   > As before, be careful not to introduce additional spaces before or after your addresses.
   > 
   > In addition, if your AD RMS servers use SSL/TLS server certificates, check whether the licensing URL values include the port number **443** in the string. For example: https://rms.treyresearch.net:443/_wmcs/licensing. You can find this information in the Active Directory Rights Management Services console when you click the cluster name and view the **Cluster Details** information. If you see the port number 443 included in the URL, include this value when you modify the script. For example, https://rms.treyresearch.net:<strong>443</strong>. 
    
   If you need to retrieve your Azure Rights Management service URL for *&lt;YourTenantURL&gt;*, refer back to [To identify your Azure Rights Management service URL](migrate-from-ad-rms-phase1.md#to-identify-your-azure-rights-management-service-url).

3. Using the instructions at the beginning of this step, configure your script deployment methods to run **Migrate-Client.cmd** and **Migrate-User.cmd** on the Windows client computers that are used by the members of the AIPMigrated group. 

## Next steps
To continue the migration, go to [phase 4 -supporting services configuration](migrate-from-ad-rms-phase4.md).
