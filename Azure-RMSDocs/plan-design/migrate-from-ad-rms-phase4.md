---
# required metadata

title: Migrating from AD RMS to Azure Information Protection - Phase 4 | Azure Information Protection
description: Phase 4 of migrating from AD RMS to Azure Information Protection, covering steps 8 through 9 from Migrating from AD RMS to Azure Information Protection.
author: cabailey
manager: mbaldwin
ms.date: 10/05/2016
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

# Migration phase 4 - post migration tasks

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Office 365*


Use the following information for Phase 4 of migrating from AD RMS to Azure Information Protection. These procedures cover steps 8 through 9 from [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md).


## Step 8. Decommission AD RMS

Optional: Remove the Service Connection Point (SCP) from Active Directory to prevent computers from discovering your on-premises Rights Management infrastructure. This is optional because of the redirection that you configured in the registry (for example, by running the migration script). To remove the Service Connection Point, use the AD SCP Register tool from the [Rights Management Services Administration Toolkit](http://www.microsoft.com/download/details.aspx?id=1479).

Monitor your AD RMS servers for activity, for example, by checking the [requests in the System Health report](https://technet.microsoft.com/library/ee221012%28v=ws.10%29.aspx), the [ServiceRequest table](http://technet.microsoft.com/library/dd772686%28v=ws.10%29.aspx) or [auditing of user access to protected content](http://social.technet.microsoft.com/wiki/contents/articles/3440.ad-rms-frequently-asked-questions-faq.aspx). When you have confirmed that RMS clients are no longer communicating with these servers and that clients are successfully using Azure Information Protection, you can remove the AD RMS server role from these server. If you’re using dedicated servers, you might prefer the cautionary step of first shutting down the servers for a period of time to make sure that there are no reported problems that might require restarting these servers to ensure service continuity while you investigate why clients are not using Azure Information Protection.

After decommissioning your AD RMS servers, you might want to take the opportunity to review your templates in the Azure classic portal and consolidate them so that users have fewer to choose between, or reconfigure them, or even add new templates. This would be also a good time to publish the default templates. For more information, see [Configuring custom templates for the Azure Rights Management service](../deploy-use/configure-custom-templates.md).

## Step 9. Re-key your Azure Information Protection tenant key
This step is applicable only if your chosen tenant key topology is Microsoft-managed rather than customer-managed (BYOK with Azure Key Vault).

This step is optional but recommended when your Azure Information Protection tenant key is managed by Microsoft and has been migrated from AD RMS. Re-keying in this scenario helps to protect your Azure Information Protection tenant key from potential security breaches to your AD RMS key.

When you re-key your Azure Information Protection tenant key (also known as “rolling your key”), a new key is created and the original key is archived. However, because moving from one key to another doesn’t happen immediately but over a few weeks, do not wait until you suspect a breach to your original key but re-key your Azure Information Protection tenant key as soon as the migration is complete.

To re-key your Microsoft-managed Azure Information Protection tenant key, [contact Microsoft Support](../get-started/information-support.md#to-contact-microsoft-support) and open an **Azure Information Protection support case with a request to re-key your Azure Information Protection key after migration from AD RMS**. You must prove you are an administrator for your Azure Information Protection tenant, and understand that this process will take several days to confirm. Standard support charges apply; re-keying your tenant key is a not a free-of-charge support service.


## Next steps

For more information about managing your Azure Information Protection tenant key, see [Operations for your Azure Rights Management tenant key](../deploy-use/operations-tenant-key.md).

Now that you have completed the migration, review the [deployment roadmap](deployment-roadmap.md) to identify any other deployment tasks that you might need to do.

