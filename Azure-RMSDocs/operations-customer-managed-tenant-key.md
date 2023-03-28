---
# required metadata

title: Customer-managed - AIP tenant key life cycle operations
description: Information about the life cycle operations that are relevant if you manage your tenant key for Azure Information Protection (the bring your own key, or BYOK, scenario).
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/11/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: c5b19c59-812d-420c-9c54-d9776309636c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: kms
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---


# Customer-managed: Tenant key life cycle operations

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]


If you manage your tenant key for Azure Information Protection (the bring your own key, or BYOK, scenario), use the following sections for more information about the life cycle operations that are relevant to this topology.

## Revoke your tenant key

There are very few scenarios when you might need to revoke your key instead of rekeying. When you revoke your key, all content that has been protected by your tenant using that key will become inaccessible to everybody (including Microsoft, your global admins, and super users) unless you have a backup of the key that you can restore. After revoking your key, you won't be able to protect new content until you create and configure a new tenant key for Azure Information Protection. 

To revoke your customer-managed tenant key, in Azure Key Vault, change the permissions on the key vault that contains your Azure Information Protection tenant key so that the Azure Rights Management service can no longer access the key. This action effectively revokes the tenant key for Azure Information Protection.

When you cancel your subscription for Azure Information Protection, Azure Information Protection stops using your tenant key and no action is needed from you.

## Rekey your tenant key

Rekeying is also known as rolling your key. When you do this operation, Azure Information Protection stops using the existing tenant key to protect documents and emails, and starts to use a different key. Policies and templates are immediately resigned but this changeover is gradual for existing clients and services using Azure Information Protection. So for some time, some new content continues to be protected with the old tenant key.

To rekey, you must configure the tenant key object and specify the alternative key to use. Then, the previously used key is automatically marked as archived for Azure Information Protection. This configuration ensures that content that was protected by using this key remains accessible.

Examples of when you might need to rekey for Azure Information Protection:

- Your company has split into two or more companies. When you rekey your tenant key, the new company will not have access to new content that your employees publish. They can access the old content if they have a copy of the old tenant key.

- You want to move from one key management topology to another. 

- You believe the master copy of your tenant key (the copy in your possession) is compromised.

To rekey to another key that you manage, you can either create a new key in Azure Key Vault or use a different key that is already in Azure Key Vault. Then follow the same procedures that you did to implement BYOK for Azure Information Protection. 

1. Only if the new key is in a different key vault to the one you are already using for Azure Information Protection: Authorize Azure Information Protection to use the key vault, by using the [Set-AzKeyVaultAccessPolicy](/powershell/module/az.keyvault/set-azkeyvaultaccesspolicy) cmdlet.

1. If Azure Information Protection doesn't already know about the key you want to use, run [Use-AipServiceKeyVaultKey](/powershell/module/aipservice/use-aipservicekeyvaultkey) cmdlet.

1. Configure the tenant key object, by using the run [Set-AipServiceKeyProperties](/powershell/module/aipservice/set-aipservicekeyproperties) cmdlet.

For more information about each of these steps:

- To rekey to another key that you manage, see [Planning and implementing your Azure Information Protection tenant key](plan-implement-tenant-key.md).

    
    If you are rekeying an HSM-protected key that you create on-premises and transfer to Key Vault, you can use the same security world and access cards as you used for your current key.

- To rekey, changing to a key that Microsoft manages for you, see the [Rekey your tenant key](operations-microsoft-managed-tenant-key.md#rekey-your-tenant-key) section for Microsoft-managed operations.

## Backup and recover your tenant key

Because you are managing your tenant key, you are responsible for backing up the key that Azure Information Protection uses. 

If you generated your tenant key on premises, in a nCipher HSM: To back up the key, back up the tokenized key file, the world file, and the administrator cards. When you transfer your key to Azure Key Vault, the service saves the tokenized key file, to protect against failure of any service nodes. This file is bound to the security world for the specific Azure region or instance. However, do not consider this tokenized key file to be a full backup. For example, if you ever need a plain text copy of your key to use outside a nCipher HSM, Azure Key Vault cannot retrieve it for you, because it has only a non-recoverable copy.

Azure Key Vault has a [backup cmdlet](/powershell/module/az.keyvault/backup-azkeyvaultkey) that you can use to back up a key by downloading it and storing it in a file. Because the downloaded content is encrypted, it cannot be used outside Azure Key Vault. 

## Export your tenant key

If you use BYOK, you cannot export your tenant key from Azure Key Vault or Azure Information Protection. The copy in Azure Key Vault is non-recoverable. 

## Respond to a breach

No security system, no matter how strong, is complete without a breach response process. Your tenant key might be compromised or stolen. Even when it’s protected well, vulnerabilities might be found in current generation key technology or in current key lengths and algorithms.

Microsoft has a dedicated team to respond to security incidents in its products and services. As soon as there is a credible report of an incident, this team engages to investigate the scope, root cause, and mitigations. If this incident affects your assets, Microsoft notifies your tenant Global administrators by email.

If you have a breach, the best action that you or Microsoft can take depends on the scope of the breach; Microsoft will work with you through this process. The following table shows some typical situations and the likely response, although the exact response depends on all the information that is revealed during the investigation.

|Incident description|Likely response|
|------------------------|-------------------|
|Your tenant key is leaked.|Rekey your tenant key. See [Rekey your tenant key](#rekey-your-tenant-key).|
|An unauthorized individual or malware got rights to use your tenant key but the key itself did not leak.|Rekeying your tenant key does not help here and requires root-cause analysis. If a process or software bug was responsible for the unauthorized individual to get access, that situation must be resolved.|
|Vulnerability discovered in the current-generation HSM technology.|Microsoft must update the HSMs. If there is reason to believe that the vulnerability exposed keys, Microsoft will instruct all customers to rekey their tenant keys.|
|Vulnerability discovered in the RSA algorithm, or key length, or brute-force attacks become computationally feasible.|Microsoft must update Azure Key Vault or Azure Information Protection to support new algorithms and longer key lengths that are resilient, and instruct all customers to rekey their tenant key.|
