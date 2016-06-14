---
# required metadata

title: Planning and implementing your Azure Rights Management tenant key | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 06/12/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: f0d33c5f-a6a6-44a1-bdec-5be1bc8e1e14

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Planning and implementing your Azure Rights Management tenant key

*Applies to: Azure Rights Management, Office 365*

Use the information in this article to help you plan for and manage your Rights Management (RMS) tenant key for Azure RMS. For example, instead of Microsoft managing your tenant key (the default), you might want to manage your own tenant key to comply with specific regulations that apply to your organization.  Managing your own tenant key is also referred to as bring your own key, or BYOK.

> [!NOTE]
> The RMS tenant key is also known as the Server Licensor Certificate (SLC) key. Azure RMS maintains one or more keys for each organization that subscribes to Azure RMS. Whenever a key is used for RMS within an organization (such as user keys, computer keys, document encryption keys), they cryptographically chain to your RMS tenant key.

**At a glance:** Use the following table as a quick guide to your recommended tenant key topology. Then, use the additional documentation for more information.

If you deploy Azure RMS by using a tenant key that is managed by Microsoft, you can change to BYOK later. However, you cannot currently change your Azure RMS tenant key from BYOK to managed by Microsoft.

|Business requirement|Recommended tenant key topology|
|------------------------|-----------------------------------|
|Deploy Azure RMS quickly and without requiring special hardware|Managed by Microsoft|
|Need full IRM functionality in Exchange Online with Azure RMS|Managed by Microsoft|
|Your keys are created by you and protected in a hardware security module (HSM)|BYOK<br /><br />Currently, this configuration will result in reduced IRM functionality in Exchange Online. For more information, see [BYOK pricing and restrictions](byok-price-restrictions.md).|

## Choose your tenant key topology: Managed by Microsoft (the default) or managed by you (BYOK)
Decide which tenant key topology is best for your organization. By default, Azure RMS generates your tenant key and manages most aspects of the tenant key lifecycle. This is the simplest option with the lowest administrative overheads. In most cases, you do not even need to know that you have a tenant key. You just sign up for Azure RMS and the rest of the key management process is handled by Microsoft.

Alternatively, you might want complete control over your tenant key, by using [Azure Key Vault](https://azure.microsoft.com/services/key-vault/). This scenario involves creating your tenant key and keeping the master copy on your premises. This scenario is often referred to as bring your own key (BYOK). With this option, the following happens:

1.  You generate your tenant key on your premises, in line with your IT policies and security policies.

2.  You securely transfer the tenant key from a hardware security module (HSM) in your possession to HSMs that are owned and managed by Microsoft, using Azure Key Vault. Throughout this process, your tenant key never leaves the hardware protection boundary.

3.  When you transfer your tenant key to Microsoft, it stays protected by Azure Key Vault.

Although it’s optional, you will also probably want to use the near real-time usage logs from Azure RMS to see exactly how and when your tenant key is being used.

> [!NOTE]
> As an additional protection measure, Azure Key Vault uses separate security domains for its data centers in regions such as North America, EMEA (Europe, Middle East and Africa), and Asia. And for different instances of Azure, such as Microsoft Azure Germany, and Azure Government. When you manage your own tenant key, it is tied to the security domain of the region or instance in which your RMS tenant is registered. For example, a tenant key from a European customer cannot be used in data centers in North America or Asia.

## The tenant key lifecycle
If you decide that Microsoft should manage your tenant key, Microsoft handles most of the key lifecycle operations. However, if you decide to manage your tenant key, you are responsible for many of the key lifecycle operations and some additional procedures in Azure Key Vault.

The following diagrams show and compares these two options. The first diagram shows how little administrator overheads there are for you in the default configuration when Microsoft manages the tenant key.

![Azure RMS tenant key lifecycle - managed by Microsoft, the default](../media/RMS_BYOK_cloud.png)

The second diagram shows the additional steps required when you manage your own tenant key.

![Azure RMS tenant key lifecycle - managed by you, BYOK](../media/RMS_BYOK_onprem4.png)

If you decide to let Microsoft manage your tenant key, no further action is required for you to generate the key and you can go straight to [Next steps](plan-implement-tenant-key.md#next-steps).

If you decide to manage your tenant key yourself, read the following sections for more information.

## Implementing your Azure Rights Management tenant key

Use the information and procedures in this section if you have decided to generate and manage your tenant key; the bring your own key (BYOK) scenario:


> [!IMPORTANT]
> If you have already started to use [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] (the service is activated) and you have users who run Office 2010, contact Microsoft Support before you run these procedures. Depending on your scenario and requirements, you can still use BYOK but with some limitations or additional steps.
> 
> Also contact Microsoft Support if your organization has specific policies for handling keys.

### Prerequisites for BYOK
See the following table for a list of prerequisites for bring your own key (BYOK).

|Requirement|More information|
|---------------|--------------------|
|A subscription that supports Azure RMS.|For more information about the available subscriptions, see [Cloud subscriptions that support Azure RMS](../get-started/requirements-subscriptions.md).|
|You do not use RMS for individuals or Exchange Online. Or, if you use Exchange Online, you understand and accept the limitations of using BYOK with this configuration.|For more information about the restrictions and current limitations for BYOK, see [BYOK pricing and restrictions](byok-price-restrictions.md).<br /><br />**Important**: Currently, BYOK is not compatible with Exchange Online.|
|All the prerequisites listed for Key Vault BYOK.|See [Prequisites for BYOK](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#prerequisites-for-byok) from the Azure Key Vault documentation . <br /><br />**Note**: If you are migrating from AD RMS to Azure RMS by using software key to hardware key, you must have a minimum version of 11.62 for the Thales drivers.|

For more information about Thales HSMs and how they are used with Azure Key Vault, see the [Thales website](https://www.thales-esecurity.com/msrms/cloud).

To generate and transfer your own tenant key to Azure Key Vault, follow the procedures in [How to generate and transfer HSM-protected keys for Azure Key Vault](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/) from the Azure Key Vault documentation.

When the key is transferred to Key Vault, it is given a key ID in Key Vault, which is a URL that contains the name of the vault, the keys container, the name of the key, and the key version. For example: **https://contosorms-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333** You will need to tell Azure RMS to use this key, by using this URL.

But before Azure RMS can use the key, Azure RMS must be authorized to use the key. To do this, the Azure Key Vault administrator uses the Key Vault PowerShell cmdlet, [Set-AzureRmKeyVaultAccessPolicy](https://msdn.microsoft.com/library/mt603625.aspx) and grants all permissions to the Azure RMS service principal, **Microsoft.Azure.RMS**. For example:

	Set-AzureRmKeyVaultAccessPolicy -VaultName 'ContosoRMS-kv' -ResourceGroupName 'ContosoRMS-byok-rg' -ServicePrincipalName Microsoft.Azure.RMS -PermissionsToKeys decrypt,encrypt,unwrapkey,wrapkey,verify,sign 

You're now ready to configure Azure RMS to use this key as your organization's Azure RMS tenant key. Using Azure RMS cmdlets, first connect to Azure RMS and sign in:

	Connect-AadrmService

Then run the Add-AadrmKeyVaultKey cmdlet command, specifying the key URL:

	Add-AadrmKeyVaultKey -KeyVaultKeyUrl "https://contosorms-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333"

When you run this command, it verifies that your Azure RMS tenant can access this key in Key Vault.


## Next steps

Now that you've planned for and if necessary, generated your tenant key, do the following:

1.  Start to use your tenant key:

    -   If you haven’t already done so, you must now activate Rights Management so that your organization can start to use RMS. Users immediately start to use your tenant key (managed by Microsoft or managed by you in Azure Key Vault).

        For more information about activation, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

    -   If you had already activated Rights Management and then decided to manage your own tenant key, users gradually transition from the old tenant key to the new tenant key, and this staggered transition can take a few weeks to complete. Documents and files that were protected with the old tenant key remains accessible to authorized users.

2.  Consider using usage logging, which logs every transaction that Azure Rights Management performs.

    If you decided to manage your own tenant key, logging includes information about using your tenant key. See the following example of a log file displayed in Excel where the **Decrypt** and **SignDigest** Request Types show that the tenant key is being used.

    ![log file in Excel where tenant key is being used](../media/RMS_Logging.gif)

    For more information about usage logging, see [Logging and analyzing Azure Rights Management usage](../deploy-use/log-analyze-usage.md).

3.  Maintain your tenant key.

    For more information, see [Operations for your Azure Rights Management tenant key](../deploy-use/operations-tenant-key.md).

