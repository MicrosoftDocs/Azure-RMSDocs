---
# required metadata

title: Step 2&colon; Software-protected key to software-protected key migration | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 06/12/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
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

*Applies to: Active Directory Rights Management Services, Azure Rights Management*


These instructions are part of the [migration path from AD RMS to Azure Rights Management](migrate-from-ad-rms-to-azure-rms.md), and are applicable only if your AD RMS key is software-protected and you want to migrate to Azure Rights Management with a software-protected tenant key. 

If this is not your chosen configuration scenario, go back to [Step 2. Export configuration data from AD RMS and import it to Azure RMS](migrate-from-ad-rms-to-azure-rms.md#step-2-export-configuration-data-from-ad-rms-and-import-it-to-azure-rms) and choose a different configuration.

Use the following procedure to import the AD RMS configuration to Azure RMS, to result in your Azure RMS tenant key that is managed by Microsoft.

## To import the configuration data to Azure RMS

1.  On an Internet-connected workstation, download and install the Windows PowerShell module for Azure RMS (minimum version 2.1.0.0), which includes the [Import-AadrmTpd](http://msdn.microsoft.com/library/azure/dn857523.aspx) cmdlet.

    > [!TIP]
    > If you have previously downloaded and installed the module, check the version number by running: `(Get-Module aadrm -ListAvailable).Version`

    For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/install-powershell.md).

2.  Start Windows PowerShell with the **Run as administrator** option and use the [Connect-AadrmService](http://msdn.microsoft.com/library/azure/dn629415.aspx) cmdlet to connect to the Azure RMS service:

    ```
    Connect-AadrmService
    ```
    When prompted, enter your [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] tenant administrator credentials (typically, you will use an account that is a global administrator for Azure Active Directory or Office 365).

3.  Use the [Import-AadrmTpd](http://msdn.microsoft.com/library/azure/dn857523.aspx) cmdlet to upload the first exported trusted publishing domain (.xml) file. If you have more than one .xml file because you had multiple trusted publishing domains, choose the file that contains the exported trusted publishing domain that you want to use in Azure RMS to protect content after the migration. Use the following command:

    ```
    Import-AadrmTpd -TpdFile <PathToTpdPackageFile> -ProtectionPassword -Active $True -Verbose
    ```
    For example: **Import-AadrmTpd -TpdFile E:\contosokey1.xml -ProtectionPassword -Active $true -Verbose**

    When prompted, enter the password that you specified earlier, and confirm that you want to perform this action.

4.  When the command completes, repeat step 3 for each remaining  .xml file that you created by exporting your trusted publishing domains. But for these files, set **-Active** to **false** when you run the Import command. For example: **Import-AadrmTpd -TpdFile E:\contosokey2.xml -ProtectionPassword -Active $false -Verbose**

5.  Use the [Disconnect-AadrmService](http://msdn.microsoft.com/library/azure/dn629416.aspx) cmdlet to disconnect from the Azure RMS service:

    ```
    Disconnect-AadrmService
    ```

You’re now ready to go to [Step 3. Activate your RMS tenant](migrate-from-ad-rms-phase1#step-3-activate-your-rms-tenant).

