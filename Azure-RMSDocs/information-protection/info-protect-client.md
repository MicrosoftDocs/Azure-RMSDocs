---
# required metadata

title: Installing the Azure Information Protection client | Azure Rights Management
description:
author: cabailey
manager: mbaldwin
ms.date: 07/23/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 4445adff-4c5a-450f-aff8-88bf5bd4ca78

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Installing the Azure Information Protection client

*Applies to: Azure Information Protection preview*

To classify documents and email messages by using Azure Information Protection, you must first install the Azure Information Protection client. This installation adds an Information Protection bar to your Office applications (Word, Excel, PowerPoint, Outlook) that displays the classification labels for your organization, in addition to a new **Protection** group on the **Home** tab, that has a button labeled **Protect**:

![Azure Information Protection quick start tutorial step 3 - client installed](../media/word2013-callouts.png)

Download the Azure Information Protection client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

Before you install the client, check that you have the required operating system versions and applications: [Requirements for Azure Information Protection](requirements-azure-infoprotect.md).


## To install the Azure Information Protection client manually

1. After you have [downloaded the client]((https://www.microsoft.com/en-us/download/details.aspx?id=53018), run **AZInfoProtection.exe** and follow the prompts to install the client.

    Select the option to install a demo policy if you do not have Office 365 or Azure Active Directory, but want to see and experience the client side of Azure Information Protection by using a local policy for demonstration purposes. When your client connects to an Azure Information Protection service, this demo policy is replaced with your organization's Azure Information Protection policy. 

2. If your computer runs Office 2010, restart your computer. For other versions of Office, restart any Office applications.

## To install the Azure Information Protection client for users

- You can script and automate the installation of the Azure Information Protection client by packaging AZInfoProtection.exe and using standard [Windows Installer (msiexec) command line options](https://technet.microsoft.com/library/cc759262(v=ws.10).aspx).

    For example, if the packaged version you create is named InfoProtect.msi and you want to install the client silently: `msiexec /qn InfoProtection.msi`


## To uninstall the Azure Information Protection client

- Use Control Panel to uninstall a program: Click **Microsoft Azure Information Protection** > **Uninstall**

## To verify installation and connection status

1. Open an Office application and on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and feedback**.

2. In the **Microsoft Azure Information Protection** dialog box, note the following:

    - The last connection time date and time that should show a recent date and time for when the client connected to your organization's Azure Information Protection service.

    - Your displayed user name that should show your work or school account for Office 365 or Azure Active Directory tenant.

    - The version of the Azure Information Protection client.

## File locations

Client files:	

- For 64-bit operating systems: **\ProgramFiles (x86)\Microsoft Azure Information Protection**

- For 32-bit operating systems: **\Program Files\Microsoft Azure Information Protection**

Cient logs files and latest policy files:

- **%localappdata%\Microsoft\MSIP\logs**.


## Next steps

To change the labels on the Information Protection bar, you must configure the Azure Information Protection policy. For more information, see [Configuring Azure Information Protection policy](configure-policy.md).

For an example of how to customize the default policy, and see the resulting behavior in an Office application, try the [Quick start tutorial for Azure Information Protection](infoprotect-quick-start-tutorial.md). 
