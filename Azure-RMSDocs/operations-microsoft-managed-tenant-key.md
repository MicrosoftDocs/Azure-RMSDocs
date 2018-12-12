---
# required metadata

title: Microsoft-managed - AIP tenant key life cycle operations
description: Information about the life cycle operations that are relevant if Microsoft manages your tenant key for Azure Information Protection (the default).
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 03/07/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 3c48cda6-e004-4bbd-adcf-589815c56c55

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Microsoft-managed: Tenant key life cycle operations

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

If Microsoft manages your tenant key for Azure Information Protection (the default), use the following sections for more information about the life cycle operations that are relevant to this topology.

## Revoke your tenant key
When you cancel your subscription for Azure Information Protection, Azure Information Protection stops using your tenant key and no action is needed from you.

## Rekey your tenant key
Rekeying is also known as rolling your key. When you do this operation, Azure Information Protection stops using the existing tenant key to protect documents and emails, and starts to use a different key. Policies and templates are immediately resigned but this changeover is gradual for existing clients and services using Azure Information Protection. So for some time, some new content continues to be protected with the old tenant key.

To rekey, you must configure the tenant key object and specify the alternative key to use. Then, the previously used key is automatically marked as archived for Azure Information Protection. This configuration ensures that content that was protected by using this key remains accessible.

Examples of when you might need to rekey for Azure Information Protection:

- You have migrated from Active Directory Rights Management Services (AD RMS) with a cryptographic mode 1 key. When the migration is complete, you want to change to using a key that uses cryptographic mode 2.

- Your company has split into two or more companies. When you rekey your tenant key, the new company will not have access to new content that your employees publish. They can access the old content if they have a copy of the old tenant key.

- You want to move from one key management topology to another.

- You believe the master copy of your tenant key is compromised.

To rekey, you can select a different Microsoft-managed key to become your tenant key, but you cannot create a new Microsoft-managed key. To create a new key, you must change your key topology to be customer-managed (BYOK).

You have more than one Microsoft-managed key if you migrated from Active Directory Rights Management Services (AD RMS) and chose the Microsoft-managed key topology for Azure Information Protection. In this scenario, you have at least two Microsoft-managed keys for your tenant. One key, or more, is the key or keys that you imported from AD RMS. You will also have the default key that was automatically created for your Azure Information Protection tenant.

To select a different key to be your active tenant key for Azure Information Protection, use the [Set-AadrmKeyProperties](/powershell/module/aadrm/set-aadrmkeyproperties) cmdlet from the AADRM module. To help you identify which key to use, use the [Get-AadrmKeys](/powershell/module/aadrm/get-aadrmkeys) cmdlet. You can identify the default key that was automatically created for your Azure Information Protection tenant by running the following command:

	(Get-AadrmKeys) | Sort-Object CreationTime | Select-Object -First 1

To change your key topology to be customer-managed (BYOK), see [Implementing BYOK for your Azure Information Protection tenant key](plan-implement-tenant-key.md#implementing-byok-for-your-azure-information-protection-tenant-key).

## Backup and recover your tenant key
Microsoft is responsible for backing up your tenant key and no action is required from you.

## Export your tenant key
You can export your Azure Information Protection configuration and tenant key by following the instructions in the following three steps:

### Step 1: Initiate export

- [Contact Microsoft Support](information-support.md#to-contact-microsoft-support) to open an **Azure Information Protection support case with a request for an Azure Information Protection key export**. You must prove you are an administrator for your Azure Information Protection tenant, and understand that this process takes several days to confirm. Standard support charges apply; exporting your tenant key is not a free-of-charge support service.

### Step 2: Wait for verification

- Microsoft verifies that your request to release your Azure Information Protection tenant key is legitimate. This process can take up to three weeks.

### Step 3: Receive key instructions from CSS

- Microsoft Customer Support Services (CSS) sends you your Azure Information Protection configuration and tenant key encrypted in a password-protected file. This file has a **.tpd** file name extension. To do this, CSS first sends you (as the person who initiated the export) a tool by email. You must run the tool from a command prompt as follows:

    ```
    AadrmTpd.exe -createkey
    ```
    This generates an RSA key pair and saves the public and private halves as files in the current folder. For example: **PublicKey-FA29D0FE-5049-4C8E-931B-96C6152B0441.txt** and **PrivateKey-FA29D0FE-5049-4C8E-931B-96C6152B0441.txt**.

    Respond to the email from CSS, attaching the file that has a name that starts with **PublicKey**. CSS next sends you a TPD file as an .xml file that is encrypted with your RSA key. Copy this file to the same folder as you ran the AadrmTpd tool originally, and run the tool again, using your file that starts with **PrivateKey** and the file from CSS. For example:

    ```
    AadrmTpd.exe -key PrivateKey-FA29D0FE-5049-4C8E-931B-96C6152B0441.txt -target TPD-77172C7B-8E21-48B7-9854-7A4CEAC474D0.xml
    ```
    The output of this command should be two files: One contains the plain text password for the password-protected TPD, and the other is the password-protected TPD itself. The files have a new GUID, for example:
     
    - Password-5E4C2018-8C8C-4548-8705-E3218AA1544E.txt

    - ExportedTPD-5E4C2018-8C8C-4548-8705-E3218AA1544E.xml

    Back up these files and store them safely to ensure that you can continue to decrypt content that is protected with this tenant key. In addition, if you are migrating to AD RMS, you can import this TPD file (the file that starts with **ExportedTDP**) to your AD RMS server.

### Step 4: Ongoing: Protect your tenant key

After you receive your tenant key, keep it well-guarded, because if somebody gets access to it, they can decrypt all documents that are protected by using that key.

If the reason for exporting your tenant key is because you no longer want to use Azure Information Protection, as a best practice, now deactivate the Azure Rights Management service from your Azure Information Protection tenant. Do not delay doing this after you receive your tenant key because this precaution helps to minimize the consequences if your tenant key is accessed by somebody who should not have it. For instructions, see [Decommissioning and deactivating Azure Rights Management](decommission-deactivate.md).

## Respond to a breach
No security system, no matter how strong, is complete without a breach response process. Your tenant key might be compromised or stolen. Even when it’s protected well, vulnerabilities might be found in current generation key technology or in current key lengths and algorithms.

Microsoft has a dedicated team to respond to security incidents in its products and services. As soon as there is a credible report of an incident, this team engages to investigate the scope, root cause, and mitigations. If this incident affects your assets, Microsoft will notify your Azure Information Protection tenant administrators by email, by using the email address that you supplied when you subscribed.

If you have a breach, the best action that you or Microsoft can take depends on the scope of the breach; Microsoft will work with you through this process. The following table shows some typical situations and the likely response, although the exact response depends on all the information that is revealed during the investigation.

|Incident description|Likely response|
|------------------------|-------------------|
|Your tenant key is leaked.|Rekey your tenant key. See the [Rekey your tenant key](#rekey-your-tenant-key) section in this article.|
|An unauthorized individual or malware got rights to use your tenant key but the key itself did not leak.|Rekeying your tenant key does not help here and requires root-cause analysis. If a process or software bug was responsible for the unauthorized individual to get access, that situation must be resolved.|
|Vulnerability discovered in the RSA algorithm, or key length, or brute-force attacks become computationally feasible.|Microsoft must update Azure Information Protection to support new algorithms and longer key lengths that are resilient, and instruct all customers to rekey their tenant key.|


