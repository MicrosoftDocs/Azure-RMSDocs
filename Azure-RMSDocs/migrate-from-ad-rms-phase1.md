---
# required metadata

title: Migrate AD RMS-Azure Information Protection - Phase 1
description: Phase 1 of migrating from AD RMS to Azure Information Protection, covering steps 1 though 3 from Migrating from AD RMS to Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 09/03/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: d954d3ee-3c48-4241-aecf-01f4c75fa62c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: migration
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Migration phase 1 - preparation

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Use the following information for Phase 1 of migrating from AD RMS to Azure Information Protection. These procedures cover steps 1 though 3 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md) and prepare your environment for migration without any impact to your users.


## Step 1: Install the AIPService PowerShell module and identify your tenant URL

Install the AIPService module so that you can configure and manage the service that provides the data protection for Azure Information Protection.

For instructions, see [Installing the AIPService PowerShell module](./install-powershell.md).

To complete some of the migration instructions, you will need to know the Azure Rights Management service URL for your tenant so that you can substitute it for when you see references to *\<Your Tenant URL\>*. Your Azure Rights Management service URL has the following format: **{GUID}.rms.[Region].aadrm.com**.

For example: **5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

### To identify your Azure Rights Management service URL

1. Connect to the Azure Rights Management service and when prompted, enter the credentials for your tenant's global administrator:
    
		Connect-AipService
    
2. Get your tenant's configuration:
    
		Get-AipServiceConfiguration
    
3. Copy the value displayed for **LicensingIntranetDistributionPointUrl**, and from this string, remove `/_wmcs\licensing`. 
    
    What remains is your Azure Rights Management service URL for your Azure Information Protection tenant. This value is often shortened to *Your tenant URL* in the following migration instructions.
    
    You can verify that you have the correct value by running the following PowerShell command:
    
            (Get-AipServiceConfiguration).LicensingIntranetDistributionPointUrl -match "https:\/\/[0-9A-Za-z\.-]*" | Out-Null; $matches[0]

## Step 2. Prepare for client migration

For most migrations, it is not practical to migrate all clients at once, so you will likely migrate clients in batches. This means that for a period of time, some clients will be using Azure Information Protection and some will still be using AD RMS. To support both pre-migrated and migrated users, use onboarding controls and deploy a pre-migration script. This step is required during the migration process so that users who have not yet migrated can consume content that has been protected by migrated users who are now using Azure Rights Management.

1. Create a group, for example, named **AIPMigrated**. This group can be created in Active Directory and synchronized to the cloud, or it can be created in Office 365 or Azure Active Directory. Do not assign any users to this group at this time. At a later step, when users are migrated, you will add them to the group.

    Make a note of this group's object ID. To do this, you can use Azure AD PowerShell—for example, for version 1.0 of the module, use the [Get-MsolGroup](/powershell/msonline/v1/Get-MsolGroup) command. Or you can copy the object ID of the group from the Azure portal.

2. Configure this group for onboarding controls to allow only people in this group to use Azure Rights Management to protect content. To do this, in a PowerShell session, connect to the Azure Rights Management service and when prompted, specify your global admin credentials:

		Connect-AipService

    Then configure this group for onboarding controls, substituting your group object ID for the one in this example, and enter **Y** to confirm when you are prompted:

		Set-AipServiceOnboardingControlPolicy -UseRmsUserLicense $False -SecurityGroupObjectId "fba99fed-32a0-44e0-b032-37b419009501" -Scope WindowsApp

3. [Download the following file](https://go.microsoft.com/fwlink/?LinkId=524619) that contains client migration scripts:
    
    **Migration-Scripts.zip**
    
4. Extract the files and follow the instructions in **Prepare-Client.cmd** so that it contains the server name for your AD RMS cluster extranet licensing URL. 
    
    To locate this name: From the Active Directory Rights Management Services console, click the cluster name. From the **Cluster Details** information, copy the server name from the **Licensing** value from the extranet cluster URLs section. For example: **rmscluster.contoso.com**.

    > [!IMPORTANT]
    > The instructions include replacing example addresses of **adrms.contoso.com** with your AD RMS server addresses. When you do this, be careful that there are no additional spaces before or after your addresses, which will break the migration script and is very hard to identify as the root cause of the problem. Some editing tools automatically add a space after pasting text.
    >

5. Deploy this script to all Windows computers to ensure that when you start to migrate clients, clients yet to be migrated continue to communicate with AD RMS even if they consume content that is protected by migrated clients that are now using the Azure Rights Management service.

    You can use Group Policy or another software deployment mechanism to deploy this script.

## Step 3. Prepare your Exchange deployment for migration

If you are using Exchange on-premises or Exchange online, you might have previously integrated Exchange with your AD RMS deployment. In this step you will configure them to use the existing AD RMS configuration to support content protected by Azure RMS. 

Make sure that you have your [Azure Rights Management service URL for your tenant](migrate-from-ad-rms-phase1.md#to-identify-your-azure-rights-management-service-url) so that you can substitute this value for *&lt;YourTenantURL&gt;* in the following commands. 

**If you have integrated Exchange Online with AD RMS**: Open an Exchange Online PowerShell session and run the following PowerShell commands either one by one, or in a script:

	$irmConfig = Get-IRMConfiguration
	$list = $irmConfig.LicensingLocation
	$list += "<YourTenantURL>/_wmcs/licensing"
	Set-IRMConfiguration -LicensingLocation $list
	Set-IRMConfiguration -internallicensingenabled $false
    Set-IRMConfiguration -internallicensingenabled $true 

**If you have integrated Exchange on-premises with AD RMS**: For each Exchange organization, first add registry values on each Exchange server, and then run PowerShell commands: 

Registry values for Exchange 2013 and Exchange 2016:

**Registry path:**

HKLM\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection

**Type:** Reg_SZ

**Value:** https://\<Your Tenant URL\>/_wmcs/licensing

**Data:** https://\<AD RMS Extranet Licensing URL\>/_wmcs/licensing

---

Registry values For Exchange 2010:

**Registry path:**

HKLM\SOFTWARE\Microsoft\ExchangeServer\v14\IRM\LicenseServerRedirection

**Type:** Reg_SZ

**Value:** https://\<Your Tenant URL\>/_wmcs/licensing

**Data:** https://\<AD RMS Extranet Licensing URL>/_wmcs/licensing

---

PowerShell commands to run either one by one, or in a script

	$irmConfig = Get-IRMConfiguration
	$list = $irmConfig.LicensingLocation
	$list += "<YourTenantURL>/_wmcs/licensing"
	Set-IRMConfiguration -LicensingLocation $list
	Set-IRMConfiguration -internallicensingenabled $false
	Set-IRMConfiguration -RefreshServerCertificates
	Set-IRMConfiguration -internallicensingenabled $true
	IISReset


After running these commands for Exchange Online or Exchange on-premises, if your Exchange deployment was configured to support content that was protected by AD RMS, it will also support content protected by Azure RMS after the migration. Your Exchange deployment will continue to use AD RMS to support protected content until a later step in the migration.


## Next steps
Go to [phase 2 - server-side configuration](migrate-from-ad-rms-phase2.md).

