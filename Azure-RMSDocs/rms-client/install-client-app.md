---
# required metadata

title: Download and install the Azure Information Protection client | Azure Information Protection
description: Instructions for users to install the Azure Information Protection client for Windows, so that you can classify and protect your documents and emails. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/22/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 2bf09690-9dba-43b7-9e0a-0110915d4081

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Download and install the Azure Information Protection client

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*

**[ This version of the client is in preview and subject to change. ]**

If your administrator does not install the Azure Information Protection client for you, you can do this yourself. You do not have to be a local administrator for your PC to install this client, unless you use Office 2010. 

### Office 2010 only

Only if you use Office 2010 must you be a local administrator to install the Azure Information Protection client. When you use this version of Office, the Azure Information Protection client must set registry keys that require administrator permission: 

- **If your account is not a local administrator for your PC**: Ask your administrator or IT department to install this client for you.

- **If your account is a local administrator for your PC**: Use the instructions to download and install the client, and then use the instructions in the following section for Office 2010.

## To download and install the Azure Information Protection client

1.  Go to the [Microsoft Download Site](https://www.microsoft.com/en-us/download/details.aspx?id=53018) and download the **preview** version of the Azure Information Protection client.

2. Double-click the executable file that was downloaded. 

3. On the **Install the Azure Information Protection client** page: 
    
    - Select the option to install a demo policy if you cannot connect to the cloud but want to see and experience the client side of Azure Information Protection by using a local policy for demonstration purposes. When your client connects to an Azure Information Protection service, this demo policy is replaced with your organization's Azure Information Protection policy.
    
    - Click **I agree** when you have read the license terms and conditions.

4. If you are prompted to continue, click **Yes**, and wait for the installation to finish.

3. Click **Close**. Before you start to use the Azure Information Protection client:

    - If your computer runs Office 2010, restart your computer and then go to the next section for your final step.
    
    - For other versions of Office, restart all Office applications and all instances of File Explorer. Your installation is now complete and you can use client to label and protect your documents and emails.

> [!NOTE]
> If you have Windows 7 SP1, the Azure Information Protection client requires a specific update [KB 2533623](https://support.microsoft.com/en-us/kb/2533623). If your PC needs this update but it not installed, you will see a message when you try to use the client that this update must be installed before you can use all features of the Azure Information Protection client.

### Installing the Azure Information Protection client with Office 2010

After you have installed the Azure Information Protection client by using the previous instructions:

1. Open Microsoft Word. When this is the first time that you have run an Office 2010 application after you have installed the Azure Information Protection client, you see a **Microsoft Azure Information Protection** dialog box. This dialog box tells you that administrator credentials are required to complete the sign in process.

2. In the **Microsoft Azure Information Protection** dialog box, click **OK**.

2. If you see a **User Access Control** dialog box, click **Yes** so that the Azure Information Protection client can update the registry.

Your installation is now complete and you can use Azure Information Protection to label and protect your documents and emails.

## Other instructions
For how-to instructions, see the following sections from the Azure Information Protection user guide:

-   [What do you want to do?](client-user-guide.md#what-do-you-want-to-do)

## Additional information for administrators
[Installing the Azure Information Protection client](info-protect-client.md)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
