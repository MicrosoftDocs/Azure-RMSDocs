---
# required metadata

title: BYOK pricing & restrictions - Azure Information Protection
description: Understand the restrictions when you use customer-managed keys (known as "bring your own key", or BYOK) with Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/28/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: f5930ed3-a6cf-4eac-b2ec-fcf63aa4e809

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# BYOK pricing and restrictions

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*


Organizations that have a subscription that includes Azure Information Protection can configure their Azure Information Protection tenant to use a customer-managed key (BYOK) and [log its usage](./log-analyze-usage.md). 

The key must be stored in Azure Key Vault, which requires an Azure subscription. To use an HSM-protected key, you must use the Azure Key Vault Premium service tier. Using a key in Azure Key Vault incurs a monthly charge. For more information, see the [Azure Key Vault Pricing page](https://azure.microsoft.com/pricing/details/key-vault/).

When you use Azure Key Vault for your Azure Information Protection tenant key, we recommend that you use a dedicated key vault for this key to help ensure that it's used by only the Azure Rights Management service. This configuration ensures that calls by other services do not result in exceeding the [service limits](/azure/key-vault/key-vault-service-limits) for the key vault, which could throttle the response times for the Azure Rights Management service.  

In addition, because each service that uses Azure Key Vault typically has different key management requirements, we recommend a separate Azure subscription for this key vault to help safeguard against misconfiguration. 

However, if you want to share an Azure subscription with other services that use Azure Key Vault, make sure that the subscription shares a common set of administrators. This precaution means that the administrators who use that subscription have a good understanding of all the keys that they have access to, so that they are less likely to misconfigure them. For example, a shared Azure subscription if the administrators for your Azure Information Protection tenant key are the same people who administer keys for Office 365 Customer Key and CRM Online. But if the administrators who manage the keys for Customer Key or CRM Online are not the same people who administer your Azure Information Protection tenant key, then we recommend you do not share your Azure subscription for Azure Information Protection.

## Benefits of using Azure Key Vault

In addition to using Azure Information Protection usage logging, for additional assurance, you can cross-reference this with [Azure Key Vault logging](/azure/key-vault/key-vault-logging) to independently monitor that only the Azure Rights Management service is using this key. If necessary, you can immediately revoke access to the key by removing the permissions on the key vault.

Other benefits of using Azure Key Vault for your Azure Information Protection tenant key:

- Azure Key Vault provides a centralized key management solution that offers a consistent management solution for many cloud-based and even on-premises services that use encryption.

- Azure Key Vault supports a number of built-in interfaces for key management, including PowerShell, CLI, REST APIs, and the Azure portal. Other services and tools have integrated with Key Vault, to provide capabilities that are optimized for specific tasks, such as monitoring. For example, you can analyze your key usage logs via Log analytics from the Operations Management Suite, set alerts when specified criteria are met, and so on.

- Azure Key Vault provides role separation, as a recognized security best practice. Azure Information Protection administrators can focus on managing data classification and protection, and Azure Key Vault administrators can focus on managing encryption keys and any special policies that they might require for security or compliance.

- Some organizations have restrictions where their master key must live. Azure Key Vault provides a high level of control where to store the master key because the service is available in many Azure regions. Currently, you can choose from 28 Azure regions and you can expect this number to increase. For more information, see the [Products available by region] (https://azure.microsoft.com/regions/services/) page on the Azure site.

In addition to managing keys, Azure Key Vault offers your security administrators the same management experience to store, access, and manage certificates and secrets (such as passwords) for other services and applications that use encryption. 

For more information about Azure Key Vault, see [What is Azure Key Vault?](/azure/key-vault/key-vault-whatis) and visit the [Azure Key Vault team blog](https://cloudblogs.microsoft.com/kv/) for the latest information and to learn how other services use this technology.

## Restrictions when using BYOK

BYOK and usage logging work seamlessly with every application that integrates with the Azure Rights Management service that is used by Azure Information Protection. This includes cloud services such as SharePoint Online, on-premises servers that run Exchange and SharePoint that use the Azure Rights Management service by using the RMS connector, and client applications such as Office 2016 and Office 2013. You get key usage logs regardless of which application makes requests to the Azure Rights Management service.

If you have previously enabled Exchange Online IRM by importing your trusted publishing domain (TPD) from Azure RMS, follow the instructions in [Set up new Office 365 Message Encryption capabilities built on top of Azure Information Protection](https://support.office.com/article/7ff0c040-b25c-4378-9904-b1b50210d00e) to enable the new capabilities in Exchange Online that support using BYOK for Azure Information Protection.

## Next steps

If you've made the decision to manage your own key, go to [Implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md#implementing-byok-for-your-azure-information-protection-tenant-key).

If you've decided to stay with the default configuration where Microsoft manages your tenant key, see the [Next steps](plan-implement-tenant-key.md#next-steps) section of the Planning and implementing your Azure Information Protection tenant key article.

