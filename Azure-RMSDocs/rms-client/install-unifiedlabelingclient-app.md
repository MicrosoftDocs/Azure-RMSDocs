---
# required metadata

title: Download & install the Azure Information Protection unified labeling client (Preview)
description: Instructions for users to install the preview version of the Azure Information Protection unified labeling client for Windows, so that you can classify and protect your documents and emails. 
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 10/17/2018
ms.topic: conceptual
ms.collection: M365-security-compliance
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

# Download and install the Azure Information Protection unified labeling client (Preview)

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*

> [!NOTE]
> This client is in preview and is subject to changes. It uses the unified labeling store and downloads policy with sensitivity labels from the Office 365 Security & Compliance Center. To use these labels, they must first be published from the Security & Compliance Center. [More information](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Announcing-the-availability-of-unified-labeling-management-in/ba-p/262492)

You must be a local administrator for your PC to install this preview client so that it can label and protect your documents and emails.

In addition:

- The Azure Information Protection unified labeling client requires a minimum version of Microsoft .NET Framework 4.6.2 and if this is missing, the installer tries to download and install this prerequisite. When this prerequisite is installed as part of the client installation, your computer must be restarted.

- If you have Windows 7 SP1, the Azure Information Protection unified labeling client requires a specific update, KB 2533623. If your PC needs this update but it is not installed, installation completes but with a message that the Azure Information Protection unified labeling client requires this update. Until this update is installed, you won't be able to use all features of the Azure Information Protection unified labeling client. 

## To download and install the Azure Information Protection unified labeling client

Before you install the Azure Information Protection unified labeling client, confirm that you have sensitivity labels in the Office 365 Security & Compliance Center that are published for users. 

If you have labels that are currently published from the Azure portal for Azure Information Protection, you can [migrate these labels](../configure-policy-migrate-labels.md) to the Security & Compliance Center.

1. Download the preview client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=57440).

2. Run the executable file that was downloaded, **AzInfoProtection_For_Unified_Labeling.exe**. If you are prompted to continue, click **Yes**.    

3. On the **Install the Azure Information Protection client** page:     
    - Select the option to install a demo policy if you cannot connect to the cloud but want to see and experience the client side of Azure Information Protection by using a local policy for demonstration purposes. When your client connects to the Office 365 Security & Compliance Center, this demo policy is replaced with your organization's label policy.

    - Click **I agree** when you have read the license terms and conditions.    

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

## Next steps

To learn more about the unified labeling store that the Office 365 Security & Compliance center now uses, read the following blog post: [Announcing the availability of unified labeling management in the Security & Compliance Center](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Announcing-the-availability-of-unified-labeling-management-in/ba-p/262492).

