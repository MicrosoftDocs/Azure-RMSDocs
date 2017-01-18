---
# required metadata

title: Download and install the Azure Information Protection client | Azure Information Protection
description: Instructions for users to install the Azure Information Protection client for Windows, so that you can classify and protect your documents and emails. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/30/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
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

If your administrator does not install the Azure Information Protection client for you, you can do this yourself. You must be a local administrator for your PC to install this client.     

## To download and install the Azure Information Protection client    

1.  Go to the [Microsoft Azure Information Protection](https://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website.    
2. Click the Windows icon for the **Azure Information Protection client** and save the **AzInfoProtection.exe** file to install to install the Azure Information Protection client.     

2. Double-click the executable file that was downloaded. If you are prompted to continue, click **Yes**.    

3. On the **Install the Azure Information Protection client** page:     
    - Select the option to install a demo policy if you cannot connect to the cloud but want to see and experience the client side of Azure Information Protection by using a local policy for demonstration purposes. When your client connects to an Azure Information Protection service, this demo policy is replaced with your organization's Azure Information Protection policy.    

    - Click **I agree** when you have read the license terms and conditions.    

4. If you are prompted to continue, click **Yes**, and wait for the installation to finish.    

3. Click **Close**. Before you start to use the Azure Information Protection client:    

    - If your computer runs Office 2010, restart your computer and then go to the next section for your final step.    
        
    - For other versions of Office, restart all Office applications and all instances of File Explorer. Your installation is now complete and you can use client to label and protect your documents and emails.    

   [!NOTE]    
   > If you have Windows 7 SP1, the Azure Information Protection client requires a specific update [KB 2533623](https://support.microsoft.com/en-us/kb/2533623). If your PC needs this update but it not installed, you will see a message when you try to use the client that this update must be installed before you can use all features of the Azure Information Protection client.

### Installing the Azure Information Protection client with Office 2010    
After you have installed the Azure Information Protection client by using the previous instructions:    

1. Open Microsoft Word. When this is the first time that you have run an Office 2010 application after you have installed the Azure Information Protection client, you see a **Microsoft Azure Information Protection** dialog box. This dialog box tells you that administrator credentials are required to complete the sign in process.

2. In the **Microsoft Azure Information Protection** dialog box, click **OK**.

3. If you see a **User Access Control** dialog box, click **Yes** so that the Azure Information Protection client can update the registry.   
Your installation is now complete and you can use Azure Information Protection to label and protect your documents and emails.

## Other instructions    
For how-to instructions, see the following sections from the Azure Information Protection user guide:    

## Additional information for administrators    
See [How to install the Azure Information Protection client for users](client-admin-guide.md#how-to-install-the-azure-information-protection-client-for-users) from the admin guide.
 

[!INCLUDE[Commenting house rules](../includes/houserules.md)]  
