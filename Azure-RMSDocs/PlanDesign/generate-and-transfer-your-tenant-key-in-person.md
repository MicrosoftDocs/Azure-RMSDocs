---
title: Generate and transfer your tenant key – in person
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: TBD
author: Cabailey
---
# Generate and transfer your tenant key – in person

Use the following procedures if you want to manage your own tenant key and do not want to transfer it over the Internet, but instead, transfer your tenant key in person.

> [!div class="button"]
[Back to: Planning and implementing your Azure Rights Management tenant key](planning-and-implementing-your-azure-rights-management-tenant-key.md)

## <a name="BKMK_GenerateKey"></a>Generate your tenant key
To generate your own tenant key, follow these 3 steps:

-   [Step 1: Prepare a workstation with Thales HSM](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_GenerateYourKey1)

-   [Step 2: Create a security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_GenerateYourKey2)

-   [Step 3: Create a new key](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_GenerateYourKey3)

### <a name="BKMK_GenerateYourKey1"></a>Step 1: Prepare a workstation with Thales HSM
Install the nCipher (Thales) support software on a Windows computer. Attach a Thales HSM to that computer. Ensure the Thales tools are in your path. For more information, see the user guide included with the Thales HSM, or visit the Thales website for Azure RMS at [http://www.thales-esecurity.com/msrms/cloud](http://www.thales-esecurity.com/msrms/cloud).

### <a name="BKMK_GenerateYourKey2"></a>Step 2: Create a security world
Start a command prompt and run the Thales new-world program.

```
new-world.exe --initialize --cipher-suite=DLf1024s160mRijndael --module=1 --acs-quorum=2/3
```
This program creates a **Security World** file at %NFAST_KMDATA%\local\world, which corresponds to the C:\ProgramData\nCipher\Key Management Data\local folder. You can use different values for the quorum but in our example, you’re prompted to enter three blank cards and pins for each one. Then, any two cards will give full access to the security world.  These cards become the **Administrator Card Set** for the new security world.

Then do the following:

1.  Install the Thales CNG provider as described in the Thales documentation, and configure it to use the new security world.

2.  Back up the world file. Secure and protect the world file, the Administrator Cards, and their pins, and make sure that no single person has access to more than one card.

You’re now ready to create a new key that will be your RMS tenant key.

### <a name="BKMK_GenerateYourKey3"></a>Step 3: Create a new key
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

## <a name="BKMK_Transfer"></a>Transfer your tenant key to Azure RMS
After you have generated your own key, you must transfer it to Azure RMS before you use it. For the highest level of security, this transfer is a manual process that requires you to fly to the Microsoft office in Redmond, Washington, United States of America. To complete this process, follow these 3 steps:

-   [Step 1: Bring your key to Microsoft](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_TransferYourKey1)

-   [Step 2: Transfer your key to the Window Azure RMS security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_TransferYourKey2)

-   [Step 3: Closing procedures](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_TransferYourKey3)

### Step 1: Bring your key to Microsoft

-   Contact Microsoft Customer Support Services (CSS) to schedule a key transfer appointment for Azure RMS. Bring the following to Microsoft in Redmond:

    -   A quorum of your Administrative Cards. If you followed the previous instructions in [Step 2: Create a security world](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_GenerateYourKey2), these are any two of your three cards.

    -   Personnel authorized to carry your Administrative Cards and pins, typically two (one for each card).

    -   Your Security World file (%NFAST_KMDATA%\local\world) on a USB drive.

    -   Your Tokenized Key File on a USB drive.

### Step 2: Transfer your key to the Window Azure RMS security world

1.  When you arrive at Microsoft to transfer your key, the following happens:

    -   Microsoft provides you with an offline workstation that has a Thales HSM attached, Thales software installed, and a Azure RMS Security World file pre-loaded into the folder C:\Temp\Destination.

    -   On this workstation, you load your Security World file and Tokenized Key File from your USB drive into the C:\Temp\Source folder.

    -   Azure RMS operators securely transfer your key to the Azure RMS security world by using Thales utilities.

    This process will look similar to the following, where the last parameter of key-xfer-im in this example is replaced by your Tokenized Key File name:

    **C:\&gt; mk-reprogram.exe --owner c:\Temp\Destination add c:\Temp\Source**

    **C:\&gt; key-xfer-im.exe c:\Temp\Source c:\Temp\Destination --module c:\Temp\Source\key_caping_machine--801c1a878c925fd9df4d62ba001b94701c039e2fb**

2.  Mk-reprogram will ask you and the Azure RMS operators to plug in their respective Administrator cards and pins. These commands output a Tokenized Key File in C:\Temp\Destination that contains your key protected by Azure RMS security world.

### Step 3: Closing procedures

-   In your presence, Azure RMS operators do the following:

    -   Run a tool that Microsoft developed in collaboration with Thales that removes two permissions: The permission to recover the key, and the permission to change permissions. After this is done, this copy of your key is locked to the Azure RMS security world. Thales HSMs will not allow Azure RMs operators with their Administrator cards to recover the plaintext copy of your key.

    -   Copy the resulting key file to a USB drive to later upload to the Azure RMS service.

    -   Factory-reset the HSM, and wipe the workstation clean.

You have now completed the instructions required for bring your own key in person and can return to your organization for the next steps in planning and implementing your tenant key.

> [!div class="button"]
[Next Steps](planning-and-implementing-your-azure-rights-management-tenant-key.md#BKMK_NextSteps)



