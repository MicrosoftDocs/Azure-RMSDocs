---
# required metadata

title: Step 2&colon; Software-protected key to software-protected key migration | Azure Information Protection
description: Instructions that are part of the migration path from AD RMS to Azure Information Protection, and are applicable only if your AD RMS key is software-protected and you want to migrate to Azure Information Protection with a software-protected tenant key. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 11/03/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 81a5cf4f-c1f3-44a9-ad42-66e95f33ed27

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Step 2: Software-protected key to software-protected key migration

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Office 365*


These instructions are part of the [migration path from AD RMS to Azure Information Protection](migrate-from-ad-rms-to-azure-rms.md), and are applicable only if your AD RMS key is software-protected and you want to migrate to Azure Information Protection with a software-protected tenant key. 

If this is not your chosen configuration scenario, go back to [Step 2. Export configuration data from AD RMS and import it to Azure RMS](migrate-from-ad-rms-phase1.md#step-2-export-configuration-data-from-ad-rms-and-import-it-to-azure-information-protection) and choose a different configuration.

Use the following procedure to import the AD RMS configuration to Azure Information Protection, to result in your Azure Information Protection tenant key that is managed by Microsoft.

## To import the configuration data to Azure Information Protection

1.  On an Internet-connected workstation, download and install the Windows PowerShell module for Azure Rights Management (minimum version 2.5.0.0), which includes the [Import-AadrmTpd](http://msdn.microsoft.com/library/azure/dn857523.aspx) cmdlet. The Azure Rights Management service (Azure RMS) provides the protection service for Azure Information Protection.

    > [!TIP]
    > If you have previously downloaded and installed the module, check the version number by running: `(Get-Module aadrm -ListAvailable).Version`

    For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

2.  Start Windows PowerShell with the **Run as administrator** option and use the [Connect-AadrmService](http://msdn.microsoft.com/library/azure/dn629415.aspx) cmdlet to connect to the Azure RMS service:

    ```
    Connect-AadrmService
    ```
    When prompted, enter your [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] tenant administrator credentials (typically, you will use an account that is a global administrator for Azure Active Directory or Office 365).

3.  Use the [Import-AadrmTpd](http://msdn.microsoft.com/library/azure/dn857523.aspx) cmdlet to upload the first exported trusted publishing domain (.xml) file. If you have more than one .xml file because you had multiple trusted publishing domains, choose the file that contains the exported trusted publishing domain that you want to use with Azure Information Protection to protect content after the migration. Use the following command:

    ```
    Import-AadrmTpd -TpdFile <PathToTpdPackageFile> -ProtectionPassword <secure string> -Active $True -Verbose
    ```
    You can use either [ConvertTo-SecureString -AsPlaintext](https://technet.microsoft.com/library/hh849818.aspx) or [Read-Host](https://technet.microsoft.com/library/hh849945.aspx) to specify the password as a secure string. When you use ConvertTo-SecureString and the password has special characters, enter the password between single quotes or escape the special characters.
    
    For example: First run **$TPD_Password = Read-Host -AsSecureString** and enter the password that you specified earlier. Then run **Import-AadrmTpd -TpdFile E:\contosokey1.xml -ProtectionPassword $TPD_Password -Active $true -Verbose**. When prompted, confirm that you want to perform this action.
    
4.  When the command completes, repeat step 3 for each remaining .xml file that you created by exporting your trusted publishing domains. But for these files, set **-Active** to **false** when you run the Import command. For example: **Import-AadrmTpd -TpdFile E:\contosokey2.xml -ProtectionPassword $TPD_Password -Active $false -Verbose**

5.  Use the [Disconnect-AadrmService](http://msdn.microsoft.com/library/azure/dn629416.aspx) cmdlet to disconnect from the Azure Rights Management service:

    ```
    Disconnect-AadrmService
    ```


You’re now ready to go to [Step 3. Activate your Azure Information Protection tenant](migrate-from-ad-rms-phase1.md#step-3-activate-your-azure-information-protection-tenant).


