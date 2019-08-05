---
# required metadata

title: Download & install the Azure Information Protection unified labeling client
description: Instructions for users to install the Azure Information Protection unified labeling client for Windows, so that you can classify and protect your documents and emails. 
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 07/17/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: v2client
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: user

---

# User Guide: Download and install the Azure Information Protection unified labeling client

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

If your administrator does not install the Azure Information Protection unified labeling client for you, you can do this yourself. You must be a local administrator for your PC to install this client so that it can label and protect your documents and emails.

In addition:

- The Azure Information Protection unified labeling client requires a minimum version of Microsoft .NET Framework 4.6.2 and if this is missing, the installer tries to download and install this prerequisite. When this prerequisite is installed as part of the client installation, your computer must be restarted.

- If you have Windows 7 SP1, the Azure Information Protection unified labeling client requires a specific update, KB 2533623. If your PC needs this update but it is not installed, installation completes but with a message that the Azure Information Protection unified labeling client requires this update. Until this update is installed, you won't be able to use all features of the Azure Information Protection unified labeling client. 

## To download and install the Azure Information Protection unified labeling client

Before you install the Azure Information Protection unified labeling client, confirm with your administrator or help desk that you are using Office 365 sensitivity labels.

1. Download **AzInfoProtection_UL.exe** from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

2. Run the executable file that was downloaded, and if you are prompted to continue, click **Yes**.

3. On the **Install the Azure Information Protection client** page, click **I agree** when you have read the license terms and conditions.

4. If you are prompted to continue, click **Yes**, and wait for the installation to finish.

6. Click **Close**. Before you start to use the Azure Information Protection unified labeling client:

    - If your computer runs Office 2010, restart your computer and then go to the next section for your final step.    
        
    - For other versions of Office, restart all Office applications and all instances of File Explorer. Your installation is now complete and you can use the client to label and protect your documents and emails.

### Installing the Azure Information Protection unified labeling client with Office 2010

After you have installed the Azure Information Protection unified labeling client by using the previous instructions:

1. Open Microsoft Word. When this is the first time that you have run an Office 2010 application after you have installed the Azure Information Protection client, you see a **Microsoft Azure Information Protection** dialog box. This dialog box tells you that administrator credentials are required to complete the sign in process.

2. In the **Microsoft Azure Information Protection** dialog box, click **OK**.

3. If you see a **User Access Control** dialog box, click **Yes** so that the Azure Information Protection client can update the registry.

Your installation is now complete and you can use the Azure Information Protection unified labeling client to label and protect your documents and emails.

## Other instructions    
More how-to instructions from the Azure Information Protection unified labeling client user guide:

- [What do you want to do?](clientv2-user-guide.md#what-do-you-want-to-do)

## Additional information for administrators    
See [Install the Azure Information Protection unified labeling client for users](clientv2-admin-guide-install.md) from the [admin guide](clientv2-admin-guide.md).
