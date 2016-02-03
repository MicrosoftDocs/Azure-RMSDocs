---
title: Rights Management sharing application user guide - revision for single topic
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.assetid: f10c8e7e-aa83-473d-857a-f01a7908552e
author: Cabailey
robots: noindex,nofollow
---
# Rights Management sharing application user guide - revision for single topic
The Microsoft Rights Management (RMS) sharing application for Windows helps you keep important documents and pictures safe from people who shouldn’t see them, even if you email them or save them to another device. You can also use this application to open and use files that other people have protected by using the same Rights Management technology.

All you need is a computer that runs at least Windows 7, and a local administrator account to install the RMS sharing application. Then [download and install](http://go.microsoft.com/fwlink/?LinkId=303970) this free application from Microsoft.

If you have questions that are not answered by this guide, see [FAQ for Microsoft Rights Management Sharing Application for Windows](http://go.microsoft.com/fwlink/?LinkId=303971).

Here are just some examples of how you might use the sharing application, to help protect your files.

|I want to …|How to do this|
|---------------|------------------|
|**… safely share financial information with somebody I trust who is outside my organization**<br /><br />You work with a partner company and want to email them an Excel spreadsheet that contains projected sales figures. You want them to be able to view the figures but not change them.|You use the Share Protected button on the ribbon in Excel, type the email addresses of the two people that you work with in the partner company, select Viewer on the slider, and click Send.<br /><br />When the email arrives at the partner company, only the recipients in the email can view the spreadsheet and they cannot save, edit, print, or forward it.<br /><br />Details: See **Protect a file that you share by email** in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.|
|**… safely send a document by email to somebody who uses an iOS device**<br /><br />You want to email a highly confidential Word document to a coworker, who you know, regularly checks email on their iOS device.|You use File Explorer to right-click the file, and select Share Protected. In the RMS sharing application, you select the Allow consumption on all devices option, and send the file as an attachment to your coworker.<br /><br />The recipient receives the email on their iOS device, clicks the link in the email that tells them how to download the sharing application, installs the version for iOS devices, and then views the document.<br /><br />Details: See **Protect a file that you share by email** in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.|
|**… read an attachment I’ve received in an email message that has a securely shared file attachment but I can’t read it because my company doesn’t use Rights Management**<br /><br />The email sender is somebody who you trust because you’ve done business with them in the past and you suspect that they might be sending you information about a potential new business opportunity.|You follow the instructions in the email and click the link to sign up for Microsoft Rights Management. Microsoft confirms that your organization does not have a subscription to Office 365, sends you an email to complete the free signup process, and you sign in with your new account. You click the second link in the email to install the Rights Management sharing app and can then open the email attachment to read about the new business opportunity.<br /><br />Details: See **View and use files that have been protected by Rights Management** in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.|
|**… protect company-confidential files on my laptop so they can’t be accessed by people outside my company**<br /><br />You travel a lot and use your laptop to access and update files in a folder that must be secured against unauthorized access.|You have the RMS sharing application installed on your laptop. You use File Explorer to protect the files by using a template, which quickly protects the files. If your laptop is stolen, you have peace of mind that nobody outside your company can access these documents.<br /><br />Details: See **Protect a file on a device (protect in-place)** in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.|

## <a name="BKMK_UsingMSRMSApp"></a>What do you want to do?
Use the following instructions to help you work with protected files.

### <a name="BKMK_DownloadInstall"></a>Download and install the Rights Management sharing application

1.  Go to the [Microsoft Rights Management](http://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website.

2.  In the **Computers** section, click the icon for the **RMS app for Windows** and save the Microsoft Rights Management sharing application installation package to your computer.

3.  Double click the compressed file that was downloaded, and then double-click **setup.exe**. If you are prompted to continue, click **Yes**.

    > [!TIP]
    > You might have to scroll to the bottom of the list in the current folder to see **setup.exe**.

4.  On the **Setup Microsoft RMS** page, click **Next**, and wait for the installation to finish.

5.  When the installation finishes, click **Restart** to restart your computer and complete the installation. Or, click **Close** and restart your computer later to complete the installation.

You’re now ready to start protecting your files or read files that others have protected.

#### More information
You must have a local administrator account to install the sharing application. If you do not log in as a local administrator, you can use the **Run as administrator** option when you run Setup.exe in step 3.

### <a name="BKMK_ProtectInPlace"></a>Protect a file on a device (protect in-place)

1.  In File Explorer, select a file, a folder, or multiple files to protect. Right-click, and then select **Protect in-place**. For example:

    ![](../Image/ADRMS_MSRMSApp_SP_CompanyDefined.png)

    > [!NOTE]
    > If you do not see the **Protect in-place** option, it’s likely that either the sharing application is not installed on your computer, or your computer must be restarted to complete the installation. For more information about how to install the sharing application, see the **Download and install the Rights Management sharing application** instructions in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.

2.  Do one of the following:

    -   Select a policy template: These are predefined permissions that restrict access and usage to people in your organization. If this is the first time you have protected a file on this computer, you will first need to select **Company-defined Protection** to download the templates. The name of the templates begin with your company name and then a descriptive name of the permission. For example: **Contoso - Confidential View Only**

    -   Select **Custom permissions**: Choose this option if the templates don’t provide the level of protection that you need. For example, you want to grant access to people outside your organization, or you want to explicitly set the protection options yourself. Specify the options that you want for this file in the **add protection** dialog box, and then click **Apply**.

        > [!NOTE]
        > For more information about the options in this dialog box, see the **Specify options in the Rights Management dialog box** instructions in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.

3.  You might quickly see a dialog box to tell you that the file is being protected, and the focus then returns to File Explorer. The selected file or files are now protected. In some cases (when adding protection changes the file name extension), the original file in File Explorer is replaced with a new file that has the Rights Management protection lock icon. For example:

    ![](../Image/ADRMS_MSRMSApp_Pfile.png)

If you later need to remove protection from a file, see the **Remove protection from a file** instructions in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.

#### More information
When you protect a file in-place, it replaces the original, unprotected file. You can then leave the file where it is, copy it to another folder or device, or share the folder that it is in and the file will remain protected. You could also attach the protected file to an email message, although the recommended way to share a protected file by email is directly from File Explorer or an Office application (see **Protect a file that you share by email** in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide).

You can use the same technique to protect multiple files at the same time, or a folder. When you protect a folder, all the files in that folder are automatically selected for protection but new files that you create in that folder will not be automatically protected.

If you see any errors when you try to protect files, refer to [FAQ for Microsoft Rights Management Sharing Application for Windows](http://go.microsoft.com/fwlink/?LinkId=303971).

### <a name="BKMK_ProtectSharing"></a>Protect a file that you share by email

1.  Use one of the following options:

    -   For File Explorer: Right-click the file and select **Share Protected**:

        ![](../Image/ADRMS_MSRMSApp_ShareProtectedMenu.png)

    -   For Office application: Make sure that you have first saved the file. Then, on the **Protection** group, click **Share Protected**.

        ![](../Image/ADRMS_MSRMSApp_SP_OfficeToolbar.png)

    > [!NOTE]
    > If you do not see these options for sharing protection, it’s likely that either the sharing application is not installed on your computer, or your computer must be restarted to complete the installation. For more information about how to install the sharing application, see the **Download and install the Rights Management sharing application** instructions in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.

2.  Specify the options that you want for this file in the **share protected** dialog box, and then click **Send**.

    ![](../Image/ADRMS_MSRMSAPP_SP_ShareProtected.gif)

    > [!NOTE]
    > For more information about the options in this dialog box, see the **Specify options in the Rights Management dialog box** instructions in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.

3.  You might quickly see a dialog box to tell you that the file is being protected, and then you see an email message created for you that has the subject **I have securely shared file(s) with you**. In this email message, the file that you selected is attached and protected, and the text in the email contains links for the following:

    -   RMS for individuals

    -   The RMS sharing application

    -   This user guide

    Example:

    ![](../Image/ADRMS_MSRMSApp_EmailMessage.PNG)

4.  Optional: You can change anything that you want in this email message. For example, you can add to or change the subject or text in the message.

    > [!WARNING]
    > Although you can add or remove people from this email message, this does not change the permissions for the attachment that you specified in the **share protected** dialog box. If you want to change those permissions, for example, give a new person permissions to open the file, close the email message without saving or sending it, and return to step 1.

5.  Send the email message.

#### More information
When you protect a file that you share by email, it creates a new version of the original file. The original file remains unprotected and the new version is protected and automatically attached to an email that you then send.

The email message has a default subject and default text that you can change before sending it.

There are two ways to protect a file that you share by email:

-   From File Explorer: This method works for all files.

-   From an Office application: This method works for applications that the Rights Management sharing application supports by using the Office add-in so that you see the **Protection** group on the ribbon.

> [!NOTE]
> In this version of the Rights Management sharing application, there is no add-in for Outlook that lets you protect files and email messages directly from the Outlook application. Instead, use the procedure in this section.

### <a name="BKMK_ViewUseProtected"></a>View and use files that have been protected by Rights Management

#### <a name="BKMK_ViewPFILE"></a>To view a protected file
By using File Explorer or the email message that contains the attachment, double-click the protected file, and enter your credentials if prompted to do so. How the file opens depends on how it was protected.

-   If the file was generically protected (it has a .pfile file extension):

    You see a **protected file** dialog box from the sharing application that tells you who protected the file and that you are expected to honor the co-owner permissions. You are informed that when you open the file, this action is audited.

    ![](../Image/ADRMS_MSRMSApp_PfilePermission.png)

    Click **Open** to read the file.

-   If the file was natively protected (it does not have a .pfile file extension):

    The file opens by using the application that is associated with the original file name extension, and a restriction banner is displayed at the top of the file. The banner might display the permissions that are applied to the file, or it might provide a link to display them. For example, you might see the following where you must click **Permission is currently restricted** to see the actual permissions that are applied to the file and the people that can access it:

    ![](../Image/ADRMS_MSRMSApp_RestrictedAccess.png)

    This file is also audited and remains audited as long as it is protected.

##### More information
Before you can view the protected file, RMS must first confirm that you are authorized to view the file, which it does by checking your user name and password. In some cases, this might be cached and you will not see a prompt that asks for your credentials. In other cases, you will be prompted to supply your credentials.

If your organization does not use either Windows Azure Rights Management (Windows Azure RMS) or AD RMS, you can apply for a free account that will accept your credentials so that you can open files that are protected by using RMS. To apply for this account, click the link to apply for [RMS for individuals](http://go.microsoft.com/fwlink/?LinkId=309469).

#### <a name="BKMK_UserDefined"></a>To use files that have been protected (for example, edit and print the file)
If the protected file has a .pfile file extension:

-   Save the opened file and give it a new file name extension that is associated with the application that you want to use.

    For example, if a file was protected by using the file name document.vsdx.pfile, view the file and in File Explorer, save the file as document.vsdx.

    The new file is no longer protected. If you want to protect it, you must do this manually. For instructions, see **How to protect a file on a device (protect in-place) by using the Rights Management sharing application** in the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.

If the originally protected file did not have a .pfile extension:

-   You cannot do anything other than view the file unless you have an application that understands Rights Management. These applications are called Rights Management enlightened applications. Applications from Office 2013 and Office 2010 (such as Word, Excel, PowerPoint, and Outlook) are examples of applications that are enlightened for Rights Management. But applications that do not come from Microsoft, such as other software companies and your own line-of-business applications, might also be enlightened for Rights Management.

    Applications that are enlightened for Rights Management know how to open files that have been protected by other Rights Management enlightened applications. They also persist the protection that is applied to them, even if you edit the file or save it to another file name or another location. These applications let you use the file according to the permissions that are currently applied to the file, so that if you have permissions to use the file, you can do so. For example, if the file was protected as Read-only, you will not be able to make changes or print the file.

### <a name="BKMK_RemoveProtection"></a>Remove protection from a file
From File Explorer, right-click the file (for example, Sample.ptxt), click **Protect in-place**, and then click **Remove Protection**:

![](../Image/ADRMS_MSRMSApp_RemoveProtection.png)

You might be prompted for credentials.

#### More information
The original protected file is deleted (for example, Sample.ptxt) and replaced with a file that has the same name but with the unprotected file name extension (for example, Sample.txt).

To remove protection from a file (that is, unprotect a file) that was previously protected by using the RMS sharing application, use the **Remove Protection** option from File Explorer.

> [!IMPORTANT]
> You must be an owner of the file to remove protection.

### <a name="BKMK_ShortcutKeys"></a>Use keyboard shortcuts in the Rights Management sharing application
Press the **Alt** key to see the available access keys, and then press **Alt** + the access key to select an option.

#### More information
As an example, in the **share protected** dialog box, press **Alt** to see the access keys, and then press **Alt + u** to select the **Users must login every time they open this file** check box.

![](../Image/ADRMS_MSRMSApp_AccessKeys.png)

### <a name="BKMK_SpecifyDialogOptions"></a>Specify options in the Rights Management dialog box

|Option|Description|
|----------|---------------|
|**USERS**|Type the email addresses of the people that you want to be able to open the file. Use semicolons for multiple addresses. These can be email addresses inside your organization, or outside.<br /><br />For example: janetm@contoso.com; pdover@fabricom.com|
|**Allow consumption on all devices**|When you choose this option that lets users open the file on mobile devices such as an iPad, the permissions is automatically set to **CO-OWNER** (all permissions) so that generic protection is used to protect the file.|
|**PERMISSIONS**|Move the slider to the permission that you want for this file.<br /><br />In some cases, the permissions are automatically set to CO-OWNER and cannot be changed. This happens if you select **Allow consumption on all devices**. And it also happens if you are protecting a file that cannot be natively protected by RMS, and so must be generically protected. The sharing application makes this determination, based on the file name extension. **Tip:** You can use the [Microsoft Rights Management](http://go.microsoft.com/fwlink/?LinkId=303970) page on the Microsoft website to quickly check which applications support built-in protection.|
|**Users must login every time they open this file**|Select this option when you need higher security for a file because it requires that the users you specify are always authenticated, every time they access the file. To do this, if their credentials are not cached, they will be prompted for their user name and password. However, this setting requires that these users always have Internet access to open the file, and being prompted to unlock a file and waiting for the authentication process to finish can be frustrating.|
|**Content expires on**|Select this option only for time-sensitive files that the users that you selected should not be able to open after a date that you specify. You will still be able to open the original file.|

#### More information
Use the table to help you specify the options in the sharing application **add protection** dialog box or the **share protected** dialog box. You will see this dialog box when you protect a file in place and choose custom permissions, or you protect a file to share.

For more information about protecting a file in place and protecting a file to share, see the [What do you want to do?](../Topic/Rights_Management_sharing_application_user_guide_-_revision_for_single_topic.md#BKMK_UsingMSRMSApp) section of this guide.

## See Also
[Rights Management sharing application administrator guide](../Topic/Rights_Management_sharing_application_administrator_guide.md)
 [Microsoft Rights Management sharing application download](http://go.microsoft.com/fwlink/?LinkId=303970)
 [FAQ for Microsoft Rights Management Sharing Application for Windows](http://go.microsoft.com/fwlink/?LinkId=303971)

