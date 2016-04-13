---
# required metadata

title: Generate and transfer your tenant key – over the Internet | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 1bff9b06-8c5a-4b1d-9962-6668219210e6

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Generate and transfer your tenant key – over the Internet
Use the following procedures if you have decided to [manage your own tenant key](planning-and-implementing-your-azure-rights-management-tenant-key.md#choose-your-tenant-key-topology-managed-by-microsoft-the-default-or-managed-by-you-byok-) and want to transfer it over the Internet rather than travel to a Microsoft facility to transfer the tenant key in person:


## Prepare your Internet-connected workstation
To prepare your workstation that is connected to the Internet, follow these 3 steps:

-   [Step 1: Install Windows PowerShell for Azure Rights Management](#step-1-install-windows-powershell-for-azure-rights-management)

-   [Step 2: Get your Azure Active Directory tenant ID](#step-2-get-your-azure-active-directory-tenant-id)

-   [Step 3: Download the BYOK toolset](#step-3-download-the-byok-toolset)

### Step 1: Install Windows PowerShell for Azure Rights Management
From the Internet-connected workstation, download and install the Windows PowerShell module for Azure Rights Management.

> [!NOTE]
> If you have previously downloaded this Windows PowerShell module, run the following command to check that your version number is at least 2.1.0.0: `(Get-Module aadrm -ListAvailable).Version`

For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](../deploy-use/installing-windows-powershell-for-azure-rights-management.md).

### Step 2: Get your Azure Active Directory tenant ID
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

### Step 3: Download the BYOK toolset
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

## Prepare your disconnected workstation
To prepare your workstation that is not connected to a network (either the Internet or your internal network), follow these 2 steps:

-   [Step 1: Prepare the disconnected workstation with Thales HSM](#step-1-prepare-the-disconnected-workstation-with-thales-hsm)

-   [Step 2: Install the BYOK toolset on the disconnected workstation](#step-2-install-the-byok-toolset-on-the-disconnected-workstation)

### Step 1: Prepare the disconnected workstation with Thales HSM
On the disconnected workstation, install the nCipher (Thales) support software on a Windows computer, and then attach a Thales HSM to that computer.

Ensure that the Thales tools are in your path **(%nfast_home%\bin** and **%nfast_home%\python\bin**). For example, type the following:

```
set PATH=%PATH%;”%nfast_home%\bin”;”%nfast_home%\python\bin”
```
For more information, see the user guide included with the Thales HSM, or visit the Thales website for Azure RMS at [http://www.thales-esecurity.com/msrms/cloud](http://www.thales-esecurity.com/msrms/cloud).

### Step 2: Install the BYOK toolset on the disconnected workstation
Copy the BYOK toolset package from the USB drive or other portable storage, and then do the following:

1.  Extract the files from the downloaded package into any folder.

2.  From that folder, run vcredist_x64.exe.

3.  Follow the instructions to the install the Visual C++ runtime components for Visual Studio 2012.

## Generate your tenant key
On the disconnected workstation, following these 3 steps to generate your own tenant key:

-   [Step 1: Create a security world](#step-1-create-a-security-world)

-   [Step 2: Validate the downloaded package](#step-2-validate-the-downloaded-package)

-   [Step 3: Create a new key](#step-3-create-a-new-key)

### Step 1: Create a security world
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

### Step 2: Validate the downloaded package
This step is optional but recommended so that you can validate the following:

-   The Key Exchange Key that is included in the toolset has been generated from a genuine Thales HSM.

-   The hash of the Azure RMS Security World that is included in the toolset has been generated in a genuine Thales HSM.

-   The Key Exchange Key is non-exportable.

> [!NOTE]
> To validate the downloaded package, the HSM must be connected, powered on, and must have a security world on it (such as the one you’ve just created).

#### To validate the downloaded package

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

### Step 3: Create a new key
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

-   Replace *contosokey* with the same value that you specified in [Step 1: Create a security world](#step-1-create-a-security-world) from the *Generate your tenant key* section.

-   Use the **-M** option so that the key is suitable for this scenario. Without this, the resultant key will be a user-specific key for the current user.

-   The **appname** option is the App Name reported in the key file. If you used these instructions to create a new key, we used the value of simple as shown in the command. However, if you are migrating an existing HSM-protected key for an AD RMS migration to Azure RMS, specify your existing name in this command and the commands that follow when they also use the appname option.

This command creates a Tokenized Key file in your %NFAST_KMDATA%\local folder with a name starting with **key_caping`_`** followed by a SID. For example: **key_caping_machine--801c1a878c925fd9df4d62ba001b94701c039e2fb**. This file contains an encrypted key.

> [!TIP]
> You can see the current configuration status of your keys by using the `nkminfo –k` command.

Back up this Tokenized Key File in a safe location.

> [!IMPORTANT]
> When you later transfer your key to Azure RMS, Microsoft cannot export this key back to you so it becomes extremely important that you back up your key and security world safely. Contact Thales for guidance and best practices for backing up your key.

You are now ready to transfer your tenant key to Azure RMS.

## Prepare your tenant key for transfer
On the disconnected workstation, following these 4 steps to prepare your own tenant key:

-   [Step 1: Create a copy of your key with reduced permissions](#step-1-create-a-copy-of-your-key-with-reduced-permissions)

-   [Step 2: Inspect the new copy of the key](#step-2-inspect-the-new-copy-of-the-key)

-   [Step 3: Encrypt your key by using Microsoft’s Key Exchange Key](#step-3-encrypt-your-key-by-using-microsoft-s-key-exchange-key)

-   [Step 4: Copy your key transfer package to the Internet-connected workstation](#step-4-copy-your-key-transfer-package-to-the-internet-connected-workstation)

### Step 1: Create a copy of your key with reduced permissions
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

When you run this command, replace *contosokey* with the same value you specified in [Step 1: Create a security world](##step-1-create-a-security-world) from the *Generate your tenant key* section.

You will be asked to plug in your security world ACS cards, and if specified, their password or PIN..

When the command completes, you will see **Result: SUCCESS** and the copy of your tenant key with reduced permissions will be in the file named key_xferacId_*&lt;contosokey&gt;*.

### Step 2: Inspect the new copy of the key
Optionally, run the Thales utilities to confirm the minimal permissions on the new tenant key:

-   aclprint.py:

    ```
    "%nfast_home%\bin\preload.exe" -m 1 -A xferacld -K contosokey "%nfast_home%\python\bin\python" "%nfast_home%\python\examples\aclprint.py"
    ```

-   kmfile-dump.exe:

    ```
    "%nfast_home%\bin\kmfile-dump.exe" "%NFAST_KMDATA%\local\key_xferacld_contosokey"
    ```

When you run these command, replace *contosokey* with the same value you specified in [Step 1: Create a security world](##step-1-create-a-security-world) from the *Generate your tenant key* section.

### Step 3: Encrypt your key by using Microsoft’s Key Exchange Key
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

-   Replace *contosokey* with the identifier that you used to generate the key in [Step 1: Create a security world](##step-1-create-a-security-world) from the *Generate your tenant key* section.

-   Replace *GUID* with your Azure Active Directory tenant ID that you retrieved in [Step 2: Get your Azure Active Directory tenant ID](#step-2-get-your-azure-active-directory-tenant-id) from the *Prepare your Internet-connected workstation* section.

-   Replace *ContosoFirstKey* with a label that will be used for your output file name.

When this completes successfully it displays **Result: SUCCESS** and there will be a new file in the current folder that has the following name: TransferPackage-*ContosoFirstkey*.byok

### Step 4: Copy your key transfer package to the Internet-connected workstation
Use a USB drive or other portable storage to copy the output file from the previous step (KeyTransferPackage-*ContosoFirstkey*.byok) to your Internet-connected workstation.

> [!NOTE]
> Use security practices to protect the file because it includes your private key.

## Transfer your tenant key to Azure RMS
On the Internet-connected workstation,  follow these 3 steps To transfer your new tenant key to Azure RMS, :

-   [Step 1: Connect to Azure RMS](#step-1-connect-to-azure-rms)

-   [Step 2: Upload the key package](#step-2-upload-the-key-package)

-   [Step 3: Enumerate your tenant keys – as needed](#step-3-enumerate-your-tenant-keys-as-needed)

### Step 1: Connect to Azure RMS
Return to the Windows PowerShell window and type the following:

1.  Reconnect to the [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] service:

    ```
    Connect-AadrmService
    ```

2.  Use the [Get-AadrmKeys](http://msdn.microsoft.com/library/windowsazure/dn629420.aspx) cmdlet to see your current tenant key configuration:

    ```
    Get-AadrmKeys
    ```

### Step 2: Upload the key package
Use the [Add-AadrmKey](http://msdn.microsoft.com/library/windowsazure/dn629418.aspx) cmdlet to upload the key transfer package that you copied from the disconnected workstation:

```
Add-AadrmKey –KeyFile <PathToPackageFile> -Verbose
```
> [!WARNING]
> You are prompted to confirm this action. It’s important to understand that this action cannot be undone. When you upload a tenant key, it automatically becomes your organization’s primary tenant key and users will start to use this tenant key when they protect documents and files.

If the upload is successful, you will see the following message: **The Rights management service successfully added the key.**

Expect a replication delay for the change to propagate to all [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] data centers.

### Step 3: Enumerate your tenant keys – as needed
Use the Get-AadrmKeys cmdlet again to see the change in your tenant key, and whenever you want to see a list of your tenant keys. The tenant keys displayed include the initial tenant key that Microsoft generated for you, and any tenant keys that you added:

```
Get-AadrmKeys
```
The tenant key that is marked **Active** is the one that your organization is currently using to protect documents and files.

You have now completed all the steps required for bring your own key over the Internet and can go to the next steps for planning and implementing your tenant key.


> [!div class="button"]
[Next Steps >>](planning-and-implementing-your-azure-rights-management-tenant-key#next-steps)


