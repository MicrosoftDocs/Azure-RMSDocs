---
# required metadata

title: View protected files with the Azure Information Protection unified labeling client
description: Instructions to view a protected file that requires you to have the Azure Information Protection unified labeling viewer installed.
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

# User Guide: View protected files with the Azure Information Protection unified labeling client

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

You can often view a protected file by simply opening it. For example, you might double-click an attachment in an email message or double-click a file from File Explorer, or you might click a link to a file.

If the files don't immediately open, the **Azure Information Protection viewer** might be able to open it. This viewer can open protected text files, protected image files, protected PDF files, and all files that have a **.pfile** file name extension.

The viewer automatically installs as part of the Azure Information Protection unified labeling client, or you can install it separately. You can install both this client and the viewer from the [Microsoft Azure Information Protection](https://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website. For more information about installing this client, see [Download and install the Azure Information Protection unified labeling client](install-unifiedlabelingclient-app.md).

> [!NOTE]
> Although installing the client provides more functionality, it requires local administrator permissions and the full functionality requires a corresponding service for your organization. For example, Azure Information Protection.
> 
> Install the viewer if you have been sent a protected document by somebody from another organization or if you do not have local administrator permissions to your PC.

To be able to open a protected document, the application must be "RMS-enlightened". Office apps and the Azure Information Protection viewer are examples of RMS-enlightened applications. To see a list of applications by type and supported devices, see the [RMS-enlightened applications](../requirements-applications.md#rms-enlightened-applications) table. 

## Message.rpmsg as an email attachment

If you see **message.rpmsg** as a file attachment in an email, this file is not a protected document but a protected email message that displays as an attachment. You can't use the Azure Information Protection viewer for Windows to view this protected email message on your Windows PC. Instead, you need an email application for Windows that supports Rights Management protection, such as Office Outlook. Or you can use Outlook on the web.

However, if you have an iOS or Android device, you can use the Azure Information Protection app to open these protected email messages. You can download this app for these mobile devices from the [Microsoft Azure Information Protection](https://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website.

## Prompts for authentication

Before you can view the protected file, the Rights Management service that was used to protect the file must first confirm that you are authorized to view the file. The service does this confirmation by checking your user name and password. In some cases, these credentials might be cached and you do not see a prompt that asks you to sign in. In other cases, you are prompted to supply your credentials.

If your organization does not have a cloud-based account for you to use (for Office 365 or Azure) and does not use an equivalent on-premises version (AD RMS), you have two options:

- If you were sent a protected email, follow the instructions to sign in with your social identity provider (such as Google for a Gmail account) or apply for a one-time passcode.

- You can apply for a free account that will accept your credentials so that you can open documents that are protected by Rights Management. To apply for this account, click the link to apply for [RMS for individuals](https://go.microsoft.com/fwlink/?LinkId=309469) and use your company email address rather than a personal email address. 

## To view a protected file

1. Open the protected file (for example, by double-clicking the file or attachment, or by clicking the link to the file). If you are prompted to select an app, select **Azure Information Protection Viewer**. 

2. If you see a page to **Sign in** or **Sign up**: Click **Sign in** and enter your credentials. If the protected file was sent to you as an attachment, be sure to specify the same email address that was used to send you the file.
    
    If you do not have an account that is accepted, see the [Prompts for authentication](#prompts-for-authentication) section on this page.

3. A read-only version of the file opens in the **Azure Information Protection Viewer** or in the application associated with the file name extension.

4. If you have additional protected files to open, you can browse directly to them from the viewer, by using the **Open** option. Your selected file replaces the original file in the viewer. 

> [!TIP]
> If the protected file does not open and you have the full Azure Information Protection client installed, try the **Reset Settings** option. To access this option, from an Office app, select the **Sensitivity** button > **Help and Feedback** > **Reset Settings**. 
> 
> [More information about the Reset Settings option](clientv2-admin-guide.md#more-information-about-the-reset-settings-option)

## Other instructions
More how-to instructions from the Azure Information Protection user guide:

- [What do you want to do?](client-user-guide.md#what-do-you-want-to-do)

