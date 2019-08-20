---
# required metadata

title: Migrate HSM-protected key to HSM-protected key - AIP
description: Instructions that are part of the migration path from AD RMS to Azure Information Protection, and applicable only if your AD RMS key is HSM-protected and you want to migrate to Azure Information Protection with a HSM-protected tenant key in Azure Key Vault. 
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 08/20/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: c5bbf37e-f1bf-4010-a60f-37177c9e9b39

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: migration
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Step 2: HSM-protected key to HSM-protected key migration

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*


These instructions are part of the [migration path from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md), and are applicable only if your AD RMS key is HSM-protected and you want to migrate to Azure Information Protection with a HSM-protected tenant key in Azure Key Vault. 

If this is not your chosen configuration scenario, go back to [Step 4. Export configuration data from AD RMS and import it to Azure RMS](migrate-from-ad-rms-phase2.md#step-4-export-configuration-data-from-ad-rms-and-import-it-to-azure-information-protection) and choose a different configuration.

> [!NOTE]
> These instructions assume your AD RMS key is module-protected. This is the most typical case. 

It’s a two-part procedure to import your HSM key and AD RMS configuration to Azure Information Protection, to result in your Azure Information Protection tenant key that is managed by you (BYOK).

Because your Azure Information Protection tenant key will be stored and managed by Azure Key Vault, this part of the migration requires administration in Azure Key Vault, in addition to Azure Information Protection. If Azure Key Vault is managed by a different administrator than you for your organization, you must co-ordinate and work with that administrator to complete these procedures.

Before you begin, make sure that your organization has a key vault that has been created in Azure Key Vault, and that it supports HSM-protected keys. Although it's not required, we recommend that you have a dedicated key vault for Azure Information Protection. This key vault will be configured to allow the Azure Rights Management service to access it, so the keys that this key vault stores should be limited to Azure Information Protection keys only.


> [!TIP]
> If you are doing the configuration steps for Azure Key Vault and you are not familiar with this Azure service, you might find it useful to first review [Get started with Azure Key Vault](/azure/key-vault/key-vault-get-started). 


## Part 1: Transfer your HSM key to Azure Key Vault

These procedures are done by the administrator for Azure Key Vault.

1. For each exported SLC key that you want to store in Azure Key Vault, follow the instructions from the Azure Key Vault documentation, using [Implementing bring your own key (BYOK) for Azure Key Vault](/azure/key-vault/key-vault-hsm-protected-keys#implementing-bring-your-own-key-byok-for-azure-key-vault) with the following exception:

   - Do not do the steps for **Generate your tenant key**, because you already have the equivalent from your AD RMS deployment. Instead, identify the keys used by your AD RMS server from the nCipher installation and prepare these keys for transfer, and then transfer them to Azure Key Vault. 
        
        Encrypted key files for nCipher are named **key_<*keyAppName*>_<*keyIdentifier*>** locally on the server. For example, `C:\Users\All Users\nCipher\Key Management Data\local\key_mscapi_f829e3d888f6908521fe3d91de51c25d27116a54`. You will need the **mscapi** value as the keyAppName, and your own value for the key identifier when you run the KeyTransferRemote command to create a copy of the key with reduced permissions.
        
         When the key uploads to Azure Key Vault, you see the properties of the key displayed, which includes the key ID. It will look similar to https://contosorms-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333. Make a note of this URL because the Azure Information Protection administrator needs it to tell the Azure Rights Management service to use this key for its tenant key.

2. On the Internet-connected workstation, in a PowerShell session, use the [Set-AzKeyVaultAccessPolicy](/powershell/module/az.keyvault/set-azkeyvaultaccesspolicy) cmdlet to authorize the Azure Rights Management service principal to access the key vault that will store the Azure Information Protection tenant key. The permissions required are decrypt, encrypt, unwrapkey, wrapkey, verify, and sign.
    
    For example, if the key vault that you have created for Azure Information Protection is named contoso-byok-ky, and your resource group is named contoso-byok-rg, run the following command:
    
        Set-AzKeyVaultAccessPolicy -VaultName "contoso-byok-kv" -ResourceGroupName "contoso-byok-rg" -ServicePrincipalName 00000012-0000-0000-c000-000000000000 -PermissionsToKeys decrypt,sign,get


Now that you’ve prepared your HSM key in Azure Key Vault for the Azure Rights Management service from Azure Information Protection, you’re ready to import your AD RMS configuration data.

## Part 2: Import the configuration data to Azure Information Protection

These procedures are done by the administrator for Azure Information Protection.

1. On the Internet-connect workstation and in the PowerShell session, connect to the Azure Rights Management service by using the [Connnect-AadrmService](/powershell/module/aipservice/connect-aipservice) cmdlet.
    
    Then upload each trusted publishing domain (.xml) file, by using the [Import-AipServiceTpd](/powershell/module/aipservice/import-aipservicetpd) cmdlet. For example, you should have at least one additional file to import if you upgraded your AD RMS cluster for Cryptographic Mode 2.
    
    To run this cmdlet, you need the password that you specified earlier for each configuration data file, and the URL for the key that was identified in the previous step.
    
    For example, using a configuration data file of C:\contoso-tpd1.xml and our key URL value from the previous step, first run the following to store the password:
    
    ```
	$TPD_Password = Read-Host -AsSecureString
    ```
    
    Enter the password that you specified to export the configuration data file. Then, run the following command and confirm that you want to perform this action:
    
    ```
    Import-AipServiceTpd -TpdFile "C:\contoso-tpd1.xml" -ProtectionPassword $TPD_Password –KeyVaultKeyUrl https://contoso-byok-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333 -Verbose
    ```
    
    As part of this import, the SLC key is imported and automatically set as archived.

2.  When you have uploaded each file, run [Set-AipServiceKeyProperties](/powershell/module/aipservice/set-aipservicekeyproperties) to specify which imported key matches the currently active SLC key in your AD RMS cluster. This key becomes the active tenant key for your Azure Rights Management service.

3.  Use the [Disconnect-AipServiceService](/powershell/module/aipservice/disconnect-aipservice) cmdlet to disconnect from the Azure Rights Management service:

    ```
    Disconnect-AipServiceService
    ```

If you later need to confirm which key your Azure Information Protection tenant key is using in Azure Key Vault, use the [Get-AipServiceKeys](/powershell/module/aipservice/get-aipservicekeys) Azure RMS cmdlet.

You’re now ready to go to [Step 5. Activate the Azure Rights Management service](migrate-from-ad-rms-phase2.md#step-5-activate-the-azure-rights-management-service).


