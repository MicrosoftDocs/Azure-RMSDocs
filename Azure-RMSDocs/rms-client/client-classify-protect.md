---
# required metadata

title: Classify and protect a file or email by using Azure Information Protection | Azure Information Protection
description: Instructions how to classify and protect your documents and emails.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/07/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 75268245-6f14-4218-b904-202f63fb3ce6

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Classify and protect a file or email by using Azure Information Protection

>*Applies to: Active Directory Rights Management Services, Azure Information Protection, Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1*

**[ This version of the client is in preview and subject to change. ]**

The easiest way to classify and protect your documents and emails is when you are creating or editing them from within your Office desktop apps: **Word**, **Excel**, **PowerPoint**, **Outlook**. 

However, you can also classify and protect files by using **File Explorer**, which supports additional file types and is a convenient way to classify and protect multiple files at once.

## Using Office apps to classify and protect your documents and emails

Use the Azure Information Protection bar and select one of the labels that has been configured for you. For example:

![Azure Information Protection bar example](../media/info-protect-bar-not-set-callout.png)


## Using File Explorer to classify and protect files

When you use File Explorer, you can quickly classify and protect a single file, multiple files, or a folder. 

When you select a folder, all the files in that folder and any subfolders it has are automatically selected for the classification and protection options that you set. However, new files that you create in that folder or subfolders are not automatically configured with those options.

When you use File Explorer to classify and protect your files, you might notice that the labels are not always available. That happens when the files that you select do not support classification. For these files, you can select a label only if your administrator has configured the label to apply protection. Or, you can specify your own protection settings. 

For a list of file types that are supported from File Explorer, see the [File types supported for classification and protection](#file-types-supported-for-classification-and-protection) section on this page.


### To classify and protect a file by using File Explorer

1.  In File Explorer, select your file, multiple files, or a folder. Right-click, and select **Classify and protect (preview)**. 

2. In the **Classify and protect - Azure Information Protection** dialog box, use the labels as you would do in an Office application, which sets the classification and protection as defined by your administrator. If a label cannot be selected (it is unavailable), the selected file does not support classification but you can protect it.

3. To protect the file, choose between the protection settings that your administrator defined for your selected label (**Automatic, based on the selected classification label**), or specify your own settings (**Override with custom permissions**).
    
    The override option doesn't use any protection settings that your administrator might have defined for your chosen label. Instead, you specify your own protection settings. 

4. If you selected the override option, now specify the following:

    - **Select permissions**: Select the level of access that you want people to have when you protect the selected file or files.
    
    - **Select users**: Specify the people who should have the permissions you selected for your file or files. For people and groups in your organization, you can use the address book to search and select them. For people in another organization, you must specify their full email address. Make sure that you use a business email address because personal email addresses are not currently supported.
        
    - **Expire access**: Select this option only for time-sensitive files so that the people you specified will not be able to open your selected file or files after a date that you specify. You will still be able to open the original file but after midnight (your current time zone), on the day that you select, the people that you specified will not be able to open the file.

5. Click **Apply**, and then click **Close**.

The selected file or files are now classified and protected, according to your selections. In some cases (when adding protection changes the file name extension), the original file in File Explorer is replaced with a new file that has the Azure Information Protection lock icon. For example:

![Protected file with lock icon for Azure Information Protection](../media/Pfile.png)

If you change your mind about the classification and protection, or later need to modify your settings, simply repeat this process with your new settings.

The classification and protection that you specified stays with the file, even if you email the file or save it to another location. If you protected the file, you can track how people are using it and if necessary, revoke access to it. For more information, see [Track and revoke your protected documents when you use Azure Information Protection](client-track-revoke.md). 

#### File types supported for classification and protection

Classification-only is supported for the following file types. Other file types support classification when they are also protected.

- **Microsoft Visio**: .vsdx, .vsdm, .vssx, .vssm, .vsd, .vdw, .vst​

- **Microsoft Project**: .mpp, .mpt​

- **Microsoft Publisher**: .pub​

- **Microsoft Office 97, Office 2010, Office 2003**: .xls, .xlt, .doc, .dot, .ppt, .pps, .pot​

- **Microsoft XPS**: .xps .oxps​

- **Images**: .jpg, .jpe, .jpeg, .jif, .jfif, .jfi.png, .tif, .tiff​

- **SolidWorks**: .sldprt, .slddrw, .sldasm​

- **Autodesk Design Review 2013**: .dwfx​

- **Adobe Photoshop**: .psd​

- **Digital Negative**: .dng


Protection using the Rights Management service is supported for the file types documented in the [File API configuration](../develop/file-api-configuration.md). This protection can be applied automatically when you select a label that your administrator has configured, or you can specify your own protection settings by using [permission levels](../deploy-use/configure-usage-rights.md#rights-included-in-permissions-levels). 


## Other instructions
For how-to instructions, see the following sections from the Azure Information Protection user guide:

-   [What do you want to do?](client-user-guide.md#what-do-you-want-to-do)

