---
# required metadata

title: Azure RMS requirements&#58; Applications | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 06/17/2016
ms.topic: get-started-article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 7b33bcb8-63da-46be-ad56-b06de97822fa

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Azure RMS requirements: Applications

*Applies to: Azure Rights Management, Office 365*


Use the following table to identify the applications that natively support Azure RMS, which means that RMS is tightly integrated into these applications by using RMS APIs to support usage restrictions. These applications are also known as RMS-enlightened.

Unless stated otherwise, the supported capabilities apply to both Azure RMS and AD RMS. In addition, AD RMS support on iOS, Android, OS X, and Windows Phone 8.1 requires [Active Directory Rights Management Services Mobile Device Extension](https://technet.microsoft.com/library/dn673574.aspx).

Information about the table columns:

-   **Protected PDF**: Files that have a .ppdf file name extension and that are automatically created when you use the RMS sharing application to share Office files and PDF files by email. The RMS sharing application includes a reader for protected PDF files. Previously, if you created PDF files that you protected by using Azure RMS or AD RMS, you can continue to read these files on Windows, iOS, and Android devices by using Foxit Reader and Nitro Pro.

-   **Email:** The email clients listed can protect the email message itself, which will automatically protect any attached files. In this scenario, the client’s preview feature can display the protected content (message and attachment) to authorized recipients. However, if an email message itself is not protected but the attachment is protected, the client’s preview feature cannot display the protected attachment to authorized recipients.

-   **Other file types**: Text and image files include files that have a file name extension such as .txt, .xml, .jpg, .and jpeg. These files change their file name extension after they are natively protected by RMS, and become read-only. Files that cannot be natively protected have a .pfile file name extension after they are generically protected by RMS. For more information, see the [Rights Management sharing application administrator guide](../rms-client/sharing-app-admin-guide.md).


|**Device operating system**|Word, Excel, PowerPoint|Protected PDF|Email|Other file types|
|-------------------------------|---------------------------|-----------------|---------|--------------------|
|**Windows**|Office 2010<br /><br />Office 2013<br /><br />Office 2016 <br /><br />Office Mobile apps (Azure RMS only) [[1]](#footnote-1)<br /><br />Office Online [[2]](#footnote-2)|Gaaiho Doc<br /><br />GigaTrust Desktop PDF Client for Adobe<br /><br />Foxit Reader<br /><br />Nitro PDF Reader<br /><br />RMS sharing app|Outlook 2010<br /><br />Outlook 2013<br /><br />Office 2016 <br /><br />Outlook Web App (OWA) [[3]](footnote-3)<br /><br />Windows Mail [[4]](footnote-4)|RMS sharing application for Windows: Text, images, pfile<br /><br />Siemens JT2Go: JT files (Windows 10 only)|
|**iOS**|Office for iPad and iPhone [[5]](#footnote-5)<br /><br />Office Online [[2]](#footnote-2)<br /><br />TITUS Docs|Foxit Reader<br /><br />RMS sharing app [[1]](#footnote-1)<br /><br />TITUS Docs|Citrix WorxMail [[6]](#footnote-6)<br /><br />NitroDesk [[4]](#footnote-4)<br /><br />Outlook for iPad and iPhone [[4]](#footnote-4)<br /><br />OWA for iOS [[3]](#footnote-3)<br /><br />TITUS Mail|RMS sharing app [[1]](#footnote-1): Text, images, pfile<br /><br />TITUS Docs: Pfile|
|**Android**|GigaTrust App for Android<br /><br />Office Online [[2]](#footnote-2)|GigaTrust App for Android<br /><br />Foxit Reader<br /><br />RMS sharing app [[1]](#footnote-1)|9Folders [[4]](#footnote-4)<br /><br />GigaTrust App for Android [[4]](#footnote-4)<br /><br />Citrix WorxMail [[6]](#footnote-6)<br /><br />NitroDesk [[4]](#footnote-4)<br /><br />Outlook for Android [[4]](#footnote-4)<br /><br />OWA for Android [[3]](#footnote-3) and [[7]](#footnote-7)<br /><br />Samsung Email (S3 and later) [[7]](#footnote-7)<br /><br />TITUS Classification for Mobile|RMS sharing app [[1]](#footnote-1): Text, images, pfile|
|**OS X**|Office 2011 (AD RMS only)<br /><br />Office 2016 for Mac<br /><br />Office Online [[2]](#footnote-2)|Foxit Reader<br /><br />RMS sharing app [[1]](#footnote-1)|Outlook 2011 (AD RMS only)<br /><br />Outlook 2016 for Mac<br /><br />Outlook for Mac|RMS sharing app [[1]](#footnote-1): Text, images, pfile|
|**Windows 10 Mobile**|Office Mobile apps (Azure RMS only)[[1]](#footnote-1)|Not supported|Citrix WorxMail [[6]](#footnote-6)<br /><br />Outlook Mail|Not supported|
|**Windows RT**|Office 2013 RT<br /><br />Office Online [[2]](#footnote-2)|Not supported|Outlook 2013 RT<br /><br />Mail app for Windows<br /><br />Windows Mail [[4]](#footnote-4)|Siemens JT2Go: JT files|
|**Windows Phone 8.1**|Office Mobile (AD RMS only)|RMS sharing app [[1]](#footnote-1)|Outlook Mobile [[4]](#footnote-4)|RMS sharing app [[1]](#footnote-1): Text, images, pfile|
|**Blackberry 10**|Not supported|Not supported|Blackberry email [[4]](#footnote-4)|Not supported|


###### Footnote 1
Supports viewing protected content.

###### Footnote 2 
Supports viewing protected content in SharePoint Online, OneDrive for Business, and Outlook Web Access.

###### Footnote 3
If a recipient has a mailbox in Exchange on-premises, and receives a protected email, this content can be opened only in a rich email client, such as Outlook.  This content cannot be opened from Outlook Web Access.

###### Footnote 4
Uses Exchange ActiveSync IRM, which must be enabled by the Exchange administrator. Users can view, reply, and reply all for protected email messages but users cannot protect new email messages themselves.

If a recipient has a mailbox in Exchange on-premises, and receives a protected email from another organization who is using Exchange, this content can be opened only in a rich email client, such as Outlook.  This content cannot be opened from a device that uses Exchange Active Sync IRM.

###### Footnote 5
Supports viewing and editing protected documents. For more information, see the following post on the Office blog: [Azure Rights Management support comes to Office for iPad and iPhone](https://blogs.office.com/2015/07/22/azure-rights-management-support-comes-to-office-for-ipad-and-iphone-2/)

###### Footnote 6
For more information, see the Citrix [product documentation for WorxMail](http://docs.citrix.com/en-us/worx-mobile-apps/10/xmob-worx-mail.html).

###### Footnote 7
For more information, see the following post on the Office blog: [OWA for Android now available on select devices](http://blogs.office.com/2014/06/11/owa-for-android-now-available-on-select-devices/)

## More information about Azure RMS support for Office

Azure RMS is tightly integrated into the Word, Excel, PowerPoint, and Outlook apps, where this functionality is often referred to as Information Rights Management (IRM). The following Office client editions support protecting files and emails by using Azure RMS:

- Office Professional Plus 2016

- Office Professional Plus 2013

- Office Professional Plus 2010

All editions of Office (with the exception of Office 2007) support consuming protected content.

Azure RMS with Office Professional Plus 2010 or Office Professional 2010:

- Requires the Rights Management sharing application for Windows

- Not supported on Windows 10


## More information about the Rights Management sharing application

For more information about the Rights Management sharing application for Windows, see the following resources:

-   [Rights Management sharing application administrator guide](../rms-client/sharing-app-admin-guide.md)

-   [Rights Management sharing application user guide](../rms-client/sharing-app-user-guide.md)

For more information about the Rights Management sharing application for mobile platforms, see the following resources:

-   Download the relevant app by using the links on the [Microsoft Rights Management page](http://go.microsoft.com/fwlink/?LinkId=303970)

-   If you have Microsoft Intune, you can deploy and manage the app by using a policy managed app: 

    -   For iOS and Android devices that are enrolled by Intune: [Configure and deploy mobile application management policies in the Microsoft Intune console](/intune/deploy-use/configure-and-deploy-mobile-application-management-policies-in-the-microsoft-intune-console)

    -   For Android devices that are not enrolled by Intune: [Create and deploy mobile app management policies with Microsoft Intune](/intune/deploy-use/create-and-deploy-mobile-app-management-policies-with-microsoft-intune)

-   [FAQ for Microsoft Rights Management Sharing Application for Mobile Platforms](https://technet.microsoft.com/dn451248)



## More information about other applications that support Azure RMS

In addition to the applications in the table, any application that support that RMS APIs can be integrated with Azure RMS, which includes:

- Line-of-business applications that are written in-house by using the RMS SDK

- Applications from software vendors that are written by using the RMS SDK.

For more information about the SDK, see the [Microsoft Rights Management SDK](../develop/developers-guide.md).

## Applications that are not supported by Azure RMS

The following applications that are not currently supported by Azure RMS include the following:

-   Microsoft Office for Mac 2011

-   Microsoft OneDrive for Business for SharePoint Server 2013

-   XPS Viewer
 
In addition, the RMS sharing application has the following restrictions:

-   For Windows computers: Requires a minimum version of Windows 7 Service Pack 1



## Next steps
To check for other requirements, see [Requirements for Azure Rights Management](requirements-azure-rms.md).

For more information about how the most commonly used applications support Azure RMS, see [How applications support Azure Rights Management](../understand-explore/applications-support.md).

For information about how to configure the most commonly used  applications for Azure RMS, see [Configuring applications for Azure Rights Management](../deploy-use/configure-applications.md).