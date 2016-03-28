---
# required metadata

title: Implementing your Azure Rights management tenant key | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
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

# Implementing your Azure Rights Management tenant key

Use the information and procedures in this section if you have decided to generate and manage your tenant key; the bring your own key (BYOK) scenario:

-   [Prerequisites for BYOK](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_Preqs)

-   [Generate and transfer your tenant key – over the Internet](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_BYOK_Internet)

-   [Generate and transfer your tenant key – in person](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_BYOK_InPerson)

> [!IMPORTANT]
> If you have already started to use [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] (the service is activated) and you have users who run Office 2010, contact Microsoft Customer Support Services (CSS) before you run these procedures. Depending on your scenario and requirements, you can still use BYOK but with some limitations or additional steps.
> 
> Also contact CSS if your organization has specific policies for handling keys.

### Prerequisites for BYOK
See the following table for a list of prerequisites for bring your own key (BYOK).

|Requirement|More information|
|---------------|--------------------|
|A subscription that supports Azure RMS.|For more information about the available subscriptions, see the [Cloud subscriptions that support Azure RMS](requirements-for-azure-rights-management.md#BKMK_SupportedSubscriptions) section in the [Requirements for Azure Rights Management](requirements-for-azure-rights-management.md) topic.|
|You do not use RMS for individuals or Exchange Online. Or, if you use Exchange Online, you understand and accept the limitations of using BYOK with this configuration.|For more information about the restrictions and current limitations for BYOK, see the [BYOK pricing and restrictions](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_Pricing) section in this topic.<br /><br />**Important**: Currently, BYOK is not compatible with Exchange Online.|
|Thales HSM, smartcards, and support software.<br /><br />**Note**: If you are migrating from AD RMS to Azure RMS by using software key to hardware key, you must have a minimum version of 11.62 for the Thales drivers.|You must have access to a Thales Hardware Security Module and basic operational knowledge of Thales HSMs. See [Thales Hardware Security Module](http://www.thales-esecurity.com/msrms/buy) for the list of compatible models, or to purchase an HSM if you do not have one.|
|If you want to transfer your tenant key over the Internet rather than physically be present in Redmond, USA. there are 3 requirements:<br /><br />Requirement 1: An offline x64 workstation with a minimum Windows operation system of Windows 7 and Thales nShield software that is at least version 11.62.<br /><br />If this workstation runs Windows 7, you must [install Microsoft .NET Framework 4.5](http://go.microsoft.com/fwlink/?LinkId=225702).<br /><br />Requirement 2: A workstation that is connected to the Internet and has a minimum Windows operation system of Windows 7.<br /><br />Requirement 2: A USB drive or other portable storage device that has at least 16 MB free space.|These prerequisites are not required if you travel to Redmond and transfer your tenant key in person.<br /><br />For security reasons, we recommend that the first workstation is not connected to a network. However, this is not programmatically enforced.<br /><br />Note: In the instructions that follow, this first workstation is referred to as the **disconnected workstation**.<br /><br />In addition, if your tenant key is for a production network, we recommend that you use a second, separate workstation to download the toolset and upload the tenant key. But for testing purposes, you can use the same workstation as the first one.<br /><br />Note: In the instructions that follow, this second workstation is referred to as the **Internet-connected workstation**.|

The procedures to generate and use your own tenant key depend on whether you want to do this over the Internet or in person:

-   **Over the Internet:** This requires some extra configuration steps, such as downloading and using a toolset and Windows PowerShell cmdlets. However, you do not have to physically be in a Microsoft facility to transfer your tenant key. Security is maintained by the following methods:

    -   You generate the tenant key from an offline workstation, which reduces the attack surface.

    -   The tenant key is encrypted with a Key Exchange Key (KEK), which stays encrypted until it is transferred to the Azure RMS HSMs. Only the encrypted version of your tenant key leaves the original workstation.

    -   A tool sets properties on your tenant key that binds your tenant key to the Azure RMS security world. So after the Azure RMS HSMs receive and decrypt your tenant key, only these HSMs can use it. Your tenant key cannot be exported. This binding is enforced by the Thales HSMs.

    -   The Key Exchange Key (KEK) that is used to encrypt your tenant key is generated inside the Azure RMS HSMs and is not exportable. The HSMs enforce that there can be no clear version of the KEK outside the HSMs. In addition, the toolset includes attestation from Thales that the KEK is not exportable and was generated inside a genuine HSM that was manufactured by Thales.

    -   The toolset includes attestation from Thales that the Azure RMS security world was also generated on a genuine HSM manufactured by Thales. This proves to you that Microsoft is using genuine hardware.

    -   Microsoft uses separate KEKs as well as separate Security Worlds in each geographical region, which ensures that your tenant key can be used only in data centers in the region in which you encrypted it. For example, a tenant key from a European customer cannot be used in data centers in North American or Asia.

    > [!NOTE]
    > Your tenant key can safely move through untrusted computers and networks because it is encrypted and secured with access control level permissions, which makes it usable only within your HSMs and Microsoft’s HSMs for Azure RMS. You can use the scripts that are provided in the toolset to verify the security measures and read more information about how this works from Thales: [Hardware Key management in the RMS Cloud](https://www.thales-esecurity.com/knowledge-base/white-papers/hardware-key-management-in-the-rms-cloud).

-   **In person:** This requires that you contact Microsoft Customer Support Services (CSS) to schedule a key transfer appointment for Azure RMS. You must travel to a Microsoft office in Redmond, Washington, United States of America to transfer your tenant key to the Azure RMS security world.

Most people will generate and transfer their tenant key over the Internet. See the following procedures for how to do this. If you must generate and transfer your tenant key in person, see the alternative procedures in [Generate and transfer your tenant key - in person](generate-and-transfer-your-tenant-key-in-person.md).


### Generate and transfer your tenant key – over the Internet
Use the following procedures if you want to transfer your tenant key over the Internet rather than travel to a Microsoft facility to transfer the tenant key in person:

-   [Prepare your Internet-connected workstation](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetPrepareWorkstation)

-   [Prepare your disconnected workstation](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_DisconnectedPrepareWorkstation)

-   [Generate your tenant key](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetGenerate)

-   [Prepare your tenant key for transfer](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetPrepareTransfer)

-   [Transfer your tenant key to Azure RMS](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetTransfer)

#### Prepare your Internet-connected workstation
To prepare your workstation that is connected to the Internet, follow these 3 steps:

-   [Step 1: Install Windows PowerShell for Azure Rights Management](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_PrepareInternetConnectedWorkstation1)

-   [Step 2: Get your Azure Active Directory tenant ID](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_PrepareInternetConnectedWorkstation2)

-   [Step 3: Download the BYOK toolset](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_PrepareInternetConnectedWorkstation3)

##### Step 1: Install Windows PowerShell for Azure Rights Management
From the Internet-connected workstation, download and install the Windows PowerShell module for Azure Rights Management.

> [!NOTE]
> If you have previously downloaded this Windows PowerShell module, run the following command to check that your version number is at least 2.1.0.0: `(Get-Module aadrm -ListAvailable).Version`

For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](installing-windows-powershell-for-azure-rights-management.md).

##### Step 2: Get your Azure Active Directory tenant ID
Start Windows PowerShell with the **Run as administrator** option, and then run the following commands:

-   Use the [Connect-AadrmService](http://msdn.microsoft.com/library/windowsazure/dn629415.aspx) cmdlet to connect to the Azure RMS service:

    ```
    Connect-AadrmService
    ```
    When prompted, enter your [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] tenant administrator credentials (typically, you will use an account that is a global administrator for Azure Active Directory or Office 365).

-   Use the [Get-AadrmConfiguration](http://msdn.microsoft.com/library/windowsazure/dn629410.aspx) cmdlet to display the configuration of your tenant:

    ```
    Get-AadrmConfiguration
    ```
    From the output, save the GUID from the first line (BPOSId). This is your Azure Active Directory tenant ID, which you will need later when you prepare your tenant key for upload.

-   Use the [Disconnect-AadrmService](http://msdn.microsoft.com/library/windowsazure/dn629416.aspx) cmdlet to disconnect from the Azure RMS service until you are ready to upload your key:

    ```
    Disconnect-AadrmService
    ```

Do not close the Windows PowerShell window.

##### Step 3: Download the BYOK toolset
Go to the Microsoft Download Center and [download the BYOK toolset](http://go.microsoft.com/fwlink/?LinkId=335781) for your region:

|Region|Package name|
|----------|----------------|
|North America|AzureRMS-BYOK-tools-UnitedStates.zip|
|Europe|AzureRMS-BYOK-tools-Europe.zip|
|Asia|AzureRMS-BYOK-tools-AsiaPacific.zip|
The toolset includes the following :

-   A Key Exchange Key (KEK) package that has a name beginning with **BYOK-KEK-pkg-**.

-   A Security World package that has a name beginning with **BYOK-SecurityWorld-pkg-**.

-   A python script named **verifykeypackage.py**.

-   A command-line executable file named **KeyTransferRemote.exe**, a metadata file named **KeyTransferRemote.exe.config**, and associated DLLs.

-   A Visual C++ Redistributable Package, named **vcredist_x64.exe**.

Copy the package to a USB drive or other portable storage.

#### Prepare your disconnected workstation
To prepare your workstation that is not connected to a network (either the Internet or your internal network), follow these 2 steps:

-   [Step 1: Prepare the disconnected workstation with Thales HSM](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_PrepareDisconnectedWorkstation1)

-   [Step 2: Install the BYOK toolset on the disconnected workstation](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_PrepareDisconnectedWorkstation2)

##### Step 1: Prepare the disconnected workstation with Thales HSM
On the disconnected workstation, install the nCipher (Thales) support software on a Windows computer, and then attach a Thales HSM to that computer.

Ensure that the Thales tools are in your path **(%nfast_home%\bin** and **%nfast_home%\python\bin**). For example, type the following:

```
set PATH=%PATH%;”%nfast_home%\bin”;”%nfast_home%\python\bin”
```
For more information, see the user guide included with the Thales HSM, or visit the Thales website for Azure RMS at [http://www.thales-esecurity.com/msrms/cloud](http://www.thales-esecurity.com/msrms/cloud).

##### Step 2: Install the BYOK toolset on the disconnected workstation
Copy the BYOK toolset package from the USB drive or other portable storage, and then do the following:

1.  Extract the files from the downloaded package into any folder.

2.  From that folder, run vcredist_x64.exe.

3.  Follow the instructions to the install the Visual C++ runtime components for Visual Studio 2012.

#### Generate your tenant key
On the disconnected workstation, following these 3 steps to generate your own tenant key:

-   [Step 1: Create a security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetGenerate1)

-   [Step 2: Validate the downloaded package](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetGenerate2)

-   [Step 3: Create a new key](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetGenerate3)

##### Step 1: Create a security world
Start a command prompt and run the Thales new-world program.

```
new-world.exe --initialize --cipher-suite=DLf1024s160mRijndael --module=1 --acs-quorum=2/3
```
This program creates a **Security World** file at %NFAST_KMDATA%\local\world, which corresponds to the C:\ProgramData\nCipher\Key Management Data\local folder. You can use different values for the quorum but in our example, you’re prompted to enter three blank cards and pins for each one. Then, any two cards will be required to have administrative access to the security world (your specified quorum).  These cards become the **Administrator Card Set** for the new security world. At this stage, you can specify the password or PIN for each ACS card, or add it later with a command.

> [!TIP]
> You can verify the current configuration status of your HSM by using the `nkminfo` command.

Then do the following:

1.  Install the Thales CNG provider as described in the Thales documentation, and configure it to use the new security world.

2.  Back up the world file in **%nfast_kmdata%\local**. Secure and protect the world file, the Administrator Cards, and their pins, and make sure that no single person has access to more than one card.

##### Step 2: Validate the downloaded package
This step is optional but recommended so that you can validate the following:

-   The Key Exchange Key that is included in the toolset has been generated from a genuine Thales HSM.

-   The hash of the Azure RMS Security World that is included in the toolset has been generated in a genuine Thales HSM.

-   The Key Exchange Key is non-exportable.

> [!NOTE]
> To validate the downloaded package, the HSM must be connected, powered on, and must have a security world on it (such as the one you’ve just created).

###### To validate the downloaded package

1.  Run the verifykeypackage.py script by tying one of the following, depending on your region:

    -   For North America:

        ```
        python verifykeypackage.py -k BYOK-KEK-pkg-NA-1 -w BYOK-SecurityWorld-pkg-NA-1
        ```

    -   For Europe:

        ```
        python verifykeypackage.py -k BYOK-KEK-pkg-EU-1 -w BYOK-SecurityWorld-pkg-EU-1
        ```

    -   For Asia:

        ```
        python verifykeypackage.py -k BYOK-KEK-pkg-AP-1 -w BYOK-SecurityWorld-pkg-AP-1
        ```

    > [!TIP]
    > The Thales software includes a Python interpreter at %NFAST_HOME%\python\bin

2.  Confirm that you see the following, which indicates successful validation: **Result:  SUCCESS**

This script validates the signer chain up to the Thales root key. The hash of this root key is embedded in the script and its value should be **59178a47 de508c3f 291277ee 184f46c4 f1d9c639**. You can also confirm this value separately by visiting the [Thales website](http://www.thalesesec.com/).

You’re now ready to create a new key that will be your RMS tenant key.

##### Step 3: Create a new key
Generate a CNG key by using the Thales **generatekey** and **cngimport** programs.

Run the following command to generate the key:

```
generatekey --generate simple type=RSA size=2048 protect=module ident=contosokey plainname=contosokey nvram=no pubexp=
```
When you run this command, use these instructions:

-   The parameter **protect** must be set to the value **module**, as shown. This creates a module-protected key. The BYOK toolset does not support OCS-protected keys.

-   For the key size, we recommend 2048 but also support 1024-bit RSA keys for existing AD RMS customers who have such keys and are migrating to Azure RMS.

-   Replace the value of *contosokey* for the **ident** and **plainname** with any string value. To minimize administrative overheads and reduce the risk of errors, we recommend that you use the same value for both, and use all lower case characters.

-   The pubexp is left blank (default) in this example, but you can specify specific values. For more information, see the Thales documentation.

Then run the following command to import the key to CNG:

```
cngimport --import -M --key=contosokey --appname=simple contosokey
```
When you run this command, use these instructions:

-   Replace *contosokey* with the same value that you specified in [Step 1: Create a security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetGenerate1) from the *Generate your tenant key* section.

-   Use the **-M** option so that the key is suitable for this scenario. Without this, the resultant key will be a user-specific key for the current user.

-   The **appname** option is the App Name reported in the key file. If you used these instructions to create a new key, we used the value of simple as shown in the command. However, if you are migrating an existing HSM-protected key for an AD RMS migration to Azure RMS, specify your existing name in this command and the commands that follow when they also use the appname option.

This command creates a Tokenized Key file in your %NFAST_KMDATA%\local folder with a name starting with **key_caping_** followed by a SID. For example: **key_caping_machine--801c1a878c925fd9df4d62ba001b94701c039e2fb**. This file contains an encrypted key.

> [!TIP]
> You can see the current configuration status of your keys by using the `nkminfo –k` command.

Back up this Tokenized Key File in a safe location.

> [!IMPORTANT]
> When you later transfer your key to Azure RMS, Microsoft cannot export this key back to you so it becomes extremely important that you back up your key and security world safely. Contact Thales for guidance and best practices for backing up your key.

You are now ready to transfer your tenant key to Azure RMS.

#### </a>Prepare your tenant key for transfer
On the disconnected workstation, following these 4 steps to prepare your own tenant key:

-   [Step 1: Create a copy of your key with reduced permissions](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetPrepareTransfer1)

-   [Step 2: Inspect the new copy of the key](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetPrepareTransfer2)

-   [Step 3: Encrypt your key by using Microsoft’s Key Exchange Key](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetPrepareTransfer3)

-   [Step 4: Copy your key transfer package to the Internet-connected workstation](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetPrepareTransfer4)

##### Step 1: Create a copy of your key with reduced permissions
To reduce the permissions on your tenant key, do the following:

-   From a command prompt, run one of the following, depending on your region:

    -   For North America:

        ```
        KeyTransferRemote.exe -ModifyAcls -KeyAppName simple -KeyIdentifier contosokey -ExchangeKeyPackage BYOK-KEK-pkg-NA-1 -NewSecurityWorldPackage BYOK-SecurityWorld-pkg-NA-1
        ```

    -   For Europe:

        ```
        KeyTransferRemote.exe -ModifyAcls -KeyAppName simple -KeyIdentifier contosokey -ExchangeKeyPackage BYOK-KEK-pkg-EU-1 -NewSecurityWorldPackage BYOK-SecurityWorld-pkg-EU-1
        ```

    -   For Asia:

        ```
        KeyTransferRemote.exe -ModifyAcls -KeyAppName simple -KeyIdentifier contosokey -ExchangeKeyPackage BYOK-KEK-pkg-AP-1 -NewSecurityWorldPackage BYOK-SecurityWorld-pkg-AP-1
        ```

When you run this command, replace *contosokey* with the same value you specified in [Step 1: Create a security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetGenerate1) from the *Generate your tenant key* section.

You will be asked to plug in your security world ACS cards, and if specified, their password or PIN..

When the command completes, you will see **Result: SUCCESS** and the copy of your tenant key with reduced permissions will be in the file named key_xferacId_*&lt;contosokey&gt;*.

##### Step 2: Inspect the new copy of the key
Optionally, run the Thales utilities to confirm the minimal permissions on the new tenant key:

-   aclprint.py:

    ```
    "%nfast_home%\bin\preload.exe" -m 1 -A xferacld -K contosokey "%nfast_home%\python\bin\python" "%nfast_home%\python\examples\aclprint.py"
    ```

-   kmfile-dump.exe:

    ```
    "%nfast_home%\bin\kmfile-dump.exe" "%NFAST_KMDATA%\local\key_xferacld_contosokey"
    ```

When you run these command, replace *contosokey* with the same value you specified in [Step 1: Create a security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetGenerate1) from the *Generate your tenant key* section.

##### Step 3: Encrypt your key by using Microsoft’s Key Exchange Key
Run one of the following commands, depending on your region:

-   For North America:

    ```
    KeyTransferRemote.exe -Package -KeyIdentifier contosokey -ExchangeKeyPackage BYOK-KEK-pkg-NA-1 -NewSecurityWorldPackage BYOK-SecurityWorld-pkg-NA-1 -TenantBposId GUID -KeyFriendlyName ContosoFirstkey
    ```

-   For Europe:

    ```
    KeyTransferRemote.exe -Package -KeyIdentifier contosokey -ExchangeKeyPackage BYOK-KEK-pkg-EU-1 -NewSecurityWorldPackage BYOK-SecurityWorld-pkg-EU-1 -TenantBposId GUID -KeyFriendlyName ContosoFirstkey
    ```

-   For Asia:

    ```
    KeyTransferRemote.exe -Package -KeyIdentifier contosokey -ExchangeKeyPackage BYOK-KEK-pkg-AP-1 -NewSecurityWorldPackage BYOK-SecurityWorld-pkg-AP-1 -TenantBposId GUID -KeyFriendlyName ContosoFirstkey
    ```

When you run this command, use these instructions:

-   Replace *contosokey* with the identifier that you used to generate the key in [Step 1: Create a security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetGenerate1) from the *Generate your tenant key* section.

-   Replace *GUID* with your Azure Active Directory tenant ID that you retrieved in [Step 2: Get your Azure Active Directory tenant ID](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_PrepareInternetConnectedWorkstation2) from the *Prepare your Internet-connected workstation* section.

-   Replace *ContosoFirstKey* with a label that will be used for your output file name.

When this completes successfully it displays **Result: SUCCESS** and there will be a new file in the current folder that has the following name: TransferPackage-*ContosoFirstkey*.byok

##### Step 4: Copy your key transfer package to the Internet-connected workstation
Use a USB drive or other portable storage to copy the output file from the previous step (KeyTransferPackage-*ContosoFirstkey*.byok) to your Internet-connected workstation.

> [!NOTE]
> Use security practices to protect the file because it includes your private key.

#### Transfer your tenant key to Azure RMS
On the Internet-connected workstation,  follow these 3 steps To transfer your new tenant key to Azure RMS, :

-   [Step 1: Connect to Azure RMS](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetTransfer1)

-   [Step 2: Upload the key package](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetTransfer2)

-   [Step 3: Enumerate your tenant keys – as needed](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_InternetTransfer3)

##### Step 1: Connect to Azure RMS
Return to the Windows PowerShell window and type the following:

1.  Reconnect to the [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] service:

    ```
    Connect-AadrmService
    ```

2.  Use the [Get-AadrmKeys](http://msdn.microsoft.com/library/windowsazure/dn629420.aspx) cmdlet to see your current tenant key configuration:

    ```
    Get-AadrmKeys
    ```

##### Step 2: Upload the key package
Use the [Add-AadrmKey](http://msdn.microsoft.com/library/windowsazure/dn629418.aspx) cmdlet to upload the key transfer package that you copied from the disconnected workstation:

```
Add-AadrmKey –KeyFile <PathToPackageFile> -Verbose
```
> [!WARNING]
> You are prompted to confirm this action. It’s important to understand that this action cannot be undone. When you upload a tenant key, it automatically becomes your organization’s primary tenant key and users will start to use this tenant key when they protect documents and files.

If the upload is successful, you will see the following message: **The Rights management service successfully added the key.**

Expect a replication delay for the change to propagate to all [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] data centers.

##### Step 3: Enumerate your tenant keys – as needed
Use the Get-AadrmKeys cmdlet again to see the change in your tenant key, and whenever you want to see a list of your tenant keys. The tenant keys displayed include the initial tenant key that Microsoft generated for you, and any tenant keys that you added:

```
Get-AadrmKeys
```
The tenant key that is marked **Active** is the one that your organization is currently using to protect documents and files.

You have now completed all the steps required for bring your own key over the Internet and can go to [Next steps](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_NextSteps).

### Generate and transfer your tenant key – in person
Use the following procedures if you do not want to transfer your tenant key over the Internet, but instead, transfer your tenant key in person.

-   [Generate your tenant key](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_GenerateKey)

-   [Transfer your tenant key to Azure RMS](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_Transfer)

#### Generate your tenant key
To generate your own tenant key, follow these 3 steps:

-   [Step 1: Prepare a workstation with Thales HSM](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_GenerateYourKey1)

-   [Step 2: Create a security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_GenerateYourKey2)

-   [Step 3: Create a new key](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_GenerateYourKey3)

##### Step 1: Prepare a workstation with Thales HSM
Install the nCipher (Thales) support software on a Windows computer. Attach a Thales HSM to that computer. Ensure the Thales tools are in your path. For more information, see the user guide included with the Thales HSM, or visit the Thales website for Azure RMS at [http://www.thales-esecurity.com/msrms/cloud](http://www.thales-esecurity.com/msrms/cloud).

##### Step 2: Create a security world
Start a command prompt and run the Thales new-world program.

```
new-world.exe --initialize --cipher-suite=DLf1024s160mRijndael --module=1 --acs-quorum=2/3
```
This program creates a **Security World** file at %NFAST_KMDATA%\local\world, which corresponds to the C:\ProgramData\nCipher\Key Management Data\local folder. You can use different values for the quorum but in our example, you’re prompted to enter three blank cards and pins for each one. Then, any two cards will give full access to the security world.  These cards become the **Administrator Card Set** for the new security world.

Then do the following:

1.  Install the Thales CNG provider as described in the Thales documentation, and configure it to use the new security world.

2.  Back up the world file. Secure and protect the world file, the Administrator Cards, and their pins, and make sure that no single person has access to more than one card.

You’re now ready to create a new key that will be your RMS tenant key.

##### Step 3: Create a new key
Generate a CNG key by using the Thales **generatekey** and **cngimport** programs.

Run the following command to generate the key:

```
generatekey --generate simple type=RSA size=2048 protect=module ident=contosokey plainname=contosokey nvram=no pubexp=
```
When you run this command, use these instructions:

-   The parameter **protect** must be set to the value **module**, as shown. This creates a module-protected key. The BYOK toolset does not support OCS-protected keys.

-   For the key size, we recommend 2048 but also support 1024-bit RSA keys for existing AD RMS customers who have such keys and are migrating to Azure RMS.

-   Replace the value of *contosokey* for the **ident** and **plainname** with any string value. To minimize administrative overheads and reduce the risk of errors, we recommend that you use the same value for both, and use all lower case characters.

-   The pubexp is left blank (default) in this example, but you can specify specific values. For more information, see the Thales documentation.

Then run the following command to import the key to CNG:

```
cngimport --import –M --key=contosokey --appname=simple contosokey
```
When you run this command, use these instructions:

-   Replace *contosokey* with the same value that you specified in Step 1.

-   Use the **-M** option so that the key is suitable for this scenario. Without this, the resultant key will be a user-specific key for the current user.

This command creates a Tokenized Key file in your %NFAST_KMDATA%\local folder with a name starting with **key_caping_** followed by a SID. For example: **key_caping_machine--801c1a878c925fd9df4d62ba001b94701c039e2fb**. This file contains an encrypted key.

Back up this Tokenized Key File in a safe location.

> [!IMPORTANT]
> When you later transfer your key to Azure RMS, Microsoft will have a non-recoverable copy of your key. This means that nobody can retrieve your key from the HSMs at Microsoft. This allows you to retain exclusive control over your tenant key. Therefore it becomes extremely important that you back up your key and security world safely. Contact Thales for guidance and best practices for backing up your key.

You are now ready to transfer your tenant key to Azure RMS.

#### Transfer your tenant key to Azure RMS
After you have generated your own key, you must transfer it to Azure RMS before you use it. For the highest level of security, this transfer is a manual process that requires you to fly to the Microsoft office in Redmond, Washington, United States of America. To complete this process, follow these 3 steps:

-   [Step 1: Bring your key to Microsoft](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_TransferYourKey1)

-   [Step 2: Transfer your key to the Window Azure RMS security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_TransferYourKey2)

-   [Step 3: Closing procedures](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_TransferYourKey3)

###### Step 1: Bring your key to Microsoft

-   Contact Microsoft Customer Support Services (CSS) to schedule a key transfer appointment for Azure RMS. Bring the following to Microsoft in Redmond:

    -   A quorum of your Administrative Cards. If you followed the previous instructions in [Step 2: Create a security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_GenerateYourKey2), these are any two of your three cards.

    -   Personnel authorized to carry your Administrative Cards and pins, typically two (one for each card).

    -   Your Security World file (%NFAST_KMDATA%\local\world) on a USB drive.

    -   Your Tokenized Key File on a USB drive.

###### Step 2: Transfer your key to the Window Azure RMS security world

1.  When you arrive at Microsoft to transfer your key, the following happens:

    -   Microsoft provides you with an offline workstation that has a Thales HSM attached, Thales software installed, and a Azure RMS Security World file pre-loaded into the folder C:\Temp\Destination.

    -   On this workstation, you load your Security World file and Tokenized Key File from your USB drive into the C:\Temp\Source folder.

    -   Azure RMS operators securely transfer your key to the Azure RMS security world by using Thales utilities.

    This process will look similar to the following, where the last parameter of key-xfer-im in this example is replaced by your Tokenized Key File name:

    **C:\&gt; mk-reprogram.exe --owner c:\Temp\Destination add c:\Temp\Source**

    **C:\&gt; key-xfer-im.exe c:\Temp\Source c:\Temp\Destination --module c:\Temp\Source\key_caping_machine--801c1a878c925fd9df4d62ba001b94701c039e2fb**

2.  Mk-reprogram will ask you and the Azure RMS operators to plug in their respective Administrator cards and pins. These commands output a Tokenized Key File in C:\Temp\Destination that contains your key protected by Azure RMS security world.

###### Step 3: Closing procedures

-   In your presence, Azure RMS operators do the following:

    -   Run a tool that Microsoft developed in collaboration with Thales that removes two permissions: The permission to recover the key, and the permission to change permissions. After this is done, this copy of your key is locked to the Azure RMS security world. Thales HSMs will not allow Azure RMs operators with their Administrator cards to recover the plaintext copy of your key.

    -   Copy the resulting key file to a USB drive to later upload to the Azure RMS service.

    -   Factory-reset the HSM, and wipe the workstation clean.

You have now completed all the steps required for bring your own key in person and can return to your organization for the next steps.

## Next steps

See the [Next steps](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_NextSteps) section from the **Planning and implementing your Azure Rights Management tenant key** article.

