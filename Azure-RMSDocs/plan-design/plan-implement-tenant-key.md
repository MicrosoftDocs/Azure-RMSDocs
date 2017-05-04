---
# required metadata

title: Your Azure Information Protection tenant key
description: Information to help you plan for and manage your Azure Information Protection tenant key. Instead of Microsoft managing your tenant key (the default), you might want to manage your own tenant key to comply with specific regulations that apply to your organization. Managing your own tenant key is also referred to as bring your own key, or BYOK.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/18/2017
ms.topic: article
ms.prod:
ms.service: information-protection
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

# Planning and implementing your Azure Information Protection tenant key

>*Applies to: Azure Information Protection, Office 365*

Use the information in this article to help you plan for and manage your Azure Information Protection tenant key. For example, instead of Microsoft managing your tenant key (the default), you might want to manage your own tenant key to comply with specific regulations that apply to your organization. Managing your own tenant key is also referred to as bring your own key, or BYOK.

> [!NOTE]
> The on-premises equivalent of the Azure Information Protection tenant key is known as the Server Licensor Certificate (SLC) key. Azure Information Protection maintains one or more keys for each organization that has a subscription for Azure Information Protection. Whenever keys are used for Azure Information Protection within an organization (such as user keys, computer keys, document encryption keys), they cryptographically chain to your Azure Information Protection tenant key, which acts as a root key for your organization.

**At a glance:** Use the following table as a quick guide to your recommended tenant key topology. Then, use the additional documentation for more information.

If required, you can change your tenant key topology after deployment, by using the [Set-AadrmKeyProperties](/powershell/module/aadrm/set-aadrmkeyproperties) cmdlet.


|Business requirement|Recommended tenant key topology|
|------------------------|-----------------------------------|
|Deploy Azure Information Protection quickly and without requiring special hardware|Managed by Microsoft|
|Your keys are created by you and protected in a hardware security module (HSM)|BYOK [[1]](#footnote-1)|

###### Footnote 1
If you have already enabled Exchange Online for Azure Rights Management by using the Import-RMSTrustedPublishingDomain command, you cannot currently use BYOK. For more information, see [Restrictions when using BYOK](byok-price-restrictions.md#restrictions-when-using-byok).


## Choose your tenant key topology: Managed by Microsoft (the default) or managed by you (BYOK)
Decide which tenant key topology is best for your organization. By default, Azure Information Protection generates your tenant key and manages most aspects of the tenant key lifecycle. This is the simplest option with the lowest administrative overheads. In most cases, you do not even need to know that you have a tenant key. You just sign up for Azure Information Protection and the rest of the key management process is handled by Microsoft.

Alternatively, you might want complete control over your tenant key, by using [Azure Key Vault](https://azure.microsoft.com/services/key-vault/). This scenario involves creating your tenant key and keeping the master copy on your premises. This scenario is often referred to as bring your own key (BYOK). With this option, the following happens:

1.  You generate your tenant key on your premises, in line with your IT policies and security policies.

2.  You securely transfer the tenant key from a hardware security module (HSM) in your possession to HSMs that are owned and managed by Microsoft, using Azure Key Vault. Throughout this process, your tenant key never leaves the hardware protection boundary.

3.  When you transfer your tenant key to Microsoft, it stays protected by Azure Key Vault.

Although it’s optional, you will also probably want to use the near real-time usage logs from Azure Information Protection to see exactly how and when your tenant key is being used.

> [!NOTE]
> As an additional protection measure, Azure Key Vault uses separate security domains for its data centers in regions such as North America, EMEA (Europe, Middle East and Africa), and Asia. And for different instances of Azure, such as Microsoft Azure Germany, and Azure Government. When you manage your own tenant key, it is tied to the security domain of the region or instance in which your Azure Information Protection tenant is registered. For example, a tenant key from a European customer cannot be used in data centers in North America or Asia.

## The tenant key lifecycle
If you decide that Microsoft should manage your tenant key, Microsoft handles most of the key lifecycle operations. However, if you decide to manage your tenant key, you are responsible for many of the key lifecycle operations and some additional procedures in Azure Key Vault.

The following diagrams show and compares these two options. The first diagram shows how little administrator overheads there are for you in the default configuration when Microsoft manages the tenant key.

![Azure Information Protection tenant key lifecycle - managed by Microsoft, the default](../media/RMS_BYOK_cloud.png)

The second diagram shows the additional steps required when you manage your own tenant key.

![Azure Information Protection tenant key lifecycle - managed by you, BYOK](../media/RMS_BYOK_onprem4.png)

If you decide to let Microsoft manage your tenant key, no further action is required for you to generate the key and you can go straight to [Next steps](plan-implement-tenant-key.md#next-steps).  

If you decide to manage your tenant key yourself, read the following sections for more information.

## Implementing your Azure Information Protection tenant key

Use the information and procedures in this section if you have decided to generate and manage your tenant key; the bring your own key (BYOK) scenario:


> [!IMPORTANT]
> If you have started to use Azure Information Protection with a tenant key that is managed by Microsoft and you now want to manage your tenant key (move to BYOK), your previously protected documents and emails will remain accessible by using an archived key. However, if you have users who run Office 2010, [contact Microsoft Support](../get-started/information-support.md#to-contact-microsoft-support) before you run these procedures. These computers will need some additional configuration steps.
> 
> Also [contact Microsoft Support](../get-started/information-support.md#to-contact-microsoft-support) if your organization has specific policies for handling keys.

### Prerequisites for BYOK
See the following table for a list of prerequisites for bring your own key (BYOK).

|Requirement|More information|
|---------------|--------------------|
|A subscription that supports Azure Information Protection.|For more information about the available subscriptions, see the Azure Information Protection [Pricing page](https://go.microsoft.com/fwlink/?LinkId=827589).|
|All the prerequisites listed for Key Vault BYOK, which includes a paid or trial Azure subscription for your existing Azure Information Protection tenant. |See [Prerequisites for BYOK](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#prerequisites-for-byok) from the Azure Key Vault documentation. <br /><br /> The free Azure subscription that provides access to configure Azure Active Directory and configuration of Azure Rights Management custom templates (**Access to Azure Active Directory**) is not sufficient to use Azure Key Vault. To confirm that you have an Azure subscription that you can use for BYOK, use [Azure Resource Manager](https://docs.microsoft.com/powershell/module/azurerm.resources/?view=azurermps-3.8.0) PowerShell cmdlets: <br /><br /> 1. Start an Azure PowerShell session with the **Run as administrator** option, and sign in as a global admin for your Azure Information Protection tenant with the following command: `Login-AzureRmAccount`<br /><br />2. Type the following and confirm that you see values displayed for your subscription name and ID, your Azure Information Protection tenant ID, and that the state is enabled: `Get-AzureRmSubscription`<br /><br />If no values are displayed and you are simply returned to the prompt, you do not have an Azure subscription that can be used for BYOK. <br /><br />**Note**: In addition to the BYOK prerequisites, if you are migrating from AD RMS to Azure Information Protection by using software key to hardware key, you must have a minimum version of 11.62 for the Thales firmware.|
|The Azure Rights Management administration module for Windows PowerShell.|For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md). <br /><br />If you have previously installed this Windows PowerShell module, run the following command to check that your version number is at least **2.9.0.0**: `(Get-Module aadrm -ListAvailable).Version`|

For more information about Thales HSMs and how they are used with Azure Key Vault, see the [Thales website](https://www.thales-esecurity.com/msrms/cloud).

### Instructions for BYOK

To generate and transfer your own tenant key to Azure Key Vault, follow the procedures in [How to generate and transfer HSM-protected keys for Azure Key Vault](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/) from the Azure Key Vault documentation.

When the key is transferred to Key Vault, it is given a key ID in Key Vault, which is a URL that contains the name of the key vault, the keys container, the name of the key, and the key version. For example: **https://contosorms-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333**. You will need to tell the Azure Rights Management service from Azure Information Protection to use this key, by specifying this URL.

But before Azure Information Protection can use the key, the Azure Rights Management service must be authorized to use the key in your organization's key vault. To do this, the Azure Key Vault administrator uses the Key Vault PowerShell cmdlet, [Set-AzureRmKeyVaultAccessPolicy](/powershell/module/azurerm.keyvault/set-azurermkeyvaultaccesspolicy) and grants permissions to the Azure Rights Management service principal, by using the GUID 00000012-0000-0000-c000-000000000000. For example:

	Set-AzureRmKeyVaultAccessPolicy -VaultName 'ContosoRMS-kv' -ResourceGroupName 'ContosoRMS-byok-rg' -ServicePrincipalName 00000012-0000-0000-c000-000000000000 -PermissionsToKeys decrypt,encrypt,unwrapkey,wrapkey,verify,sign,get

You're now ready to configure Azure Information Protection to use this key as your organization's Azure Information Protection tenant key. Using Azure RMS cmdlets, first connect to the Azure Rights Management service and sign in:

	Connect-AadrmService

Then run the [Use-AadrmKeyVaultKey cmdlet](/powershell/module/aadrm/use-aadrmkeyvaultkey), specifying the key URL. For example:

	Use-AadrmKeyVaultKey -KeyVaultKeyUrl "https://contosorms-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333"

> [!IMPORTANT]
> In this example, "aaaabbbbcccc111122223333" is the version of the key to use. If you do not specify the version, the current version of the key is used without warning and the command appears to work. However, if your key in Key Vault is later updated (renewed), the Azure Rights Management service will stop working for your tenant, even if you run the Use-AadrmKeyVaultKey command again.
>
>Make sure that you specify the key version, in addition to the key name when you run this command. You can use the Azure Key Vault cmd, [Get-AzureKeyVaultKey](/powershell/resourcemanager/azurerm.keyvault\get-azurekeyvaultkey), to get the version number of the current key. For example: `Get-AzureKeyVaultKey -VaultName 'contosorms-kv' -KeyName 'contosorms-byok'`

If you need to confirm that the key URL is set correctly in the Azure RMS service, in Azure Key Vault, you can run [Get-AzureKeyVaultKey](/powershell/resourcemanager/azurerm.keyvault\get-azurekeyvaultkey) to see the key URL.

Finally, if the Azure Rights Management service is already activated, run [Set-AadrmKeyProperties](/powershell/module/aadrm/set-aadrmkeyproperties) to tell Azure Rights Management to this use key as the active tenant key for your Azure Rights Management service. If you do not do this step, Azure Rights Management will continue to use the default Microsoft-managed key, that was automatically created when the service was activated.


## Next steps

Now that you've planned for and if necessary, generated your tenant key, do the following:

1.  Start to use your tenant key:
    
    - If you haven’t already done so, you must now activate the Rights Management service so that your organization can start to use Azure Information Protection. Users immediately start to use your tenant key (managed by Microsoft or managed by you in Azure Key Vault).
    
        For more information about activation, see [Activating Azure Rights Management](../deploy-use/activate-service.md).
        
    - If you had already activated the Rights Management service and then decided to manage your own tenant key, users gradually transition from the old tenant key to the new tenant key, and this staggered transition can take a few weeks to complete. Documents and files that were protected with the old tenant key remains accessible to authorized users.
        
2. Consider using usage logging, which logs every transaction that the Azure Rights Management service performs.
    
    If you decided to manage your own tenant key, logging includes information about using your tenant key. See the following snippet from a log file displayed in Excel where the **KeyVaultDecryptRequest** and **KeyVaultSignRequest** request types show that the tenant key is being used.
    
    ![log file in Excel where tenant key is being used](../media/RMS_Logging.png)
    
    For more information about usage logging, see [Logging and analyzing usage of the Azure Rights Management service](../deploy-use/log-analyze-usage.md).
    
3.  Maintain your tenant key.
    
    For more information, see [Operations for your Azure Rights Management tenant key](../deploy-use/operations-tenant-key.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
