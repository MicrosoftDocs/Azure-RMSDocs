---
# required metadata

title: Tasks that you did with the RMS sharing application - AIP
description: Instructions for users who have upgraded from the RMS sharing application to the Azure Information Protection client. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 01/14/2019
ms.topic: conceptual
ms.service: information-protection
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

# User Guide: Tasks that you used to do with the RMS sharing application

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

Recently upgraded from the Rights Management sharing application (also known as just the "RMS sharing app") to the Azure Information Protection client? 

Use the following information to help you get up and running quickly.

|The RMS sharing app|How to do this with the Azure Information Protection client
|-----------|--------------------|
|Protect a file on a device <br /><br />Also known as "protect in place"|For Office apps: Select a label that applies the required protection, or set custom permissions.<br /><br />For other files: Use the File Explorer menu option, **Classify and protect** to open the **Classify and protect - Azure Information Protection** dialog box. Then select a label that applies the required protection, or specify your own custom permissions. <br /><br />For more information, see [Classify and protect a file or email](client-classify-protect.md).
|Protect a file that you share by email <br /><br />Also known as "share protected"|Using Outlook, apply a label with the required protection to your email message, or select the Outlook **Do Not Forward** option. Unprotected attachments that have a [supported file type](https://support.office.com/article/bb643d33-4a3f-4ac7-9770-fd50d95f58dc#FileTypesforIRM) are automatically protected.<br /><br />Note: To track a protected document that you email, protect it first and then attach it to the email message.<br /><br />For more information, see [Classify and protect a file or email](client-classify-protect.md).
|Change permissions on protected files <br /><br />Also known as "re-protect"|For Office apps that display the Azure Information Protection bar: Select a label that applies the required protection.<br /><br />For other files, and if the Azure Information Protection client is in [protection-only mode](client-protection-only-mode.md): Use the File Explorer menu option, **Classify and protect** to open the **Classify and protect - Azure Information Protection** dialog box. Then select a label that applies the required protection, or specify your own custom permissions.<br /><br />For more information, see [Classify and protect a file or email](client-classify-protect.md).
|Track and revoke documents|From Word, Excel, and PowerPoint: Open the document and then, on the **Home** tab > **Protection** group > **Protect** > **Track and revoke**<br /><br />From File Explorer: Right click a file or folder > **Classify and protect**. Then in the **Classify and protect - Azure Information Protection** dialog box, click **Track and revoke**. <br /><br />When you use PowerShell from the current preview version of the Azure Information Protection client: Use the *EnableTracking* parameter with the [Set-AIPFileLabel](/powershell/azureinformationprotection/vlatest/set-aipfilelabel) cmdlet to register the labeled document for tracking.<br /><br />For more information, see [Track and revoke your documents](client-track-revoke.md).
|View and use files that have been protected|You must have Office installed for protected Office documents. The Azure Information Protection Viewer can open many other protected files so that you can read them, and also print and save these files if you have permissions to do these actions. This viewer is automatically installed with the client, or you can install it separately.<br /><br />For more information, see [Open files that have been protected](client-view-use-files.md).
|Remove protection from files|Use the File Explorer menu option, **Classify and protect** to open the **Classify and protect - Azure Information Protection** dialog box. <br /><br />Then, for a single file, clear the **Protect with custom permissions** option. For multiple files or a folder, click **Remove custom permissions**.<br /><br />For more information, see [Remove labels and protection from files and emails](client-remove-label-protection.md).|

## Can't find the option you're looking for?

If you're looking for a specific option that you're used to selecting with the RMS sharing application, check the following table.

|Option in the RMS sharing app|Information
|-----------|--------------------|
|**Share Protected**|This option is no longer available from the Office ribbon. Instead of sharing directly from within your Office application, use File Explorer's right-click option, **Classify and protect** to protect a copy of the document with custom permissions, and then share the file using your choice of email client, or sharing location. <br /><br /> You can also attach an unprotected Office document to an email that you protect, and the document is automatically protected with the same restrictions. However, you cannot track and revoke this document.
|**Email me when somebody tries to open these documents**|Use the document tracking site to configure your preferred email notification setting: Locate the protected document that you shared > **Settings** > **Email notifications**
|**Allow me to instantly revoke access to these documents**|This option is no longer available. Use administrator-defined protection settings that do not allow offline access. Additionally, an administrator can reduce the use license validity period for your tenant, by running [Set-AadrmMaxUseLicenseValidityTime](/powershell/aadrm/vlatest/set-aadrmmaxuselicensevaliditytime).
|**Track Usage** in Outlook|The ability to access the document tracking site from Outlook is no longer available. Instead, use the **Track and revoke** option from Word, PowerPoint, Excel, or File Explorer. Or, using a browser, you can go directly to the [document tracking site](https://go.microsoft.com/fwlink/?LinkId=529562).

## Next steps
More how-to instructions from the Azure Information Protection user guide:

- [What do you want to do?](client-user-guide.md#what-do-you-want-to-do)

## Additional information for administrators    
See the [Azure Information Protection client administrator guide](client-admin-guide.md).

  
