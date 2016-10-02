---
# required metadata

title: BYOK pricing and restrictions | Azure Information Protection
description: Understand the restrictions when you use customer-managed keys (known as "bring your own key", or BYOK) with Azure RMS.
author: cabailey
manager: mbaldwin
ms.date: 10/03/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
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

>*Applies to: Azure Information Protection, Office 365*


Organizations that have a subscription that includes Azure Information Protection can use customer-managed keys (BYOK) in Azure Key Vault and [log its usage](../deploy-use/log-analyze-usage.md) at no extra charge. 

However, to use Azure Key Vault, you must have an Azure subscription that supports Key Vault with HSM-protected keys. Using a key in Azure Key Vault incurs a monthly charge. For more information, see the [Azure Key Vault Pricing page](https://azure.microsoft.com/en-us/pricing/details/key-vault/).

When you use Azure Key Vault for your Azure Information Protection tenant key, we recommend that you use a dedicated key vault for this key, to ensure that it's used by only the Azure Rights Management service. In addition to using Azure Information Protection usage logging, for additional assurance, you can cross-reference this with [Azure Key Vault logging](https://azure.microsoft.com/documentation/articles/key-vault-logging/) to independently monitor that only the Azure Rights Management service is using this key. If necessary, you can immediately revoke access to the key by removing the permissions on the key vault.

Although we recommend a dedicated key vault for Azure Information Protection, using the same subscription you can create other key vaults to securely store and access other keys and secrets (such as passwords).

Other benefits of using Azure Key Vault for your Azure Information Protection tenant key:

- Azure Key Vault provides a centralized key management solution that offers a consistent management solution for many cloud-based and even on-premises services that use encryption.

- Azure Key Vault supports a number of interfaces for key management, including PowerShell, CLI, REST APIs, and the Azure portal. As a result, many other services and tools can support and interface with Key Vault, to provide supporting tools and services for managing keys. For example, you can analyze your key usage logs via Log analytics from the Operations Management Suite, set alerts when specified criteria are met, and so on.

- Azure Key Vault provides role separation, as a recognized security best practice. Azure Information Protection administrators can focus on managing data classification and protection, and Azure Key Vault administrators can focus on managing encryption keys and any special policies that they might require for security or compliance.

- Some organizations have restrictions where their master key must live. Azure Key Vault provides a high level of control where to store the master key because the service is available in many Azure regions. Currently, 28 Azure regions are supported and this number is expected to increase.

For more information about Azure Key Vault, see [What is Azure Key Vault?](https://azure.microsoft.com/documentation/articles/key-vault-whatis/) and visit the [Azure Key Vault team blog](https://blogs.technet.microsoft.com/kv/), for the latest information and how other services use this technology.


## Restrictions

If you have users who have signed up for a free account by using RMS for individuals, you cannot use BYOK or usage logging because this configuration does not have a tenant administrator to configure these features.


> [!NOTE]
> For more information about RMS for individuals, see [RMS for individuals and Azure Rights Management](../understand-explore/rms-for-individuals.md).

![BYOK doesn't support Exchange Online](../media/RMS_BYOK_noExchange.png)

BYOK and usage logging work seamlessly with every application that integrates with the Azure Rights Management service (Azure RMS) that is used by Azure Information Protection. This includes cloud services such as SharePoint Online, on-premises servers that run Exchange and SharePoint that work with Azure RMS by using the RMS connector, and client applications such as Office 2016 and Office 2013. You will get key usage logs regardless of which application makes requests of Azure RMS.

There is one exception: Currently, **Azure RMS BYOK is not compatible with Exchange Online**. If you want to use Exchange Online, we recommend that you deploy Azure RMS in the default key management mode now, where Microsoft generates and manages your key. You have the option to move to BYOK later, for example, when Exchange Online does support Azure RMS BYOK. However, if you cannot wait, another option is to deploy Azure RMS with BYOK now, with reduced RMS functionality for Exchange Online (unprotected emails and unprotected attachments remain fully functional):

-   Protected emails or protected attachments in Outlook Web Access cannot be displayed.

-   Protected emails on mobile devices that use Exchange ActiveSync IRM cannot be displayed.

-   Transport decryption (for example, to scan for malware) and journal  decryption is not possible, so protected emails and protected attachments will be skipped.

-   Transport protection rules and data loss prevention (DLP) that enforce IRM policies is not possible, so RMS protection cannot be applied by using these methods.

-   Server-based search for protected emails, so protected emails will be skipped.

When you use Azure RMS BYOK with reduced RMS functionality for Exchange Online, RMS will work with email clients in Outlook on Windows and Mac, and on other email clients that don't use Exchange ActiveSync IRM.

If you are migrating to Azure RMS from AD RMS, you might have imported your key as a trusted publishing domain (TPD) to Exchange Online (also called BYOK in Exchange terminology, which is separate from Azure Key Vault BYOK). In this scenario, you must remove the TPD from Exchange Online to avoid conflicting templates and policies. For more information, see [Remove-RMSTrustedPublishingDomain](https://technet.microsoft.com/library/jj200720%28v=exchg.150%29.aspx) from the Exchange Online cmdlets library.

Sometimes, the Azure RMS BYOK  exception for Exchange Online is not a problem in practice. For example, organizations that need BYOK and logging run their data applications (Exchange, SharePoint, Office) on-premises, and use Azure RMS for functionality that is not easily available with on-premises AD RMS (for example, collaboration with other companies and access from mobile clients). Both BYOK and logging work well in this scenario and allow the organization to have full control over their Azure RMS subscription.

## Next steps

If you've made the decision to manage your own key, go to [Implementing your Azure Rights Management tenant key](plan-implement-tenant-key.md#implementing-your-azure-rights-management-tenant-key).

If you've decided to stay with the default configuration where Microsoft manages your tenant key, see the [Next steps](plan-implement-tenant-key.md#next-steps) section of the Planning and implementing your Azure Rights Management tenant key article.

