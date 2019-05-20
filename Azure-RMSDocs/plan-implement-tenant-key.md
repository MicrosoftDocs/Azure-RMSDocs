---
# required metadata

title: Your Azure Information Protection tenant key
description: Instead of Microsoft managing the root key for Azure Information Protection, you might want to create and manage this key (known as "bring your own key" or BYOK) for your tenant, to comply with specific regulations.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 05/16/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
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

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Use the information in this article to help you plan for and manage your Azure Information Protection tenant key. For example, instead of Microsoft managing your tenant key (the default), you might want to manage your own tenant key to comply with specific regulations that apply to your organization. Managing your own tenant key is also referred to as bring your own key, or BYOK.

What is the Azure Information Protection tenant key?

- The Azure Information Protection tenant key is a root key for your organization. Other keys can be derived from this root key, such as user keys, computer keys, and document encryption keys. Whenever Azure Information Protection uses these keys for your organization, they cryptographically chain to your Azure Information Protection tenant key.

- The Azure Information Protection tenant key is the online equivalent of the Server Licensor Certificate (SLC) key from Active Directory Rights Management Services (AD RMS). 

**At a glance:** Use the following table as a quick guide to your recommended tenant key topology. Then, use the additional documentation for more information.

|Business requirement|Recommended tenant key topology|
|------------------------|-----------------------------------|
|Deploy Azure Information Protection quickly and without special hardware, additional software, or an Azure subscription.<br /><br />For example: Testing environments and when your organization does not have regulatory requirements for key management.|Managed by Microsoft|
|Compliance regulations and control over all life cycle operations. <br /><br />For example: Your key must be protected by a hardware security module (HSM).|BYOK|


If required, you can change your tenant key topology after deployment, by using the [Set-AadrmKeyProperties](/powershell/module/aadrm/set-aadrmkeyproperties) cmdlet.


## Choose your tenant key topology: Managed by Microsoft (the default) or managed by you (BYOK)

Decide which tenant key topology is best for your organization:

- **Managed by Microsoft**: Microsoft automatically generates a tenant key for your organization and this key is used exclusively for Azure Information Protection. By default, Microsoft uses this key for your tenant and manages most aspects of your tenant key life cycle. 
    
    This is the simplest option with the lowest administrative overheads. In most cases, you do not even need to know that you have a tenant key. You just sign up for Azure Information Protection and the rest of the key management process is handled by Microsoft.

- **Managed by you (BYOK)**: For complete control over your tenant key, use [Azure Key Vault](https://azure.microsoft.com/services/key-vault/) with Azure Information Protection. For this tenant key topology, you create the key, either directly in Key Vault, or create it on-premises. If you create it on-premises, you next transfer or import this key into Key Vault. You then configure Azure Information Protection to use this key, and you manage it in Azure Key Vault.
    

### More information about BYOK
To create your own key, you have the following options:

- **A key that you create on-premises and transfer or import to Key Vault**:
    
    - An HSM-protected key that you create on-premises and transfer to Key Vault as an HSM-protected key.
    
    - A software-protected key that you create on-premises, convert, and then transfer to Key Vault as an HSM-protected key. This option is supported only when you [migrate from Active Directory Rights Management Services (AD RMS)](migrate-from-ad-rms-to-azure-rms.md).
    
    - A software-protected key that you create on-premises and import to Key Vault as a software-protected key. This option requires a .PFX certificate file.
    
- **A key that you create in Key Vault**:
    
    - An HSM-protected key that you create in Key Vault.
    
    - A software-protected key that you create in Key Vault.

Of these BYOK options, the most typical is an HSM-protected key that you create on-premises and transfer to Key Vault as an HSM-protected key. Although this option has the greatest administrative overheads, it might be required for your organization to comply with specific regulations. The HSMs that are used by Azure Key Vault are FIPS 140-2 Level 2 validated.

With this option, the following happens:

1. You generate your tenant key on your premises, in line with your IT policies and security policies. This key is the master copy. It remains on-premises and you are responsible for backing it up.

2. You create a copy of this key, and securely transfer this copy from your HSM to Azure Key Vault. Throughout this process, the master copy of this key never leaves the hardware protection boundary.

3. The copy of the key is protected by Azure Key Vault.

> [!NOTE]
> 
> As an additional protection measure, Azure Key Vault uses separate security domains for its data centers in regions such as North America, EMEA (Europe, Middle East and Africa), and Asia. Azure Key Vault also uses different instances of Azure, such as Microsoft Azure Germany, and Azure Government. 

Although it’s optional, you will also probably want to use the near real-time usage logs from Azure Information Protection to see exactly how and when your tenant key is being used.

### When you have decided your tenant key topology

If you decide to let Microsoft manage your tenant key: 

- Unless you are migrating from AD RMS, no further action is required for you to generate the key for your tenant and you can go straight to [Next steps](plan-implement-tenant-key.md#next-steps).

- If you currently have AD RMS and want to migrate to Azure Information Protection, use the migration instructions: [Migrating from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md). 

If you decide to manage your tenant key yourself, read the following sections for more information.

## Implementing BYOK for your Azure Information Protection tenant key

Use the information and procedures in this section if you have decided to generate and manage your tenant key; the bring your own key (BYOK) scenario:

> [!NOTE]
> If you have started to use Azure Information Protection with a tenant key that is managed by Microsoft and you now want to manage your tenant key (move to BYOK), your previously protected documents and emails will remain accessible by using an archived key. 

### Prerequisites for BYOK
See the following table for a list of prerequisites for bring your own key (BYOK).

|Requirement|More information|
|---------------|--------------------|
|Your Azure Information Protection tenant must have an Azure subscription. If you do not have one, you can sign up for a [free account](https://azure.microsoft.com/pricing/free-trial/). <br /><br /> To use an HSM-protected key, you must have the Azure Key Vault Premium service tier.|The free Azure subscription that provides access to configure Azure Active Directory and configuration of Azure Rights Management custom templates (**Access to Azure Active Directory**) is not sufficient to use Azure Key Vault. To confirm that you have an Azure subscription that you can use for BYOK, use [Azure PowerShell](/powershell/azure/overview) cmdlets: <br /><br /> 1. Start an Azure PowerShell session with the **Run as administrator** option, and sign in as a global admin for your Azure Information Protection tenant by using `Connect-AzAccount` and then copy and paste the resulting token string into `https://microsoft.com/devicelogin`by using a browser. <br /><br /> For more information, see [Sign in with Azure PowerShell](/powershell/azure/authenticate-azureps). <br /><br />2. Type the following and confirm that you see values displayed for your subscription name and ID, your Azure Information Protection tenant ID, and that the state is enabled: `Get-AzSubscription`<br /><br />If no values are displayed and you are just returned to the prompt, you do not have an Azure subscription that can be used for BYOK. <br /><br />**Note**: In addition to the BYOK prerequisites, if you are migrating from AD RMS to Azure Information Protection by using software key to hardware key, you must have a minimum version of 11.62 if you are using Thales firmware for your HSM.|
|To use an HSM-protected key that you create on-premises: <br /><br />- All the prerequisites listed for Key Vault BYOK. |See [Prerequisites for BYOK](/azure/key-vault/key-vault-hsm-protected-keys#prerequisites-for-byok) from the Azure Key Vault documentation. <br /><br /> **Note**: In addition to the BYOK prerequisites, if you are migrating from AD RMS to Azure Information Protection by using software key to hardware key, you must have a minimum version of 11.62 if you are using Thales firmware for your HSM.|
|If the key vault to contain your tenant key uses Virtual Network Service Endpoints for Azure Key Vault: <br /><br />- Allow trusted Microsoft services to bypass this firewall.|For more information, see [Virtual Network Service Endpoints for Azure Key Vault](/azure/key-vault/key-vault-overview-vnet-service-endpoints).|
|The Azure Rights Management administration module for Windows PowerShell.|For installation instructions, see [Installing the AADRM PowerShell module](./install-powershell.md). <br /><br />If you have previously installed this Windows PowerShell module, run the following command to check that your version number is at least **2.9.0.0**: `(Get-Module aadrm -ListAvailable).Version`|

For more information about nCipher nShield hardware security module (HSM) and how they are used with Azure Key Vault, see the [nCipher website](https://www.ncipher.com/products/key-management/cloud-microsoft-azure/how-to-buy).

### Choosing your key vault location

When you create a key vault to contain the key to be used as your tenant key for Azure Information, you must specify a location. This location is an Azure region, or Azure instance.

Make your choice first for compliance, and then to minimize network latency:

- If you have chosen the BYOK key topology for compliance reasons, those compliance requirements might mandate the Azure region or Azure instance that stores your Azure Information Protection tenant key.

- Because all cryptographic calls for protection chain to your Azure Information Protection tenant key, you want to minimize the network latency that these calls incur. To do that, create your key vault in the same Azure region or instance as your Azure Information Protection tenant.

To identify the location of your Azure Information Protection tenant, use the [Get-AadrmConfiguration](/powershell/module/aadrm/get-aadrmconfiguration)​ PowerShell cmdlet and identify the region from the URLs. For example:

	LicensingIntranetDistributionPointUrl : https://5c6bb73b-1038-4eec-863d-49bded473437.rms.na.aadrm.com/_wmcs/licensing

The region is identifiable from **rms.na.aadrm.com**, and for this example, it is in North America.

Use the following table to identify which Azure region or instance is recommended to minimize network latency.

|Azure region or instance|Recommended location for your key vault|
|---------------|--------------------|
|rms.**na**.aadrm.com|**North Central US** or **East US**|
|rms.**eu**.aadrm.com|**North Europe** or **West Europe**|
|rms.**ap**.aadrm.com​|**East Asia** or **Southeast Asia**|
|rms.**sa**.aadrm.com|**West US** or **East US**|
|rms.**govus**.aadrm.com​|**Central US** or **East US 2**|


### Instructions for BYOK

Use the Azure Key Vault documentation to create a key vault and the key that you want to use for Azure Information Protection. For example, see [Get started with Azure Key Vault](/azure/key-vault/key-vault-get-started).

Make sure that the key length is 2048 bits (recommended) or 1024 bits. Other key lengths are not supported by Azure Information Protection.

To create an HSM-protected key on-premises and transfer it to your key vault as an HSM-protected key, follow the procedures in [How to generate and transfer HSM-protected keys for Azure Key Vault](/azure/key-vault/key-vault-hsm-protected-keys).

For Azure Information Protection to use the key, all Key Vault operations must be permitted for the key. This is the default configuration and the operations are encrypt, decrypt, wrapKey, unwrapKey, sign, and verify. You can check the permitted operations of a key by using the following PowerShell command: `(Get-AzKeyVaultKey -VaultName <key vault name> -Name <key name>).Attributes.KeyOps`. If necessary, add permitted operations by using [Update-AzKeyVaultKey](/powershell/module/az.keyvault/update-azkeyvaultkey) and the *KeyOps* parameter.

A key that is stored in Key Vault has a key ID. This key ID is a URL that contains the name of the key vault, the keys container, the name of the key, and the key version. For example: **https://contosorms-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333**. You must configure Azure Information Protection to use this key, by specifying its key vault URL.

Before Azure Information Protection can use the key, the Azure Rights Management service must be authorized to use the key in your organization's key vault. To do this, the Azure Key Vault administrator can use the Azure portal, or Azure PowerShell:

Configuration by using the Azure portal:

1. Navigate to **Key vaults** > **\<*your key vault name*>** > **Access policies** > **Add new**.

2. From the **Add access policy** blade, select **Azure Information Protection BYOK** from the **Configure from template (optional)** list box, and click **OK**.
    
    The selected template has the following configuration:
    
    - **Microsoft Rights Management Services** is automatically assigned for **Select principal**.
    - **Get**, **Decrypt**, and **Sign** is automatically selected for the key permissions. 

Configuration by using PowerShell:

- Run the Key Vault PowerShell cmdlet, [Set-AzKeyVaultAccessPolicy](/powershell/module/az.keyvault/set-azkeyvaultaccesspolicy), and grant permissions to the Azure Rights Management service principal, by using the GUID **00000012-0000-0000-c000-000000000000**. For example:
    
    	Set-AzKeyVaultAccessPolicy -VaultName 'ContosoRMS-kv' -ResourceGroupName 'ContosoRMS-byok-rg' -ServicePrincipalName 00000012-0000-0000-c000-000000000000 -PermissionsToKeys decrypt,sign,get

You're now ready to configure Azure Information Protection to use this key as your organization's Azure Information Protection tenant key. Using Azure RMS cmdlets, first connect to the Azure Rights Management service and sign in:

	Connect-AadrmService

Then run the [Use-AadrmKeyVaultKey cmdlet](/powershell/module/aadrm/use-aadrmkeyvaultkey), specifying the key URL. For example:

	Use-AadrmKeyVaultKey -KeyVaultKeyUrl "https://contosorms-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333"

> [!IMPORTANT]
> In this example, "aaaabbbbcccc111122223333" is the version of the key to use. If you do not specify the version, the current version of the key is used without warning and the command appears to work. However, if your key in Key Vault is later updated (renewed), the Azure Rights Management service will stop working for your tenant, even if you run the Use-AadrmKeyVaultKey command again.
> 
> Make sure that you specify the key version, in addition to the key name when you run this command. You can use the Azure Key Vault cmd, [Get-AzKeyVaultKey](/powershell/module/az.keyvault/get-azkeyvaultkey), to get the version number of the current key. For example: `Get-AzKeyVaultKey -VaultName 'contosorms-kv' -KeyName 'contosorms-byok'`

If you need to confirm that the key URL is set correctly for Azure Information Protection: In Azure Key Vault, run [Get-AzKeyVaultKey](/powershell/module/az.keyvault/get-azkeyvaultkey) to see the key URL.

Finally, if the Azure Rights Management service is already activated, run [Set-AadrmKeyProperties](/powershell/module/aadrm/set-aadrmkeyproperties) to tell Azure Information Protection to use this key as the active tenant key for the Azure Rights Management service. If you do not do this step, Azure Information Protection will continue to use the default Microsoft-managed key that was automatically created for your tenant.


## Next steps

Now that you've planned for and if necessary, created and configured your tenant key, do the following:

1.  Start to use your tenant key:
    
    - If the protection service isn't already activated, you must now activate the Rights Management service so that your organization can start to use Azure Information Protection. Users immediately start to use your tenant key (managed by Microsoft, or managed by you in Azure Key Vault).
    
        For more information about activation, see [Activating Azure Rights Management](./activate-service.md).
        
    - If the Rights Management service was already activated and then you decided to manage your own tenant key, users gradually transition from the old tenant key to the new tenant key. This staggered transition can take a few weeks to complete. Documents and files that were protected with the old tenant key remains accessible to authorized users.
        
2. Consider using usage logging, which logs every transaction that the Azure Rights Management service performs.
    
    If you decided to manage your own tenant key, logging includes information about using your tenant key. See the following snippet from a log file displayed in Excel where the **KeyVaultDecryptRequest** and **KeyVaultSignRequest** request types show that the tenant key is being used.
    
    ![log file in Excel where tenant key is being used](./media/RMS_Logging.png)
    
    For more information about usage logging, see [Logging and analyzing usage of the Azure Rights Management service](./log-analyze-usage.md).
    
3.  Manage your tenant key.
    
    For more information about the life cycle operations for your tenant key, see [Operations for your Azure Information Protection tenant key](./operations-tenant-key.md).
