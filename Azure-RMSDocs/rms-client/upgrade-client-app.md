---
# required metadata

title: Tasks that you used to do with the RMS sharing application
description: Instructions for users who have upgraded from the RMS sharing application to the Azure Information Protection client. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/30/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: d7bc2478-c22f-4e19-9992-012658362b25


# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: eymanor
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Tasks that you used to do with the RMS sharing application

Recently upgraded from the Rights Management sharing application (also known as just the "RMS sharing app") to the Azure Information Protection client? 

Use the following information to help you get up and running quickly.

|Task using the RMS sharing app|How to do this with the Azure Information Protection client
|-----------|--------------------|
|Protect a file on a device by using menu options in File Explorer <br /><br />Also known as "protect in place"|Use the File Explorer menu option, **Classify and protect** to open the **Classify and protect - Azure Information Protection** dialog box. <br /><br />Then select a label that automatically applies protection, or specify your own custom permissions. <br /><br />For more information, see [Classify and protect a file or email](client-classify-protect.md).
|Protect a file that you share by email <br /><br />Also known as "share protected"|Using a copy of the file, use the File Explorer menu option, **Classify and protect** to open the **Classify and protect - Azure Information Protection** dialog box. <br /><br />Select **Protect with custom permissions** to specify email addresses and custom permissions.<br /><br /> Finally, share the file using your standard sharing mechanism, such as an attachment to an email or an invitation to a SharePoint Online document.<br /><br />For more information, see [Set custom protection for a file and then share it with others](client-protect-share.md).
|Change permissions on protected files <br /><br />Also known as "re-protect"|Use the File Explorer menu option, **Classify and protect** to open the **Classify and protect - Azure Information Protection** dialog box. <br /><br />Select **Protect with custom permissions** to specify email addresses and custom permissions.<br /><br />For more information, see [Classify and protect a file or email](client-classify-protect.md).
|Track and revoke documents|For the Office applications, Word, Excel, PowerPoint, and Outlook: On the Home tab, in the **Protection** group, click **Protect** > **Track usage**<br /><br />From File Explorer: Right click a file or folder to open the **Classify and protect - Azure Information Protection** dialog box. Click **Track and revoke**. <br /><br />For more information, see [Track and revoke your documents](client-track-revoke.md).
|View and use files that have been protected|The Azure Information Protection viewer can open protected files that your installed applications can't open. This viewer is automatically installed with the client, or you can install it separately.<br /><br />For more information, see [Open files that have been protected](client-view-use-files.md).
|Remove protection from files|Use the File Explorer menu option, **Classify and protect** to open the **Classify and protect - Azure Information Protection** dialog box. <br /><br />Then, for a single file, clear the **Protect with custom permissions** option. For multiple files or a folder, click **Remove custom permissions**.<br /><br />For more information, see [Remove labels and protection from files and emails](client-remove-label-protection.md).|

## Can't find the option you're looking for?

If you're looking for a specific option that you're used to selecting with the RMS sharing application, check the following table.

|Option in the RMS sharing app|Information
|-----------|--------------------|
|**Share Protected**|This option is no longer available from the Office ribbon. Instead of sharing directly from within your Office application, use File Explorer's right-click option, **Classify and protect** to protect a copy of the document with custom permissions and then share the file using your choice of email client, or sharing location.
|**Email me when somebody tries to open these documents**|This option is no longer available. Instead, use the document tracking site
|**Allow me to instantly revoke access to these documents**|This option is no longer available. Configure templates that do not allow offline access. Additionally, consider whether you need to reduce the use license validity period for your tenant, by running [Set-AadrmMaxUseLicenseValidityTime](/powershell/aadrm/vlatest/set-aadrmmaxuselicensevaliditytime) 







[!INCLUDE[Commenting house rules](../includes/houserules.md)]  
