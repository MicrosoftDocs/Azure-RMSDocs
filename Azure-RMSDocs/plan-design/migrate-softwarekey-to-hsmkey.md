---
# required metadata

title: Step 2&colon; Software-protected key to HSM-protected key migration | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 06/12/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
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

*Applies to: Active Directory Rights Management Services, Azure Rights Management*


These instructions are part of the [migration path from AD RMS to Azure Rights Management](migrate-from-ad-rms-to-azure-rms.md), and are applicable only if your AD RMS key is software-protected and you want to migrate to Azure Rights Management with a HSM-protected tenant key in Azure Key Vault. 

If this is not your chosen configuration scenario, go back to [Step 2. Export configuration data from AD RMS and import it to Azure RMS](migrate-from-ad-rms-to-azure-rms.md#step-2-export-configuration-data-from-ad-rms-and-import-it-to-azure-rms) and choose a different configuration.

It’s a four-part procedure to import the AD RMS configuration to Azure RMS, to result in your Azure RMS tenant key that is managed by you (BYOK) in Azure Key Vault.

You must first extract your server licensor certificate (SLC) key from the configuration data and transfer the key to an on-premises Thales HSM, next package and transfer your HSM key to Azure Key Vault, then authorize Azure RMS to access your key vault, and then import the configuration data.

Because your Azure RMS tenant key will be stored and managed by Azure Key Vault, this part of the migration requires administration in Azure Key Vault, in addition to Azure Key RMS. If Azure Key Vault is managed by a different administrator than you for your organization, you will need to co-ordindate and work with that administrator to complete these procedures.

Before you begin, make sure that your organization has a key vault that has been created in Azure Key Vault, and that it supports HSM-protected keys. Although it's not required, we recommend that you have a dedicated key vault for Azure RMS. This key vault will be be configured to allow Azure RMS to access it, so the keys that this key vault stores should be limited to Azure RMS keys only.

> [!TIP]
> If you will be doing the configuration steps for Azure Key Vault and you are not familiar with this Azure service, you might find it useful to first review [Get started with Azure Key Vault](https://azure.microsoft.com/documentation/articles/key-vault-get-started/). 


## Part 1: Extract your SLC from the configuration data and import the key to your on-premises HSM

1.  Azure Key Vault administrator: Use the following steps in the [Implementing bring your own key (BYOK) for Azure Key Vault](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#implementing-bring-your-own-key-byok-for-azure-key-vault) section of the Azure Key Vault documentation:

    -   **Generate and transfer your key to Azure Key Vault HSM**: [Prepare your Internet-connected workstation](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#step-1-prepare-your-internet-connected-workstation)

    -   **Generate and transfer your tenant key – over the Internet**: [Step 2: Prepare your disconnected workstation](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#step-2-prepare-your-disconnected-workstation)

    Do not follow the steps to generate your tenant key, because you already have the equivalent in the exported configuration data (.xml) file. Instead, you will run a command to extract this key from the file and import it to your on-premises HSM.

2. Azure RMS administrator or Azure Key Vault administrator: On the disconnected workstation, run the Tpd2PfxConverter tool from the [Azure RMS migration toolkit](https://go.microsoft.com/fwlink/?LinkId=524619) to extract the key from the SLC file. For example, if the tool is installed on your E drive:

    ```
    	E:\Migration\Tpd2PfxConverter.exe /tpd:ContosoTPD.xml /pfx:ContosoTPD.pfx
    ```

    Additional information for this command:

    -   The /tpd: specifies the full path to the TPD file. The full parameter name is TpdFilePath.

    -   The /pfx: specifies  the output of the .PFX file name. The full parameter name is OutPfxFile. 

    -   If you don't specify the password when you run this command (by using the TpdPassword full parameter name or pwd short parameter name), you will be prompted to specify it.

    This command results in the .PFX file (by default, RmsoTDP.pfx) in the current directory.

3. On the same disconnected workstation, attach and configure Thales HSM according to your Thales documentation. Then convert your .PFX file to a PEM format by using a Command Prompt window with the openssl utility, which is included with Thales HSM software. For example, from your \Program Files (x86)\nCipher\nfast\bin folder, run:

		openssl pkcs12 -in e:\Migration\ContosoTPD.pfx -out e:\Migration\Contoso.pem -nodes

    You will be prompted for an import password and see a confirmation message of **MAC verified OK**.

    This creates a Contoso.pem file that you must secure from unauthorized access.

4. Convert your PEM file to a format that is accepted by Thales HSM. For example, from your \Program Files (x86)\nCipher\nfast\bin folder, run:

		openssl.exe rsa -in "e:\Migration\Contoso.pem" -out e:\Migration\Contoso_converted.pem -outform PEM

    This creates a Contoso_converted.pem file that you must secure from unauthorized access.

5. By using your converted .PEM file, you can now import your key into your attached Thales HSM by using the following command:

    	generatekey --import simple pemreadfile=e:\Migration\Contoso_converted.pem plainname=ContosoBYOK protect=module ident=contosobyok type=RSA

    This will generate an output display similar to the following:

    **key generation parameters:**

    **operation &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Operation to perform &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import**

    **application &nbsp;&nbsp;&nbsp;&nbsp;Application&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; simple**

    **verify &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Verify security of key&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes**

    **type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Key type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RSA**

    **pemreadfile &nbsp;&nbsp;&nbsp; PEM file containing RSA key &nbsp;&nbsp;&nbsp; e:Contoso_converted.pem**

    **ident &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Key identifier &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; contosobyok**

    **plainname &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Key name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ContosoBYOK**

    **Key successfully imported.**

    **Path to key: C:\ProgramData\nCipher\Key Management Data\local\key_simple_contosobyok**

    This output confirms that the private key is now migrated to your on-premises Thales HSM device with an encrypted copy that is saved to a key (in our example, "key_simple_contosobyok"). 

    Now that your SLC has been extracted so that it’s an HSM-based key, you’re ready to package and transfer it to Azure Key Vault.

## Part 2: Package and transfer your HSM key to Azure Key Vault

1.  Azure Key Vault administrator: Use the following steps from the [Implementing bring your own key (BYOK) for Azure Key Vault](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#implementing-bring-your-own-key-byok-for-azure-key-vault) section of the Azure Key Vault documentation:

    -   [Step 4: Prepare your key for transfer](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#step-4-prepare-your-key-for-transfer)

    -   [Step 5: Transfer your key to Azure Key Vault](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#step-5-transfer-your-key-to-azure-key-vault)

    Do not follow the steps to generate your key pair, because you already have the key. Instead, you will run a command to transfer this key (in our example, our KeyIdentifier parameter uses "contosobyok") from your on-premises HSM.

    Before you transfer your key to Azure Key Vault, make sure that the KeyTransferRemote.exe utility returns **Result: SUCCESS** when you create a copy of your key with reduced permissions (step 4.1) and when you encrypt your key (step 4.3).

    Now that you’ve transferred your HSM key to Azure Key Vault, you’re ready to import your AD RMS configuration data, which contains only a pointer to the newly transferred tenant key.

## Part 3: Import the configuration data to Azure RMS

1.  Azure RMS administrator: Still on the Internet-connected workstation and in the PowerShell session, copy over the RMS configuration files with the SLC removed.

2.  Upload the first file. If you have more than one .xml file because you had multiple trusted publishing domains, choose the file that contains the exported trusted publishing domain that corresponds to the HSM key you want to use in Azure RMS to protect content after the migration. Use the following command:

    ```
    Import-AadrmTpd -TpdFile <PathToNoKeyTpdPackageFile> -ProtectionPassword –KeyVaultStringUrl https://contoso-byok-kv.vault.azure.net/ -Active $True -Verbose
    ```

    When prompted, enter the password that you specified earlier for the SLC file, and confirm that you want to perform this action.

    If you have more than one AD RMS configuration data files, repeat this command for the remainder of these files. But for these files, set **-Active** to **false** when you run the Import command.

    > [!IMPORTANT]
    > When you have completed this step, securely erase these PEM files from the disconnected workstation to ensure that they cannot be accessed by unauthorized people. For example, run "cipher /w:E" to securely delete all files from the E: drive.


You’re now ready to go to [Step 3. Activate your RMS tenant](migrate-from-ad-rms-phase1#step-3-activate-your-rms-tenant).


