---
# required metadata

title: Download & install the Azure Information Protection classic client
description: Instructions for users to install the Azure Information Protection classic client for Windows, so that you can classify and protect your documents and emails. 
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 08/17/2020
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 2bf09690-9dba-43b7-9e0a-0110915d4081
ROBOTS: NOINDEX


# optional metadata

#audience:
#audience:
#ms.devlang:
ms.subservice: v1client
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: user

---

# User Guide: Download and install the Azure Information Protection classic client

>***Applies to**: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see the [unified labeling user guide](install-unifiedlabelingclient-app.md).*

> [!NOTE] 
> To provide a unified and streamlined customer experience, **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. This time-frame allows all current Azure Information Protection customers to transition to our unified labeling solution using the Microsoft Information Protection Unified Labeling platform. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

If your administrator does not install the Azure Information Protection client for you, you can do this yourself. You must be a local administrator for your PC to install this client so that it can label and protect your documents and emails.

In addition:

- The Azure Information Protection client requires a minimum version of Microsoft .NET Framework 4.6.2 and if this is missing, the installer tries to download and install this prerequisite. When this prerequisite is installed as part of the client installation, your computer must be restarted.


## To download and install the Azure Information Protection client

The Azure Information Protection classic client is being deprecated in March, 2021. 

To deploy the AIP classic client, open a support ticket to get download access.

1. Run the **AzInfoProtection.exe** file to start the installation. If you are prompted to continue, click **Yes**.    

1. On the **Install the Azure Information Protection client** page:     
    - Select the option to install a demo policy if you cannot connect to the cloud but want to see and experience the client side of Azure Information Protection by using a local policy for demonstration purposes. When your client connects to an Azure Information Protection service, this demo policy is replaced with your organization's Azure Information Protection policy.    

    - Click **I agree** when you have read the license terms and conditions.    

1. If you are prompted to continue, click **Yes**, and wait for the installation to finish.    

1. Click **Close**. Before you start to use the Azure Information Protection client:    

    - **If your computer runs Office 2010**, restart your computer and then go to the [next section](#installing-the-azure-information-protection-client-with-office-2010) for your final step.  
        
    - **For other versions of Office**, restart all Office applications and all instances of File Explorer. Your installation is now complete and you can use the client to label and protect your documents and emails.    

### Installing the Azure Information Protection client with Office 2010    
After you have installed the Azure Information Protection client by using the previous instructions:    

1. Open Microsoft Word. When this is the first time that you have run an Office 2010 application after you have installed the Azure Information Protection client, you see a **Microsoft Azure Information Protection** dialog box. This dialog box tells you that administrator credentials are required to complete the sign in process.

2. In the **Microsoft Azure Information Protection** dialog box, click **OK**.

3. If you see a **User Access Control** dialog box, click **Yes** so that the Azure Information Protection client can update the registry.

Your installation is now complete and you can use Azure Information Protection to label and protect your documents and emails.

For more information, see [AIP for Windows and Office versions in extended support](../known-issues.md#aip-for-windows-and-office-versions-in-extended-support).

## Other instructions    
More how-to instructions from the Azure Information Protection user guide:

- [What do you want to do?](client-user-guide.md#what-do-you-want-to-do)

## Additional information for administrators    
See [Install the Azure Information Protection client for users](client-admin-guide-install.md) from the [admin guide](client-admin-guide.md).
 
  
