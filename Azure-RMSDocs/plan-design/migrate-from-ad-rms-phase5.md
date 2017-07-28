---
# required metadata

title: Migrate AD RMS-Azure Information Protection - Phase 5
description: Phase 5 of migrating from AD RMS to Azure Information Protection, covering steps 10 through 12 from Migrating from AD RMS to Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/31/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: d51e7bdd-2e5c-4304-98cc-cf2e7858557d


# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Migration phase 5 - post migration tasks

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Office 365*


Use the following information for Phase 5 of migrating from AD RMS to Azure Information Protection. These procedures cover steps 10 through 12 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).

## Step 10. Deprovison AD RMS

Remove the Service Connection Point (SCP) from Active Directory to prevent computers from discovering your on-premises Rights Management infrastructure. This is optional for the existing clients that you migrated because of the redirection that you configured in the registry (for example, by running the migration script). However, removing the SCP prevents new clients and potentially RMS-related services and tools from finding the SCP when the migration is complete and all connections should be going to the Azure Rights Management service. 

To remove the SCP, make sure that you are logged in as a domain enterprise administrator, and then use the following procedure:

1. In the Active Directory Rights Management Services console, right-click the AD RMS cluster, and then click **Properties**.

2. Click the **SCP** tab.

3. Select the **Change SCP** check box.

4. Select **Remove Current SCP**, and then click **OK**.

Now monitor your AD RMS servers for activity, for example, by checking the [requests in the System Health report](https://technet.microsoft.com/library/ee221012%28v=ws.10%29.aspx), the [ServiceRequest table](http://technet.microsoft.com/library/dd772686%28v=ws.10%29.aspx) or [auditing of user access to protected content](http://social.technet.microsoft.com/wiki/contents/articles/3440.ad-rms-frequently-asked-questions-faq.aspx). 

When you have confirmed that RMS clients are no longer communicating with these servers and that clients are successfully using Azure Information Protection, you can remove the AD RMS server role from these servers. If you’re using dedicated servers, you might prefer the cautionary step of first shutting down the servers for a period of time to make sure that there are no reported problems that might require restarting these servers to ensure service continuity while you investigate why clients are not using Azure Information Protection.

After you have deprovisioned your AD RMS servers, you might want to take the opportunity to review your templates in the Azure portal and consolidate them so that users have fewer to choose between, or reconfigure them, or even add new templates. This would be also a good time to publish the default templates. For more information, see [Configuring and managing templates for Azure Information Protection](../deploy-use/configure-policy-templates.md).

>[!IMPORTANT]
> At the end of this migration, your AD RMS cluster cannot be used with Azure Information Protection and the hold your own key (HYOK) option. If you decide to use HYOK for an Azure Information Protection label, because of the redirections that are now in place, the AD RMS cluster that you use must have different licensing URLs to the ones in the clusters that you migrated.

## Step 11. Remove onboarding controls

When all your existing clients have migrated to Azure Information Protection, there's no reason to continue to use onboarding controls and maintain the **AIPMigrated** group that you created for the migration process. 

Remove the onboarding controls first, and then you can delete the **AIPMigrated** group and any software deployment task you created to deploy the redirections.

To remove the onboarding controls:

1. In a PowerShell session, connect to the Azure Rights Management service and when prompted, specify your global admin credentials:

		Connect-Aadrmservice

2. Run the following command, and enter **Y** to confirm:

		Set-AadrmOnboardingControlPolicy -UseRmsUserLicense $False

3. Confirm that onboarding controls are no longer set:

		Get-AadrmOnboardingControlPolicy

    In the output, **License** should show **False**, and there is no GUID displayed for the **SecurityGroupOjbectId**

## Step 12. rekey your Azure Information Protection tenant key
This step is required when migration is complete if your AD RMS deployment was using RMS Cryptographic Mode 1, because rekeying creates a new tenant key that uses RMS Cryptographic Mode 2. Using Azure RMS with Cryptographic Mode 1 is supported only during the migration process.

This step is optional but recommended when migration is complete even if you were running in RMS Cryptographic Mode 2. rekeying in this scenario helps to protect your Azure Information Protection tenant key from potential security breaches to your AD RMS key.

When you rekey your Azure Information Protection tenant key (also known as “rolling your key”), a new key is created and the original key is archived. However, because moving from one key to another doesn’t happen immediately but over a few weeks, do not wait until you suspect a breach to your original key but rekey your Azure Information Protection tenant key as soon as the migration is complete.

To rekey your Azure Information Protection tenant key:

- If your tenant key is managed by Microsoft: Contact [Microsoft Support](../get-started/information-support.md#to-contact-microsoft-support) and open an **Azure Information Protection support case with a request to rekey your Azure Information Protection key after migration from AD RMS**. You must prove you are an administrator for your Azure Information Protection tenant, and understand that this process takes several days to confirm. Standard support charges apply; rekeying your tenant key is not a free-of-charge support service.

- If your tenant key is managed by you (BYOK): In Azure Key Vault, rekey the key that you're using for your Azure Information Protection tenant, and then run the [Use-AadrmKeyVaultKey](/powershell/aadrm/vlatest/use-aadrmkeyvaultkey) cmdlet again to specify the new key URL. 

For more information about managing your Azure Information Protection tenant key, see [Operations for your Azure Rights Management tenant key](../deploy-use/operations-tenant-key.md).

## Next steps

Now that you have completed the migration, review the [deployment roadmap](deployment-roadmap.md) to identify any other deployment tasks that you might need to do.

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
