---
# required metadata

title: Migrating from AD RMS to Azure Rights Management - Phase 4 | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
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

Use the following information for Phase 4 of migrating from AD RMS to Azure Rights Management (Azure RMS). These procedures cover steps 8 through 9 from [Migrating from AD RMS to Azure Rights Management](migrating-from-ad-rms-to-azure-rights-management.md).


## Step 8. Decommission AD RMS

Optional: Remove the Service Connection Point (SCP) from Active Directory to prevent computers from discovering your on-premises Rights Management infrastructure. This is optional because of the redirection that you configured in the registry (for example, by running the migration script). To remove the Service Connection Point, use the AD SCP Register tool from the [Rights Management Services Administration Toolkit](http://www.microsoft.com/download/details.aspx?id=1479).

Monitor your AD RMS servers for activity, for example, by checking the [requests in the System Health report](https://technet.microsoft.com/library/ee221012%28v=ws.10%29.aspx), the [ServiceRequest table](http://technet.microsoft.com/library/dd772686%28v=ws.10%29.aspx) or [auditing of user access to protected content](http://social.technet.microsoft.com/wiki/contents/articles/3440.ad-rms-frequently-asked-questions-faq.aspx). When you have confirmed that RMS clients are no longer communicating with these servers and that clients are successfully using Azure RMS, you can remove the AD RMS server role from these server. If you’re using dedicated servers, you might prefer the cautionary step of first shutting down the servers for a period of time to make sure that there are no reported problems that might require restarting these servers to ensure service continuity while you investigate why clients are not using Azure RMS.

After decommissioning your AD RMS servers, you might want to take the opportunity to review your templates in the Azure classic portal and consolidate them so that users have fewer to choose between, or reconfigure them, or even add new templates. This would be also a good time to publish the default templates. For more information, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates-for-azure-rights-management.md).

## Step 9. Re-key your Azure RMS tenant key
This step is required when migration is complete if your AD RMS deployment was using RMS Cryptographic Mode 1, because re-keying creates a new tenant key that uses RMS Cryptographic Mode 2. Using Azure RMS with Cryptographic Mode 1 is supported only during the migration process.

This step is optional but recommended when migration is complete even if you were running in RMS Cryptographic Mode 2, because it helps to secure your Azure RMS tenant key from potential security breaches to your AD RMS key. When you re-key your Azure RMS tenant key (also known as “rolling your key”), a new key is created and the original key is archived. However, because moving from one key to another doesn’t happen immediately but over a few weeks, do not wait until you suspect a breach to your original key but re-key your RMS tenant key as soon as the migration is complete.

To re-key your Azure RMS tenant key:

-   If your RMS tenant key is managed by Microsoft: Call Microsoft Customer Support Services (CSS) and prove that you are the RMS tenant administrator.

-   If your RMS tenant key is managed by you (BYOK): Repeat the BYOK procedure to generate and create a new key over the Internet or in person.

For more information about managing your RMS tenant key, see [Operations for your Azure Rights Management tenant ky](../deploy-use/operations-for-your-azure-rights-management-tenant-key.md).

## Next steps

Now that you have completed the migration, review the [deployment roadmap](azure-rights-management-deployment-roadmap.md) to identify any other deployment tasks that you might need to do.

