---
# required metadata

title: Migrate software-protected key to HSM-protected key  - AIP
description: Instructions that are part of the migration path from AD RMS to Azure Information Protection, and are applicable only if your AD RMS key is software-protected and you want to migrate to Azure Information Protection with a HSM-protected tenant key in Azure Key Vault. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/11/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: c5f4c6ea-fd2a-423a-9fcb-07671b3c2f4f

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Step 2: Software-protected key to HSM-protected key migration

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*


These instructions are part of the [migration path from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md), and are applicable only if your AD RMS key is software-protected and you want to migrate to Azure Information Protection with a HSM-protected tenant key in Azure Key Vault. 

If this is not your chosen configuration scenario, go back to [Step 4. Export configuration data from AD RMS and import it to Azure RMS](migrate-from-ad-rms-phase2.md#step-4-export-configuration-data-from-ad-rms-and-import-it-to-azure-information-protection) and choose a different configuration.

It’s a four-part procedure to import the AD RMS configuration to Azure Information Protection, to result in your Azure Information Protection tenant key that is managed by you (BYOK) in Azure Key Vault.

You must first extract your server licensor certificate (SLC) key from the AD RMS configuration data and transfer the key to an on-premises Thales HSM, next package and transfer your HSM key to Azure Key Vault, then authorize the Azure Rights Management service from Azure Information Protection to access your key vault, and then import the configuration data.

Because your Azure Information Protection tenant key will be stored and managed by Azure Key Vault, this part of the migration requires administration in Azure Key Vault, in addition to Azure Information Protection. If Azure Key Vault is managed by a different administrator than you for your organization, you must co-ordinate and work with that administrator to complete these procedures.

Before you begin, make sure that your organization has a key vault that has been created in Azure Key Vault, and that it supports HSM-protected keys. Although it's not required, we recommend that you have a dedicated key vault for Azure Information Protection. This key vault will be configured to allow the Azure Rights Management service from Azure Information Protection to access it, so the keys that this key vault stores should be limited to Azure Information Protection keys only.


> [!TIP]
> If you are doing the configuration steps for Azure Key Vault and you are not familiar with this Azure service, you might find it useful to first review [Get started with Azure Key Vault](/azure/key-vault/key-vault-get-started). 


## Part 1: Extract your SLC key from the configuration data and import the key to your on-premises HSM

1.  Azure Key Vault administrator: For each exported SLC key that you want to store in Azure Key Vault, use the following steps in the [Implementing bring your own key (BYOK) for Azure Key Vault](/azure/key-vault/key-vault-hsm-protected-keys#implementing-bring-your-own-key-byok-for-azurekey-vault) section of the Azure Key Vault documentation:

    -   **Generate and transfer your key to Azure Key Vault HSM**: [Step 1: Prepare your Internet-connected workstation](/azure/key-vault-hsm-protected-keys/#step-1-prepare-your-internet-connected-workstation)

    -   **Generate and transfer your tenant key – over the Internet**: [Step 2: Prepare your disconnected workstation](/azure/key-vault-hsm-protected-keys/#step-2-prepare-your-disconnected-workstation)

    Do not follow the steps to generate your tenant key, because you already have the equivalent in the exported configuration data (.xml) file. Instead, you will run a tool to extract this key from the file and import it to your on-premises HSM. The tool creates two files when you run it:

    - A new configuration data file without the key, which is then ready to be imported to your Azure Information Protection tenant.

    - A PEM file (key container) with the key, which is then ready to be imported to your on-premises HSM.

2. Azure Information Protection administrator or Azure Key Vault administrator: On the disconnected workstation, run the TpdUtil tool from the [Azure RMS migration toolkit](https://go.microsoft.com/fwlink/?LinkId=524619). For example, if the tool is installed on your E drive where you copy your configuration data file named ContosoTPD.xml:

    ```
    	E:\TpdUtil.exe /tpd:ContosoTPD.xml /otpd:ContosoTPD.xml /opem:ContosoTPD.pem
    ```

    If you have more than one RMS configuration data files, run this tool for the remainder of these files.

    To see Help for this tool, which includes a description, usage, and examples, run TpdUtil.exe with no parameters

    Additional information for this command:

    - The **/tpd**: specifies the full path and name of the exported AD RMS configuration data file. The full parameter name is **TpdFilePath**.

    - The **/otpd**: specifies the output file name for the configuration data file without the key. The full parameter name is **OutPfxFile**. If you do not specify this parameter, the output file defaults to the original file name with the suffix **_keyless**, and it is stored in the current folder.

    - The **/opem**: specifies the output file name for the PEM file, which contains the extracted key. The full parameter name is **OutPemFile**. If you do not specify this parameter, the output file defaults to the original file name with the suffix **_key**, and it is stored in the current folder.

    - If you don't specify the password when you run this command (by using the **TpdPassword** full parameter name or **pwd** short parameter name), you are prompted to specify it.

3. On the same disconnected workstation, attach and configure your Thales HSM, according to your Thales documentation. You can now import your key into your attached Thales HSM by using the following command where you need to substitute your own file name for ContosoTPD.pem:

    	generatekey --import simple pemreadfile=e:\ContosoTPD.pem plainname=ContosoBYOK protect=module ident=contosobyok type=RSA

    > [!NOTE]
    >If you have more than one file, choose the file that corresponds to the HSM key you want to use in Azure RMS to protect content after the migration.

    This generates an output display similar to the following:

    **key generation parameters:**

    **operation &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Operation to perform &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import**

    **application &nbsp;&nbsp;&nbsp;&nbsp;Application&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; simple**

    **verify &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Verify security of configuration key&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes**

    **type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Key type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RSA**

    **pemreadfile &nbsp;&nbsp; PEM file containing RSA key &nbsp;&nbsp; e:\ContosoTPD.pem**

    **ident &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Key identifier &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contosobyok**

    **plainname &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Key name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ContosoBYOK**

    **Key successfully imported.**

    **Path to key: C:\ProgramData\nCipher\Key Management Data\local\key_simple_contosobyok**

This output confirms that the private key is now migrated to your on-premises Thales HSM device with an encrypted copy that is saved to a key (in our example, "key_simple_contosobyok"). 

Now that your SLC key has been extracted and imported to your on-premises HSM, you’re ready to package the HSM-protected key and transfer it to Azure Key Vault.

> [!IMPORTANT]
> When you have completed this step, securely erase these PEM files from the disconnected workstation to ensure that they cannot be accessed by unauthorized people. For example, run "cipher /w: E" to securely delete all files from the E: drive.

## Part 2: Package and transfer your HSM key to Azure Key Vault

Azure Key Vault administrator: For each exported SLC key that you want to store in Azure Key vault, use the following steps from the [Implementing bring your own key (BYOK) for Azure Key Vault](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#implementing-bring-your-own-key-byok-for-azurekey-vault) section of the Azure Key Vault documentation:

- [Step 4: Prepare your key for transfer](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#step-4-prepare-your-key-for-transfer)

- [Step 5: Transfer your key to Azure Key Vault](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#step-5-transfer-your-key-to-azurekey-vault)

Do not follow the steps to generate your key pair, because you already have the key. Instead, you will run a command to transfer this key (in our example, our KeyIdentifier parameter uses "contosobyok") from your on-premises HSM.

Before you transfer your key to Azure Key Vault, make sure that the KeyTransferRemote.exe utility returns **Result: SUCCESS** when you create a copy of your key with reduced permissions (step 4.1) and when you encrypt your key (step 4.3).

When the key uploads to Azure Key Vault, you see the properties of the key displayed, which includes the key ID. It will look similar to **https://contosorms-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333**. Make a note of this URL because the Azure Information Protection administrator will need it to tell the Azure Rights Management service from Azure Information Protection to use this key for its tenant key.

Then use the [Set-AzureRmKeyVaultAccessPolicy](/powershell/module/azurerm.keyvault/set-azurermkeyvaultaccesspolicy) cmdlet to authorize the Azure Rights Management service principal to access the key vault. The permissions required are decrypt, encrypt, unwrapkey, wrapkey, verify, and sign.

For example, if the key vault that you have created for Azure Information Protection is named contosorms-byok-kv, and your resource group is named contosorms-byok-rg, run the following command:
    
    Set-AzureRmKeyVaultAccessPolicy -VaultName "contosorms-byok-kv" -ResourceGroupName "contosorms-byok-rg" -ServicePrincipalName 00000012-0000-0000-c000-000000000000 -PermissionsToKeys decrypt,encrypt,unwrapkey,wrapkey,verify,sign,get

Now that you’ve transferred your HSM key to Azure Key Vault, you’re ready to import your AD RMS configuration data.

## Part 3: Import the configuration data to Azure Information Protection

1. Azure Information Protection administrator: On the Internet-connected workstation and in the PowerShell session, copy over your new configuration data files (.xml) that have the SLC key removed after running the TpdUtil tool.

2. Upload each .xml file, by using the [Import-AadrmTpd](/powershell/aipservice/import-aadrmtpd) cmdlet. For example, you should have at least one additional file to import if you upgraded your AD RMS cluster for Cryptographic Mode 2.

    To run this cmdlet, you need the password that you specified earlier for the configuration data file, and the URL for the key that was identified in the previous step.

    For example, using a configuration data file of C:\contoso_keyless.xml and our key URL value from the previous step, first run the following to store the password:
    
    ```
	$TPD_Password = Read-Host -AsSecureString
    ```
    
   Enter the password that you specified to export the configuration data file. Then, run the following command and confirm that you want to perform this action:

    ```
    Import-AadrmTpd -TpdFile "C:\contoso_keyless.xml" -ProtectionPassword $TPD_Password –KeyVaultStringUrl https://contoso-byok-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333 -Verbose
    ```

    As part of this import, the SLC key is imported and automatically set as archived.

3. When you have uploaded each file, run [Set-AadrmKeyProperties](/powershell/module/aadrm/set-aadrmkeyproperties) to specify which imported key matches the currently active SLC key in your AD RMS cluster.

4. Use the [Disconnect-AipServiceService](/powershell/aipservice/disconnect-aadrmservice) cmdlet to disconnect from the Azure Rights Management service:

    ```
    Disconnect-AipServiceService
    ```

If you later need to confirm which key your Azure Information Protection tenant key is using in Azure Key Vault, use the [Get-AadrmKeys](/powershell/aipservice/get-aadrmkeys) Azure RMS cmdlet.


You’re now ready to go to [Step 5. Activate the Azure Rights Management service](migrate-from-ad-rms-phase2.md#step-5-activate-the-azure-rights-management-service).


