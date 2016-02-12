---
title: Operations for Your Azure Rights Management Tenant Key
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 1284d0ee-0a72-45ba-a64c-3dcb25846c3d
author: Cabailey
---
# Operations for Your Azure Rights Management Tenant Key
Depending on your tenant key topology (Microsoft-managed or customer-managed), you have different levels of control and responsibility for your Microsoft Azure Rights Management (Azure RMS) tenant key after it is implemented.

When you manage your own tenant key, this is often referred to as bring your own key (BYOK). For more information about this scenario and how to choose between the two tenant key topologies, see [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning-and-Implementing-Your-Azure-Rights-Management-Tenant-Key.md).

The following table identifies which operations you can do, depending on the topology that you’ve chosen for your Azure RMS tenant key.

|Lifecycle operation|Microsoft-managed (default)|Customer-managed (BYOK)|
|-----------------------|-------------------------------|---------------------------|
|Revoke your tenant key|No (automatic)|No (automatic)|
|Re-key your tenant key|Yes|Yes|
|Backup and recover your tenant key|No|Yes|
|Export your tenant key|Yes|No|
|Respond to a breach|Yes|Yes|
After you have identified which topology you have implemented, use one of the following sections for more information about these operations for your Azure RMS tenant key.

## <a name="BKMK_MSManagedOperations"></a>Microsoft-managed: Tenant key lifecycle operations
If Microsoft manages your tenant key for Azure Rights Management (the default), use the following sections for more information about the lifecycle operations that are relevant to this topology:

-   [Revoke your tenant key](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_MSRevoke)

-   [Re-key your tenant key](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_MSRekey)

-   [Backup and recover your tenant key](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_MSBackup)

-   [Export your tenant key](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_MSExport)

-   [Respond to a breach](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_MSBreach)

### <a name="BKMK_MSRevoke"></a>Revoke your tenant key
When you unsubscribe from Azure RMS, Azure RMS stops using your tenant key and no action is needed from you.

### <a name="BKMK_MSRekey"></a>Re-key your tenant key
Re-keying is also known as rolling your key. Do not re-key your tenant key unless it’s really necessary. Older clients, such as Office 2010, were not designed to handle key changes gracefully. In this scenario, you must clear the RMS state on computers by using Group Policy or an equivalent mechanism. However, there are some legitimate events that may force you to re-key your tenant key. For example:

-   Your company has split into two or more companies. When you re-key your tenant key, the new company will not have access to new content that your employees publish. They can access the old content if they have a copy of the old tenant key.

-   You believe the master copy of your tenant key (the copy in your possession) was compromised.

You can re-key your tenant key by calling Microsoft Customer Support Services (CSS) and proving that you are the tenant administrator.

When you re-key your tenant key, new content is protected by using the new tenant key. This happens in a phased manner, so for a period of time, some new content will continue to be protected with the old tenant key. Previously protected content stays protected to your old tenant key. To support this scenario, Azure RMS retains your old tenant key so that it can issue licenses for old content.

### <a name="BKMK_MSBackup"></a>Backup and recover your tenant key
Microsoft is responsible for backing up your tenant key and no action is required from you.

### <a name="BKMK_MSExport"></a>Export your tenant key
You can export your Azure RMS configuration and tenant key by following the instructions in these three steps:

##### Step 1: Initiate export

-   To do this, contact Microsoft Customer Service Support (CSS). You must prove you are an administrator for your Azure RMS tenant.

##### Step 2: Wait for verification

-   Microsoft verifies that your request to release your RMS tenant key is legitimate. This process can take up to 3 weeks.

##### Step 3: Receive key instructions from CSS

-   Microsoft Customer Support Services (CSS) will send you your Azure RMS configuration and tenant key as encrypted in a password-protected file that has a .tpd file name extension. To do this, CSS first sends you (as the person who initiated the export) a tool by email. You must run the tool from a command prompt as follows:

    ```
    AadrmTpd.exe -createkey
    ```
    This generates an RSA key pair and saves the public and private halves as files in the current folder. For example: **PublicKey-FA29D0FE-5049-4C8E-931B-96C6152B0441.txt** and **PrivateKey-FA29D0FE-5049-4C8E-931B-96C6152B0441.txt**.

    Respond to the email from CSS, attaching the file that has a name that starts with **PublicKey**. CSS will next send you a TPD file as an .xml file that is encrypted with your RSA key. Copy this file to the same folder as you ran the AadrmTpd tool originally, and run the tool again, using your file that starts with **PrivateKey** and the file from CSS. For example:

    ```
    AadrmTpd.exe -key PrivateKey-FA29D0FE-5049-4C8E-931B-96C6152B0441.txt -target TPD-77172C7B-8E21-48B7-9854-7A4CEAC474D0.xml
    ```
    The output of this command should be two files: One contains the plaintext password for the password-protected TPD, and the other is the password-protected TPD itself. For cross-referencing purposes, both should have the same GUID as the public and private key files from when you ran the AadrmTpd.exe -createkey command:

    -   Password-FA29D0FE-5049-4C8E-931B-96C6152B0441.txt

    -   ExportedTPD-FA29D0FE-5049-4C8E-931B-96C6152B0441.xml

    Backup these files and store them safely to ensure that you can continue to decrypt content that is protected with this tenant key. In addition, if you are migrating to AD RMS, you can import this TPD file (the file that starts with **ExportedTDP**) to your AD RMS server.

##### Step 4: Ongoing: Protect your tenant key

-   After you receive your tenant key, keep it well-guarded, because if somebody gets access to it, they can decrypt all documents that are protected by using that key.

    If the reason for exporting your tenant key is because you no longer want to use Azure RMS, as a best practice, now deactivate your RMS tenant. Do not delay doing this after you receive your tenant key because this precaution will help to minimize the consequences if your tenant key is accessed by somebody who should not have it. For instructions, see [Decommissioning and Deactivating Azure Rights Management](../Topic/Decommissioning-and-Deactivating-Azure-Rights-Management.md).

### <a name="BKMK_MSBreach"></a>Respond to a breach
No security system, no matter how strong, is complete without a breach response process. Your tenant key might be compromised or stolen. Even when it’s well protected well, vulnerabilities might be found in current generation HSM technology or current key lengths and algorithms.

Microsoft has a dedicated team to respond to security incidents in its products and services. As soon as there is a credible report of an incident, this team engages to investigate the scope, root cause, and mitigations. If this incident affects your assets, then Microsoft will notify your Azure RMS tenant administrators by email by using the address that you supplied when you subscribed.

If you have a breach, the best action that you or Microsoft can take depends on the scope of the breach; Microsoft will work with you through this process. The following table shows some typical situations and the likely response, although the exact response will depend on all the information that is revealed during the investigation.

|Incident description|Likely response|
|------------------------|-------------------|
|Your tenant key is leaked.|Re-key your tenant key. See the [Re-key your tenant key](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_MSRekey) section in this topic.|
|An unauthorized individual or malware got rights to use your tenant key but the key itself did not leak.|Re-keying your tenant key does not help here and requires root-cause analysis. If a process or software bug was responsible for the unauthorized individual to get access, that situation must be resolved.|
|Vulnerability discovered in the RSA algorithm, or key length, or brute-force attacks become computationally feasible.|Microsoft must update the Azure RMS to support new algorithms and longer key lengths that are resilient, and instruct all customers to renew their tenant keys.|

## <a name="BKMK_BYOKManagedOperations"></a>Customer-managed: Tenant key lifecycle operations
If you manage your tenant key for Azure Rights Management (the bring your own key, or BYOK, scenario), use the following sections for more information about the lifecycle operations that are relevant to this topology:

-   [Revoke your tenant key](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_BYOKRevoke)

-   [Re-key your tenant key](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_BYOKRekey)

-   [Backup and recover your tenant key](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_BYOKBackup)

-   [Export your tenant key](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_BYOKExport)

-   [Respond to a breach](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_BYOKBreach)

### <a name="BKMK_BYOKRevoke"></a>Revoke your tenant key
When you unsubscribe from Azure RMS, Azure RMS stops using your tenant key and no action is needed from you.

### <a name="BKMK_BYOKRekey"></a>Re-key your tenant key
Re-keying is also known as rolling your key. Do not re-key your tenant key unless it’s really necessary. Older clients, such as Office 2010, were not designed to handle key changes gracefully. In this scenario, you must clear the RMS state on computers by using Group Policy or an equivalent mechanism. However, there are some legitimate events that may force you to re-key your tenant key. For example:

-   Your company has split into two or more companies. When you re-key your tenant key, the new company will not have access to new content that your employees publish. They can access the old content if they have a copy of the old tenant key.

-   You believe the master copy of your tenant key (the copy in your possession) was compromised.

When you re-key your tenant key, new content is protected by using the new tenant key. This happens in a phased manner, so for a period of time, some new content will continue to be protected with the old tenant key. Previously protected content stays protected to your old tenant key. To support this scenario, Azure RMS retains your old tenant key so that it can issue licenses for old content.

To re-key your tenant key, generate and create a new key over the Internet or in person, by using the procedures in the [Implementing bring your own key (BYOK)](../Topic/Planning-and-Implementing-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_ImplementBYOK) section from the [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning-and-Implementing-Your-Azure-Rights-Management-Tenant-Key.md) topic.

### <a name="BKMK_BYOKBackup"></a>Backup and recover your tenant key
You are responsible for backing up your tenant key. If you generated your tenant key in a Thales HSM, to back up the key, just back up the Tokenized Key file, the World file, and the Administrator Cards.

If you transferred your key by following the procedures in the [Implementing bring your own key (BYOK)](../Topic/Planning-and-Implementing-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_ImplementBYOK) section from the [Planning and Implementing Your Azure Rights Management Tenant Key](../Topic/Planning-and-Implementing-Your-Azure-Rights-Management-Tenant-Key.md) topic, Azure RMS will persist the Tokenized Key File, to protect against failure of any Azure RMS nodes. However, do not consider this to be a full backup. For example, if you ever need a plaintext copy of your key to use outside a Thales HSM, Azure RMS will not be able to retrieve it for you because it only has a non-recoverable copy.

### <a name="BKMK_BYOKExport"></a>Export your tenant key
If you use BYOK, you cannot export your tenant key from Azure RMS. The copy in Azure RMS is non-recoverable. If you want to delete this key so it can no longer be used, contact Microsoft Customer Service Support (CSS).

### <a name="BKMK_BYOKBreach"></a>Respond to a breach
No security system, no matter how strong, is complete without a breach response process. Your tenant key might be compromised or stolen. Even when it’s well protected well, vulnerabilities might be found in current generation HSM technology or current key lengths and algorithms.

Microsoft has a dedicated team to respond to security incidents in its products and services. As soon as there is a credible report of an incident, this team engages to investigate the scope, root cause, and mitigations. If this incident affects your assets, then Microsoft will notify your Azure RMS tenant administrators by email by using the address that you supplied when you subscribed.

If you have a breach, the best action that you or Microsoft can take  depends on the scope of the breach; Microsoft will work with you through this process. The following table shows some typical situations and the likely response, although the exact response will depend on all the information that is revealed during the investigation.

|Incident description|Likely response|
|------------------------|-------------------|
|Your tenant key is leaked.|Re-key your tenant key. See the [Re-key your tenant key](../Topic/Operations-for-Your-Azure-Rights-Management-Tenant-Key.md#BKMK_BYOKRekey) section in this topic.|
|An unauthorized individual or malware got rights to use your tenant key but the key itself did not leak.|Re-keying your tenant key does not help here and requires root-cause analysis. If a process or software bug was responsible for the unauthorized individual to get access, that situation must be resolved.|
|Vulnerability discovered in the current-generation HSM technology.|Microsoft must update the HSMs. If there is reason to believe that the vulnerability exposed keys, then Microsoft will instruct all customers to renew their tenant keys.|
|Vulnerability discovered in the RSA algorithm, or key length, or brute-force attacks become computationally feasible.|Microsoft must update the Azure RMS to support new algorithms and longer key lengths that are resilient, and instruct all customers to renew their tenant keys.|

## See Also
[Using Azure Rights Management](../Topic/Using-Azure-Rights-Management.md)

