---
# required metadata

title: Migrate AD RMS-Azure Information Protection - Phase 5
description: Phase 5 of migrating from AD RMS to Azure Information Protection, covering steps 10 through 12 from Migrating from AD RMS to Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 07/03/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: d51e7bdd-2e5c-4304-98cc-cf2e7858557d


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

# Migration phase 5 - post migration tasks

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*


Use the following information for Phase 5 of migrating from AD RMS to Azure Information Protection. These procedures cover steps 10 through 12 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).

## Step 10. Deprovision AD RMS

Remove the Service Connection Point (SCP) from Active Directory to prevent computers from discovering your on-premises Rights Management infrastructure. This is optional for the existing clients that you migrated because of the redirection that you configured in the registry (for example, by running the migration script). However, removing the SCP prevents new clients and potentially RMS-related services and tools from finding the SCP when the migration is complete. At this point, all computer connections should go to the Azure Rights Management service. 

To remove the SCP, make sure that you are logged in as a domain enterprise administrator, and then use the following procedure:

1. In the Active Directory Rights Management Services console, right-click the AD RMS cluster, and then click **Properties**.

2. Click the **SCP** tab.

3. Select the **Change SCP** check box.

4. Select **Remove Current SCP**, and then click **OK**.

Now monitor your AD RMS servers for activity. For example, check the [requests in the System Health report](https://technet.microsoft.com/library/ee221012%28v=ws.10%29.aspx), the [ServiceRequest table](https://technet.microsoft.com/library/dd772686%28v=ws.10%29.aspx) or [audit user access to protected content](https://social.technet.microsoft.com/wiki/contents/articles/3440.ad-rms-frequently-asked-questions-faq.aspx). 

When you have confirmed that RMS clients are no longer communicating with these servers and that clients are successfully using Azure Information Protection, you can remove the AD RMS server role from these servers. If you’re using dedicated servers, you might prefer the cautionary step of first shutting down the servers for a period of time. This gives you time to make sure that there are no reported problems that might require you to restart these servers for service continuity while you investigate why clients are not using Azure Information Protection.

After you have deprovisioned your AD RMS servers, you might want to take the opportunity to review your templates in the Azure portal. For example, convert them to labels, consolidate them so that users have fewer to choose between, or reconfigure them. This would be also a good time to publish the default templates. For more information, see [Configuring and managing templates for Azure Information Protection](./configure-policy-templates.md).

>[!IMPORTANT]
> At the end of this migration, your AD RMS cluster cannot be used with Azure Information Protection and the hold your own key (HYOK) option. If you decide to use HYOK for an Azure Information Protection label, because of the redirections that are now in place, the AD RMS cluster that you use must have different licensing URLs to the ones in the clusters that you migrated.

### Addition configuration for computers that run Office 2010

If migrated clients run Office 2010, users might experience delays in opening protected content after our AD RMS servers are deprovisioned. Or, users might see messages that they don't have credentials to open protected content. To resolve these problems, create a network redirection for these computers, which redirects the AD RMS URL FQDN to the local IP address of the computer (127.0.0.1). You can do this by configuring the local hosts file on each computer, or by using DNS.

Redirection via local hosts file:

- Add the following line in the local hosts file, replacing `<AD RMS URL FQDN>` with the value for your AD RMS cluster, without prefixes or web pages:
    
    	127.0.0.1 <AD RMS URL FQDN>

Redirection via DNS:
    
- Create a new host (A) record for your AD RMS URL FQDN, which has the IP address of 127.0.0.1.

## Step 11. Complete client migration tasks

For mobile device clients and Mac computers: Remove the DNS SRV records that you created when you deployed the [AD RMS mobile device extension](https://technet.microsoft.com/library/dn673574.aspx).

When these DNS changes have propogated, these clients will automatically discover and start to use the Azure Rights Management service. However, Mac computers that run Office Mac cache the information from AD RMS. For these computers, this process can take up to 30 days. 

To force Mac computers to run the discovery process immediately, in the keychain, search for "adal" and delete all ADAL entries. Then, run the following commands on these computers:

````

rm -r ~/Library/Cache/MSRightsManagement

rm -r ~/Library/Caches/com.microsoft.RMS-XPCService

rm -r ~/Library/Caches/Microsoft\ Rights\ Management\ Services

rm -r ~/Library/Containers/com.microsoft.RMS-XPCService

rm -r ~/Library/Containers/com.microsoft.RMSTestApp

rm ~/Library/Group\ Containers/UBF8T346G9.Office/DRM.plist

killall cfprefsd

````

When all your existing Windows computers have migrated to Azure Information Protection, there's no reason to continue to use onboarding controls and maintain the **AIPMigrated** group that you created for the migration process. 

Remove the onboarding controls first, and then you can delete the **AIPMigrated** group and any software deployment method that you created to deploy the migration scripts.

To remove the onboarding controls:

1. In a PowerShell session, connect to the Azure Rights Management service and when prompted, specify your global admin credentials:

		Connect-AipService

2. Run the following command, and enter **Y** to confirm:

		Set-AipServiceOnboardingControlPolicy -UseRmsUserLicense $False
    
    Note that this command removes any license enforcement for the Azure Rights Management protection service, so that all computers can protect documents and emails.

3. Confirm that onboarding controls are no longer set:

		Get-AipServiceOnboardingControlPolicy

    In the output, **License** should show **False**, and there is no GUID displayed for the **SecurityGroupOjbectId**

Finally, if you are using Office 2010 and you have enabled the **AD RMS Rights Policy Template Management (Automated)** task in the Windows Task Scheduler library, disable this task because it is not used by the Azure Information Protection client. This task is typically enabled by using group policy and supports an AD RMS deployment. You can find this task in the following location: **Microsoft** > **Windows** > **Active Directory Rights Management Services Client**

## Step 12. Rekey your Azure Information Protection tenant key

This step is required when migration is complete if your AD RMS deployment was using RMS Cryptographic Mode 1 because this mode uses a 1024-bit key and SHA-1. This configuration is considered to offer an inadequate level of protection. Microsoft doesn’t endorse the use of lower key lengths such as 1024-bit RSA keys and the associated use of protocols that offer inadequate levels of protection, such as SHA-1.

Rekeying results in protection that uses RMS Cryptographic Mode 2, which results in a 2048-bit key and SHA-256. 

Even if your AD RMS deployment was using Cryptographic Mode 2, we still recommend you do this step because a new key helps to protect your tenant from potential security breaches to your AD RMS key.

When you rekey your Azure Information Protection tenant key (also known as "rolling your key"), the currently active key is archived and Azure Information Protection starts to use a different key that you specify. This different key could be a new key that you create in Azure Key Vault, or the default key that was automatically created for your tenant.

Moving from one key to another doesn’t happen immediately but over a few weeks. Because it's not immediate, do not wait until you suspect a breach to your original key but do this step as soon as the migration is complete.

To rekey your Azure Information Protection tenant key:

- **If your tenant key is managed by Microsoft**: Run the PowerShell cmdlet [Set-AipServiceKeyProperties](/powershell/module/aipservice/set-aipservicekeyproperties) and specify the key identifier for the key that was automatically created for your tenant. You can identify the value to specify by running the [Get-AipServiceKeys](/powershell/module/aipservice/get-aipservicekeys) cmdlet. The key that was automatically created for your tenant has the oldest creation date, so you can identify it by using the following command:
    
    	(Get-AipServiceKeys) | Sort-Object CreationTime | Select-Object -First 1

- **If your tenant key is managed by you (BYOK)**: In Azure Key Vault, repeat your key creation process for your Azure Information Protection tenant, and then run the [Use-AipServiceKeyVaultKey](/powershell/module/aipservice/use-aipservicekeyvaultkey) cmdlet again to specify the URI for this new key. 

For more information about managing your Azure Information Protection tenant key, see [Operations for your Azure Information Protection tenant key](./operations-tenant-key.md).


## Next steps

Now that you have completed the migration, review the [deployment roadmap](deployment-roadmap.md) to identify any other deployment tasks that you might need to do.

