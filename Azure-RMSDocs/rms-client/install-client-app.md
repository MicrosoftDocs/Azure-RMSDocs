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
#ms.devlang:
ms.subservice: v1client
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: user

---

# User Guide: Download and install the Azure Information Protection classic client

>***Applies to**: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8*
>
>***Relevant for**: [Azure Information Protection classic client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients). For the unified labeling client, see the [unified labeling user guide](install-unifiedlabelingclient-app.md).*

[!INCLUDE [AIP classic client is sunset - extended support customers](../includes/classic-client-sunset-extended-support.md)]

If your administrator does not install the Azure Information Protection client for you, you can do this yourself. You must be a local administrator for your PC to install this client so that it can label and protect your documents and emails.



## To download and install the Azure Information Protection client

The Azure Information Protection classic client was sunset on March 31, 2021. To deploy the AIP classic client, open a support ticket to get download access.

The Azure Information Protection client requires a minimum version of Microsoft .NET Framework 4.6.2. If this is missing, the installer tries to download and install this prerequisite. When this prerequisite is installed as part of the client installation, your computer must be restarted.

1. Run the **AzInfoProtection.exe** file to start the installation. If you are prompted to continue, click **Yes**.    

1. On the **Install the Azure Information Protection client** page:     
    - Select the option to install a demo policy if you cannot connect to the cloud but want to see and experience the client side of Azure Information Protection by using a local policy for demonstration purposes. When your client connects to an Azure Information Protection service, this demo policy is replaced with your organization's Azure Information Protection policy.    

    - Click **I agree** when you have read the license terms and conditions.    

1. If you are prompted to continue, click **Yes**, and wait for the installation to finish.    

1. Click **Close**. 

    Before you start to use the Azure Information Protection client, restart all Office applications and all instances of File Explorer. Your installation is now complete and you can use the client to label and protect your documents and emails.

    > [!NOTE]
    > If your computer runs Office 2010, restart your computer and then go to the [next section](#installing-the-azure-information-protection-client-with-office-2010) for your final step.  

### Installing the Azure Information Protection client with Office 2010

> [!IMPORTANT]
> Office 2010 extended support ended on October 13, 2020. For more information, see [AIP and legacy Windows and Office versions](../removed-sunset-services.md#aip-and-legacy-windows-and-office-sharepoint-and-exchange-versions).
> 

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
 
  
