---
# required metadata

title: Application support for RMS data protection - AIP
description: Identify the applications that use RMS APIs to natively support the Azure Rights Management service from Azure Information Protection.  
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 07/12/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 7b33bcb8-63da-46be-ad56-b06de97822fa

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: prereqs
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---


# Applications that support Azure Rights Management data protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*


Use the following tables to identify the applications and solutions that natively support the Azure Rights Management service (Azure RMS), which provides the data protection for Azure Information Protection.

For these applications and solutions, Rights Management support is tightly integrated by using the Rights Management APIs to support usage restrictions. These applications and solutions are also known as "RMS-enlightened."

Unless stated otherwise, the supported capabilities apply to both Azure RMS and AD RMS. In addition, AD RMS support on iOS, Android, macOS, and Windows Phone 8.1 requires [Active Directory Rights Management Services Mobile Device Extension](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/dn673574\(v=ws.11\)).

## RMS-enlightened applications

The following table displays RMS-enlightened client applications from Microsoft and software vendors. 

For information about viewing protected PDF documents, see [Protected PDF readers for Microsoft Information Protection](./rms-client/protected-pdf-readers.md).

Information about the table columns:

-   **Email:** The email clients that are listed can protect the email message itself, which automatically protects any attached Office files that are not already protected. In this scenario, the client’s preview feature can display the protected content (message and attachment) to authorized recipients. However, if an email message itself is not protected but the attachment is protected, the client’s preview feature cannot display the protected attachment to authorized recipients. 
    
    Tip: For email clients that don't support protecting emails, consider using [Exchange Online mail flow rules to apply this protection](https://support.office.com/article/define-mail-flow-rules-to-encrypt-email-messages-in-office-365-9b7daf19-d5f2-415b-bc43-a0f5f4a585e8).

-   **Other file types**: Text and image files include files that have a file name extension such as .txt, .xml, .jpg, and .jpeg. These files change their file name extension after they are natively protected by Rights Management, and become read-only. Files that cannot be natively protected have a .pfile file name extension after they are generically protected by Rights Management. For more information, see the [File types supported](./rms-client/client-admin-guide-file-types.md) from the Azure Information Protection client admin guide.


|**Device operating system**|Word, Excel, PowerPoint|Email|Other file types|
|---------------------------|-----------------------|-----------------|---------|
|**Windows**|Office 365 apps [[1]](#footnote-1)<br /><br />Office 2010<br /><br />Office 2013<br /><br />Office 2016 <br /><br />Office 2019 <br /><br />Office on the web (viewing protected documents) [[2]](#footnote-2)<br /><br />Web browser [[3]](#footnote-3)|Outlook 2010<br /><br />Outlook 2013<br /><br />Office 2016 <br /><br />Office 2019 <br /><br />Office 365 ProPlus<br /><br />Web browser [[4]](#footnote-4)<br /><br />Windows Mail [[5]](#footnote-5) |Azure Information Protection client for Windows: Text, images, pfile<br /><br />SealPath RMS plugin for AutoCAD: .dwg|
|**iOS**|GigaTrust<br /><br /> Office Mobile <br /><br />Office on the web [[2]](#footnote-2)<br /><br />TITUS Docs<br /><br />Web browser [[3]](#footnote-3)|Azure Information Protection app (viewing protected email)<br /><br />BlackBerry Work<br /><br />Citrix WorxMail <br /><br />NitroDesk [[5]](#footnote-5)<br /><br />Outlook for iPad and iPhone [[5]](#footnote-5)<br /><br />TITUS Mail <br /><br />Web browser [[4]](#footnote-4)|Azure Information Protection app (viewing protecting text and images)<br /><br />TITUS Docs: Pfile|
|**Android**|GigaTrust App for Android<br /><br />Office on the web [[2]](#footnote-2)<br /><br />Office Mobile (unless using sensitivity labels, limited to viewing and editing protected documents) <br /><br />Web browser [[3]](#footnote-3)|9Folders [[5]](#footnote-5)<br /><br />Azure Information Protection app (viewing protected emails)<br /><br />BlackBerry Work <br /><br />GigaTrust App for Android [[5]](#footnote-5)<br /><br />Citrix WorxMail <br /><br />NitroDesk [[5]](#footnote-5)<br /><br />Outlook for Android [[5]](#footnote-5)<br /><br />Samsung Email (S3 and later) [[5]](#footnote-5)<br /><br />TITUS Classification for Mobile <br /><br />Web browser [[4]](#footnote-4)|Azure Information Protection app (viewing protected text and images)|
|**macOS**|Office 365 apps<br /><br />Office 2019 for Mac<br /><br />Office 2016 for Mac<br /><br />Office on the web [[2]](#footnote-2)<br /><br />Web browser [[3]](#footnote-3)|Outlook 2019 for Mac<br /><br /> Outlook 2016 for Mac<br /><br />Web browser [[4]](#footnote-4)|RMS sharing app (viewing protected text, images, generically protected files)|
|**Windows 10 Mobile**|Office Mobile apps (viewing protected documents using Azure RMS) <br /><br />Web browser [[3]](#footnote-3)|Citrix WorxMail <br /><br />Outlook Mail (viewing protected emails) <br /><br />Web browser [[4]](#footnote-4)|Not supported|
|**Blackberry 10**|Web browser [[3]](#footnote-3)|Blackberry email [[5]](#footnote-5) <br /><br />Web browser [[4]](#footnote-4)|Not supported|

###### Footnote 1
Includes: 
- Office apps minimum version 1805, build 9330.2078 from Office 365 Business or Microsoft 365 Business when the user is assigned a license for Azure Rights Management (also known as Azure Information Protection for Office 365)
- Office 365 ProPlus apps

###### Footnote 2
Supported only with SharePoint Online and OneDrive for Business, and the documents are unprotected before they are uploaded to a protected library.

###### Footnote 3
For [Office attachments](https://support.office.com/article/bb643d33-4a3f-4ac7-9770-fd50d95f58dc#FileTypesforIRM) that are protected by using [Office 365 Message Encryption with the new capabilities](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Email-Encryption-and-Rights-Protection/ba-p/110801).

###### Footnote 4
If the sender and the recipient are part of the same organization. Or either of the following conditions:
- The sender or the recipient are using Exchange Online.
- The sender is using Exchange on-premises in a hybrid configuration. 

###### Footnote 5
Uses Exchange ActiveSync IRM, which must be enabled by the Exchange administrator. Users can view, reply, and reply all for protected email messages but users cannot protect new email messages.
 
If the email application cannot render the message because the Exchange ActiveSync IRM is not enabled, the recipient can view the email in a web browser when the sender uses Exchange Online, or Exchange on-premises in a hybrid configuration. 

### More information about Azure RMS support for Office

Azure RMS is tightly integrated into the Word, Excel, PowerPoint, and Outlook apps, where this functionality is often referred to as Information Rights Management (IRM). 

See also: [Office Applications Service Description](https://technet.microsoft.com/library/office-applications-service-description.aspx)

#### Windows computers for Information Rights Management (IRM)

The following Office client suites support protecting files and emails on Windows computers by using the Azure Rights Management service:

- Office apps minimum version 1805, build 9330.2078 from Office 365 Business or Microsoft 365 Business when the user is assigned a license for Azure Rights Management (also known as Azure Information Protection for Office 365)

- Office 365 ProPlus
    
    These editions of Office are included with most but not all Office 365 subscriptions that include data protection from Azure Information Protection. Check your subscription information to see if Office 365 ProPlus is included. You'll also find this information in the [Azure Information Protection datasheet](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf).

- Office Professional Plus 2019

- Office Professional Plus 2016

- Office Professional Plus 2013

- Office Professional Plus 2010 with Service Pack 2

All editions of Office (with the exception of Office 2007) support consuming protected content.

When you use the Azure Rights Management service with Office Professional Plus 2010 and Service Pack 2 or Office Professional 2010 with Service Pack 2:

- Requires the Azure Information Protection client for Windows.

- Not supported on Windows 10.

- Does not support forms-based authentication for federated user accounts. These accounts must use Windows Integrated Authentication.

- Does not support overriding template protection with custom permissions that a user selects with the Azure Information Protection client. In this scenario, the original protection must first be removed before custom permissions can be applied.

#### Mac computers for Information Rights Management (IRM)

The following Office client suites support protecting files and emails on macOS by using Azure RMS:

- Office 365 ProPlus

- Office Standard 2019 for Mac

- Office Standard 2016 for Mac

All editions of Office for Mac 2019 and Office for Mac 2016 support consuming protected content.

Tip: To get started with protecting documents by using Office for Mac, you might find the following FAQ useful: [How do I configure a Mac computer to protect and track documents?](faqs-rms.md#how-do-i-configure-a-mac-computer-to-protect-and-track-documents)

### More information about the Azure Information Protection app for iOS and Android

The Azure Information Protection app for iOS and Android provides a viewer for rights-protected email messages (.rpmsg files) when these mobile devices don't have an email app that can open protected emails. This app can also open rights-protected PDF files, and pictures and text files that are rights-protected.

If your iOS and Android devices are enrolled by Microsoft Intune, users can install the app from the Company Portal and you can manage the app by using Intune's [app protection policies](/intune/app-protection-policies).

For more information about how to use app, see the [FAQ for Microsoft Azure Information Protection app for iOS and Android](./rms-client/mobile-app-faq.md).


### More information about the Azure Information Protection client for Windows

For more information, see the following resources:

- [Azure Information Protection client administrator guide](./rms-client/client-admin-guide.md)

- [Azure Information Protection client user guide](./rms-client/client-user-guide.md)

- [FAQs for Azure Information Protection app for iOS and Android](./rms-client/mobile-app-faq.md)

Download the relevant app by using the links on the [Microsoft Azure Information Protection page](https://go.microsoft.com/fwlink/?LinkId=303970).

### More information about the Rights Management sharing app

For Mac computers, the Rights Management sharing app offers a viewer for protected PDF files (.ppdf), protected text images, and generically protected files. It can also protect image files, but not other files. To protect Office files on these computers, use Office for Mac or Office 365 ProPlus. 

For more information, see the following resources:

-   [FAQ for Microsoft Rights Management Sharing Application for Mobile Platforms](https://technet.microsoft.com/dn451248)

Download the Rights Management sharing app for Mac computers by using the link on the [Microsoft Azure Information Protection page](https://go.microsoft.com/fwlink/?LinkId=303970).


### More information about other applications that support Azure Information Protection

In addition to the applications in the table, any application that supports the APIs for the Azure Rights Management service can be integrated with Azure Information Protection, which includes:

- Line-of-business applications that are written in-house by using the RMS SDKs

- Applications from software vendors that are written by using the RMS SDKs.

For more information, see the [Azure Information Protection Developer's Guide](./develop/developers-guide.md).

### Applications that are not supported by Azure RMS

The following applications that are not currently supported by Azure RMS include the following:

- Microsoft OneDrive for Business for SharePoint Server 2013

- XPS Viewer

In addition, the Azure Information Protection client has the following restrictions:

- For Windows computers: Requires a minimum version of Windows 7 Service Pack 1

## RMS-enlightened solutions

The following table displays RMS-enlightened solutions from software vendors.

If you are a software vendor and have a solution for this table that is not listed, register your application with Azure AD. For more information, see [How to register and RMS enable your app with Azure AD](./develop/authentication-integration.md).


|Product|Vendor|Description|
|-------------------------------|---------------------------|-----------------|
|Absolute|Absolute|Data loss prevention (DLP) to protect content.|
|Content Locker|VMware|Stores, consumes, and creates protected content.|
|Controle|TakeControle|eDiscovery by using labeling and protection.|
|Forcepoint|Forcepoint DLP|Endpoint data loss prevention (DLP) solution to enforce an organization’s data security policies.|
|Halocore|Secude|Protects files that are exported from SAP environments.|
|MaaS 360|IBM|Integration to consume and protect documents.|
|Mobiliya|Mobiliya|Secures documents from EMC’s Documentum repositories.
|Ramessys|Ramessys|Integration for Chemcart and Documentum.
|Sealpath|Sealpath Technologies|Integration with CAD design tools, such as AutoCAD and Siemens Jt2GO.
|SecRMM|Sqaudra Technologies |Document protection for removable media.
|Security Sheriff|CryptZone |Access management on SharePoint and protects documents, based on their classification and access permissions.
|Symantec DLP|Symantec |Detection and monitoring for protected files.

## Next steps
To check for other requirements, see [Requirements for Azure Information Protection](requirements.md).

For more information about how the most commonly used applications support Azure RMS, see [How applications support the Azure Rights Management service](./applications-support.md).

For information about how to configure the most commonly used  applications for Azure RMS, see [Configuring applications for Azure Rights Management](configure-applications.md).

