---
# required metadata

title: Step 2&colon; Software-protected key to HSM-protected key migration | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
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


These instructions are part of the [migration path from AD RMS to Azure Rights Management](migrate-from-ad-rms-to-azure-rms.md), and are applicable only if your AD RMS key is software-protected and you want to migrate to Azure Rights Management with a HSM-protected tenant key. 

If this is not your chosen configuration scenario, go back to [Step 2. Export configuration data from AD RMS and import it to Azure RMS](migrate-from-ad-rms-phase1.md#step-2-export-configuration-data-from-ad-rms-and-import-it-to-azure-rms) and choose a different configuration.

It’s a three-part procedure to import the AD RMS configuration to Azure RMS, to result in your Azure RMS tenant key that is managed by you (BYOK).

You must first extract your server licensor certificate (SLC) key from the configuration data and transfer the key to an on-premises Thales HSM, then package and transfer your HSM key to Azure RMS, and then import the configuration data.

## Part 1: Extract your SLC from the configuration data and import the key to your on-premises HSM

1.  Follow the steps in the [Implementing bring your own key (BYOK)](plan-implement-tenant-key.md#implementing-your-azure-rights-management-tenant-key) section of the [Planning and implementing your Azure Rights Management tenant key](plan-implement-tenant-key.md), using the procedure **Generate and transfer your tenant key – over the Internet** with the following exceptions:

    -   **Generate and transfer your tenant key – over the Internet**: **Prepare your Internet-connected workstation**

    -   **Generate and transfer your tenant key – over the Internet**: **Prepare your disconnected workstation**

    Do not follow the steps to generate your tenant key, because you already have the equivalent in the exported configuration data (.xml) file. Instead, you will run a command to extract this key from the file and import it to your on-premises HSM.

2.  On the disconnected workstation, run the following command:

    ```
    KeyTransferRemote.exe -ImportRmsCentrallyManagedKey -TpdFilePath <TPD> -ProtectionPassword -KeyIdentifier <KeyID> -ExchangeKeyPackage <BYOK-KEK-pka-Region> -NewSecurityWorldPackage <BYOK-SecurityWorld-pkg-Region>
    ```
    For example, for North America: **KeyTransferRemote.exe -ImportRmsCentrallyManagedKey -TpdFilePath E:\contosokey1.xml -ProtectionPassword -KeyIdentifier contosorms1key –- -ExchangeKeyPackage &lt;BYOK-KEK-pka-NA-1&gt; -NewSecurityWorldPackage &lt;BYOK-SecurityWorld-pkg-NA-1&gt;**

    Additional information:

    -   The ImportRmsCentrallyManagedKey parameter indicates that the operation is to import the SLC key.

    -   If you don’t specify the password in the command, you will be prompted to specify it.

    -   The KeyIdentifier parameter is for a key friendly name that creates the key file name. You must use only lower-case ASCII characters.

    -   The ExchangeKeyPackage parameter specifies a region-specific key exchange key (KEK) package that has a name beginning with BYOK-KEK-pkg-.

    -   The NewSecurityWorldPackage parameter specifies a region-specific security world package that has a name beginning with BYOK-SecurityWorld-pkg-.

    This command results in the following:

    -   An HSM key file: %NFAST_KMDATA%\local\key_mscapi_&lt;KeyID&gt;

    -   RMS configuration data file with the SLC removed: %NFAST_KMDATA%\local\no_key_tpd_&lt;KeyID&gt;.xml

3.  If you have more than one RMS configuration data files, repeat step 2 for the remainder of these files.

Now that your SLC has been extracted so that it’s an HSM-based key, you’re ready to package and transfer it to Azure RMS.

## Part 2: Package and transfer your HSM key to Azure RMS

1.  Use the following steps from the [Implementing bring your own key (BYOK)](plan-implement-tenant-key.md#implementing-your-azure-rights-management-tenant-key) section of the [Planning and implementing your Azure Rights Management tenant key](plan-implement-tenant-key.md):

    -   **Generate and transfer your tenant key – over the Internet**: **Prepare your tenant key for transfer**

    -   **Generate and transfer your tenant key – over the Internet**: **Transfer your tenant key to Azure RMS**

Now that you’ve transferred your HSM key to Azure RMS, you’re ready to import your AD RMS configuration data, which contains only a pointer to the newly transferred tenant key.

## Part 3: Import the configuration data to Azure RMS

1.  Still on the Internet-connected workstation and in the Windows PowerShell session, copy over the RMS configuration files with the SLC removed (from the disconnected workstation, %NFAST_KMDATA%\local\no_key_tpd_&lt;KeyID&gt;.xml)

2.  Upload the first file. If you have more than one .xml file because you had multiple trusted publishing domains, choose the file that contains the exported trusted publishing domain that corresponds to the HSM key you want to use in Azure RMS to protect content after the migration. Use the following command:

    ```
    Import-AadrmTpd -TpdFile <PathToNoKeyTpdPackageFile> -ProtectionPassword -HsmKeyFile <PathToKeyTransferPackage> -Active $true -Verbose
    ```
    For example: **Import -TpdFile E:\no_key_tpd_contosorms1key.xml -ProtectionPassword -HsmKeyFile E:\KeyTransferPackage-contosorms1key.byok -Active $true -Verbose**

    When prompted, enter the password that you specified earlier, and confirm that you want to perform this action.

3.  When the command completes, repeat step 2 for each remaining  .xml file that you created by exporting your trusted publishing domains. But for these files, set **-Active** to **false** when you run the Import command. For example: **Import -TpdFile E:\no_key_tpd_contosorms2key.xml -ProtectionPassword -HsmKeyFile E:\KeyTransferPackage-contosorms1key.byok -Active $false -Verbose**

4.  Use the [Disconnect-AadrmService](http://msdn.microsoft.com/library/windowsazure/dn629416.aspx) cmdlet to disconnect from the Azure RMS service:

    ```
    Disconnect-AadrmService
    ```

You’re now ready to go to [Step 3. Activate your RMS tenant](migrate-from-ad-rms-phase1.md#step-3-activate-your-rms-tenant).


