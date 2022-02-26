---
# required metadata

title: Download & install the Azure Information Protection unified labeling client
description: Instructions for users to install the Azure Information Protection unified labeling client for Windows, so that you can classify and protect your documents and emails. 
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 05/06/2020
ms.topic: how-to
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

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), Windows 11, Windows 10, Windows 8.1, Windows 8*
>
> ***Relevant for**: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients).*

If your administrator does not install the Azure Information Protection unified labeling client for you, you can do this yourself. You must be a local administrator for your PC to install this client so that it can label and protect your documents and emails.

> [!NOTE]
> The Azure Information Protection unified labeling client requires a minimum version of Microsoft .NET Framework 4.6.2. If this is missing, the installer tries to download and install this prerequisite. When this prerequisite is installed as part of the client installation, your computer must be restarted.
>

## To download and install the Azure Information Protection unified labeling client

Before you install the Azure Information Protection unified labeling client, confirm with your administrator or help desk that you are using [sensitivity labels](/microsoft-365/compliance/sensitivity-labels) to classify and protect documents and emails.

1. Download **AzInfoProtection_UL.exe** from the [Microsoft Download Center](https://www.microsoft.com/download/details.aspx?id=53018).

2. Run the executable file that was downloaded, and if you are prompted to continue, click **Yes**.

3. On the **Install the Azure Information Protection client** page, click **I agree** when you have read the license terms and conditions.

4. If you are prompted to continue, click **Yes**, and wait for the installation to finish.

6. Click **Close**. 

    Before you start to use the Azure Information Protection unified labeling client, restart all Office applications and all instances of File Explorer. Your installation is now complete and you can use the client to label and protect your documents and emails.

    > [!NOTE]
    > If your computer runs Office 2010, restart your computer and then go to the [next section](#installing-the-azure-information-protection-unified-labeling-client-with-office-2010) for your final step.   
    >
     
### Installing the Azure Information Protection unified labeling client with Office 2010

> [!IMPORTANT]
> Office 2010 extended support ended on October 13, 2020. For more information, see [AIP and legacy Windows and Office versions](../known-issues.md#aip-and-legacy-windows-and-office-versions).
> 

After you have installed the Azure Information Protection unified labeling client by using the previous instructions:

1. Open Microsoft Word. When this is the first time that you have run an Office 2010 application after you have installed the Azure Information Protection client, you see a **Microsoft Azure Information Protection** dialog box. This dialog box tells you that administrator credentials are required to complete the sign in process.

2. In the **Microsoft Azure Information Protection** dialog box, click **OK**.

3. If you see a **User Access Control** dialog box, click **Yes** so that the Azure Information Protection client can update the registry.

Your installation is now complete and you can use the Azure Information Protection unified labeling client to label and protect your documents and emails.

## Other instructions    
More how-to instructions from the Azure Information Protection unified labeling client user guide.

- [What do you want to do?](clientv2-user-guide.md#what-do-you-want-to-do)

## Additional information for administrators    
See [Install the Azure Information Protection unified labeling client for users](clientv2-admin-guide-install.md) from the [admin guide](clientv2-admin-guide.md).