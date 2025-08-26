---
# required metadata

title: Migrate AD RMS-Azure Information Protection - Phase 1
description: Phase 1 of migrating from AD RMS to Azure Information Protection, covering steps 1 through 3 from Migrating from AD RMS to Azure Information Protection.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/26/2020
ms.topic: how-to
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
ms.custom: admin, has-azure-ad-ps-ref, azure-ad-ref-level-one-done
---

# Migration phase 1 - preparation


Use the following information for Phase 1 of migrating from AD RMS to Azure Information Protection. These procedures cover steps 1 through 3 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md) and prepare your environment for migration without any effect to your users.

## Step 1: Install the AIPService PowerShell module and identify your tenant URL

Install the **AIPService** module to enable you to configure and manage the service that provides the data protection for Azure Information Protection.

For instructions, see [Install the AIPService PowerShell module for the Azure Right Management service](/purview/install-aipservice-powershell).

To complete some of the migration instructions, you need to know the Azure Rights Management service URL for your tenant, so that you can substitute it for when you see references to *\<Your Tenant URL\>*. 

Your Azure Rights Management service URL has the following format: **{GUID}.rms.[Region].aadrm.com**. For example: **5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com**

### To identify your Azure Rights Management service URL

1. Connect to the Azure Rights Management service and when prompted, enter the credentials for your tenant's global administrator:

    ```PowerShell
    Connect-AipService
    ```

2. Get your tenant's configuration:

    ```PowerShell
    Get-AipServiceConfiguration
    ```

3. Copy the value displayed for **LicensingIntranetDistributionPointUrl**, and from this string, remove `/_wmcs\licensing`.

    What remains is your Azure Rights Management service URL for your Azure Information Protection tenant. This value is often shortened to *Your tenant URL* in the following migration instructions.

    You can verify that you have the correct value by running the following PowerShell command:

    ```PowerShell
    (Get-AipServiceConfiguration).LicensingIntranetDistributionPointUrl -match "https:\/\/[0-9A-Za-z\.-]*" | Out-Null; $matches[0]
    ```

## Step 2: Prepare for client migration

For most migrations, it isn't practical to migrate all clients at once. You're likely migrate clients in batches. 

This means that for some time, some clients use Azure Information Protection and some will still be using AD RMS. To support both premigrated and migrated users, use onboarding controls and deploy a premigration script. 

> [!NOTE]
> This step is required during the migration process so that users who have not yet migrated can consume content that has been protected by migrated users who are now using Azure Rights Management.
> 

**To prepare for client migration**

1. Create a group, for example, named **AIPMigrated**. This group can be created in Active Directory and synchronized to the cloud, or it can be created in Microsoft 365 or Microsoft Entra ID.

    Don't assign any users to this group at this time. At a later step, when users are migrated, add them to the group.

1. Make a note of this group's object ID using one of the following methods.

    - **Use Microsoft Graph PowerShell.** For example, use the [Get-MgGroup](/powershell/module/microsoft.graph.groups/get-mggroup) command.
    - **Copy the object ID** of the group from the Azure portal.

1. Configure this group for onboarding controls to allow only people in this group to use Azure Rights Management to protect content.

    To do this configuration, in a PowerShell session, connect to the Azure Rights Management service. When prompted, specify your global admin credentials.

    ```PowerShell
    Connect-AipService
    ```

    Configure this group for onboarding controls, substituting your group object ID for the one in this example. When prompted, enter **Y** to confirm.

    ```PowerShell
    Set-AipServiceOnboardingControlPolicy -UseRmsUserLicense $False -SecurityGroupObjectId "fba99fed-32a0-44e0-b032-37b419009501" -Scope WindowsApp
    ```

1. Download the [**Migration-Scripts.zip**](https://go.microsoft.com/fwlink/?LinkId=524619) file.

1. Extract the files and follow the instructions in **Prepare-Client.cmd**, so that it contains the server name for your AD RMS cluster extranet licensing URL. To locate this name, do the following steps.

    1. From the Active Directory Rights Management Services console, select the cluster name.

    1. From the **Cluster Details** information, copy the server name from the **Licensing** value from the extranet cluster URLs section. For example: **rmscluster.contoso.com**.

    > [!IMPORTANT]
    > The instructions include replacing example addresses of **adrms.contoso.com** with your AD RMS server addresses.
    >
    > When you do this, be careful that there are no additional spaces before or after your addresses. Extra spaces will break the migration script, and is very hard to identify as the root cause of the problem.
    >
    > Some editing tools automatically add a space after pasting text.
    >

1. Deploy this script to all Windows computers to ensure that when you start to migrate clients, clients yet to be migrated continue to communicate with AD RMS even if they consume content that is protected by migrated clients that are now using the Azure Rights Management service.

    You can use Group Policy or another software deployment mechanism to deploy this script.

## Step 3: Prepare your Exchange deployment for migration

If you use Exchange on-premises or Exchange online, you might have previously integrated Exchange with your AD RMS deployment. In this step, configure them to use the existing AD RMS configuration to support content protected by Azure RMS.

Make sure that you have your [Azure Rights Management service URL for your tenant](migrate-from-ad-rms-phase1.md#to-identify-your-azure-rights-management-service-url) so that you can substitute this value for *&lt;YourTenantURL&gt;* in the following commands.

Do one of the following, depending on whether you integrated Exchange on-premises or Exchange Online with AD RMS:

- [Integrated Exchange on-premises with AD RMS](#if-you-have-integrated-exchange-on-premises-with-ad-rms)
- [Integrated Exchange Online with AD RMS](#if-you-have-integrated-exchange-online-with-ad-rms)
### If you have integrated Exchange Online with AD RMS

1. Open an Exchange Online PowerShell session.

1. Run the following PowerShell commands either one by one, or in a script.

    ```PowerShell
    $irmConfig = Get-IRMConfiguration
    $list = $irmConfig.LicensingLocation
    $list += "<YourTenantURL>/_wmcs/licensing"
    Set-IRMConfiguration -LicensingLocation $list
    Set-IRMConfiguration -internallicensingenabled $false
    Set-IRMConfiguration -internallicensingenabled $true 
    ```

### If you have integrated Exchange on-premises with AD RMS

For each Exchange organization, add registry values on each Exchange server, and then run PowerShell commands:

1. If you have Exchange 2013 or Exchange 2016, add the following registry value:

    - **Registry path**: `HKLM\SOFTWARE\Microsoft\ExchangeServer\v15\IRM\LicenseServerRedirection`

    - **Type**: Reg_SZ

    - **Value**: `https://\<Your Tenant URL\>/_wmcs/licensing`

    - **Data**: `https://\<AD RMS Extranet Licensing URL\>/_wmcs/licensing`

1. Run the following PowerShell commands, either one by one, or in a script:

    ```PowerShell
    $irmConfig = Get-IRMConfiguration
    $list = $irmConfig.LicensingLocation
    $list += "<YourTenantURL>/_wmcs/licensing"
    Set-IRMConfiguration -LicensingLocation $list
    Set-IRMConfiguration -internallicensingenabled $false
    Set-IRMConfiguration -RefreshServerCertificates
    Set-IRMConfiguration -internallicensingenabled $true
    IISReset
    ```

After you run these commands for Exchange Online or Exchange on-premises, if your Exchange deployment was configured to support content that was protected by AD RMS, it will also support content protected by Azure RMS after the migration. 

Your Exchange deployment continues to use AD RMS to support protected content until a later step in the migration.

## Next steps

Go to [phase 2 - server-side configuration](migrate-from-ad-rms-phase2.md).
