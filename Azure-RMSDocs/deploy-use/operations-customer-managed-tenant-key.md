---
# required metadata

title: Customer-managed - AIP tenant key lifecycle operations
description: Information about the lifecycle operations that are relevant if you manage your tenant key for Azure Information Protection (the bring your own key, or BYOK, scenario).
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/19/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: c5b19c59-812d-420c-9c54-d9776309636c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Customer-managed: Tenant key lifecycle operations

>*Applies to: Azure Information Protection, Office 365*

If you manage your tenant key for Azure Information Protection (the bring your own key, or BYOK, scenario), use the following sections for more information about the lifecycle operations that are relevant to this topology.

## Revoke your tenant key
In Azure Key Vault, you can change the permissions on the key vault that contains your Azure Information Protection tenant key so that the Azure Rights Management service can no longer access the key. However, when you do this, nobody will be able to open documents and emails that you previously protected with the Azure Rights Management service.

When you cancel your subscription for Azure Information Protection, Azure Information Protection stops using your tenant key and no action is needed from you.

## Rekey your tenant key
Rekeying is also known as rolling your key. When you do this operation, Azure Information Protection stops using the existing tenant key to protect documents and emails and starts to use a different key. Policies and templates are immediately resigned but this changeover is gradual for existing clients and services using Azure Information Protection. So for some time, some new content continues to be protected with the old tenant key.

By using the tenant key object, the previously used key is automatically marked as archived for Azure Information Protection. This configuration ensures that content that was protected by using this key remains accessible.

Examples of when you might need to rekey for Azure Information Protection:

- Your company has split into two or more companies. When you rekey your tenant key, the new company will not have access to new content that your employees publish. They can access the old content if they have a copy of the old tenant key.

- You believe the master copy of your tenant key (the copy in your possession) was compromised.

To rekey, you can either create a new key in Azure Key Vault or use a different key that is already in Azure Key Vault. Then follow the same procedures that you did to implement BYOK for Azure Information Protection:

1. Authorize Azure Information Protection to use the new key, by using the [Set-AzureRmKeyVaultAccessPolicy](/powershell/module/azurerm.keyvault/set-azurermkeyvaultaccesspolicy) cmdlet.

2. Configure Azure Information Protection to use the new key, by using the [Use-AadrmKeyVaultKey](/powershell/module/aadrm/use-aadrmkeyvaultkey) cmdlet.

3. Set this key object to be active, by using the run [Set-AadrmKeyProperties](/powershell/module/aadrm/set-aadrmkeyproperties) cmdlet.

For more information about each of these steps, see [Implementing your Azure Information Protection tenant key](../plan-design/plan-implement-tenant-key.md#implementing-your-azure-information-protection-tenant-key).

## Backup and recover your tenant key
You are responsible for backing up your tenant key. If you generated your tenant key in a Thales HSM, to back up the key, just back up the Tokenized Key file, the World file, and the Administrator Cards.

Because you transferred your key by following the procedures in the [Implementing bring your own key (BYOK)](../plan-design/plan-implement-tenant-key.md#implementing-byok-for-your-azure-information-protection-tenant-key) section from the [Planning and implementing your Azure Rights Management tenant key](../plan-design/plan-implement-tenant-key.md) article, Key Vault will persist the Tokenized Key File, to protect against failure of any service nodes. This file is bound to the security world for the specific Azure region or instance. However, do not consider this to be a full backup. For example, if you ever need a plain text copy of your key to use outside a Thales HSM, Azure Key Vault will not be able to retrieve it for you because it only has a non-recoverable copy.

## Export your tenant key
If you use BYOK, you cannot export your tenant key from Azure Key Vault or Azure Information Protection. The copy in Azure Key Vault is non-recoverable. 

## Respond to a breach
No security system, no matter how strong, is complete without a breach response process. Your tenant key might be compromised or stolen. Even when it’s well protected well, vulnerabilities might be found in current generation HSM technology or current key lengths and algorithms.

Microsoft has a dedicated team to respond to security incidents in its products and services. As soon as there is a credible report of an incident, this team engages to investigate the scope, root cause, and mitigations. If this incident affects your assets, then Microsoft will notify your Azure Information Protection tenant administrators by email by using the address that you supplied when you subscribed.

If you have a breach, the best action that you or Microsoft can take depends on the scope of the breach; Microsoft will work with you through this process. The following table shows some typical situations and the likely response, although the exact response will depend on all the information that is revealed during the investigation.

|Incident description|Likely response|
|------------------------|-------------------|
|Your tenant key is leaked.|Rekey your tenant key. See [Rekey your tenant key](#rkey-your-tenant-key).|
|An unauthorized individual or malware got rights to use your tenant key but the key itself did not leak.|Rekeying your tenant key does not help here and requires root-cause analysis. If a process or software bug was responsible for the unauthorized individual to get access, that situation must be resolved.|
|Vulnerability discovered in the current-generation HSM technology.|Microsoft must update the HSMs. If there is reason to believe that the vulnerability exposed keys, then Microsoft will instruct all customers to renew their tenant keys.|
|Vulnerability discovered in the RSA algorithm, or key length, or brute-force attacks become computationally feasible.|Microsoft must update Azure Key Vault or Azure Information Protection to support new algorithms and longer key lengths that are resilient, and instruct all customers to renew their tenant keys.|

[!INCLUDE[Commenting house rules](../includes/houserules.md)]

