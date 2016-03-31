---
# required metadata

title: Step 2&colon; HSM-protected key to HSM-protected key migration | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
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

> [!NOTE]
> These instructions assume your AD RMS key is module-protected. This is the common case. If your AD RMS key is OCS-protected, please contact [AskIPTeam@microsoft.com](mailto: askipteam@microsoft.com?subject=AD%20RMS%20migration%20with%20OCS-protected%20key) before you do these instructions.

It’s a two-part procedure to import your HSM key and AD RMS configuration to Azure RMS, to result in your Azure RMS tenant key that is managed by you (BYOK).

You must first package your HSM key so it's ready to transfer to Azure RMS, and then import it with the configuration data.

## Part 1: Package your HSM key so it's ready to transfer to Azure RMS

1.  Follow the steps in the [Implementing bring your own key (BYOK)](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_ImplementBYOK) section of the [Planning and Implementing Your Azure Rights Management Tenant Key](planning-and-implementing-your-azure-rights-management-tenant-key.md), using the procedure **Generate and transfer your tenant key – over the Internet** with the following exceptions:

    -   Do not follow the steps for **Generate your tenant key**, because you already have the equivalent from your AD RMS deployment. You must identify the key used by your AD RMS server from the Thales installation and use this key during the migration. Thales encrypted key files are usually named **key_(keyAppName)_(keyIdentifier)** locally on the server.

    -   Do not follow the steps for **Transfer your tenant key to Azure RMS**, which uses the  Add-AadrmKey command.  Instead, you will transfer your prepared HSM key when you upload your exported trusted publishing domain, by using the Import-AadrmTpd command.

2.  On the Internet-connected workstation, in Windows PowerShell session, reconnect to the Azure RMS service.

Now that you’ve prepared your HSM key for Azure RMS, you’re ready to import your HSM key file and AD RMS configuration data.

## Part 2: Import the HSM key and configuration data to Azure RMS

1.  Still on the Internet-connect workstation and in the Windows PowerShell session, upload the first exported trusted publishing domain (.xml) file. If you have more than one .xml file because you had multiple trusted publishing domains, choose the file that contains the exported trusted publishing domain that corresponds to the HSM key you want to use in Azure RMS to protect content after the migration. Use the following command:

    ```
    Import-AadrmTpd -TpdFile <PathToTpdPackageFile> -ProtectionPassword -HsmKeyFile <PathToBYOKPackage> -Active $True -Verbose
    ```
    For example: **Import -TpdFile E:\no_key_tpd_contosokey1.xml  -HsmKeyFile E:\KeyTransferPackage-contosokey.byok -ProtectionPassword -Active $true -Verbose**

    When prompted, enter the password that you specified earlier, and confirm that you want to perform this action.

2.  When the command completes, repeat step 1 for each remaining  .xml file that you created by exporting your trusted publishing domains. But for these files, set **-Active** to **false** when you run the Import command.  For example: **Import -TpdFile E:\contosokey2.xml -HsmKeyFile E:\KeyTransferPackage-contosokey.byok -ProtectionPassword -Active $false -Verbose**

3.  Use the [Disconnect-AadrmService](http://msdn.microsoft.com/library/windowsazure/dn629416.aspx) cmdlet to disconnect from the Azure RMS service:

    ```
    Disconnect-AadrmService
    ```

You’re now ready to go to [Step 3. Activate your RMS tenant](migrating-from-ad-rms-to-azure-rights-management.md#BKMK_Step3Migration).

