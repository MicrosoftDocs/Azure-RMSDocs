---
# required metadata

title: Migrate software-protected key to software-protected key - AIP
description: Instructions that are part of the migration path from AD RMS to Azure Information Protection, and are applicable only if your AD RMS key is software-protected and you want to migrate to Azure Information Protection with a software-protected tenant key. 
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/11/2020
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 81a5cf4f-c1f3-44a9-ad42-66e95f33ed27

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


# Step 2: Software-protected key to software-protected key migration

These instructions are part of the [migration path from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md), and are applicable only if your AD RMS key is software-protected and you want to migrate to Azure Information Protection with a software-protected tenant key. 

If this is not your chosen configuration scenario, go back to [Step 4. Export configuration data from AD RMS and import it to Azure RMS](migrate-from-ad-rms-phase2.md#step-4-export-configuration-data-from-ad-rms-and-import-it-to-azure-information-protection) and choose a different configuration.

Use the following procedure to import the AD RMS configuration to Azure Information Protection, to result in your Azure Information Protection tenant key that is managed by Microsoft.

## To import the configuration data to Azure Information Protection

1. On an internet-connected workstation, use the [Connect-AipService](/powershell/module/aipservice/connect-aipservice) cmdlet to connect to the Azure Rights Management service:

    ```PowerShell
    Connect-AipService
    ```
    
    When prompted, enter your Azure Rights Management tenant administrator credentials (typically, you will use an account that is a global administrator for Azure Active Directory or Office 365).

2. Use the [Import-AipServiceTpd](/powershell/module/aipservice/import-aipservicetpd) cmdlet to upload each exported trusted publishing domain (.xml) file. For example, you should have at least one additional file to import if you upgraded your AD RMS cluster for Cryptographic Mode 2. 
    
    To run this cmdlet, you will need the password that you specified earlier for each configuration data file. 
    
    For example, first run the following to store the password:
    
    ```PowerShell
	$TPD_Password = Read-Host -AsSecureString
    ```

    Enter the password that you specified to export the first configuration data file. Then, using E:\contosokey1.xml as an example for that configuration file, run the following command and confirm that you want to perform this action:

    ```PowerShell
    Import-AipServiceTpd -TpdFile E:\contosokey1.xml -ProtectionPassword $TPD_Password -Verbose
    ```
    
3. When you have uploaded each file, run [Set-AipServiceKeyProperties](/powershell/module/aipservice/set-aipservicekeyproperties) to identify the imported key that matches the currently active SLC key in AD RMS. This key will become the active tenant key for your Azure Rights Management service.

4.  Use the [Disconnect-AipService](/powershell/module/aipservice/disconnect-aipservice) cmdlet to disconnect from the Azure Rights Management service:

    ```PowerShell
    Disconnect-AipService
    ```

You’re now ready to go to [Step 5. Activate the Azure Rights Management service](migrate-from-ad-rms-phase2.md#step-5-activate-the-azure-rights-management-service).


