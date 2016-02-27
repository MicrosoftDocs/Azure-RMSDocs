---
title: How Does Azure RMS Work
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: EMS
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: TBD
author: Cabailey
---

# <a name="BKMK_HowRMSworks"></a>How does Azure RMS work? Under the hood
One important thing to understand about how Azure RMS works is that the Rights Management service (and Microsoft) do not see or store your data as part of the information protection process. Information that you protect is never sent to or stored in Azure unless you explicitly store it in Azure or use another cloud service that stores it in Azure. Azure RMS simply makes the data in a document unreadable to anyone other than authorized users and services:

-   The data is encrypted at the application level and includes a policy that defines the authorized use for that document.

-   When a protected document is used by a legitimate user or it is processed by an authorized service, the data in the document is decrypted and the rights that are defined in the policy are enforced.

At a high level, you can see how this process works in the following picture. A document containing the secret formula is protected, and then successfully opened by an authorized user or service. The document is protected by a content key (the green key in this picture). It is unique for each document and is placed in the file header where it is protected by your RMS tenant root key (the red key in this picture). Your tenant key can be generated and managed by Microsoft, or you can generate and manage your own tenant key.

Throughout the protection process when Azure RMS is encrypting and decrypting, authorizing, and enforcing restrictions, the secret formula is never sent to Azure.

![](../media/AzRMS_SecretColaFormula_final.png)

For a detailed description of what’s happening, see the [Walkthrough of how Azure RMS works: First use, content protection, content consumption](#BKMK_Walthrough) section in this topic.

For technical details about the algorithms and key lengths that Azure RMS uses, see the next section.

## <a name="BKMK_RMScrytographics"></a>Cryptographic controls used by Azure RMS: Algorithms and key lengths
Even if you don't need to know yourself how RMS works, you might be asked about the cryptographic controls that it uses, to make sure that the security protection is industry-standard.


|Azure RMS protection|Cryptographic controls|
|-|-|
|Documentation protection method:|Algorithm: AES<br /><br />Key length: 128 bits and 256 bits [footnote 1]|
|Key protection method:|Algorithm: RSA<br /><br />Key length: 2048 bits|
|Certificate signing:|Algorithm: SHA-256|

Footnote 1:
             256 bits is used by the Rights Management sharing application for generic protection and native protection when the file has a .ppdf file name extension or is a protected text or image file (such as .ptxt or .pjpg).

How the cryptographic keys are stored and secured:

- For each document or email that is protected by Azure RMS, Azure RMS creates a single AES key (the "content key"), and that key is embedded to the document, and persists through editions of the document. 

- The content key is protected with the organization’s RSA key (the "Azure RMS tenant key") as part of the policy in the document, and the policy is also signed by the author of the document. This tenant key is common to all documents and emails that are protected by Azure RMS for the organization and this key can only be changed by an Azure RMS administrator if the organization is using a tenant key that is customer-managed (known as "bring your own key", or BYOK). 

	This tenant key is protected in Microsoft’s online services, in a highly controlled environment and under close monitoring. When you use a customer-managed tenant key (BYOK), this security is enhanced by the use of an array of high-end hardware security modules (HSMs) in each Azure region, without the ability for the keys to be extracted, exported or shared under any circumstances. For more information about the tenant key and BYOK, see [Planning and Implementing Your Azure Rights Management Tenant Key](planning-and-implementing-your-azure-rights-management-tenant-key.md).

- Licenses and certificates that are sent to a Windows device are protected with the client’s device private key, which is created the first time a user on the device uses Azure RMS. This private key, in turn, is protected with the DPAPI on the client, which protects these secrets by using a key derived from the user’s password. On mobile devices, the keys are used only one time, so because they are not stored on the clients, these keys don’t need to be protected on the device. 



## <a name="BKMK_Walthrough"></a>Walkthrough of how Azure RMS works: First use, content protection, content consumption
To understand in more detail how Azure RMS works, let's walk through a typical flow after the [Azure RMS service is activated](activating-azure-rights-management.md) and when a user first uses RMS on their Windows computer (a process sometimes known as **initializing the user environment** or bootstrapping), **protects content** (a document or email), and then **consumes**  (opens and uses) content that has been protected by somebody else.

After the user environment is initialized, that user can then protect documents or consume protected documents on that computer.

> [!NOTE]
> If this user moves to another Windows computer, or another user uses this same Windows computer, the initialization process is repeated.

### Initializing the user environment
Before a user can protect content or consume protected content on a Windows computer, the user environment must be prepared on the device. This is a one-time process and happens automatically without user intervention when a user tries to protect or consume protected content:

![](../media/AzRMS.png)

**What's happening in step 1**: The RMS client on the computer first connects to Azure RMS, and authenticates the user by using their Azure Active Directory account.

When the user’s account is federated with Azure Active Directory, this authentication is automatic and the user is not prompted for credentials.|

![](../media/AzRMS_useractivation2.png)

**What's happening in step 2**: After the user is authenticated, the connection is automatically redirected to the organization’s RMS tenant, which issues certificates that let the user authenticate to Azure RMS in order to consume protected content and to protect content offline.

A copy of the user’s certificate is stored in Azure RMS so that if the user moves to another device, the certificates are created by using the same keys.

### Content protection
When a user protects a document, the RMS client takes the following actions on an unprotected document:

![](../media/AzRMS_documentprotection1.png)

**What's happening in step 1**: The RMS client creates a random key (the content key) and encrypts the document using this key with the AES symmetric encryption algorithm.

![](../media/AzRMS_documentprotection2.png)

**What's happening in step 2**: The RMS client then creates a certificate that includes a policy for the document, either based on a template or by specifying specific rights for the document. This policy includes the rights for different users or groups and other restrictions, such as an expiration date.

The RMS client then uses the organization’s key that was obtained when the user environment was initialized and uses this key to encrypt the policy and the symmetric content key. The RMS client also signs the policy with the user’s certificate that was obtained when the user environment was initialized.|

![](../media/AzRMS_documentprotection3.png)

**What's happening in step 3**: Finally, the RMs client embeds the policy into a file with the body of the document encrypted previously, which together comprise a protected document.

This document can be stored anywhere or shared by using any method, and the policy always stays with the encrypted document.

### Content consumption
When a user wants to consume a protected document, the RMS client starts by requesting access to the Azure RMS service:

![](../media/AzRMS_documentconsumption1.png)

**What's happening in step 1**: The authenticated user sends the document policy and the user’s certificates to Azure RMS. The service decrypts and evaluates the policy, and builds a list of rights (if any) the user has for the document.

![](../media/AzRMS_documentconsumption2.png)

**What's happening in step 2**: The service then extracts the AES content key from the decrypted policy. This key is then encrypted with the user’s public RSA key that was obtained with the request.

The re-encrypted content key is then embedded into an encrypted use license with the list of user rights, which is then returned to the RMS client.

![](../media/AzRMS_documentconsumption3.png)

**What's happening in step 3**: Finally, the RMS client takes the encrypted use license and decrypts it with its own user private key. This lets the RMS client decrypt the document’s body as it is needed and render it on the screen.

The client also decrypts the rights list and passes them to the application, which enforces those rights in the application’s user interface.

### Variations
The preceding walkthroughs cover the standard scenarios but there are some variations:

-   **Mobile devices**: When mobile devices protect or consume files with Azure RMS, the process flows are much simpler. Mobile devices don’t first go through the user initialization process because instead, each transaction (to protect or consume content) is independent. As with Windows computers, mobile devices connect to the Azure RMS service and authenticate. To protect content, mobile devices submit a policy and Azure RMS sends them a publishing license and symmetric key to protect the document. To consume content, when mobile devices connect to the Azure RMS service and authenticate, they send the document policy to Azure RMS and request a use license to consume the document. In response, Azure RMS sends the necessary keys and restrictions to the mobile devices. Both processes use TLS to protect the key exchange and other communications.

-   **RMS connector**: When Azure RMS is used with the RMS connector, the process flows remain the same. The only difference is that the connector acts as a relay between the on-premises services (such as Exchange Server and SharePoint Server) and Azure RMS. The connector itself does not perform any operations, such as the initialization of the user environment, or encryption or decryption. It simply relays the communication that would usually go to an AD RMS server, handling the translation between the protocols that are used on each side. This scenario lets you use Azure RMS with on-premises services.

-   **Generic protection (.pfile)**: When Azure RMS generically protects a file, the flow is basically the same for content protection except that the RMS client creates a policy that grants all rights. When the file is consumed, it is decrypted before it is passed to the target application. This scenario lets you protect all files, even if they don’t natively support RMS.

-   **Protected PDF (.ppdf)**: When Azure RMS natively protects an Office file, it also creates a copy of that file and protects it in the same way. The only difference is that the file copy is in PPDF file format, which the RMS sharing application knows how to open for viewing only. This scenario lets you send protected attachments via email, knowing that the recipient on a mobile device will always be able to read them even if the mobile device doesn’t have an app that natively supports protected Office files.

## Next steps

To learn more about Azure RMS, use the other topics in the Understand and Explore section, such as [How Applications Support Azure Rights Management](how-applications-support-azure-rights-management.md) to learn how your existing applications can integrate with Azure RMS to provide an information protection solution. 

Review [Terminology for Azure Rights Management](terminology-for-azure-rights-management.md) so that you’re familiar with the terms that you might come across as you’re configuring and using Azure RMS, and be sure to also check [Requirements for Azure Rights Management](requirements-for-azure-rights-management.md) before you start your deployment. If you want to dive right in and try it out for yourself, use the [Quick Start Tutorial for Azure Rights Management](quick-start-tutorial-for-azure-rights-management.md).

If you’re ready to start deploying Azure RMS for your organization, use the [Azure Rights Management Deployment Roadmap](azure-rights-management-deployment-roadmap.md) for your deployment steps and links for how-to instructions.

> [!TIP]
> For additional information and help, use the resources and links in [Information and Support for Azure Rights Management](information-and-support-for-azure-rights-management.md).
