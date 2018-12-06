---
# required metadata

title: Technical overview for the RMS sharing app - AIP
description: Technical details for admins on enterprise networks who are are responsible for deploying the RMS sharing application for Windows.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 06/02/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: f7b13fa4-4f8e-489a-ba46-713d7a79f901

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Technical overview and protection details for the Microsoft Rights Management sharing application

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 7 with SP1, Windows 8, Windows 8.1*


The Microsoft Rights Management sharing application is an optional downloadable application for Microsoft Windows and other platforms that provides the following:

-   Protection of a single file or bulk protection of multiple files as well as all files within a selected folder.

-   Full support for protection of any type of file and a built-in viewer for commonly used text and image file types.

-   Generic protection for files that do not support RMS protection.

-   Full interoperability with files protected using Office Information Rights Management (IRM).

-   Full interoperability with PDF files protected using File Classification Infrastructure (FCI), and supported PDF authoring tools.

The Microsoft Rights Management sharing application uses the [AD RMS Client 2.1 runtime](http://www.microsoft.com/download/details.aspx?id=38396). By using the functionality of AD RMS 2.1, the Microsoft Rights Management sharing application provides end users a simple protection and consumption experience.

With the October 2013 release of RMS, you can natively protect documents by using Office 2010 and send them to people in another company, who can then consume them by using the Azure Rights Management service from Azure Information Protection. In addition, with this release, if you use AD RMS in Cryptographic Mode 2, you can use RMS for individuals and consume content from people in another company that uses the Azure Rights Management service. For more information about Cryptographic Mode 2, see [AD RMS Cryptographic Modes](https://technet.microsoft.com/library/hh867439%28v=ws.10%29.aspx).

For deployment information, see [Automatic deployment for the Microsoft Rights Management sharing application](sharing-app-admin-guide.md#automatic-deployment-for-the-microsoft-rights-management-sharing-application)

## Levels of protection – native and generic
Microsoft Rights Management sharing application supports protection at two different levels, as described in the following table.

|Type of protection|Native|Generic|
|----------------------|----------|-----------|
|Description|For text, image, Microsoft Office (Word, Excel, PowerPoint) files, .pdf files, and other application file types that support a Rights Management service, native protection provides a strong level of protection that includes both encryption and enforcement of rights (permissions).|For all other applications and file types, generic protection provides a level of protection that includes both file encapsulation using the .pfile file type and authentication to verify if a user is authorized to open the file.|
|Protection|Files are fully encrypted and protection is enforced in the following ways:<br /><br />- Before protected content is rendered, successful authentication must occur for those who receive the file through email or are given access to it through file or share permissions.<br /><br />- Additionally, usage rights and policy set by the content owner when files are protected are fully enforced when the content is rendered in either IP Viewer (for protected text and image files) or the associated application (for all other supported file types).|File protection is enforced in the following ways:<br /><br />- Before protected content is rendered, successful authentication must occur for those who are authorized to open the file and given access to it. If authorization fails, the file does not open.<br /><br />- Usage rights and policy set by the content owner are displayed to inform authorized users of the intended usage policy.<br /><br />- Audit logging of authorized users opening and accessing files occurs, however, no usage rights are enforced by non-supporting applications.|
|Default for file types|This is the default level of protection for the following file types:<br /><br />- Text and image files<br /><br />- Microsoft Office (Word, Excel, PowerPoint) files<br /><br />- Portable document format (.pdf)<br /><br />For more information, see the following section, [Supported file types and file name extensions](#supported-file-types-and-file-name-extensions).|This is the default protection for all other file types (such as .vsdx, .rtf, and so on) that are not supported by full protection.|
You can change the default protection level that the RMS sharing application applies. You can change the default level of native to generic, from generic to native, and even prevent the RMS sharing application from applying protection. For more information, see the [Changing the default protection level of files](#changing-the-default-protection-level-of-files) section in this article.

## Supported file types and file name extensions
The following table lists file types that are natively supported by Microsoft Rights Management sharing application. For these file types, the original file name extension is changed when native protected is applied, and these files become read-only.

In addition, when the RMS sharing application natively protects a Word, Excel, or PowerPoint file that users protect by sharing, this action automatically creates a second file that is a copy of the original with the same file name but with a **.ppdf** file name extension ¹. This version of the file ensures that recipients who install the RMS sharing application can always open the file that has native protection applied.

For files that are generically protected, the original file name extension is always changed to .pfile.

> [!WARNING]
> If you have firewalls, web proxies, or security software that inspect and take action according to file name extensions, you might need to reconfigure these to support these new file name extensions.

|Original file name extension|RMS-protected file name extension|
|--------------------------------|-------------------------------------|
|.txt|.ptxt|
|.xml|.pxml|
|.jpg|.pjpg|
|.jpeg|.pjeg|
|.pdf|.ppdf|
|.png|.ppng|
|.tif|.ptif|
|.tiff|.ptiff|
|.bmp|.pbmp|
|.gif|.pgif|
|.jpe|.pjpe|
|.jfif|.pjfif|
|.jt|.pjt|
¹ PDF Rendering Powered by Foxit. Copyright © 2003–2014 by Foxit Corporation.

The following table lists the file types that the Microsoft Rights Management sharing application natively supports in Microsoft Office 2016, Office 2013, and Office 2010. For these files, the file name extension remains the same after the file is protected by a Rights Management service.

|File types supported by Office|File types supported by Office|
|----------------------------------|----------------------------------|
|.doc<br /><br />.docm<br /><br />.docx<br /><br />.dot<br /><br />.dotm<br /><br />.dotx<br /><br />.potm<br /><br />.potx<br /><br />.pps<br /><br />.ppsm<br /><br />.ppsx<br /><br />.ppt<br /><br />.pptm|.pptx<br /><br />.thmx<br /><br />.xla<br /><br />.xlam<br /><br />.xls<br /><br />.xlsb<br /><br />.xlt<br /><br />.xlsm<br /><br />.xlsx<br /><br />.xltm<br /><br />.xltx<br /><br />.xps|

### Changing the default protection level of files
You can change how the RMS sharing application protects files by editing the registry. For example, you can force files that support native protection to be generically protected by the RMS sharing application.

Reasons for why you might want to do this:

-   To ensure that all users can open the file from their mobile devices.

-   To ensure that all users can open the file if they don’t have an application that supports native protection.

-   To accommodate security systems that take action on files by their file name extension and can be reconfigured to accommodate the .pfile file name extension but cannot be reconfigured to accommodate multiple file name extensions for native protection.

Similarly, you can force the RMS sharing application to apply native protection to files that by default, would have generic protection applied. This might be appropriate if you have an application that supports the RMS APIs – for example, a line-of-business application written by your internal developers or an application purchased from an independent software vendor (ISV).

You can also force the RMS sharing application to block the protection of files (not apply native protection or generic protection). For example, this might be required if you have an automated application or service that must be able to open a specific file to process its contents. When you block protection for a file type, users cannot use the RMS sharing application to protect a file that has that file type. When they try, they see a message that the administrator has prevented protection and they must cancel their action to protect the file.

To configure the RMS sharing application to apply generic protection to all files that by default, would have native protection applied, make the following registry edits. Note if the RmsSharingApp or FileProtection keys do not exist, you must manually create them.

1.  **HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\RmsSharingApp\FileProtection**: Create a new key named *.

    This setting denotes files with any file name extension.

2.  In the newly added key of HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\RmsSharingApp\FileProtection\\\*, create a new string value (REG_SZ) named **Encryption** that has the data value of **Pfile**.

    This setting results in the RMS sharing application applying generic protection.

These two settings result in the RMS sharing application applying generic protection to all files that have a file name extension. If this is your goal, no further configuration is required. However, you can define exceptions for specific file types, so that they are still natively protected. To do this, you must make three additional registry edits for each file type:

1.  **HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\RmsSharingApp\FileProtection**: Add a new key that has the name of the file name extension (without the preceding period).

    For example, for files that have a .docx file name extension, create a key named **DOCX**.

2.  In the newly added file type key (for example, **HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\RmsSharingApp\FileProtection\DOCX**), create a new DWORD Value named **AllowPFILEEncryption** that has a value of **0**.

3.  In the newly added file type key (for example, **HKEY_LOCAL_MACHINE\Software\Microsoft\MSIPC\RmsSharingApp\FileProtection\DOCX**), create a new String Value named **Encryption** that has a value of **Native**.

As a result of these settings, all files are generically protected except files that have a .docx file name extension, which are natively protected by the RMS sharing application.

Repeat these three steps for other file types that you want to define as exceptions because they support native protection and you do not want them to be generically protected by the RMS sharing application.

You can make similar registry edits for other scenarios by changing the value of the **Encryption** string that supports the following values:

-   **Pfile**: Generic protection

-   **Native**: Native protection

-   **Off**: Block protection

## See Also
[Rights Management sharing application user guide](sharing-app-user-guide.md)

