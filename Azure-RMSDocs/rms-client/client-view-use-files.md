---
# required metadata

title: View and use protected documents with the AIP client
description: Instructions to view and use a protected document that requires you to have the Azure Information Protection client installed.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 04/17/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: ce1c7d4c-b5ff-4672-8b9a-a72129bac992

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# User Guide: View and use files that have been protected by Rights Management

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*
>
> *Instructions for: [Azure Information Protection client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*

You can often view a protected document by simply opening it. For example, you might double-click an attachment in an email message or double-click a file from File Explorer, or you might click a link to a file.

If the files don't immediately open, the **Azure Information Protection viewer** might be able to open it. This viewer can open protected text files, protected image files, protected PDF files, and all files that have a **.pfile** file name extension.

The viewer automatically installs as part of the Azure Information Protection client, or you can install it separately. You can install both the client and the viewer from the [Microsoft Azure Information Protection](https://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website. For more information about installing the client, see [Download and install the Azure Information Protection client](install-client-app.md).

> [!NOTE]
> Although installing the client provides more functionality, it requires local administrator permissions and the full functionality requires a corresponding service for your organization. For example, Azure Information Protection or Active Directory Rights Management Services.
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

## To view and use a protected document

1. Open the protected file (for example, by double-clicking the file or attachment, or by clicking the link to the file). If you are prompted to select an app, select **Azure Information Protection Viewer**. 

2. If you see a page to **Sign in** or **Sign up**: Click **Sign in** and enter your credentials. If the protected file was sent to you as an attachment, be sure to specify the same email address that was used to send you the file.
    
    If you do not have an account that is accepted, see the [Prompts for authentication](#prompts-for-authentication) section on this page.

3. A read-only version of the file opens in the **Azure Information Protection Viewer**. If you have sufficient permissions, you can print the file, and edit it. 

    You can check your permissions for the file by clicking **Permissions**. From the **Permissions** dialog box, you can also identify the file owner to contact if you want to request a new version of the file with additional permissions.
    
    For more detailed information about the permissions and the usage rights that each contains, see [Rights included in permissions levels](../configure-usage-rights.md#rights-included-in-permissions-levels).

4. To edit the file, click **Save As**, which lets you save the protected file to its original file name extension. You can then edit the file by using the application that's associated with that file type. At this point, the file's label and protection is removed.
    
    Note that because the viewer is for protected files, the **Save As** button is enabled only for protected files.
    
5. When you have finished editing the file, in File Explorer, right-click the file to reapply the label. This action reapplies the protection.

6. If you have additional protected files to open, you can browse directly to them from the viewer, by using the **Open** option. Your selected file replaces the original file in the viewer. 

> [!TIP]
> If the protected file does not open and you have the full Azure Information Protection client installed, try the **Reset Settings** option. To access this option, from an Office app, select the **Protect** button > **Help and Feedback** > **Reset Settings**. 
> 
> [More information about the Reset Settings option](client-admin-guide.md#more-information-about-the-reset-settings-option)

## Other instructions
More how-to instructions from the Azure Information Protection user guide:

-   [What do you want to do?](client-user-guide.md#what-do-you-want-to-do)

