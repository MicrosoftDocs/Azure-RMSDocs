---
# required metadata

title: Application support for RMS data protection for Azure Information Protection
description: Identify the applications and solutions that have built-in support for the Azure Rights Management (Azure RMS) service. Azure RMS provides data protection for Azure Information Protection (AIP).
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 10/27/2020
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

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*
>
>***Relevant for**: [AIP unified labeling client and AIP classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients).*

[!INCLUDE [AIP classic client is deprecated](includes/classic-client-deprecation.md)]

The applications and solutions listed on this page have built-in support for the Azure Rights Management (Azure RMS) service, which provides data protection for Azure Information Protection.

These applications and solutions are known as "RMS-enlighted", and have Rights Management and [usage restrictions](configure-usage-rights.md) tightly integrated using Rights Management APIs.

> [!NOTE]
> Unless stated otherwise, the supported capabilities apply to both Azure RMS and AD RMS. 
>
> AD RMS support on iOS, Android, macOS, and Windows Phone 8.1 also requires the [Active Directory Rights Management Services Mobile Device Extension](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/dn673574\(v=ws.11\)).
> 

## Windows RMS-enlightened applications

|Type  |Supported applications   |
|---------|---------|
|**Word, Excel, PowerPoint**    | - [Microsoft 365 apps](#microsoft-365-app-support) <br />- Office 2010 <br />- Office 2013<br />- Office 2016 <br />- Office 2019 <br />- [Office for the web (viewing protected documents)](#viewing-protected-documents-in-office-for-the-web)<br />- [Web browser](#web-browser-support)        |
|[**Email**](#viewing-protected-content-in-email-clients)      |   - Outlook 2010<br />- Outlook 2013<br />- Outlook 2016 <br />- Outlook 2019 <br />- Outlook from Microsoft 365 Apps for Enterprise<br />- [Web browser](#web-browser-support)<br />- [Windows Mail](#email-clients-using-exchange-activesync-irm)|
|[**Other file types**](#supported-text-and-image-file-types)    |  - Visio from Microsoft 365 apps, Office 2019, and Office 2016: **.vsdm**, **.vsdx**, **.vssm**, **.vstm**, **.vssx**, **.vstx** <br />- Azure Information Protection client for Windows: Text, images, **pfile** <br />- [SealPath RMS plugin for AutoCAD](https://www.sealpath.com/rmscad/): **.dwg**       |
| | |

## macOS RMS-enlightened applications

|Type  |Supported applications   |
|---------|---------|
|**Word, Excel, PowerPoint**    |  - Microsoft 365 apps, version 16.40 or later <br />- Office 2019 for Mac, version 16.40 or later<br />- Office 2016 for Mac, version 16.16.27 or later<br />- [Office for the web](#viewing-protected-documents-in-office-for-the-web)<br />- [Web browser](#web-browser-support)    |
|[**Email**](#viewing-protected-content-in-email-clients)   |   - Outlook 2019 for Mac, version 16.40 or later<br />- Outlook 2016 for Mac, version 16.16.27 or later<br />- [Web browser](#web-browser-support)     |
|[**Other file types**](#supported-text-and-image-file-types)    | RMS sharing app (viewing protected text, images, generically protected files)   |
| | |

## Android RMS-enlightened applications

|Type  |Supported applications   |
|---------|---------|
|**Word, Excel, PowerPoint**    |- GigaTrust App for Android<br />- [Office for the web](#viewing-protected-documents-in-office-for-the-web)<br />- Office Mobile (unless using sensitivity labels, limited to viewing and editing protected documents) <br />- [Web browser](#web-browser-support)      |
|[**Email**](#viewing-protected-content-in-email-clients)     | - [9Folders](#email-clients-using-exchange-activesync-irm)<br />- Azure Information Protection app (viewing protected emails)<br />- BlackBerry Work <br />- [GigaTrust App for Android](#email-clients-using-exchange-activesync-irm) <br />- Citrix WorxMail <br />- [NitroDesk](#email-clients-using-exchange-activesync-irm)<br />- [Outlook for Android](#email-clients-using-exchange-activesync-irm)<br />- [Samsung Email (S3 and later)](#email-clients-using-exchange-activesync-irm)<br />- TITUS Classification for Mobile <br /><br />- [Web browser](#web-browser-support)       |
|[**Other file types**](#supported-text-and-image-file-types)    |  Azure Information Protection app (viewing protected text and images)  |
| | |


## iOS RMS-enlightened applications

|Type  |Supported applications   |
|---------|---------|
|**Word, Excel, PowerPoint**    |  - GigaTrust<br />- Office Mobile <br />- [Office for the web](#viewing-protected-documents-in-office-for-the-web)<br />- TITUS Docs<br />- [Web browser](#web-browser-support)    |
|[**Email**](#viewing-protected-content-in-email-clients)     |   - Azure Information Protection app (viewing protected email)<br />- BlackBerry Work<br />- Citrix WorxMail <br />- [NitroDesk](#email-clients-using-exchange-activesync-irm)<br />- [Outlook for iPad and iPhone](#email-clients-using-exchange-activesync-irm)<br />- TITUS Mail <br />- [Web browser](#web-browser-support)     |
|[**Other file types**](#supported-text-and-image-file-types)     | - Azure Information Protection app (viewing protecting text and images)<br />- TITUS Docs: **Pfile**  |
| | |

## Windows 10 mobile RMS-enlightened applications

|Type  |Supported applications   |
|---------|---------|
|**Word, Excel, PowerPoint**    | - Office Mobile apps (viewing protected documents using Azure RMS) <br />- [Web browser](#web-browser-support)    |
|[**Email**](#viewing-protected-content-in-email-clients)    |  - Citrix WorxMail <br />- Outlook Mail (viewing protected emails) <br />- [Web browser](#web-browser-support)     |
|[**Other file types**](#supported-text-and-image-file-types)    | Not supported   |
| | |

## Blackberry 10 RMS-enlightened applications

|Type  |Supported applications   |
|---------|---------|
|**Word, Excel, PowerPoint**    | - [Web browser](#web-browser-support)    |
|[**Email**](#viewing-protected-content-in-email-clients)   | - [ Blackberry email](#email-clients-using-exchange-activesync-irm) <br />- [Web browser](#web-browser-support)      |
|[**Other file types**](#supported-text-and-image-file-types)    | Not supported   |
| | |


## Additional details about RMS-enlightened applications

For more information about the tables RMS-enlightened applications listed above, see:

- [Viewing protected content in email clients](#viewing-protected-content-in-email-clients)
- [Supported text and image file types](#supported-text-and-image-file-types)
- [Microsoft 365 app support](#microsoft-365-app-support)
- [Viewing protected documents in Office for the web](#viewing-protected-documents-in-office-for-the-web)
- [Web browser support](#web-browser-support)
- [Email clients using Exchange ActiveSync Information Rights Management (IRM)](#email-clients-using-exchange-activesync-irm)

### Viewing protected content in email clients

When an email client protects a message, any Office files that are attached to the message, and are currently unprotected, are protected together with the email message. In such cases, both the email message and attachments can be viewed in the email client, by authorized recipients only.

However, if only the attachment is protected, but not the email message itself, the attachment cannot be previewed by the email client, even by authorized recipients.

> [!TIP]
> For email clients that don't support protecting emails, consider using [Exchange Online mail flow rules to apply this protection](https://support.office.com/article/define-mail-flow-rules-to-encrypt-email-messages-in-office-365-9b7daf19-d5f2-415b-bc43-a0f5f4a585e8).

### Supported text and image file types

File types other than Office files and email messages include text and image file types, with extensions such as **.txt**, **.xml**, **.jpg**, and **.jpeg**. 

These files change their file name extension after they're natively protected by Rights Management, and then become read-only. 

Files that cannot be natively protected have a **.pfile** file name extension after they are generically protected by Rights Management.

For more information, see the [File types supported](./rms-client/client-admin-guide-file-types.md).

### Microsoft 365 app support

Includes: 
- Office apps, for the versions listed in the [table of supported versions for Microsoft 365 Apps by update channel](/officeupdates/update-history-microsoft365-apps-by-date), from Microsoft 365 Apps for Business or Microsoft 365 Business Premium, when the user is assigned a license for Azure Rights Management (also known as Azure Information Protection for Office 365)
- Microsoft 365 Apps for Enterprise

### Viewing protected documents in Office for the web

Supported only with Microsoft SharePoint and OneDrive, and the documents are unprotected before they are uploaded to a protected library.

### Web browser support

- Web browsers are supported for **Word, Excel, and PowerPoint** files, when the [Office attachments](https://support.office.com/article/bb643d33-4a3f-4ac7-9770-fd50d95f58dc#FileTypesforIRM) are protected by using [Microsoft 365 Message Encryption with the new capabilities](https://techcommunity.microsoft.com/t5/Security-Privacy-and-Compliance/Email-Encryption-and-Rights-Protection/ba-p/110801).

- For **emails**, web browsers are supported only in the following scenarios:

    - If both the sender and the recipient are part of the same organization
    - If the sender or recipient is using Exchange Online
    - If the sender is using Exchange on-premises in a hybrid configuration 

### Email clients using Exchange ActiveSync IRM

The following email clients use Exchange ActiveSync IRM, which must be enabled by the Exchange administrator:

- Windows Mail
- 9Folders
- GigaTrust App for Android
- NitroDesk
- Outlook for Android
- Samsung Email (S3 and later)
- Outlook for iPad and iPhone
- Blackberry Email

Users can view, reply, and reply all for protected email messages but cannot protect new email messages.
 
If the email application cannot render the message because the Exchange ActiveSync IRM is not enabled, the recipient can view the email in a web browser when the sender uses Exchange Online, or Exchange on-premises in a hybrid configuration. 

## Azure RMS support for Office

Azure RMS is tightly integrated into the Word, Excel, PowerPoint, and Outlook apps, where this functionality is often referred to as Information Rights Management (IRM). 

- [Windows computers for Information Rights Management (IRM)](#windows-computers-for-information-rights-management-irm)
- [Mac computers for Information Rights Management (IRM)](#mac-computers-for-information-rights-management-irm)

See also: [Office Applications Service Description](/office365/servicedescriptions/office-applications-service-description/office-applications-service-description)

### Windows computers for Information Rights Management (IRM)

The following Office client suites support protecting files and emails on Windows computers by using the Azure Rights Management service:

- **Office apps**, for the versions listed in the [table of supported versions for Microsoft 365 Apps by update channel](/officeupdates/update-history-microsoft365-apps-by-date), from Microsoft 365 Apps for Business or Microsoft 365 Business Premium, when the user is assigned a license for Azure Rights Management (also known as Azure Information Protection for Office 365)

- **Microsoft 365 Apps for Enterprise**

    These editions of Office are included with most but not all subscriptions that include data protection from Azure Information Protection. Check your subscription information to see if Microsoft 365 Apps for Enterprise ProPlus is included. You'll also find this information in the [Azure Information Protection datasheet](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf).

- **Office Professional Plus 2019**

- **Office Professional Plus 2016**

- **Office Professional Plus 2013**

- **Office Professional Plus 2010 with Service Pack 2**

All editions of Office (with the exception of Office 2007) support consuming protected content.

#### Azure Rights Management service with Office Professional Plus 2010 and Service Pack 2 or Office Professional 2010 with Service Pack 2

When you use the Azure Rights Management service with Office Professional Plus 2010 and Service Pack 2 or Office Professional 2010 with Service Pack 2, you must also have the AIP client for Windows.

Additionally, this configuration:

- Is not supported on Windows 10.
- Does not support forms-based authentication for federated user accounts. These accounts must use Windows-Integrated Authentication.
- Does not support the ability to override template protection using custom permissions selected with the AIP client. In this scenario, the original protection must first be removed before custom permissions can be applied.

### Mac computers for Information Rights Management (IRM)

The following Office client suites support protecting files and emails on macOS by using Azure RMS:

- Microsoft 365 Apps for Enterprise
- Office Standard 2019 for Mac
- Office Standard 2016 for Mac

All editions of Office for Mac 2019 and Office for Mac 2016 support consuming protected content.

> [!TIP]
> If you are using the classic client on a Mac computer, you might find the following FAQ useful: [How do I configure a Mac computer to protect and track documents?](faqs-classic.md#how-do-i-configure-a-mac-computer-to-protect-and-track-documents)
> 
## Azure Information Protection apps for iOS and Android

The Azure Information Protection app for iOS and Android provides a viewer for rights-protected email messages **(.rpmsg** files) when these mobile devices don't have an email app that can open protected emails. This app can also open rights-protected PDF files, and pictures and text files that are rights-protected.

If your iOS and Android devices are enrolled by Microsoft Intune, users can install the app from the Company Portal and you can manage the app by using Intune's [app protection policies](/intune/apps/app-protection-policies).

For more information about how to use app, see the [FAQ for Microsoft Azure Information Protection app for iOS and Android](./rms-client/mobile-app-faq.md).

## The Azure Information Protection client for Windows

To use Azure Information Protection, you must deploy the AIP client across your system. 

Download the unified labeling client installation from the [Microsoft Azure Information Protection page](https://go.microsoft.com/fwlink/?LinkId=303970). 

For more information, see:

- [The client side of Azure Information Protection](rms-client/use-client.md)
- [Unified labeling client administrator guide](./rms-client/clientv2-admin-guide.md)
- [Unified labeling client user guide](./rms-client/clientv2-user-guide.md)

### AIP's classic client

If you have not yet upgraded, you may still have the legacy [Azure Information Protection classic client](./rms-client/aip-client.md) deployed.

For more information about deploying and using the classic client, see:

- [AIP classic client](./rms-client/aip-client.md)
- [Classic client administrator guide](./rms-client/client-admin-guide.md)
- [Classic client user guide](./rms-client/client-user-guide.md).

[!INCLUDE [AIP classic client is deprecated](includes/classic-client-deprecation.md)]

## Rights Management sharing app

For Mac computers, the Rights Management sharing app offers a viewer for protected PDF files (**.ppdf**), protected text images, and generically protected files. It can also protect image files, but not other files. To protect Office files on these computers, use Office for Mac or Microsoft 365 Apps for Enterprise. 

For more information, see the [FAQ for Microsoft Rights Management Sharing Application for Mobile Platforms](/previous-versions/msdn10/dn451248(v=msdn.10))

Download the Rights Management sharing app for Mac computers from the [Microsoft Azure Information Protection page](https://go.microsoft.com/fwlink/?LinkId=303970).

## Other applications that support Azure Information Protection

In addition to the applications listed above, any application that supports the APIs for the Azure Rights Management service can be integrated with Azure Information Protection. 

Examples may include line-of-business applications written in-house, or applications from software vendors, written using the RSM SDKs.

## Applications that are not supported by Azure RMS

Applications not currently supported by Azure RMS include:

- Microsoft OneDrive for SharePoint Server 2013
- XPS Viewer
- Applications running on Windows versions earlier than Windows 7, Service Pack 1


## Next steps

See also:

- [Requirements for Azure Information Protection](requirements.md).
- [How applications support the Azure Rights Management service](./applications-support.md).
- [Configuring applications for Azure Rights Management](configure-applications.md).

For the latest information about solutions that support the Azure Rights Management service and Azure Information Protection, see the blog post, [Microsoft Ignite 2019 – Microsoft Information Protection solutions Partner ecosystem showcase](https://techcommunity.microsoft.com/t5/Microsoft-Information-Protection/Microsoft-Ignite-2019-Microsoft-Information-Protection-solutions/ba-p/967024).
