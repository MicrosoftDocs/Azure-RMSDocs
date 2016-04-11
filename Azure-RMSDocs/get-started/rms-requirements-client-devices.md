---
# required metadata

title: Azure RMS Requirements&#58; Client device | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 93f8021d-43c5-47fe-ad63-8a1bacff9971

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Client devices that support Azure RMS
Use the following sections to identify which devices support Azure Rights Management (Azure RMS), and which Rights Management capabilities they support.

## Computers
The following computer operating systems support Azure Rights Management:

-   **Windows 7** (x86, x64)

-   **Windows 8** (x86, x64)

-   **Windows 8.1** (x86, x64)

-   **Windows 10** (x86, x64)

-   **Mac OS X**: Minimum version of Mac OS X 10.8 (Mountain Lion)

## Mobile devices
The following mobile device operating systems support Azure Rights Management:

-   **Windows Phone**: Windows Phone 8.1

-   **Android phones and tablets**: Minimum version of Android 4.0.3

-   **iPhone and iPad**: Minimum version of iOS 7.0

-   **Windows RT tablets**: Windows 8.1 RT

## Client device capabilities
Not all supported client devices currently support all RMS capabilities. Use the following table to identify which applications support the RMS capabilities, and the exceptions.

Unless stated otherwise, the supported capabilities apply to both Azure RMS and AD RMS. In addition, AD RMS support on iOS, Android, OS X, and Windows Phone 8.1 requires [Active Directory Rights Management Services Mobile Device Extension](active-directory-rights-management-services-mobile-device-extension.md).

Information about the table columns:

-   **Protected PDF**: Files that have a .ppdf file name extension and that are automatically created when you use the RMS sharing application to share Office files and PDF files by email. The RMS sharing application includes a reader for protected PDF files. Previously, if you created PDF files that you protected by using Azure RMS or AD RMS, you can continue to read these files on Windows, iOS, and Android devices by using Foxit Reader and Nitro Pro.

-   **Email:** The email clients listed can protect the email message itself, which will automatically protect any attached files. In this scenario, the client’s preview feature can display the protected content (message and attachment) to authorized recipients. However, if an email message itself is not protected but the attachment is protected, the client’s preview feature cannot display the protected attachment to authorized recipients.

-   **Other file types**: Text and image files include files that have a file name extension such as .txt, .xml, .jpg, .and jpeg. These files change their file name extension after they are natively protected by RMS, and become read-only. Files that cannot be natively protected have a .pfile file name extension after they are generically protected by RMS. For more information, see the [Levels of protection – native and generic](rights-management-sharing-application-administrator-guide.md) and [Supported file types and file name extensions](https://technet.microsoft.com/library/dn339003.aspx) sections from the [Rights Management sharing application administrator guide](rights-management-sharing-application-administrator-guide.md).

|**Device operating system**|Word, Excel, PowerPoint|Protected PDF|Email|Other file types|
|-------------------------------|---------------------------|-----------------|---------|--------------------|
|**Windows**|Office 2010<br /><br />Office 2013<br /><br />Office Mobile apps (Azure RMS only) [footnote 1]<br /><br />Office Online [footnote 2]|Gaaiho Doc<br /><br />GigaTrust Desktop PDF Client for Adobe<br /><br />Foxit Reader<br /><br />Nitro PDF Reader<br /><br />RMS sharing app|Outlook 2010<br /><br />Outlook 2013<br /><br />Outlook Web App (OWA) [footnote 3]<br /><br />Windows Mail [footnote 4]|RMS sharing application for Windows: Text, images, pfile<br /><br />Siemens JT2Go: JT files (Windows 10 only)|
|**iOS**|Office for iPad and iPhone [footnote 5]<br /><br />Office Online [footnote 2]<br /><br />TITUS Docs|Foxit Reader<br /><br />RMS sharing app [footnote 1]<br /><br />TITUS Docs|NitroDesk [footnote 4]<br /><br />Outlook for iPad and iPhone [footnote 4]<br /><br />OWA for iOS [footnote 3]<br /><br />TITUS Mail|RMS sharing app [footnote 1]: Text, images, pfile<br /><br />TITUS Docs: Pfile|
|**Android**|GigaTrust App for Android<br /><br />Office Online [footnote 2]|GigaTrust App for Android<br /><br />Foxit Reader<br /><br />RMS sharing app [footnote 1]|9Folders [footnote 4]<br /><br />GigaTrust App for Android [footnote 4]<br /><br />NitroDesk [footnote 4]<br /><br />OWA for Android [footnote 3 and 6]<br /><br />Samsung Email (S3 and later) [footnote 6]<br /><br />TITUS Classification for Mobile|RMS sharing app [footnote 1]: Text, images, pfile|
|**OS X**|Office 2011 (AD RMS only)<br /><br />Office 2016 for Mac<br /><br />Office Online [footnote 2]|Foxit Reader<br /><br />RMS sharing app [footnote 1]|Outlook 2011 (AD RMS only)<br /><br />Outlook 2016 for Mac<br /><br />Outlook for Mac|RMS sharing app [footnote 1]: Text, images, pfile|
|**Windows RT**|Office 2013 RT<br /><br />Office Online [footnote 2]|Not supported|Outlook 2013 RT<br /><br />Mail app for Windows<br /><br />Windows Mail [footnote 4]|Siemens JT2Go: JT files|
|**Windows Phone 8.1**|Office Mobile (AD RMS only)|RMS sharing app [footnote 1]|Outlook Mobile [footnote 4]|RMS sharing app [footnote 1]: Text, images, pfile|
|**Blackberry 10**|Not supported|Not supported|Blackberry email [footnote 4]|Not supported|

Footnote 1: Supports viewing protected content.

Footnote 2: Supports viewing protected content in SharePoint Online, OneDrive for Business, and Outlook Web Access.

Footnote 3: If a recipient has a mailbox in Exchange on-premises, and receives a protected email, this content can be opened only in a rich email client, such as Outlook.  This content cannot be opened from Outlook Web Access.

Footnote 4:  Uses Exchange ActiveSync IRM, which must be enabled by the Exchange administrator. Users can view, reply, and reply all for protected email messages but users cannot protect new email messages themselves.

If a recipient has a mailbox in Exchange on-premises, and receives a protected email from another organization who is using Exchange, this content can be opened only in a rich email client, such as Outlook.  This content cannot be opened from a device that uses Exchange Active Sync IRM.

Footnote 5:  Supports viewing and editing protected documents. For more information, see the following post on the Office blog: [Azure Rights Management support comes to Office for iPad and iPhone](https://blogs.office.com/2015/07/22/azure-rights-management-support-comes-to-office-for-ipad-and-iphone-2/)

Footnote 6:  For more information, see the following post on the Office blog: [OWA for Android now available on select devices](http://blogs.office.com/2014/06/11/owa-for-android-now-available-on-select-devices/)

> [!TIP]
> For more information about upcoming RMS support in Office for different platforms, see the following post from the Office blog: [Office everywhere, encryption everywhere](http://blogs.office.com/2015/02/18/office-everywhere-encryption-everywhere/)

---

TEST 1 - START

|**Device operating system**|Word, Excel, PowerPoint|Protected PDF|Email|Other file types|
|-------------------------------|---------------------------|-----------------|---------|--------------------|
|**Windows**|Office 2010<br /><br />Office 2013<br /><br />Office Mobile apps (Azure RMS only) [[footnote 1](#footnote-1)]<br /><br />Office Online [[footnote 2](#footnote-2)]|Gaaiho Doc<br /><br />GigaTrust Desktop PDF Client for Adobe<br /><br />Foxit Reader<br /><br />Nitro PDF Reader<br /><br />RMS sharing app|Outlook 2010<br /><br />Outlook 2013<br /><br />Outlook Web App (OWA) [[footnote 3](#footnote-3)]<br /><br />Windows Mail [[footnote 4](#footnote-4)]|RMS sharing application for Windows: Text, images, pfile<br /><br />Siemens JT2Go: JT files (Windows 10 only)|
|**iOS**|Office for iPad and iPhone [[footnote 5](#footnote-5)]<br /><br />Office Online [[footnote 2](#footnote-2)]<br /><br />TITUS Docs|Foxit Reader<br /><br />RMS sharing app [[footnote 1](#footnote-1)]<br /><br />TITUS Docs|NitroDesk [[footnote 4](#footnote-4)]<br /><br />Outlook for iPad and iPhone [[footnote 4](#footnote-4)]<br /><br />OWA for iOS [[footnote 3](#footnote-3)]<br /><br />TITUS Mail|RMS sharing app [[footnote 1](#footnote-1)]: Text, images, pfile<br /><br />TITUS Docs: Pfile|
|**Android**|GigaTrust App for Android<br /><br />Office Online [[footnote 2](#footnote-2)]|GigaTrust App for Android<br /><br />Foxit Reader<br /><br />RMS sharing app [[footnote 1](#footnote-1)]|9Folders [[footnote 4](#footnote-4)]<br /><br />GigaTrust App for Android [[footnote 4](#footnote-4)]<br /><br />NitroDesk [[footnote 4](#footnote-4)]<br /><br />OWA for Android [[footnote 3](#footnote-3) and 6]<br /><br />Samsung Email (S3 and later) [[footnote 6](#footnote-6)]<br /><br />TITUS Classification for Mobile|RMS sharing app [[footnote 1](#footnote-1)]: Text, images, pfile|
|**OS X**|Office 2011 (AD RMS only)<br /><br />Office 2016 for Mac<br /><br />Office Online [[footnote 2](#footnote-2)]|Foxit Reader<br /><br />RMS sharing app [[footnote 1](#footnote-1)]|Outlook 2011 (AD RMS only)<br /><br />Outlook 2016 for Mac<br /><br />Outlook for Mac|RMS sharing app [[footnote 1](#footnote-1)]: Text, images, pfile|
|**Windows RT**|Office 2013 RT<br /><br />Office Online [[footnote 2](#footnote-2)]|Not supported|Outlook 2013 RT<br /><br />Mail app for Windows<br /><br />Windows Mail [[footnote 4](#footnote-4)]|Siemens JT2Go: JT files|
|**Windows Phone 8.1**|Office Mobile (AD RMS only)|RMS sharing app [[footnote 1](#footnote-1)]|Outlook Mobile [[footnote 4](#footnote-4)]|RMS sharing app [[footnote 1](#footnote-1)]: Text, images, pfile|
|**Blackberry 10**|Not supported|Not supported|Blackberry email [[footnote 4](#footnote-4)]|Not supported|
[footnote 1](#footnote-1): Supports viewing protected content.

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
For more information, see the following post on the Office blog: [OWA for Android now available on select devices](http://blogs.office.com/2014/06/11/owa-for-android-now-available-on-select-devices/)


TEST 1- END

---

TEST 2 - START

|**Device operating system**|Word, Excel, PowerPoint|Protected PDF|Email|Other file types|
|-------------------------------|---------------------------|-----------------|---------|--------------------|
|**Windows**|Office 2010<br /><br />Office 2013<br /><br />Office Mobile apps (Azure RMS only) [[1](#footnote-1)]<br /><br />Office Online [[2](#footnote-2)]|Gaaiho Doc<br /><br />GigaTrust Desktop PDF Client for Adobe<br /><br />Foxit Reader<br /><br />Nitro PDF Reader<br /><br />RMS sharing app|Outlook 2010<br /><br />Outlook 2013<br /><br />Outlook Web App (OWA) [[3](#footnote-3)]<br /><br />Windows Mail [[4](#footnote-4)]|RMS sharing application for Windows: Text, images, pfile<br /><br />Siemens JT2Go: JT files (Windows 10 only)|
|**iOS**|Office for iPad and iPhone [[5](#footnote-5)]<br /><br />Office Online [[2](#footnote-2)]<br /><br />TITUS Docs|Foxit Reader<br /><br />RMS sharing app [[1](#footnote-1)]<br /><br />TITUS Docs|NitroDesk [[4](#footnote-4)]<br /><br />Outlook for iPad and iPhone [[4](#footnote-4)]<br /><br />OWA for iOS [[3](#footnote-3)]<br /><br />TITUS Mail|RMS sharing app [[1](#footnote-1)]: Text, images, pfile<br /><br />TITUS Docs: Pfile|
|**Android**|GigaTrust App for Android<br /><br />Office Online [[2](#footnote-2)]|GigaTrust App for Android<br /><br />Foxit Reader<br /><br />RMS sharing app [[1](#footnote-1)]|9Folders [[4](#footnote-4)]<br /><br />GigaTrust App for Android [[4](#footnote-4)]<br /><br />NitroDesk [[4](#footnote-4)]<br /><br />OWA for Android [[3](#footnote-3) and 6]<br /><br />Samsung Email (S3 and later) [[6](#footnote-6)]<br /><br />TITUS Classification for Mobile|RMS sharing app [[1](#footnote-1)]: Text, images, pfile|
|**OS X**|Office 2011 (AD RMS only)<br /><br />Office 2016 for Mac<br /><br />Office Online [[2](#footnote-2)]|Foxit Reader<br /><br />RMS sharing app [[1](#footnote-1)]|Outlook 2011 (AD RMS only)<br /><br />Outlook 2016 for Mac<br /><br />Outlook for Mac|RMS sharing app [[1](#footnote-1)]: Text, images, pfile|
|**Windows RT**|Office 2013 RT<br /><br />Office Online [[2](#footnote-2)]|Not supported|Outlook 2013 RT<br /><br />Mail app for Windows<br /><br />Windows Mail [[4](#footnote-4)]|Siemens JT2Go: JT files|
|**Windows Phone 8.1**|Office Mobile (AD RMS only)|RMS sharing app [[1](#footnote-1)]|Outlook Mobile [[4](#footnote-4)]|RMS sharing app [[1](#footnote-1)]: Text, images, pfile|
|**Blackberry 10**|Not supported|Not supported|Blackberry email [[4](#footnote-4)]|Not supported|
[1](#footnote-1): Supports viewing protected content.

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
For more information, see the following post on the Office blog: [OWA for Android now available on select devices](http://blogs.office.com/2014/06/11/owa-for-android-now-available-on-select-devices/)


TEST 2 - END

---


## Next steps
To check for other requirements, see [Requirements for Azure Rights Management](requirements-for-azure-rights-management.md).

