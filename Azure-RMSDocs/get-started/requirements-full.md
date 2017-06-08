---
# required metadata

title: Requirements for Azure Information Protection - Full article
description: Identify the prerequisites to deploy Azure Information Protection for your organization.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: get-started-article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 10cf9371-a61b-495f-9d42-898448806994

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Requirements for Azure Information Protection

>*Applies to: Azure Information Protection, Office 365*


Before you deploy Azure Information Protection for your organization, make sure that you have the following prerequisites. 

|Requirement|More information|
|---------------|--------------------|
|A subscription for Azure Information Protection|Review the [subscription information](https://www.microsoft.com/en-us/cloud-platform/azure-information-protection-pricing) and [feature list](https://www.microsoft.com/en-us/cloud-platform/azure-information-protection-features) from the Azure Information Protection site to make sure that your organization's subscription includes the Azure Information Protection features that you want to use.|
|Azure Active Directory|Your organization must have an Azure Active Directory (Azure AD) to support user authentication for Azure Information Protection. In addition, if you want to use your user accounts from your on-premises directory (AD DS), you must also configure directory integration.<br /><br />If your accounts are federated (for example, you use AD FS), they must use Windows Integrated Authentication. Forms-based authentication is not supported for Azure Information Protection.<br /><br />Multi-factor authentication (MFA) is supported with Azure Information Protection when you have the required client software and correctly configured MFA supporting infrastructure.<br /><br />For more information, see [Azure Active Directory requirements for Azure Information Protection](requirements-azure-ad.md).|
|Client devices|Users must have client devices (computer or mobile device) that run an operating system that supports Azure Information Protection.<br /><br />The following devices support the Azure Information Protection client, which lets users classify and label their Office documents and emails:<br /><br />- Windows 10 (x86, x64)<br /><br />- Windows 8.1 (x86, x64)<br /><br />- Windows 8 (x86, x64)<br /><br />- Windows 7 Service Pack 1 (x86, x64)<br /><br />When this client protects the data by using the Azure Rights Management service, it can be consumed by the same devices (Windows, Mac, iOS, Android), that support the Azure Rights Management service. <br /><br />For details about the devices that support the Azure Rights Management service, see [Client devices that support Azure Rights Management data protection](../get-started/requirements-client-devices.md).|
|Applications|The Azure Information Protection client supports labeling and protection of files and emails that are created by the following Office applications: **Word**, **Excel**, **PowerPoint**, and **Outlook** from the following Office suites:<br /><br />- Office Professional Plus 2016<br /><br />- Office Professional Plus 2013 with Service Pack 1<br /><br />- Office Professional Plus 2010<br /><br />For information about the applications that support the Azure Rights Management service, see [Applications that support Azure Rights Management data protection](requirements-applications.md).|
|Infrastructure that supports connectivity to the Internet and dependent cloud services|If you have a firewall or similar intervening network devices that must be configured to allow specific connections, see the information for **Azure Rights Management (RMS)** in the [Office 365 portal and shared](https://support.office.com/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2#BKMK_Portal-identity) section from the following Office article: [Office 365 URLs and IP address ranges](https://support.office.com/en-US/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2).<br /><br />Use the instructions in this Office article to keep up-to-date with changes to this information, by subscribing to an RSS feed.<br /><br />In addition to the information in the Office article, specific to Azure Information Protection:<br /><br />- Allow HTTPS traffic on TCP 443 to **api.informationprotection.azure.com**.<br /><br />- Do not terminate the TLS client-to-service connection (for example, to do packet-level inspection). Doing so breaks the certificate pinning that RMS clients use with Microsoft-managed CAs to help secure their communication with Azure RMS.<br /><br />- If you use a web proxy that requires authentication, you must configure it to use integrated Windows authentication with the user's Active Directory logon credentials.|

If you want to use the Azure Rights Management service from Azure Information Protection with on-premises servers, the following products are supported:

-   Exchange Server

-   SharePoint Server

-   Windows Server file servers that support File Classification Infrastructure

For information about the additional requirements for this scenario, see [On-premises servers that support Azure Rights Management data protection](requirements-servers.md).

> [!IMPORTANT]
> The following deployment scenario is not supported unless you are using AD RMS protection with Azure Information Protection (the "hold your own key" or HYOK configuration):
> 
> -   Running AD RMS and Azure RMS side-by-side in the same organization, except during migration, as described in [Migrating from AD RMS to Azure Information Protection](../plan-design/migrate-from-ad-rms-to-azure-rms.md).
> 
> There is a supported migration path [from AD RMS to Azure Information Protection](http://technet.microsoft.com/library/Dn858447.aspx), and from [Azure Information Protection to AD RMS](http://msdn.microsoft.com/library/azure/dn629429.aspx). If you deploy Azure Information Protection and then decide that you no longer want to use this cloud service, see [Decommissioning and deactivating Azure Information Protection](../deploy-use/decommission-deactivate.md).

## Azure Active Directory requirements for Azure Information Protection

You must have an Azure AD directory to use Azure Information Protection. You use your organization account for this directory to sign in to the Azure classic portal, where, for example, you can configure and manage Rights Management templates.

If you do not already have an Azure subscription for your organization, you can get one by signing up for a free trial.: Go to the [Azure Get started](https://account.windowsazure.com/organization) page and follow the instructions.

For more information, see the following resources in the Azure Active Directory documentation:

-   [What is Azure AD Directory?](/active-directory/active-directory-whatis)

-   [How Azure subscriptions are associated with Azure Active Directory](/active-directory/active-directory-how-subscriptions-associated-directory)

If you want to integrate your Azure AD directory with your on-premises AD forests, see [Integrating your on-premises identities with Azure Active Directory](/active-directory/active-directory-aadconnect).

> [!NOTE]
> If you have mobile devices or Mac computers that authenticate on-premises by using AD FS or an equivalent authentication provider:
> 
> -   You must use AD FS on the minimum server version of **Windows Server 2012 R2**, or an alternative authentication provider that supports the OAuth 2.0 protocol.

### Multi-factor authentication (MFA) and Azure Information Protection
To use multi-factor authentication (MFA) with Azure Information Protection requires at least one of the following:

-   Office 2013 (minimum version):

    -   If you have Office 2013, you must also install the [June 9, 2015, update for Office 2013 (KB3054853)](https://support.microsoft.com/kb/3054853). For more information about this update and how modern authentication brings Active Directory Authentication Library (ADAL)-based sign in to Office 2013, see [Office 2013 modern authentication public preview announced](https://blogs.office.com/2015/03/23/office-2013-modern-authentication-public-preview-announced/) on the Office blog.

-   Rights Management sharing application for Windows:

    -   You must have installed the minimum version of 1.0.1908.0, which can be confirmed by using Control Panel, Programs and Features. For more information about the sharing application, see  [Rights Management sharing application for Windows](../rms-client/sharing-app-windows.md).

-   Rights Management sharing app for mobile devices and Mac computers:

    -   Make sure that you have the latest version installed. MFA support went into the September 2015 release of the RMS sharing app.

Then, configure your MFA solution:

-   For Microsoft-managed tenants (you have Azure Active Directory or Office 365):

    -   Configure Azure MFA to enforce MFA for users. For instructions, see [Getting started with Azure Multi-Factor Authentication in the cloud](/multi-factor-authentication/multi-factor-authentication-get-started-cloud) from the Multi-factor Authentication documentation.

        For more information about Azure MFA, see [What is Azure Multi-Factor Authentication?](/multi-factor-authentication/multi-factor-authentication)

-   For federated tenants (you operate federation servers on-premises):

    -   Configure your federation servers for Azure Active Directory or Office 365. For example, if you are using AD FS, see [Configure Additional Authentication Methods for AD FS](https://technet.microsoft.com/library/dn758113.aspx) on TechNet.

        For more information about this scenario, see  [The Works with Office 365 – Identity program now streamlined](https://blogs.office.com/2014/01/30/the-works-with-office-365-identity-program-now-streamlined/) on the Office blog.

## Client devices that support Azure Rights Management data protection

Use the following sections to identify which devices support the Azure Rights Management service, which provides data protection for Azure Information Protection.

### Computers
The following computer operating systems support the Azure Rights Management service:

-   **Windows 7** (x86, x64)

-   **Windows 8** (x86, x64)

-   **Windows 8.1** (x86, x64)

-   **Windows 10** (x86, x64)

-   **Mac OS X**: Minimum version of Mac OS X 10.8 (Mountain Lion)

### Mobile devices
The following mobile device operating systems support the Azure Rights Management service:

-   **Windows Phone**: Windows Phone 8.1

-   **Android phones and tablets**: Minimum version of Android 4.0.3

-   **iPhone and iPad**: Minimum version of iOS 7.0

-   **Windows tablets**: Windows 10 Mobile and Windows 8.1 RT

## Applications that support Azure Rights Management data protection

Use the following table to identify the applications that natively support the Azure Rights Management service (Azure RMS), which provides the data protection for Azure Information Protection. 

For these applications, Rights Management support is tightly integrated by using the Rights Management APIs to support usage restrictions. These applications are also known as RMS-enlightened.

Unless stated otherwise, the supported capabilities apply to both Azure RMS and AD RMS. In addition, AD RMS support on iOS, Android, OS X, and Windows Phone 8.1 requires [Active Directory Rights Management Services Mobile Device Extension](https://technet.microsoft.com/library/dn673574.aspx).

Information about the table columns:

-   **Protected PDF**: Files that have a .ppdf file name extension and that are automatically created when you use the RMS sharing application to share Office files and PDF files by email. The RMS sharing application and the Azure Information Protection app for iOS and Android include a reader for protected PDF files. Previously, if you created PDF files that you protected by using Azure RMS or AD RMS, you can continue to read these files on Windows, iOS, and Android devices by using Foxit Reader and Nitro Pro.

-   **Email:** The email clients listed can protect the email message itself, which will automatically protect any attached files. In this scenario, the client’s preview feature can display the protected content (message and attachment) to authorized recipients. However, if an email message itself is not protected but the attachment is protected, the client's preview feature cannot display the protected attachment to authorized recipients.

-   **Other file types**: Text and image files include files that have a file name extension such as .txt, .xml, .jpg, .and jpeg. These files change their file name extension after they are natively protected by Rights Management, and become read-only. Files that cannot be natively protected have a .pfile file name extension after they are generically protected by Rights Management. For more information, see the [Rights Management sharing application administrator guide](../rms-client/sharing-app-admin-guide.md).


|**Device operating system**|Word, Excel, PowerPoint|Protected PDF|Email|Other file types|
|-------------------------------|---------------------------|-----------------|---------|--------------------|
|**Windows**|Office 2010<br /><br />Office 2013<br /><br />Office 2016 <br /><br />Office Mobile apps (Azure RMS only) [[1]](#footnote-1)<br /><br />Office Online [[2]](#footnote-2)|Gaaiho Doc<br /><br />GigaTrust Desktop PDF Client for Adobe<br /><br />Foxit Reader<br /><br />Nitro PDF Reader<br /><br />RMS sharing app|Outlook 2010<br /><br />Outlook 2013<br /><br />Office 2016 <br /><br />Outlook Web App (OWA) [[3]](#footnote-3)<br /><br />Windows Mail [[4]](#footnote-4)|RMS sharing application for Windows: Text, images, pfile<br /><br />Siemens JT2Go: JT files (Windows 10 only)|
|**iOS**|Office for iPad and iPhone [[5]](#footnote-5)<br /><br />Office Online [[2]](#footnote-2)<br /><br />TITUS Docs|Azure Information Protection app [[1]](#footnote-1)<br /><br /> Foxit Reader<br /><br />TITUS Docs|Azure Information Protection app [[1]](#footnote-1)<br /><br />Citrix WorxMail [[6]](#footnote-6)<br /><br />NitroDesk [[4]](#footnote-4)<br /><br />Outlook for iPad and iPhone [[4]](#footnote-4)<br /><br />OWA for iOS [[3]](#footnote-3)<br /><br />TITUS Mail|Azure Information Protection app [[1]](#footnote-1): Text, images<br /><br />TITUS Docs: Pfile|
|**Android**|GigaTrust App for Android<br /><br />Office Online [[2]](#footnote-2)<br /><br />Office Mobile (Azure RMS only) [[1]](#footnote-1)|Azure Information Protection app [[1]](#footnote-1)<br /><br />GigaTrust App for Android<br /><br />Foxit Reader<br /><br />RMS sharing app [[1]](#footnote-1)|9Folders [[4]](#footnote-4)<br /><br />Azure Information Protection app [[1]](#footnote-1)<br /><br />GigaTrust App for Android [[4]](#footnote-4)<br /><br />Citrix WorxMail [[6]](#footnote-6)<br /><br />NitroDesk [[4]](#footnote-4)<br /><br />Outlook for Android [[4]](#footnote-4)<br /><br />OWA for Android [[3]](#footnote-3) and [[7]](#footnote-7)<br /><br />Samsung Email (S3 and later) [[7]](#footnote-7)<br /><br />TITUS Classification for Mobile|Azure Information Protection app [[1]](#footnote-1): Text, images|
|**OS X**|Office 2011 (AD RMS only)<br /><br />Office 2016 for Mac<br /><br />Office Online [[2]](#footnote-2)|Foxit Reader<br /><br />RMS sharing app [[1]](#footnote-1)|Outlook 2011 (AD RMS only)<br /><br />Outlook 2016 for Mac<br /><br />Outlook for Mac|RMS sharing app [[1]](#footnote-1): Text, images, pfile|
|**Windows 10 Mobile**|Office Mobile apps (Azure RMS only)[[1]](#footnote-1)|Not supported|Citrix WorxMail [[6]](#footnote-6)<br /><br />Outlook Mail|Not supported|
|**Windows RT**|Office 2013 RT<br /><br />Office Online [[2]](#footnote-2)|Not supported|Outlook 2013 RT<br /><br />Mail app for Windows<br /><br />Windows Mail [[4]](#footnote-4)|Siemens JT2Go: JT files|
|**Windows Phone 8.1**|Office Mobile (AD RMS only)|RMS sharing app [[1]](#footnote-1)|Outlook Mobile [[4]](#footnote-4)|RMS sharing app [[1]](#footnote-1): Text, images, pfile|
|**Blackberry 10**|Not supported|Not supported|Blackberry email [[4]](#footnote-4)|Not supported|


##### Footnote 1
Supports viewing protected content.

##### Footnote 2 
Supports viewing protected documents when an unprotected document is uploaded to a protected library in SharePoint Online and OneDrive for Business. 

##### Footnote 3
If a recipient receives a protected email and is not using Exchange as the mail server or if the sender belongs to another organization, this content can be opened only in a rich email client, such as Outlook. This content cannot be opened from Outlook Web Access.

##### Footnote 4
Uses Exchange ActiveSync IRM, which must be enabled by the Exchange administrator. Users can view, reply, and reply all for protected email messages but users cannot protect new email messages themselves.

If a recipient receives a protected email and is not using Exchange as the mail server or if the sender belongs to another organization, this content can be opened only in a rich email client, such as Outlook. This content cannot be opened from Outlook Web Access or from mobile mail clients using Exchange Active Sync IRM.

##### Footnote 5
Supports viewing and editing protected documents. For more information, see the following post on the Office blog: [Azure Rights Management support comes to Office for iPad and iPhone](https://blogs.office.com/2015/07/22/azure-rights-management-support-comes-to-office-for-ipad-and-iphone-2/)

##### Footnote 6
For more information, see the Citrix [product documentation for WorxMail](http://docs.citrix.com/en-us/worx-mobile-apps/10/xmob-worx-mail.html).

##### Footnote 7
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

### More information about the Azure Information Protection app for iOS and Android

The Azure Information Protection app for iOS and Android replaces the RMS sharing app for these devices. It provides the same functionality and in addition, supports rights-protected email messages and rights-protected PDF files on SharePoint Online.

If your iOS and Android devices are enrolled by Microsoft Intune, you can deploy and manage this app by using a policy managed app. For more information, see [Configure and deploy mobile application management policies in the Microsoft Intune console](/intune/deploy-use/configure-and-deploy-mobile-application-management-policies-in-the-microsoft-intune-console) from the Intune documentation. For Step 2 from this Intune documentation, use the instructions to publish a policy managed app.

For more information, see the [FAQ for Microsoft Azure Information Protection app for iOS and Android](../rms-client/mobile-app-faq.md).


### More information about the Rights Management sharing application

For more information about the Rights Management sharing application for Windows, see the following resources:

-   [Rights Management sharing application administrator guide](../rms-client/sharing-app-admin-guide.md)

-   [Rights Management sharing application user guide](../rms-client/sharing-app-user-guide.md)

For more information about the Rights Management sharing application for mobile platforms, see the following resources:

-   Download the relevant app by using the links on the [Microsoft Rights Management page](http://go.microsoft.com/fwlink/?LinkId=303970)

-   [FAQ for Microsoft Rights Management Sharing Application for Mobile Platforms](https://technet.microsoft.com/dn451248)

> [!NOTE]
> The RMS sharing application for iOS and Android is now replaced by the Azure Information Protection app.

### More information about other applications that support Azure RMS

In addition to the applications in the table, any application that support that RMS APIs can be integrated with Azure RMS, which includes:

- Line-of-business applications that are written in-house by using the RMS SDK

- Applications from software vendors that are written by using the RMS SDK.

For more information about the SDK, see the [Microsoft Rights Management SDK](../develop/developers-guide.md).

### Applications that are not supported by Azure RMS

The following applications that are not currently supported by Azure RMS include the following:

-   Microsoft Office for Mac 2011

-   Microsoft OneDrive for Business for SharePoint Server 2013

-   XPS Viewer
 
In addition, the RMS sharing application has the following restrictions:

-   For Windows computers: Requires a minimum version of Windows 7 Service Pack 1

## On-premises servers that support Azure Rights Management data protection

The following on-premises server products are supported with Azure Information Protection when you use the Azure Rights Management connector. This connector acts as a communications interface (a relay) between the on-premises servers and the Azure Rights Management service that is used by Azure Information Protection to protect Office documents and emails. 

To use this connector, you must configure directory synchronization between your Active Directory forests and Azure Active Directory.

-   **Exchange Server**:

    -   Exchange Server 2016

    -   Exchange Server 2013

    -   Exchange Server 2010

-   **Office SharePoint Server**:

    -   Office SharePoint Server 2016

    -   Office SharePoint Server 2013

    -   Office SharePoint Server 2010

-   **File servers that run Windows Server and use File Classification Infrastructure (FCI)**:

    -   Windows Server 2012 R2

    -   Windows Server 2012

    > [!NOTE]
    > Because file servers that run Windows Server 2008 R2 do not have a built-in file management task action to apply Rights Management protection, you cannot use the Rights Management connector for this scenario. However, you can use File Classification Infrastructure and Azure RMS on these operating systems if you configure a custom file management task to run an executable or script that can protect files by using Azure RMS. For example, a Windows PowerShell script that uses the [RMS Protection cmdlets](https://msdn.microsoft.com/library/azure/mt433195.aspx).
    > 
    > You can also use these cmdlets with servers running later versions of Windows Server, with the benefit that these cmdlets can protect all file types. The RMS connector protects Office files only. For how-to instructions, see [RMS Protection with Windows Server File Classification Infrastructure &#40;FCI&#41;](../rms-client/configure-fci.md).

The Rights Management connector is supported on Windows Server 2012 R2, Windows Server 2012, and Windows Server 2008 R2.

For more information about how to configure the Rights Management connector for these on-premises servers, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]
