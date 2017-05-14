---
# required metadata

title: Application support for RMS data protection - AIP
description: Identify the applications that use RMS APIs to natively support the Azure Rights Management service from Azure Information Protection.  
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 05/15/2017
ms.topic: get-started-article
ms.prod:
ms.service: information-protection
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


# Applications that support Azure Rights Management data protection

>*Applies to: Azure Information Protection, Office 365*


Use the following tables to identify the applications and solutions that natively support the Azure Rights Management service (Azure RMS), which provides the data protection for Azure Information Protection.

For these applications and solutions, Rights Management support is tightly integrated by using the Rights Management APIs to support usage restrictions. These applications and solutions are also known as "RMS-enlightened".

Unless stated otherwise, the supported capabilities apply to both Azure RMS and AD RMS. In addition, AD RMS support on iOS, Android, macOS, and Windows Phone 8.1 requires [Active Directory Rights Management Services Mobile Device Extension](https://technet.microsoft.com/library/dn673574.aspx).

## RMS-enlightened applications

The following table displays RMS-enlightened client applications from Microsoft and software vendors.

Information about the table columns:

-   **Protected PDF**: Files that have a .ppdf file name extension and that are automatically created when you use the RMS sharing application to share Office files and PDF files by email. The RMS sharing application, the Azure Information Protection app for iOS and Android, and the Azure Information Protection client for Windows include a reader for protected PDF files. Previously, if you created PDF files that you protected by using Azure RMS or AD RMS, you can continue to read these files on Windows, iOS, and Android devices by using Foxit Reader and Nitro Pro.

-   **Email:** The email clients listed can protect the email message itself, which will automatically protect any attached files. In this scenario, the client’s preview feature can display the protected content (message and attachment) to authorized recipients. However, if an email message itself is not protected but the attachment is protected, the client’s preview feature cannot display the protected attachment to authorized recipients.

-   **Other file types**: Text and image files include files that have a file name extension such as .txt, .xml, .jpg, .and jpeg. These files change their file name extension after they are natively protected by Rights Management, and become read-only. Files that cannot be natively protected have a .pfile file name extension after they are generically protected by Rights Management. For more information, see the [File types supported](../rms-client/client-admin-guide-file-types.md) from the Azure Information Protection client admin guide.


|**Device operating system**|Word, Excel, PowerPoint|Protected PDF|Email|Other file types|
|-------------------------------|---------------------------|-----------------|---------|--------------------|
|**Windows**|Office 2010<br /><br />Office 2013<br /><br />Office 2016 <br /><br />Office Mobile apps (Azure RMS only) [[1]](#footnote-1)<br /><br />Office Online [[2]](#footnote-2)<br /><br />Web browser when the document is protected by using message protection in Office 365 (Azure RMS only) [[10]](#footnote-10)|Azure Information Protection client for Windows <br /><br />Gaaiho Doc<br /><br />GigaTrust Desktop PDF Client for Adobe<br /><br />Foxit Reader<br /><br />Nitro PDF Reader<br /><br />RMS sharing app|Outlook 2010<br /><br />Outlook 2013<br /><br />Office 2016 <br /><br />Outlook on the web (OWA) [[3]](#footnote-3)<br /><br />Web browser (Azure RMS only) [[9]](#footnote-9)<br /><br />Windows Mail [[4]](#footnote-4) |Azure Information Protection client for Windows: Text, images, pfile<br /><br />RMS sharing application for Windows: Text, images, pfile<br /><br />SealPath RMS plugin for AutoCAD [[8]](#footnote-8): .dwg<br />|
|**iOS**|Office for iPad and iPhone [[5]](#footnote-5)<br /><br />Office Online [[2]](#footnote-2)<br /><br />TITUS Docs<br /><br />Web browser when the document is protected by using message protection in Office 365 (Azure RMS only) [[10]](#footnote-10)|Azure Information Protection app [[1]](#footnote-1)<br /><br /> Foxit Reader<br /><br />TITUS Docs|Azure Information Protection app [[1]](#footnote-1)<br /><br />Citrix WorxMail [[6]](#footnote-6)<br /><br />NitroDesk [[4]](#footnote-4)<br /><br />Outlook for iPad and iPhone [[4]](#footnote-4)<br /><br />OWA for iOS [[3]](#footnote-3)<br /><br />TITUS Mail <br /><br />Web browser (Azure RMS only) [[9]](#footnote-9)|Azure Information Protection app [[1]](#footnote-1): Text, images<br /><br />TITUS Docs: Pfile|
|**Android**|GigaTrust App for Android<br /><br />Office Online [[2]](#footnote-2)<br /><br />Office Mobile (Azure RMS only) [[1]](#footnote-1)<br /><br />Web browser when the document is protected by using message protection in Office 365 (Azure RMS only) [[10]](#footnote-10)|Azure Information Protection app [[1]](#footnote-1)<br /><br />GigaTrust App for Android<br /><br />Foxit Reader<br /><br />RMS sharing app [[1]](#footnote-1)|9Folders [[4]](#footnote-4)<br /><br />Azure Information Protection app [[1]](#footnote-1)<br /><br />GigaTrust App for Android [[4]](#footnote-4)<br /><br />Citrix WorxMail [[6]](#footnote-6)<br /><br />NitroDesk [[4]](#footnote-4)<br /><br />Outlook for Android [[4]](#footnote-4)<br /><br />OWA for Android [[3]](#footnote-3) and [[7]](#footnote-7)<br /><br />Samsung Email (S3 and later) [[7]](#footnote-7)<br /><br />TITUS Classification for Mobile <br /><br />Web browser (Azure RMS only) [[9]](#footnote-9)|Azure Information Protection app [[1]](#footnote-1): Text, images|
|**macOS**|Office 2011 (AD RMS only)<br /><br />Office 2016 for Mac<br /><br />Office Online [[2]](#footnote-2)<br /><br />Web browser when the document is protected by using message protection in Office 365 (Azure RMS only) [[10]](#footnote-10)|Foxit Reader<br /><br />RMS sharing app [[1]](#footnote-1)|Outlook 2011 (AD RMS only)<br /><br />Outlook 2016 for Mac<br /><br />Outlook for Mac <br /><br />Web browser (Azure RMS only) [[9]](#footnote-9)|RMS sharing app [[1]](#footnote-1): Text, images, pfile|
|**Windows 10 Mobile**|Office Mobile apps (Azure RMS only) [[1]](#footnote-1)<br /><br />Web browser when the document is protected by using message protection in Office 365 (Azure RMS only) [[10]](#footnote-10)|Not supported|Citrix WorxMail [[6]](#footnote-6)<br /><br />Outlook Mail <br /><br />Web browser (Azure RMS only) [[9]](#footnote-9)|Not supported|
|**Windows RT**|Office 2013 RT<br /><br />Office Online [[2]](#footnote-2)<br /><br />Web browser when the document is protected by using message protection in Office 365 (Azure RMS only) [[10]](#footnote-10)|Not supported|Outlook 2013 RT<br /><br />Mail app for Windows<br /><br />Web browser (Azure RMS only) [[9]](#footnote-9)<br /><br />Windows Mail [[4]](#footnote-4)|Siemens JT2Go: JT files|
|**Windows Phone 8.1**|Office Mobile (AD RMS only)<br /><br />Web browser when the document is protected by using message protection in Office 365 (Azure RMS only) [[10]](#footnote-10)|RMS sharing app [[1]](#footnote-1)|Outlook Mobile [[4]](#footnote-4) <br /><br />Web browser (Azure RMS only) [[9]](#footnote-9)|RMS sharing app [[1]](#footnote-1): Text, images, pfile|
|**Blackberry 10**|Web browser when the document is protected by using message protection in Office 365 (Azure RMS only) [[10]](#footnote-10)|Not supported|Blackberry email [[4]](#footnote-4) <br /><br />Web browser (Azure RMS only) [[9]](#footnote-9)|Not supported|

###### Footnote 1
Supports viewing protected content.

###### Footnote 2
Supports viewing protected documents when an unprotected document is uploaded to a protected library in SharePoint Online and OneDrive for Business.

###### Footnote 3
If a recipient receives a protected email and is not using Exchange as the mail server or if the sender belongs to another organization that is not using message protection in Office 365, this content can be opened only in a rich email client, such as Outlook. For these scenarios, this content cannot be opened from Outlook on the web.

###### Footnote 4
Uses Exchange ActiveSync IRM, which must be enabled by the Exchange administrator. Users can view, reply, and reply all for protected email messages but users cannot protect new email messages themselves.

If a recipient receives a protected email and is not using Exchange as the mail server or if the sender belongs to another organization that is not using message protection in Office 365, this content can be opened only in a rich email client, such as Outlook. For these scenarios, this content cannot be opened from Outlook on the web or from mobile mail clients using Exchange Active Sync IRM.

###### Footnote 5
Supports viewing and editing protected documents for iOS; supports viewing protected documents for Android. For more information, see the following post on the Office blog: [Azure Rights Management support comes to Office for iPad and iPhone](https://blogs.office.com/2015/07/22/azure-rights-management-support-comes-to-office-for-ipad-and-iphone-2/)

###### Footnote 6
For more information, see the Citrix [product documentation for WorxMail](http://docs.citrix.com/en-us/worx-mobile-apps/10/xmob-worx-mail.html).

###### Footnote 7
For more information, see the following post on the Office blog: [OWA for Android now available on select devices](http://blogs.office.com/2014/06/11/owa-for-android-now-available-on-select-devices/)

###### Footnote 8
For more information, see the following post on the Enterprise Mobility and Security blog: [SealPath brings RMS protection to AutoCAD](https://blogs.technet.microsoft.com/enterprisemobility/2015/09/08/sealpath-brings-rms-protection-to-autocad/)

###### Footnote 9
When the recipient can't open a protected email by using their email client and the message is sent from an organization that uses message protection in Office 365.

###### Footnote 10
When the document is automatically protected by email from an organization that uses message protection in Office 365. For a list of file types that can be protected in this way, see [Introduction to IRM for email messages](https://support.office.com/article/Introduction-to-IRM-for-email-messages-bb643d33-4a3f-4ac7-9770-fd50d95f58dc).


### More information about Azure RMS support for Office

Azure RMS is tightly integrated into the Word, Excel, PowerPoint, and Outlook apps, where this functionality is often referred to as Information Rights Management (IRM). The following Office client editions support protecting files and emails by using Azure RMS:

- Office 365 ProPlus: Office 2016 and Office 2013

- Office Professional Plus 2016

- Office Professional Plus 2013

- Office Professional Plus 2010

All editions of Office (with the exception of Office 2007) support consuming protected content.

Azure RMS with Office Professional Plus 2010 or Office Professional 2010:

- Requires the Azure Information Protection client for Windows or the Rights Management sharing application for Windows

- Not supported on Windows 10

- Does not support forms-based authentication for federated user accounts. These accounts must use Windows Integrated Authentication.

### More information about the Azure Information Protection app for iOS and Android

The Azure Information Protection app for iOS and Android replaces the RMS sharing app for these devices. It provides the same functionality and in addition, supports rights-protected email messages and rights-protected PDF files on SharePoint Online.

If your iOS and Android devices are enrolled by Microsoft Intune, you can deploy and manage this app by using a policy managed app. For more information, see [Configure and deploy mobile application management policies in the Microsoft Intune console](/intune/deploy-use/configure-and-deploy-mobile-application-management-policies-in-the-microsoft-intune-console) from the Intune documentation. For Step 2 from this Intune documentation, use the instructions to publish a policy managed app.

For more information, see the [FAQ for Microsoft Azure Information Protection app for iOS and Android](../rms-client/mobile-app-faq.md).


### More information about the Azure Information Protection client for Windows

This client now replaces the Rights Management sharing application for Windows.

For more information, see the following resources:

- [Azure Information Protection client administrator guide](../rms-client/client-admin-guide.md)

- [Azure Information Protection client user guide](../rms-client/client-user-guide.md)

- [FAQs for Azure Information Protection app for iOS and Android](../rms-client/mobile-app-faq.md)

Download the relevant app by using the links on the [Microsoft Azure Information Protection page](http://go.microsoft.com/fwlink/?LinkId=303970).

### More information about the Rights Management sharing application

This application is being replaced by the Azure Information Protection client. It is still required for Mac computers and Windows Phone mobile devices.

For more information, see the following resources:

-   [Rights Management sharing application administrator guide](../rms-client/sharing-app-admin-guide.md)

-   [Rights Management sharing application user guide](../rms-client/sharing-app-user-guide.md)

-   [FAQ for Microsoft Rights Management Sharing Application for Mobile Platforms](https://technet.microsoft.com/dn451248)

Download the app for Mac computers and for Windows Phone using the links on the [Microsoft Azure Information Protection page](http://go.microsoft.com/fwlink/?LinkId=303970).


### More information about other applications that support Azure Information Protection

In addition to the applications in the table, any application that supports the APIs for the Azure Rights Management service can be integrated with Azure Information Protection, which includes:

- Line-of-business applications that are written in-house by using the RMS SDKs

- Applications from software vendors that are written by using the RMS SDKs.

For more information, see the [Azure Information Protection Developer's Guide](../develop/developers-guide.md).

### Applications that are not supported by Azure RMS

The following applications that are not currently supported by Azure RMS include the following:

-   Microsoft Office for Mac 2011

-   Microsoft OneDrive for Business for SharePoint Server 2013

-   XPS Viewer

In addition, the RMS sharing application and the Azure Information Protection client has the following restrictions:

-   For Windows computers: Requires a minimum version of Windows 7 Service Pack 1

## RMS-enlightened solutions

The following table displays RMS-enlightened solutions from software vendors.

If you are a software vendor and have a solution for this table that is not listed, register your application with Azure AD. For more information, see [How to register and RMS enable your app with Azure AD](../develop/authentication-integration.md).


|Product|Vendor|Description|
|-------------------------------|---------------------------|-----------------|
|Absolute|Absolute|Data loss prevention (DLP) to protect content.|
|Content Locker|VMware|Stores, consumes, and creates protected content.|
|Controle|TakeControle|eDiscovery by using labeling and protection.|
|Halocore|Secude|Protects files that are exported from SAP environments.|
|MaaS 360|IBM|Integration to consume and protect documents.|
|Mobiliya|Mobiliya|Secures documents from EMC’s Documentum repositories.
|Ramessys|Ramessys|Integration for Chemcart and Documentum.
|Sealpath|Sealpath Technologies|Integration with CAD design tools, such as AutoCAD and Siemens Jt2GO.
|SecRMM|Sqaudra Technologies |Document protection for removable media.
|Security Sheriff|CryptZone |Access management on SharePoint and protects documents, based on their classification and access permissions.
|Symantec DLP|Symantec |Detection and monitoring for protected files.

## Next steps
To check for other requirements, see [Requirements for Azure Information Protection](requirements-azure-rms.md).

For more information about how the most commonly used applications support Azure RMS, see [How applications support the Azure Rights Management service](../understand-explore/applications-support.md).

For information about how to configure the most commonly used  applications for Azure RMS, see [Configuring applications for Azure Rights Management](../deploy-use/configure-applications.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
