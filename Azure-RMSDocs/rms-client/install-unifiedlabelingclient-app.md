---
# required metadata

title: Download & install the Azure Information Protection client
description: Instructions for users to install the Azure Information Protection client for Windows, so that you can classify and protect your documents and emails. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/31/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 2bf09690-9dba-43b7-9e0a-0110915d4081

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# User Guide: Download and install the Azure Information Protection client

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*

If your administrator does not install the Azure Information Protection client for you, you can do this yourself. You must be a local administrator for your PC to install this client so that it can label and protect your documents and emails.

In addition:

- The Azure Information Protection client requires a minimum version of Microsoft .NET Framework 4.6.2 and if this is missing, the installer tries to download and install this prerequisite. When this prerequisite is installed as part of the client installation, your computer must be restarted.

- If you have Windows 7 SP1, the Azure Information Protection client requires a specific update, KB 2533623. If your PC needs this update but it is not installed, installation completes but with a message that the Azure Information Protection client requires this update. Until this update is installed, you won't be able to use all features of the Azure Information Protection client. 

## To download and install the Azure Information Protection client    

1.  Go to the [Microsoft Azure Information Protection](https://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website.

    This page has links for all the popular devices you might use, so that you can easily download a viewer app if it's needed to open protected files. If you're not a local administrator for your PC, you can still install the viewer app for Windows. But these instructions are to install the full client, which lets you label and protect files. 

2. Locate the **Azure Information Protection client** section and click the Windows icon. Click **Download** and save the **AzInfoProtection.exe** file.     

3. Run the executable file that was downloaded. If you are prompted to continue, click **Yes**.    

4. On the **Install the Azure Information Protection client** page:     
    - Select the option to install a demo policy if you cannot connect to the cloud but want to see and experience the client side of Azure Information Protection by using a local policy for demonstration purposes. When your client connects to an Azure Information Protection service, this demo policy is replaced with your organization's Azure Information Protection policy.    

    - Click **I agree** when you have read the license terms and conditions.    

5. If you are prompted to continue, click **Yes**, and wait for the installation to finish.    

6. Click **Close**. Before you start to use the Azure Information Protection client:    

    - If your computer runs Office 2010, restart your computer and then go to the next section for your final step.    
        
    - For other versions of Office, restart all Office applications and all instances of File Explorer. Your installation is now complete and you can use the client to label and protect your documents and emails.    

### Installing the Azure Information Protection client with Office 2010    
After you have installed the Azure Information Protection client by using the previous instructions:    

1. Open Microsoft Word. When this is the first time that you have run an Office 2010 application after you have installed the Azure Information Protection client, you see a **Microsoft Azure Information Protection** dialog box. This dialog box tells you that administrator credentials are required to complete the sign in process.

2. In the **Microsoft Azure Information Protection** dialog box, click **OK**.

3. If you see a **User Access Control** dialog box, click **Yes** so that the Azure Information Protection client can update the registry.

Your installation is now complete and you can use Azure Information Protection to label and protect your documents and emails.

## Other instructions    
More how-to instructions from the Azure Information Protection user guide:

- [What do you want to do?](client-user-guide.md#what-do-you-want-to-do)

## Additional information for administrators    
See [Install the Azure Information Protection client for users](client-admin-guide-install.md) from the [admin guide](client-admin-guide.md).
 
  
