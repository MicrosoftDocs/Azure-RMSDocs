---
# required metadata

title: Prepare the environment for Azure RMS and AD RMS
description: Guidance if you have Azure Rights Management with AD RMS deployed.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/31/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 11ffa730-c5dc-4b6b-9c1e-c58eff8aafc2

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Preparing the environment for Azure Rights Management when you also have Active Directory Rights Management Services (AD RMS)

>*Applies to: Azure Information Protection, Office 365*

Important guidance if you are already using Active Directory Rights Management Services (AD RMS) and the following scenario applies:

## You see an option to activate Azure RMS when you configure Azure Information Protection

Beginning with July 31, 2017: If the Azure Rights Management service for your tenant is not activated when you first use the Azure portal to configure your Azure Information Protection policy, you see a **Welcome** page with a **Launch Azure Information Protection** button.

This page also has a check box (selected by default) to activate Azure Rights Management for you, so that the [default Azure Information Protection policy](configure-policy-default.md) that is automatically created for you can include labels that apply Azure Rights Management protection.

If you are also using Active Directory Rights Management Services (AD RMS), cancel this check box. Activating Azure Rights Management when you also have AD RS isn't a compatible combination. This scenario isn't supported and has unreliable results, so it's important that you do not activate Azure Rights Management at this time. 

When you are ready to move computers from AD RMS to the Azure Rights Management service, you can start a migration process. One of the steps in the migration is to activate the service but you do this after you have exported configuration information from AD RMS to the Azure Rights Management service. This process ensures that documents and emails that were protected by AD RMS can still be opened.

When you cancel the option to activate Azure Rights Management and then click **Launch Azure Information Protection** on the **Welcome** page, a default Azure Information Protection policy is still created for you. But it's a version of the default policy that does not include data protection and those configuration options will be unavailable to you until the Azure Rights Management service is activated.

### Step One: Configure your Azure Information Protection policy for classification and labeling - without protection

After you have canceled the option to activate Azure Rights Management, you can view and configure the default policy, which does not include options for data protection.

### Step Two: Start planning for migration

See the migration guidance: [Migrating from AD RMS to Azure Information Protection](../plan-design/migrate-from-ad-rms-to-azure-rms.md).

### Step Three: Start to configure labels for protection

After you have activated the Azure Rights Management service as part of the migration process, you can configure labels for data protection. However, if you migrate users in batches, make sure that labels that apply protection are scoped to migrated users only.


[!INCLUDE[Commenting house rules](../includes/houserules.md)]


