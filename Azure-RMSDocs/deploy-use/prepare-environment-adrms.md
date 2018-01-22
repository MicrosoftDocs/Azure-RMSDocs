---
# required metadata

title: Prepare the environment for Azure RMS and AD RMS
description: Guidance if you have Azure Rights Management with AD RMS deployed.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/29/2018
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

## You see an option to activate protection when you configure Azure Information Protection

The **Azure Information Protection - Protection activation** blade has an option to activate the Azure Rights Management service (Azure RMS). 

If you are also using Active Directory Rights Management Services (AD RMS), do not select the **Activate** option. Activating Azure Rights Management when you also have AD RS isn't a compatible combination. This scenario isn't supported and has unreliable results, so it's important that you do not activate Azure Rights Management at this time. 

When you are ready to move computers from AD RMS to the Azure Rights Management service, you can start a migration process. One of the steps in the migration is to activate the service but you do this after you have exported configuration information from AD RMS to the Azure Rights Management service. This process ensures that documents and emails that were protected by AD RMS can still be opened.

When the Azure Rights Management service isn't activated, you can still use Azure Information Protection for labels that apply classification only. A special default policy is created for you that does not include data protection and those configuration options remain unavailable until the Azure Rights Management service is activated.

### Step 1: Configure your Azure Information Protection policy for classification and labeling - without protection

From the initial **Azure Information Protection** blade, select **Global policy** to view and configure your default policy that does not include options for data protection. For more information, see [Configuring Azure Information Protection policy](configure-policy.md).

### Step 2: Start planning for migration

Follow the migration guidance: [Migrating from AD RMS to Azure Information Protection](../plan-design/migrate-from-ad-rms-to-azure-rms.md).

### Step 3: Start to configure labels for protection

After you have activated the Azure Rights Management service as part of the migration process, you can configure labels for data protection. However, if you migrate users in batches, make sure that labels that apply protection are [scoped](configure-policy-scope.md) to just the migrated users.


[!INCLUDE[Commenting house rules](../includes/houserules.md)]


