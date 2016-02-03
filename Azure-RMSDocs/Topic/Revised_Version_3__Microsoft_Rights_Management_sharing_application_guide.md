---
title: Revised Version 3: Microsoft Rights Management sharing application guide
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.assetid: 846f1895-1daf-4164-8cf6-e4a691384c41
author: Cabailey
robots: noindex,nofollow
---
# Revised Version 3: Microsoft Rights Management sharing application guide
Use this guide for the Microsoft Rights Management (RMS) sharing application for Windows to help you keep important documents and pictures safe from people who should not see them, even if you email them or save them to another device. Similarly, this application lets you open and use files that other people have protected by using the same Rights Management technology.

This sharing application provides this protection for your files in the following ways:

-   It adds functionality to File Explorer (also known as Windows Explorer in Windows 7 and earlier versions) so that when you manage files in a folder, you can easily protect a single file, bulk-protect multiple files, or protect all files within a folder.

-   It provides protection for all file types and has a built-in viewer for commonly used text and image file types.

-   It adds the **Share Protected** button to the Microsoft Office toolbar for Word, PowerPoint, and Excel.

All you need is a computer that runs Windows 7 or Windows 8, and a local administrator account to install the RMS sharing application. Then download and install this free application from Microsoft.

If you have questions that are not answered by this guide, see [FAQ for Microsoft Rights Management Sharing Application for Windows](http://go.microsoft.com/fwlink/?LinkId=303971).

## Examples for using the RMS sharing application
Here are just some examples of how you might use the RMS sharing application, to help protect your files.

|Scenario|Solution using the RMS sharing application|
|------------|----------------------------------------------|
|**I want to safely copy a company-confidential document to another device**<br /><br />You’re using your PC to work on a strategy paper that is company-confidential and you want to copy it to a USB thumb drive so that you can continue to work on it when you leave the office and do not have access to the company network.|You have the RMS sharing application installed on both your PC and your laptop. You use File Explorer on your PC to protect the file by using a template, so that it cannot be accessed by people outside your company. You then copy the file to your thumb drive, attach the thumb drive to you laptop and continue to work on the document. If you drop the thumb drive or your laptop is stolen, nobody outside your company can access the document.|
|**I want to safely share financial information with somebody I trust who is outside my organization**<br /><br />You work with a partner company and want to email them an Excel spreadsheet that contains projected sales figures. You want them to be able to view the figures but not change them.|You use the **Share Protected** button on the ribbon in Excel, type the email addresses of the two people that you work with in the partner company, select **Viewer** on the slider, and click **Send**.<br /><br />When the email arrives at the partner company, only the recipients in the email can view the spreadsheet and they cannot save, edit, print, or forward it.|
|**I need to safely send an engineering diagram by email to somebody who uses an iOS device**<br /><br />Your company uses a custom engineering application and you want to email a highly confidential diagram to a coworker, who you know, regularly checks email on their iOS device.|You use File Explorer to right-click the file, and select **Share Protected**. The RMS sharing application recognizes that the file extension is not from an application that natively supports RMS, so when it attaches the file to an email message, it automatically converts it to a generically protected file, and automatically selects the **Allow consumption on all devices** option.<br /><br />The recipient receives the email on their iOS device, clicks the link in the email that tells them how to download the RMS sharing application, installs the version for iOS devices, and then views the diagram.|
|**My company doesn’t use Rights Management, but I’ve received an email message with an attachment that’s protected by RMS**<br /><br />The email sender is somebody who you trust because you’ve done business with them in the past and you suspect that they might be sending you information about a potential new business opportunity.|You click the link in the email that tells you how to download the RMS sharing application for your computer, install it, and then sign up for RMS for individuals. Microsoft confirms that your organization does not have a subscription to Office 365, sends you an email to complete the free signup process, and you sign in with your new account. You can then open the email attachment to read about the new business opportunity.|

## <a name="BKMK_Install"></a>How to download and install the RMS sharing application
> [!IMPORTANT]
> You must have a local administrator account to install the RMS sharing application. If you do not log in as a local administrator, you can use the **Run as administrator** option when you run Setup.exe in step 3.

To install the RMS sharing application, follow these steps:

1.  Go to the [Microsoft Rights Management](http://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website.

2.  In the **Computers** section, click the icon for the **RMS app for Windows** and save the Microsoft Rights Management sharing application installation package to your computer.

3.  Double click the compressed file that was downloaded, and then double-click **setup.exe**. If you are prompted to continue, click **Yes**.

4.  On the **Setup Microsoft RMS** page, click **Next**, and wait for the installation to finish.

5.  When the installation finishes, click **Restart** to restart your computer and complete the installation. Or, click **Close** and restart your computer later to complete the installation.

You’re now ready to start protecting your files or read files that others have protected.

## <a name="BKMK_UsingMSRMSApp"></a>What do you want to do?
Use the following instructions to help you work with protected files.

### <a name="BKMK_CreatePTXT"></a>Create a protected text file
You can convert a regular text (.txt) file into a protected file that then has a .ptxt file extension.

##### To create a protected text (.ptxt) file

1.  In File Explorer, right-click in a folder, click **New**, and then click **Text Document**.

2.  Rename the file (for example, Sample.txt).

3.  Double-click the file to open it in Notepad.

4.  In Notepad, add a few lines of text to the file, and then save it. You can use the following as your example text.

    ```
    This is a sample text file.
    This is a sample text file.
    This is a sample text file.
    This is a sample text file. 
    This is a sample text file.
    This is a sample text file.
    ```

5.  Right-click the file, click **Protect in-place**, and select a template from the list. If this is the first time you have used the RMS sharing application, you will first need to select **Company- Protection**, which downloads the templates for your organization.

6.  On the **Microsoft Rights Management sharing application** screen, confirm the policy you want to apply, click **Apply**, and after the file is protected, click **Close**.

### <a name="BKMK_ViewPTXT"></a>View a protected text file (.ptxt) or a protected image file
To view a protected text (.ptxt) file, in File Explorer, double-click the file (for example, Sample.ptxt). You might be prompted for credentials. When the file opens, you’ll see the file’s protection policy at the top of the file.

You view and open protected images in the same way.

### <a name="BKMK_CreatePFILE"></a>Create a generic protected file
Use the generic protection (.pfile) file format to offer a generic level of protection for file types that are not directly supported by the RMS sharing application or other applications that provide built-in RMS-type protection. You can use the [Microsoft Rights Management](http://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website to quickly check which applications support RMS built-in protection.

For example, because Microsoft Visio does not currently support built-in protection for RMS, you can use generic protection for .vsd files that you create with Microsoft Visio.

> [!TIP]
> What’s the difference between built-in (native) protection and generic protection?
> 
> -   When you generically protect a file, unauthorized people cannot open the file. But after authorized people open the file, they could then forward it unprotected to other people or save it in a location that others could access. They do, however, see a message at the top of the file that tells them  what permissions they have for the file, and they are asked to honor these, but this protection cannot be enforced. In addition, when you generically protect a file, you cannot restrict the permissions further than authorization. For example, if you use custom permissions, the slider in the RMS sharing application automatically selects **CO_OWNER** and you cannot change this for more restrictive permissions, such as **VIEWER** or **CO-AUTHOR**.
> -   In comparison, when you use the built-in protection of RMS with applications that support this (for example, Office files), the protection applies to the file even if the file is then sent to somebody else or saved in another location. And, when you protect these files, you can use restrictive permissions such as read-only, or the permission to edit but not print or copy. For example, if you use custom permissions, the slider in the RMS sharing application automatically selects **REVIEWER** for the permissions, which you can then change to be more or less restrictive.

##### Example: To create a generic protected file (.pfile) from a Visio drawing (.vsd) file

1.  In File Explorer, right-click in a folder, click **New**, and then click **New Visio Document**.

2.  Rename the file (for example, Sample.vsd).

3.  Double-click the file to open it in Visio.

4.  In Visio, add elements to the drawing, and then save and close the file.

5.  Right-click the file, click **Protect in-place**, and select a policy template from the list. If this is the first time you have used the RMS sharing application, you will first need to select **Company- Protection**, which downloads the templates for your organization.

6.  On the **Microsoft Rights Management sharing application** screen, select the policy you want to apply, and then click **Apply**.

7.  A message states your protected file was saved as a .pfile file (for example, Sample.vsd.pfile). The original file is deleted.

### <a name="BKMK_ViewPFILE"></a>View a generic protected (.pfile) file
To view a generic protected (.pfile) file, in File Explorer, double-click the generic protected (.pfile) file (for example, Sample.vsd.pfile), and click **Open**.

### <a name="BKMK_Unprotect"></a>Remove protection from a file
To remove protection from a file (that is, unprotect a file) that was previously protected, use the **Remove Protection** option:

1.  Right-click the file (for example, Sample.ptxt), click **Protect in-place**, and then click **Remove Protection**. You might be prompted for credentials.

2.  The original protected file is deleted (for example, Sample.ptxt) and replaced with a file that has the same name but with the unprotected file name extension (for example, Sample.txt).

### <a name="BKMK_ProtectCustom"></a>Protect a file with your own custom permissions
The easiest way to protect a file is to use templates but you can also specify your own permissions. This is called user-authored protection and it is useful for the following situations:

-   You want to limit file access to only a specific list of individual users that are identified by their email addresses.

-   You want to limit the use of the file to only specific rights, such as read-only rights to a document.

To protect a file with user-authored permissions, right-click the file, click **Protect in-place**, and then click **Custom Permissions**. You will see the following screen:

![](../Image/ADRMS_MSRMSApp_ProtectCustom.gif)

Type the email addresses of the users, use the slider to select permissions for the file, and then click **Apply**.

### <a name="BKMK_UserDefined"></a>Use files that have custom protection
Most protected files that you open will have been protected by applying templates. However, users can also protect files by using their own custom permissions, which is called user-authored protection.

For text and image file formats, this level of protection requires that any applications that you use to edit, save, or restrict these files have been designed to support RMS protection and that they implement the protection APIs that are provided in the AD RMS SDK.

When you view a protected text file that has user-authored protection, you will notice a slight difference in the permissions as they are displayed for the file as shown in the following example.

For files that are protected by using the generic protection (.pfile) file format, the specific rights or permissions that were specified by the user appears in the confirmation screen instead of the name of the template that was used to protect the file, as shown in the following picture.

![](../Image/ADRMS_MSRMSApp_SP_ConsumePfile.gif)

### <a name="BKMK_ShareProtected"></a>Protect content to share by email
To protect content that you want to share by using an email message, right-click the file, and click **Share Protected**. You will see the following screen:

![](../Image/ADRMS_MSRMSAPP_SP_ShareProtected.gif)

Type the email addresses of the list of users, use the slider to select permissions for the file, and click **Send**. Outlook then creates an email message for the recipients with a short message that you can change, and attaches the protected file attached. The original file is not protected.

To let people view protected files on non-Windows devices, click **Allow consumption on all devices**. Users might have to download the RMS sharing application for their device, and there is a link to do this in the email.

### <a name="BKMK_Multiple"></a>Apply protection to multiple files and folders
You don’t have to apply protection to files one-by one when you use File Explorer. Instead, you can select multiple files, or all files in a folder if these files are not already protected.

##### To protect multiple files or all files within a selected folder

1.  In File Explorer, either select multiple files or select a folder that contains files to be protected.

2.  Right-click the selected folder or files, click **Protect in-place**, and select a template from the list. If this is the first time you have used the RMS sharing application, you will first need to select **Company- Protection**, which downloads the templates for your organization.

3.  On the **Microsoft Rights Management sharing application** screen, confirm the files have been protected.

> [!TIP]
> If you see any errors, refer to [FAQ for Microsoft Rights Management Sharing Application for Windows](http://go.microsoft.com/fwlink/?LinkId=303971).

### <a name="BKMK_OfficeToolbar"></a>Use the Office toolbar add-in
You can protect and share files in Word, PowerPoint, and Excel  directly from within Microsoft Office by using the Office ribbon add-in for Microsoft Rights Management sharing application.

In the **Protection** group, click **Share Protected** to start the Microsoft Rights Management sharing application.

![](../Image/ADRMS_MSRMSApp_SP_OfficeToolbar.png)

### <a name="BKMK_AccessKeys"></a>Use keyboard shortcuts
Press the **Alt** key to see the available access keys, and then press **Alt** + the access key to select an option.

For example, in the **share protected** dialog box, press **Alt** to see the access keys, and then press **Alt + u** to select the **Users must login every time they open this file** check box.

![](../Image/ADRMS_MSRMSApp_AccessKeys.png)

## See Also
[Microsoft Rights Management sharing application download](http://go.microsoft.com/fwlink/?LinkId=303970)
 [FAQ for Microsoft Rights Management Sharing Application for Windows](http://go.microsoft.com/fwlink/?LinkId=303971)

