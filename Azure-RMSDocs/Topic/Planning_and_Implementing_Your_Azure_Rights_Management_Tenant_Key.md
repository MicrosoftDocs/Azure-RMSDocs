---
title: Planning and Implementing Your Azure Rights Management Tenant Key
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: f0d33c5f-a6a6-44a1-bdec-5be1bc8e1e14
author: Cabailey
---
# Planning and Implementing Your Azure Rights Management Tenant Key
Use the information in this topic to help you plan for and manage your Rights Management service (RMS) tenant key for Azure RMS. For example, instead of Microsoft managing your tenant key (the default), you might want to manage your own tenant key to comply with specific regulations that apply to your organization.  Managing your own tenant key is also referred to as bring your own key, or BYOK.

> [!NOTE]
> The RMS tenant key is also known as the Server Licensor Certificate (SLC) key. Azure RMS maintains one or more keys for each organization that subscribes to Azure RMS. Whenever a key is used for RMS within an organization (such as user keys, computer keys, document encryption keys), they cryptographically chain to your RMS tenant key.

**At a glance:** Use the following table as a quick guide to your recommended tenant key topology. Then, use the additional sections for more information.

If you deploy Azure RMS by using a tenant key that is managed by Microsoft, you can change to BYOK later. However, you cannot currently change your Azure RMS tenant key from BYOK to managed by Microsoft.

|Business requirement|Recommended tenant key topology|
|------------------------|-----------------------------------|
|Deploy Azure RMS quickly and without requiring special hardware|Managed by Microsoft|
|Need full IRM functionality in Exchange Online with Azure RMS|Managed by Microsoft|
|Your keys are created by you and protected in a hardware security module (HSM)|BYOK<br /><br />Currently, this configuration will result in reduced IRM functionality in Exchange Online. For more information, see the [BYOK pricing and restrictions](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_Pricing) section.|
Use the following sections to help you choose which tenant key topology to use, understand the tenant key lifecycle, how to implement bring your own key (BYOK), and what steps to take next:

-   [Choose your tenant key topology: Managed by Microsoft (the default) or managed by you (BYOK)](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_ChooseTenantKey)

-   [BYOK pricing and restrictions](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_Pricing)

-   [Implementing bring your own key (BYOK)](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_ImplementBYOK)

-   [Next steps](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_NextSteps)

## <a name="BKMK_ChooseTenantKey"></a>Choose your tenant key topology: Managed by Microsoft (the default) or managed by you (BYOK)
Decide which tenant key topology is best for your organization. By default, Azure RMS generates your tenant key and manages most aspects of the tenant key lifecycle. This is the simplest option with the lowest administrative overheads. In most cases, you do not even need to know that you have a tenant key. You just sign up for Azure RMS and the rest of the key management process is handled by Microsoft.

Alternatively, you might want complete control over your tenant key, which involves creating your tenant key and keeping the master copy on your premises. This scenario is often referred to as bring your own key (BYOK). With this option, the following happens:

1.  You generate your tenant key on your premises, in line with your IT policies.

2.  You securely transfer the tenant key from a Hardware Security Module (HSM) in your possession to HSMs that are owned and managed by Microsoft. Throughout this process, your tenant key never leaves the hardware protection boundary.

3.  When you transfer your tenant key to Microsoft, it stays protected by Thales HSMs. Microsoft has worked with Thales to ensure that your tenant key cannot be extracted from Microsoft’s HSMs.

Although it’s optional, you will also probably want to use the near real-time usage logs from Azure RMS to see exactly how and when your tenant key is being used.

> [!NOTE]
> As an additional protection measure, Azure RMS uses separate security worlds for its data centers in North America, EMEA (Europe, Middle East and Africa), and Asia. When you manage your own tenant key, it is tied to the security world of the region in which your RMS tenant is registered. For example, a tenant key from a European customer cannot be used in data centers in North America or Asia.

## <a name="BKMK_OverviewLifecycle"></a>The tenant key lifecycle
If you decide that Microsoft should manage your tenant key, Microsoft handles most of the key lifecycle operations. However, if you decide to manage your tenant key, you are responsible for many of the key lifecycle operations and some additional procedures.

The following diagrams show and compares these two options. The first diagram shows how little administrator overheads there are for you in the default configuration when Microsoft manages the tenant key.

![](../Image/RMS_BYOK_cloud.png)

The second diagram shows the additional steps required when you manage your own tenant key.

![](../Image/RMS_BYOK_onprem.png)

If you decide to let Microsoft manage your tenant key, no further action is required for you to generate the key and you can skip the following sections and go straight to [Next steps](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_NextSteps).

If you decide to manage your tenant key yourself, read the following sections for more information.

### More information about Thales HSMs and Microsoft additions
Azure RMS uses Thales HSMs to protect your keys.

Thales e-Security is a leading global provider of data encryption and cyber security solutions to the financial services, high technology, manufacturing, government, and technology sectors. With a 40-year track record of protecting corporate and government information, Thales solutions are used by four of the five largest energy and aerospace companies, 22 NATO countries, and secure more than 80 per cent of worldwide payment transactions.

Microsoft has collaborated with Thales to enhance the state of art for HSMs. These enhancements enable you to get the typical benefits of hosted services without relinquishing control over your keys. Specifically, these enhancements let Microsoft manage the HSMs so that you do not have to. As a cloud service, Azure RMS scales up at short notice to meet your organization’s usage spikes. At the same time, your key is protected inside Microsoft’s HSMs: You retain control over the key lifecycle because you generate the key and transfer it to Microsoft’s HSMs.

For more information, see [Thales HSMs and Azure RMS](http://www.thales-esecurity.com/msrms/cloud) on the Thales web site.

## <a name="BKMK_Pricing"></a>BYOK pricing and restrictions
Organization that have an IT-managed Azure subscription can use BYOK and log its usage at no extra charge. Organizations that use RMS for individuals cannot use BYOK and logging because they do not have a tenant administrator to configure these features.

> [!NOTE]
> For more information about RMS for individuals, see [RMS for Individuals and Azure Rights Management](../Topic/RMS_for_Individuals_and_Azure_Rights_Management.md).

![](../Image/RMS_BYOK_noExchange.png)

BYOK and logging work seamlessly with every application that integrates with Azure RMS. This includes cloud services such as SharePoint Online, on-premises servers that run Exchange and SharePoint that work with Azure RMS by using the RMS connector, and client applications such as Office 2013. You will get key usage logs regardless of which application makes requests of Azure RMS.

There is one exception: Currently, **Azure RMS BYOK is not compatible with Exchange Online**.  If you want to use Exchange Online, we recommend that you deploy Azure RMS in the default key management mode now, where Microsoft generates and manages your key. You have the option to move to BYOK later, for example, when Exchange Online does support Azure RMS BYOK. However, if you cannot wait, another option is to deploy Azure RMS with BYOK now, with reduced RMS functionality for Exchange Online (unprotected emails and unprotected attachments remain fully functional):

-   Protected emails or protected attachments in Outlook Web Access cannot be displayed.

-   Protected emails on mobile devices that use Exchange ActiveSync IRM cannot be displayed.

-   Transport decryption (for example, to scan for malware) and journal  decryption is not possible, so protected emails and protected attachments will be skipped.

-   Transport protection rules and data loss prevention (DLP) that enforce IRM policies is not possible, so RMS protection cannot be applied by using these methods.

-   Server-based search for protected emails, so protected emails will be skipped.

When you use Azure RMS BYOK with reduced RMS functionality for Exchange Online, RMS will work with email clients in Outlook on Windows and Mac, and on other email clients that don't use Exchange ActiveSync IRM.

If you are migrating to Azure RMS from AD RMS, you might have imported your key as a trusted publishing domain (TPD) to Exchange Online (also called BYOK in Exchange terminology, which is separate from Azure RMS BYOK). In this scenario, you must remove the TPD from Exchange Online to avoid conflicting templates and policies. For more information, see [Remove-RMSTrustedPublishingDomain](https://technet.microsoft.com/library/jj200720%28v=exchg.150%29.aspx) from the Exchange Online cmdlets library.

Sometimes, the Azure RMS BYOK  exception for Exchange Online is not a problem in practice. For example, organizations that need BYOK and logging run their data applications (Exchange, SharePoint, Office) on-premises, and use Azure RMS for functionality that is not easily available with on-premises AD RMS (for example, collaboration with other companies and access from mobile clients). Both BYOK and logging work well in this scenario and allow the organization to have full control over their Azure RMS subscription.

## <a name="BKMK_ImplementBYOK"></a>Implementing bring your own key (BYOK)
Use the information and procedures in this section if you have decided to generate and manage your tenant key; the bring your own key (BYOK) scenario:

-   [Prerequisites for BYOK](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_Preqs)

-   [Generate and transfer your tenant key – over the Internet](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_BYOK_Internet)

-   [Generate and transfer your tenant key – in person](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_BYOK_InPerson)

> [!IMPORTANT]
> If you have already started to use [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] (the service is activated) and you have users who run Office 2010, contact Microsoft Customer Support Services (CSS) before you run these procedures. Depending on your scenario and requirements, you can still use BYOK but with some limitations or additional steps.
> 
> Also contact CSS if your organization has specific policies for handling keys.

### <a name="BKMK_Preqs"></a>Prerequisites for BYOK
See the following table for a list of prerequisites for bring your own key (BYOK).

|Requirement|More information|
|---------------|--------------------|
|A subscription that supports Azure RMS.|For more information about the available subscriptions, see the [Cloud subscriptions that support Azure RMS](../Topic/Requirements_for_Azure_Rights_Management.md#BKMK_SupportedSubscriptions) section in the [Requirements for Azure Rights Management](../Topic/Requirements_for_Azure_Rights_Management.md) topic.|
|You do not use RMS for individuals or Exchange Online. Or, if you use Exchange Online, you understand and accept the limitations of using BYOK with this configuration.|For more information about the restrictions and current limitations for BYOK, see the [BYOK pricing and restrictions](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_Pricing) section in this topic.<br /><br />**Important**: Currently, BYOK is not compatible with Exchange Online.|
|Thales HSM, smartcards, and support software.<br /><br />**Note**: If you are migrating from AD RMS to Azure RMS by using software key to hardware key, you must have a minimum version of 11.62 for the Thales drivers.|You must have access to a Thales Hardware Security Module and basic operational knowledge of Thales HSMs. See [Thales Hardware Security Module](http://www.thales-esecurity.com/msrms/buy) for the list of compatible models, or to purchase an HSM if you do not have one.|
|If you want to transfer your tenant key over the Internet rather than physically be present in Redmond, USA. there are 3 requirements:<br /><br />Requirement 1: An offline x64 workstation with a minimum Windows operation system of Windows 7 and Thales nShield software that is at least version 11.62.<br /><br />If this workstation runs Windows 7, you must [install Microsoft .NET Framework 4.5](http://go.microsoft.com/fwlink/?LinkId=225702).<br /><br />Requirement 2: A workstation that is connected to the Internet and has a minimum Windows operation system of Windows 7.<br /><br />Requirement 2: A USB drive or other portable storage device that has at least 16 MB free space.|These prerequisites are not required if you travel to Redmond and transfer your tenant key in person.<br /><br />For security reasons, we recommend that the first workstation is not connected to a network. However, this is not programmatically enforced.<br /><br />Note: In the instructions that follow, this first workstation is referred to as the **disconnected workstation**.<br /><br />In addition, if your tenant key is for a production network, we recommend that you use a second, separate workstation to download the toolset and upload the tenant key. But for testing purposes, you can use the same workstation as the first one.<br /><br />Note: In the instructions that follow, this second workstation is referred to as the **Internet-connected workstation**.|
|Optional: Azure subscription.|If you want to log your tenant key usage (and Rights Management usage), you must have a subscription to Azure and sufficient storage on Azure to store your logs.|
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

### <a name="BKMK_BYOK_Internet"></a>Generate and transfer your tenant key – over the Internet
Use the following procedures if you want to transfer your tenant key over the Internet rather than travel to a Microsoft facility to transfer the tenant key in person:

-   [Prepare your Internet-connected workstation](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetPrepareWorkstation)

-   [Prepare your disconnected workstation](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_DisconnectedPrepareWorkstation)

-   [Generate your tenant key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetGenerate)

-   [Prepare your tenant key for transfer](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetPrepareTransfer)

-   [Transfer your tenant key to Azure RMS](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetTransfer)

#### <a name="BKMK_InternetPrepareWorkstation"></a>Prepare your Internet-connected workstation
To prepare your workstation that is connected to the Internet, follow these 3 steps:

-   [Step 1: Install Windows PowerShell for Azure Rights Management](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_PrepareInternetConnectedWorkstation1)

-   [Step 2: Get your Azure Active Directory tenant ID](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_PrepareInternetConnectedWorkstation2)

-   [Step 3: Download the BYOK toolset](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_PrepareInternetConnectedWorkstation3)

##### <a name="BKMK_PrepareInternetConnectedWorkstation1"></a>Step 1: Install Windows PowerShell for Azure Rights Management
From the Internet-connected workstation, download and install the Windows PowerShell module for Azure Rights Management.

> [!NOTE]
> If you have previously downloaded this Windows PowerShell module, run the following command to check that your version number is at least 2.1.0.0: `(Get-Module aadrm -ListAvailable).Version`

For installation instructions, see [Installing Windows PowerShell for Azure Rights Management](../Topic/Installing_Windows_PowerShell_for_Azure_Rights_Management.md).

##### <a name="BKMK_PrepareInternetConnectedWorkstation2"></a>Step 2: Get your Azure Active Directory tenant ID
Start Windows PowerShell with the **Run as administrator** option, and then run the following commands:

-   Use the [Connect-AadrmService](http://msdn.microsoft.com/library/windowsazure/dn629415.aspx) cmdlet to connect to the Azure RMS service:

    ```
    Connect-AadrmService
    ```
    When prompted, enter your [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] tenant administrator credentials (typically, you will use an account that is a global administrator for Azure Active Directory or Office 365).

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

##### <a name="BKMK_PrepareInternetConnectedWorkstation3"></a>Step 3: Download the BYOK toolset
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

#### <a name="BKMK_DisconnectedPrepareWorkstation"></a>Prepare your disconnected workstation
To prepare your workstation that is not connected to a network (either the Internet or your internal network), follow these 2 steps:

-   [Step 1: Prepare the disconnected workstation with Thales HSM](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_PrepareDisconnectedWorkstation1)

-   [Step 2: Install the BYOK toolset on the disconnected workstation](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_PrepareDisconnectedWorkstation2)

##### <a name="BKMK_PrepareDisconnectedWorkstation1"></a>Step 1: Prepare the disconnected workstation with Thales HSM
On the disconnected workstation, install the nCipher (Thales) support software on a Windows computer, and then attach a Thales HSM to that computer.

Ensure that the Thales tools are in your path **(%nfast_home%\bin** and **%nfast_home%\python\bin**). For example, type the following:

```
set PATH=%PATH%;”%nfast_home%\bin”;”%nfast_home%\python\bin”
```
For more information, see the user guide included with the Thales HSM, or visit the Thales website for Azure RMS at [http://www.thales-esecurity.com/msrms/cloud](http://www.thales-esecurity.com/msrms/cloud).

##### <a name="BKMK_PrepareDisconnectedWorkstation2"></a>Step 2: Install the BYOK toolset on the disconnected workstation
Copy the BYOK toolset package from the USB drive or other portable storage, and then do the following:

1.  Extract the files from the downloaded package into any folder.

2.  From that folder, run vcredist_x64.exe.

3.  Follow the instructions to the install the Visual C++ runtime components for Visual Studio 2012.

#### <a name="BKMK_InternetGenerate"></a>Generate your tenant key
On the disconnected workstation, following these 3 steps to generate your own tenant key:

-   [Step 1: Create a security world](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetGenerate1)

-   [Step 2: Validate the downloaded package](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetGenerate2)

-   [Step 3: Create a new key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetGenerate3)

##### <a name="BKMK_InternetGenerate1"></a>Step 1: Create a security world
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

##### <a name="BKMK_InternetGenerate2"></a>Step 2: Validate the downloaded package
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

##### <a name="BKMK_InternetGenerate3"></a>Step 3: Create a new key
Generate a CNG key by using the Thales **generatekey** and **cngimport** programs.

Run the following command to generate the key:

```
generatekey --generate simple type=RSA size=2048 protect=module ident=contosokey plainname=contosokey nvram=no pubexp=
```
When you run this command, use these instructions:

-   For the key size, we recommend 2048 but also support 1024-bit RSA keys for existing AD RMS customers who have such keys and are migrating to Azure RMS.

-   Replace the value of *contosokey* for the **ident** and **plainname** with any string value. To minimize administrative overheads and reduce the risk of errors, we recommend that you use the same value for both, and use all lower case characters.

-   The pubexp is left blank (default) in this example, but you can specify specific values. For more information, see the Thales documentation.

Then run the following command to import the key to CNG:

```
cngimport --import -M --key=contosokey --appname=simple contosokey
```
When you run this command, use these instructions:

-   Replace *contosokey* with the same value that you specified in [Step 1: Create a security world](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetGenerate1) from the *Generate your tenant key* section.

-   Use the **-M** option so that the key is suitable for this scenario. Without this, the resultant key will be a user-specific key for the current user.

This command creates a Tokenized Key file in your %NFAST_KMDATA%\local folder with a name starting with **key_caping_** followed by a SID. For example: **key_caping_machine--801c1a878c925fd9df4d62ba001b94701c039e2fb**. This file contains an encrypted key.

> [!TIP]
> You can see the current configuration status of your keys by using the `nkminfo –k` command.

Back up this Tokenized Key File in a safe location.

> [!IMPORTANT]
> When you later transfer your key to Azure RMS, Microsoft cannot export this key back to you so it becomes extremely important that you back up your key and security world safely. Contact Thales for guidance and best practices for backing up your key.

You are now ready to transfer your tenant key to Azure RMS.

#### <a name="BKMK_InternetPrepareTransfer"></a>Prepare your tenant key for transfer
On the disconnected workstation, following these 4 steps to prepare your own tenant key:

-   [Step 1: Create a copy of your key with reduced permissions](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetPrepareTransfer1)

-   [Step 2: Inspect the new copy of the key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetPrepareTransfer2)

-   [Step 3: Encrypt your key by using Microsoft’s Key Exchange Key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetPrepareTransfer3)

-   [Step 4: Copy your key transfer package to the Internet-connected workstation](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetPrepareTransfer4)

##### <a name="BKMK_InternetPrepareTransfer1"></a>Step 1: Create a copy of your key with reduced permissions
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

When you run this command, replace *contosokey* with the same value you specified in [Step 1: Create a security world](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetGenerate1) from the *Generate your tenant key* section.

You will be asked to plug in your security world ACS cards, and if specified, their password or PIN..

When the command completes, you will see **Result: SUCCESS** and the copy of your tenant key with reduced permissions will be in the file named key_xferacId_*&lt;contosokey&gt;*.

##### <a name="BKMK_InternetPrepareTransfer2"></a>Step 2: Inspect the new copy of the key
Optionally, run the Thales utilities to confirm the minimal permissions on the new tenant key:

-   aclprint.py:

    ```
    "%nfast_home%\bin\preload.exe" -m 1 -A xferacld -K contosokey "%nfast_home%\python\bin\python" "%nfast_home%\python\examples\aclprint.py"
    ```

-   kmfile-dump.exe:

    ```
    "%nfast_home%\bin\kmfile-dump.exe" "%NFAST_KMDATA%\local\key_xferacld_contosokey"
    ```

When you run these command, replace *contosokey* with the same value you specified in [Step 1: Create a security world](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetGenerate1) from the *Generate your tenant key* section.

##### <a name="BKMK_InternetPrepareTransfer3"></a>Step 3: Encrypt your key by using Microsoft’s Key Exchange Key
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

-   Replace *contosokey* with the identifier that you used to generate the key in [Step 1: Create a security world](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetGenerate1) from the *Generate your tenant key* section.

-   Replace *GUID* with your Azure Active Directory tenant ID that you retrieved in [Step 2: Get your Azure Active Directory tenant ID](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_PrepareInternetConnectedWorkstation2) from the *Prepare your Internet-connected workstation* section.

-   Replace *ContosoFirstKey* with a label that will be used for your output file name.

When this completes successfully it displays **Result: SUCCESS** and there will be a new file in the current folder that has the following name: TransferPackage-*ContosoFirstkey*.byok

##### <a name="BKMK_InternetPrepareTransfer4"></a>Step 4: Copy your key transfer package to the Internet-connected workstation
Use a USB drive or other portable storage to copy the output file from the previous step (KeyTransferPackage-*ContosoFirstkey*.byok) to your Internet-connected workstation.

> [!NOTE]
> Use security practices to protect the file because it includes your private key.

#### <a name="BKMK_InternetTransfer"></a>Transfer your tenant key to Azure RMS
On the Internet-connected workstation,  follow these 3 steps To transfer your new tenant key to Azure RMS, :

-   [Step 1: Connect to Azure RMS](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetTransfer1)

-   [Step 2: Upload the key package](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetTransfer2)

-   [Step 3: Enumerate your tenant keys – as needed](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_InternetTransfer3)

##### <a name="BKMK_InternetTransfer1"></a>Step 1: Connect to Azure RMS
Return to the Windows PowerShell window and type the following:

1.  Reconnect to the [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] service:

    ```
    Connect-AadrmService
    ```

2.  Use the [Get-AadrmKeys](http://msdn.microsoft.com/library/windowsazure/dn629420.aspx) cmdlet to see your current tenant key configuration:

    ```
    Get-AadrmKeys
    ```

##### <a name="BKMK_InternetTransfer2"></a>Step 2: Upload the key package
Use the [Add-AadrmKey](http://msdn.microsoft.com/library/windowsazure/dn629418.aspx) cmdlet to upload the key transfer package that you copied from the disconnected workstation:

```
Add-AadrmKey –KeyFile <PathToPackageFile> -Verbose
```
> [!WARNING]
> You are prompted to confirm this action. It’s important to understand that this action cannot be undone. When you upload a tenant key, it automatically becomes your organization’s primary tenant key and users will start to use this tenant key when they protect documents and files.

If the upload is successful, you will see the following message: **The Rights management service successfully added the key.**

Expect a replication delay for the change to propagate to all [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] data centers.

##### <a name="BKMK_InternetTransfer3"></a>Step 3: Enumerate your tenant keys – as needed
Use the Get-AadrmKeys cmdlet again to see the change in your tenant key, and whenever you want to see a list of your tenant keys. The tenant keys displayed include the initial tenant key that Microsoft generated for you, and any tenant keys that you added:

```
Get-AadrmKeys
```
The tenant key that is marked **Active** is the one that your organization is currently using to protect documents and files.

You have now completed all the steps required for bring your own key over the Internet and can go to [Next steps](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_NextSteps).

### <a name="BKMK_BYOK_InPerson"></a>Generate and transfer your tenant key – in person
Use the following procedures if you do not want to transfer your tenant key over the Internet, but instead, transfer your tenant key in person.

-   [Generate your tenant key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_GenerateKey)

-   [Transfer your tenant key to Azure RMS](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_Transfer)

#### <a name="BKMK_GenerateKey"></a>Generate your tenant key
To generate your own tenant key, follow these 3 steps:

-   [Step 1: Prepare a workstation with Thales HSM](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_GenerateYourKey1)

-   [Step 2: Create a security world](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_GenerateYourKey2)

-   [Step 3: Create a new key](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_GenerateYourKey3)

##### <a name="BKMK_GenerateYourKey1"></a>Step 1: Prepare a workstation with Thales HSM
Install the nCipher (Thales) support software on a Windows computer. Attach a Thales HSM to that computer. Ensure the Thales tools are in your path. For more information, see the user guide included with the Thales HSM, or visit the Thales website for Azure RMS at [http://www.thales-esecurity.com/msrms/cloud](http://www.thales-esecurity.com/msrms/cloud).

##### <a name="BKMK_GenerateYourKey2"></a>Step 2: Create a security world
Start a command prompt and run the Thales new-world program.

```
new-world.exe --initialize --cipher-suite=DLf1024s160mRijndael --module=1 --acs-quorum=2/3
```
This program creates a **Security World** file at %NFAST_KMDATA%\local\world, which corresponds to the C:\ProgramData\nCipher\Key Management Data\local folder. You can use different values for the quorum but in our example, you’re prompted to enter three blank cards and pins for each one. Then, any two cards will give full access to the security world.  These cards become the **Administrator Card Set** for the new security world.

Then do the following:

1.  Install the Thales CNG provider as described in the Thales documentation, and configure it to use the new security world.

2.  Back up the world file. Secure and protect the world file, the Administrator Cards, and their pins, and make sure that no single person has access to more than one card.

You’re now ready to create a new key that will be your RMS tenant key.

##### <a name="BKMK_GenerateYourKey3"></a>Step 3: Create a new key
Generate a CNG key by using the Thales **generatekey** and **cngimport** programs.

Run the following command to generate the key:

```
generatekey --generate simple type=RSA size=2048 protect=module ident=contosokey plainname=contosokey nvram=no pubexp=
```
When you run this command, use these instructions:

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

#### <a name="BKMK_Transfer"></a>Transfer your tenant key to Azure RMS
After you have generated your own key, you must transfer it to Azure RMS before you use it. For the highest level of security, this transfer is a manual process that requires you to fly to the Microsoft office in Redmond, Washington, United States of America. To complete this process, follow these 3 steps:

-   [Step 1: Bring your key to Microsoft](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_TransferYourKey1)

-   [Step 2: Transfer your key to the Window Azure RMS security world](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_TransferYourKey2)

-   [Step 3: Closing procedures](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_TransferYourKey3)

###### Step 1: Bring your key to Microsoft

-   Contact Microsoft Customer Support Services (CSS) to schedule a key transfer appointment for Azure RMS. Bring the following to Microsoft in Redmond:

    -   A quorum of your Administrative Cards. If you followed the previous instructions in [Step 2: Create a security world](../Topic/Planning_and_Implementing_Your_Azure_Rights_Management_Tenant_Key.md#BKMK_GenerateYourKey2), these are any two of your three cards.

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

## <a name="BKMK_NextSteps"></a>Next steps

1.  Start to use your tenant key:

    -   If you haven’t already done so, you must now activate Rights Management so that your organization can start to use RMS. Users immediately start to use your tenant key (managed by Microsoft or managed by you).

        For more information about activation, see [Activating Azure Rights Management](../Topic/Activating_Azure_Rights_Management.md).

    -   If you had already activated Rights Management and then decided to manage your own tenant key, users gradually transition from the old tenant key to the new tenant key, and this staggered transition can take a few weeks to complete. Documents and files that were protected with the old tenant key remains accessible to authorized users.

2.  Consider enabling usage logging, which logs every transaction that RMS performs.

    If you decided to manage your own tenant key, logging includes information about using your tenant key. See the following example of a log file displayed in Excel where the **Decrypt** and **SignDigest** Request Types show that the tenant key is being used.

    ![](../Image/RMS_Logging.gif)

    For more information about usage logging, see [Logging and Analyzing Azure Rights Management Usage](../Topic/Logging_and_Analyzing_Azure_Rights_Management_Usage.md).

3.  Maintain your tenant key.

    For more information, see [Operations for Your Azure Rights Management Tenant Key](../Topic/Operations_for_Your_Azure_Rights_Management_Tenant_Key.md).

## See Also
[Configuring Azure Rights Management](../Topic/Configuring_Azure_Rights_Management.md)

