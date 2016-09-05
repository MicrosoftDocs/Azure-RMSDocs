---
# required metadata

title: Step 2&colon; HSM-protected key to HSM-protected key migration | Azure Information Protection
description: Instructions that are part of the migration path from AD RMS to Azure Information Protection, and are applicable only if your AD RMS key is HSM-protected and you want to migrate to Azure Information Protection with a HSM-protected tenant key in Azure Key Vault. 
author: cabailey
manager: mbaldwin
ms.date: 08/25/2016
ms.topic: article
ms.prod:
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: c5bbf37e-f1bf-4010-a60f-37177c9e9b39

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Step 2: HSM-protected key to HSM-protected key migration

>*Applies to: Active Directory Rights Management Services, Azure Information Protection*


These instructions are part of the [migration path from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md), and are applicable only if your AD RMS key is HSM-protected and you want to migrate to Azure Information Protection with a HSM-protected tenant key in Azure Key Vault. 

If this is not your chosen configuration scenario, go back to [Step 2. Export configuration data from AD RMS and import it to Azure RMS](migrate-from-ad-rms-phase1.md#step-2-export-configuration-data-from-ad-rms-and-import-it-to-azure-rms) and choose a different configuration.

> [!NOTE]
> These instructions assume your AD RMS key is module-protected. This is the most typical case. 

It’s a two-part procedure to import your HSM key and AD RMS configuration to Azure Information Protection, to result in your Azure Information Protection tenant key that is managed by you (BYOK).

Because your Azure Information Protection tenant key will be stored and managed by Azure Key Vault, this part of the migration requires administration in Azure Key Vault, in addition to Azure Information Protection. If Azure Key Vault is managed by a different administrator than you for your organization, you will need to co-ordinate and work with that administrator to complete these procedures.

Before you begin, make sure that your organization has a key vault that has been created in Azure Key Vault, and that it supports HSM-protected keys. Although it's not required, we recommend that you have a dedicated key vault for Azure Information Protection. This key vault will be configured to allow the Azure Rights Management service to access it, so the keys that this key vault stores should be limited to Azure Information Protection keys only.


> [!TIP]
> If you will be doing the configuration steps for Azure Key Vault and you are not familiar with this Azure service, you might find it useful to first review [Get started with Azure Key Vault](https://azure.microsoft.com/documentation/articles/key-vault-get-started/). 


## Part 1: Transfer your HSM key to Azure Key Vault

These procedures are done by the administrator for Azure Key Vault.

1.  Follow the instructions from the Azure Key Vault documentation, using [Implementing bring your own key (BYOK) for Azure Key Vault](https://azure.microsoft.com/documentation/articles/key-vault-hsm-protected-keys/#implementing-bring-your-own-key-byok-for-azure-key-vault) with the following exception:

    - Do not do the steps for **Generate your tenant key**, because you already have the equivalent from your AD RMS deployment. Instead, identify the key used by your AD RMS server from the Thales installation and use this key during the migration. Thales encrypted key files are usually named **key<*keyAppName*><*keyIdentifier*>** locally on the server.

    When the key uploads to Azure Key Vault, you see the properties of the key displayed, which includeds the key ID. It will look similar to https://contosorms-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333. Make a note of this URL because the Azure RMS administrator will need it to tell Azure RMS to use this key for its tenant key.

2. On the Internet-connected workstation, in a PowerShell session, use the [Set-AzureRmKeyVaultAccessPolicy](https://msdn.microsoft.com/library/mt603625.aspx ) cmdlet to authorize the Azure RMS service principal (Microsoft.Azure.RMS) to access the key vault that will store the Azure RMS tenant key. The permissions required are decrypt, encrypt, unwrapkey, wrapkey, verify, and sign.
    
    For example, if the key vault that you have created for Azure RMS is named contoso-byok-ky, and your resource group is named contoso-byok-rg, run the following command:
    
        Set-AzureRmKeyVaultAccessPolicy -VaultName "contoso-byok-kv" -ResourceGroupName "contoso-byok-rg" -ServicePrincipalName Microsoft.Azure.RMS -PermissionsToKeys decrypt,encrypt,unwrapkey,wrapkey,verify,sign


Now that you’ve prepared your HSM key in Azure Key Vault for the Azure Rights Management service from Azure Information Protection, you’re ready to import your AD RMS configuration data.

## Part 2: Import the configuration data to Azure RMS

These procedures are done by the administrator for Azure Information Protection.

1.  On the Internet-connect workstation and in the PowerShell session, connect to the Azure Rights Management service by using the [Connnect-AadrmService](https://msdn.microsoft.com/library/dn629415.aspx ) cmdlet.
    
    Then upload the first exported trusted publishing domain (.xml) file, by using the [Import-AadrmTpd](https://msdn.microsoft.com/library/dn857523.aspx) cmdlet. If you have more than one .xml file because you had multiple trusted publishing domains, choose the file that contains the exported trusted publishing domain that corresponds to the HSM key you want to use in Azure RMS to protect content after the migration. 
    
    To run this cmdlet, you will need the URL for the key that was identified in the previous step.
    
    For example, using our key URL value from the previous step and a TPD file of C:\contoso-tpd1.xml, you would run:
    
    ```
    Import-AadrmTpd -TpdFile "C:\contoso-tpd1.xml" -ProtectionPassword –KeyVaultStringUrl https://contoso-byok-kv.vault.azure.net/keys/contosorms-byok/aaaabbbbcccc111122223333 -Active $True -Verbose
    ```
    
    When prompted, enter the password that you specified earlier, and confirm that you want to perform this action.

2.  When the command completes, repeat step 1 for each remaining  .xml file that you created by exporting your trusted publishing domains. But for these files, set **-Active** to **false** when you run the Import command.  

3.  Use the [Disconnect-AadrmService](http://msdn.microsoft.com/library/windowsazure/dn629416.aspx) cmdlet to disconnect from the Azure Rights Management service:

    ```
    Disconnect-AadrmService
    ```

    > [!NOTE]
    > If you later need to confirm which key your Azure Information Protection tenant key is using in Azure Key Vault, use the [Get-AadrmKeys](https://msdn.microsoft.com/library/dn629420.aspx) Azure RMS cmdlet.

You’re now ready to go to [Step 3. Activate your Azure Information Protection tenant](migrate-from-ad-rms-phase1.md#step-3-activate-your-rms-tenant).

