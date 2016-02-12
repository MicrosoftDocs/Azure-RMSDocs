---
title: Requirements for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: dc78321d-d759-4653-8818-80da74b6cdeb
author: Cabailey
---
# Requirements for Azure Rights Management
To deploy Microsoft Azure Rights Management (Azure RMS) in your organization, make sure that you have the following prerequisites. You can then use the [Azure Rights Management Deployment Roadmap](../Topic/Azure-Rights-Management-Deployment-Roadmap.md) to deploy Rights Management for your organization.

|Requirement|More information|
|---------------|--------------------|
|A cloud subscription for RMS|Your organization must have a cloud subscription that supports RMS.<br /><br />For licensing information, see the [Cloud subscriptions that support Azure RMS](../Topic/Requirements-for-Azure-Rights-Management.md#BKMK_SupportedSubscriptions) section in this topic.|
|Azure AD directory|Your organization must have an Azure AD directory to support user authentication for RMS. In addition, if you want to use your user accounts from your on-premises directory (AD DS), you must also configure directory integration.<br /><br />Multi-factor authentication (MFA) is supported with Azure RMS when you have the required client software and correctly configured     MFA supporting infrastructure.<br /><br />For more information, see the [Azure AD directory](../Topic/Requirements-for-Azure-Rights-Management.md#BKMK_AzureADTenant) section in this topic.|
|Client devices|Users must have a client devices (computer or mobile device) that run an operating system that supports RMS.<br /><br />For more information, see the [Client devices that support Azure RMS](../Topic/Requirements-for-Azure-Rights-Management.md#BKMK_SupportedDevices) section in this topic.|
|Applications|Users must run applications that support RMS.<br /><br />For more information, see the [Applications that support Azure RMS](../Topic/Requirements-for-Azure-Rights-Management.md#BKMK_SupportedApplications) section in this topic.|
|Infrastructure that supports connectivity to the Internet and dependent cloud services|If you have a firewall or similar intervening network devices that must be configured to allow specific connections, see [Office 365 URLs and IP address ranges](https://support.office.com/en-US/article/Office-365-URLs-and-IP-address-ranges-8548a211-3fe7-47cb-abb1-355ea5aa88a2).<br /><br />The list of URLs and IP addresses in the **Office 365 portal and identity** section apply to the Office 365 portal, Azure Active Directory resources, and Azure Rights Management. Use the instructions in this article to keep up-to-date with changes to this information, by subscribing to an RSS feed.<br /><br />In addition to the information in the Office article, specific to Azure RMS:<br /><br />Do not terminate the TLS client-to-service connection (for example, to do packet-level inspection). Doing so breaks the certificate pinning that RMS clients use with Microsoft-managed CAs to help secure their communication with Azure RMS.<br /><br />Do not use a web proxy configuration that authenticates on behalf of a user.|

If you want to use Azure RMS with on-premises servers, the following products are supported:

-   Exchange Server

-   SharePoint Server

-   Windows Server file servers that support File Classification Infrastructure

For information about the additional Azure RMS requirements for this scenario, see the [On-premises servers that support Azure RMS](../Topic/Requirements-for-Azure-Rights-Management.md#BKMK_SupportedServers) section in this topic.

> [!IMPORTANT]
> The following deployment scenario is not supported:
> 
> -   Running AD RMS and Azure RMS side-by-side in the same organization, except during migration, as described in [Migrating from AD RMS to Azure Rights Management](../Topic/Migrating-from-AD-RMS-to-Azure-Rights-Management.md).
> 
> There is a supported migration path [from AD RMS to Azure RMS](http://technet.microsoft.com/library/Dn858447.aspx), and from [Azure RMS to AD RMS](http://msdn.microsoft.com/library/azure/dn629429.aspx). If you deploy Azure RMS and then decide that you no longer want to use this cloud service, see [Decommissioning and Deactivating Azure Rights Management](../Topic/Decommissioning-and-Deactivating-Azure-Rights-Management.md).

Use the following sections to learn more about the Azure RMS requirements.

## <a name="BKMK_SupportedSubscriptions"></a>Cloud subscriptions that support Azure RMS
To use Azure RMS, your organization must have at least one of the following subscriptions with a sufficient number of licenses for users and services that will protect files and email messages. If you have a service that will apply protection for users (owners of the files or email messages), those users require one of these licenses. Users who will only consume (for example, read and edit) this protected data do not need a license.

-   Office 365

-   Azure Rights Management Premium (formerly Azure RMS Standalone)

-   Enterprise Mobility Suite

-   RMS for individuals

Use the following sections for more information and sign up options.

For a licensing comparison of the Azure RMS capabilities for the paid subscriptions, see [Comparison of Rights Management Services (RMS) Offerings](http://technet.microsoft.com/dn858608).

Have additional questions about licensing for Azure RMS? Download the **Licensing FAQ for Azure Rights Management** from the [Azure Rights Management Purchasing](https://www.microsoft.com/en-us/server-cloud/products/azure-rights-management/Purchasing.aspx) page. 

### Office 365 subscription
[Free 30-day trial: Enterprise E3](http://go.microsoft.com/fwlink/p/?LinkID=403802)

This subscription is designed for organizations who want to use the Office online services and use their Information Rights Management feature, which uses Azure RMS. However, not all Office 365 subscriptions include Azure RMS.

|Licensing option|Office 365 Business Essentials|Office 365 Business Premium|Office 365 Enterprise E1<br /><br />Office 365 Education A1|Office 365 Enterprise E3<br /><br />Office 365 Education A3<br /><br />Office 365 Government G3|Office 365 Enterprise E4<br /><br />Office 365 Education A4<br /><br />Office 365 Government G4|Office 365 Enterprise E5<br /><br />Office 365 Education A5<br /><br />Office 365 Government G5|Office 365 Enterprise K1|SharePoint Plan 1<br />SharePoint Plan 2|Exchange Online Plan 1<br />Exchange Online Plan 2|
|--------------------|----------------------------------|-------------------------------|-------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|----------------------------|----------------------------------------|--------------------------------------------------|
|Information Rights Protection (IRM)|No|No|No|Yes|Yes|Yes|No|No|No|

### Azure Rights Management Premium subscription
[Free 30-day trial](https://portal.microsoftonline.com/Signup/MainSignUp15.aspx?&amp;OfferId=A43415D3-404C-4df3-B31B-AAD28118A778&amp;dl=RIGHTSMANAGEMENT&amp;ali=1)

This subscription was formerly known as Azure RMS Standalone and it is designed for organizations that want to use Azure RMS but don’t have subscription that includes Azure RMS. For example, if you have a subscription for Office 365 Business Essentials or Office 365 Enterprise E1, these subscriptions do not include Azure RMS (see the table in the preceding section). To use Azure RMS, you could purchase a subscription for Azure Rights Management Premium (or purchase another subscription, such as Office 365 Enterprise E4, that includes Azure RMS).

For more information, see [Microsoft Azure Rights Management](http://products.office.com/business/microsoft-azure-rights-management).

This subscription also offers a trial period for you to try out Azure RMS for 25 users, at no charge. If the subscription expires before you purchase a replacement subscription, see the following section, “What happens when the trial subscription expires?”

|Licensing option|Office 365 Business Essentials|Office 365 Business Premium|Office 365 Enterprise E1<br /><br />Office 365 Education A1|Office 365 Enterprise E3<br /><br />Office 365 Education A3<br /><br />Office 365 Government G3|Office 365 Enterprise E4<br /><br />Office 365 Education A4<br /><br />Office 365 Government G4|Office 365 Enterprise E5<br /><br />Office 365 Education A5<br /><br />Office 365 Government G5|Office 365 Enterprise K1|SharePoint Plan 1<br />SharePoint Plan 2|Exchange Online Plan 1<br />Exchange Online Plan 2|
|--------------------|----------------------------------|-------------------------------|-------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|----------------------------|----------------------------------------|--------------------------------------------------|
|Information Rights Protection (IRM)|Yes|Yes [footnote 1]|Yes|Yes|Yes|Yes|Yes|Yes|Yes|
Footnote 1:  For Business Premium, there are some client restrictions: You can protect content and consume protected content with RMS by using the Outlook Web App and the RMS sharing app. You can consume protected content by using all other Office applications, which includes Office Online and the client applications for Office 365 Business Premium.

#### <a name="BKMK_TrialExpiryBehavior"></a>What happens when the trial subscription expires?
If your trial subscription expires, you will lose access to content that was protected by using your trial subscription for Azure RMS. However, if you then purchase a subscription that supports Azure RMS, access is automatically restored.

An exception to losing access upon expiry is if your organization used Azure RMS with the RMS for individuals subscription before you obtained the trial subscription. Then, access to previously protected content remains, even after the trial subscription expires.

### Enterprise Mobility Suite subscription
[Free 30-day trial](http://go.microsoft.com/fwlink/?LinkId=615385)

This subscription is designed for organizations who want to use a combination of Azure Active Directory Premium, Windows Intune, and Azure Rights Management. For more information, see the [Microsoft Enterprise Mobility Overview](http://go.microsoft.com/fwlink/?LinkId=615386).

|Licensing option|Office 365 Business Essentials|Office 365 Business Premium|Office 365 Enterprise E1<br /><br />Office 365 Education A1|Office 365 Enterprise E3<br /><br />Office 365 Education A3<br /><br />Office 365 Government G3|Office 365 Enterprise E4<br /><br />Office 365 Education A4<br /><br />Office 365 Government G4|Office 365 Enterprise E5<br /><br />Office 365 Education A5<br /><br />Office 365 Government G5|Office 365 Enterprise K1|SharePoint Plan 1<br />SharePoint Plan 2|Exchange Online Plan 1<br />Exchange Online Plan 2|
|--------------------|----------------------------------|-------------------------------|-------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|----------------------------|----------------------------------------|--------------------------------------------------|
|Information Rights Protection (IRM)|Yes|Yes [footnote 1]|Yes|Yes|Yes|Yes|Yes|Yes|Yes|
Footnote 1:  For Business Premium, there are some client restrictions: You can protect content and consume protected content with RMS by using the Outlook Web App and the RMS sharing app. You can consume protected content by using all other Office applications, which includes Office Online and the client applications for Office 365 Business Premium.

### RMS for individuals subscription
This subscription is designed for individuals in an organization that hasn’t deployed Azure RMS or AD RMS. It lets these people read content that has been protected by an organization that is using Azure RMS, and they can also protect their own content.

For more information, see [RMS for Individuals and Azure Rights Management](../Topic/RMS-for-Individuals-and-Azure-Rights-Management.md).

## <a name="BKMK_AzureADTenant"></a>Azure AD directory
You must have an Azure AD directory to use Azure RMS. You use your organization account for this directory to sign in to the Azure classic portal, where, for example, you can configure and manage Rights Management templates.

If you do not already have an Azure subscription for your organization, you can get one by signing up for a free trial.: Go to the [Azure Get started](https://account.windowsazure.com/organization) page and follow the instructions.

For more information, see the following resources in the Azure Active Directory documentation:

-   [What is an Azure AD directory?](http://msdn.microsoft.com/library/185da266-58a9-43e6-9c66-2c8f702545c6)

-   [How Azure subscriptions are associated with Azure AD](http://msdn.microsoft.com/library/edf05c2e-944a-4da5-a330-dc9dc479f127)

If you want to integrate your Azure AD directory with your on-premises AD forests, see [Directory integration](http://msdn.microsoft.com/library/bf82bdff-2467-403b-8c1a-0e9eebcf31e8).

> [!NOTE]
> If you have mobile devices or Mac computers that authenticate on-premises by using AD FS or an equivalent authentication provider:
> 
> -   You must use AD FS on the minimum server version of **Windows Server 2012 R2**, or an alternative authentication provider that supports the OAuth 2.0 protocol.

### <a name="BKMK_MFA"></a>Multi-factor authentication (MFA) and Azure RMS
To use multi-factor authentication (MFA) with Azure RMS requires at least one of the following:

-   Office 2013 (minimum version):

    -   If you have Office 2013, you must also install the [June 9, 2015, update for Office 2013 (KB3054853)](https://support.microsoft.com/kb/3054853). For more information about this update and how modern authentication brings Active Directory Authentication Library (ADAL)-based sign in to Office 2013, see [Office 2013 modern authentication public preview announced](https://blogs.office.com/2015/03/23/office-2013-modern-authentication-public-preview-announced/)  on the Office blog.

-   Rights Management sharing application for Windows:

    -   You must have installed the minimum version of 1.0.1908.0, which can be confirmed by using Control Panel, Programs and Features. For more information about the sharing application, see  [Rights Management Sharing Application for Windows](../Topic/Rights-Management-Sharing-Application-for-Windows.md).

-   Rights Management sharing app for mobile devices and Mac computers:

    -   Make sure that you have the latest version installed. MFA support went into the September 2015 release of the RMS sharing app.

Then, configure your MFA solution:

-   For Microsoft-managed tenants (you have Azure Active Directory or Office 365):

    -   Configure Azure MFA to enforce MFA for users. For instructions, see [Getting started with Azure Multi-Factor Authentication in the cloud](https://azure.microsoft.com/documentation/articles/multi-factor-authentication-get-started-cloud/) from the Azure documentation.

        For more information about Azure MFA, see [What is Azure Multi-Factor Authentication?](https://azure.microsoft.com/documentation/articles/multi-factor-authentication/)

-   For federated tenants (you operate federation servers on-premises):

    -   Configure your federation servers for Azure Active Directory or Office 365. For example, if you are using AD FS, see [Configure Additional Authentication Methods for AD FS](https://technet.microsoft.com/library/dn758113.aspx) on TechNet.

        For more information about this scenario, see  [The Works with Office 365 – Identity program now streamlined](https://blogs.office.com/2014/01/30/the-works-with-office-365-identity-program-now-streamlined/) on the Office blog.

## <a name="BKMK_SupportedDevices"></a>Client devices that support Azure RMS
Use the following sections to identify which devices support Azure Rights Management (RMS), and which RMS capabilities they support:

-   [Computers](../Topic/Requirements-for-Azure-Rights-Management.md#BKMK_RMSSupportedComputers)

-   [Mobile devices](../Topic/Requirements-for-Azure-Rights-Management.md#BKMK_RMSSupportedMobileDevices)

-   [Client device capabilities](../Topic/Requirements-for-Azure-Rights-Management.md#BKMK_ClientCapabilities)

### <a name="BKMK_RMSSupportedComputers"></a>Computers
The following computer operating systems support Azure Rights Management:

-   **Windows 7** (x86, x64)

-   **Windows 8** (x86, x64)

-   **Windows 8.1** (x86, x64)

-   **Windows 10** (x86, x64)

-   **Mac OS X**: Minimum version of Mac OS X 10.8 (Mountain Lion)

### <a name="BKMK_RMSSupportedMobileDevices"></a>Mobile devices
The following mobile device operating systems support Azure Rights Management:

-   **Windows Phone**: Windows Phone 8.1

-   **Android phones and tablets**: Minimum version of Android 4.0.3

-   **iPhone and iPad**: Minimum version of iOS 7.0

-   **Windows RT tablets**: Windows 8.1 RT

### <a name="BKMK_ClientCapabilities"></a>Client device capabilities
Not all supported client devices currently support all RMS capabilities. Use the following table to identify which applications support the RMS capabilities, and the exceptions.

Unless stated otherwise, the supported capabilities apply to both Azure RMS and AD RMS. In addition, AD RMS support on iOS, Android, OS X, and Windows Phone 8.1 requires [Active Directory Rights Management Services Mobile Device Extension](http://technet.microsoft.com/library/a69ead9d-7dd3-4b38-9830-4728e9757341).

Information about the table columns:

-   **Protected PDF**: Files that have a .ppdf file name extension and that are automatically created when you use the RMS sharing application to share Office files and PDF files by email. The RMS sharing application includes a reader for protected PDF files. Previously, if you created PDF files that you protected by using Azure RMS or AD RMS, you can continue to read these files on Windows, iOS, and Android devices by using Foxit Reader and Nitro Pro.

-   **Email:** The email clients listed can protect the email message itself, which will automatically protect any attached files. In this scenario, the client’s preview feature can display the protected content (message and attachment) to authorized recipients. However, if an email message itself is not protected but the attachment is protected, the client’s preview feature cannot display the protected attachment to authorized recipients.

-   **Other file types**: Text and image files include files that have a file name extension such as .txt, .xml, .jpg, .and jpeg. These files change their file name extension after they are natively protected by RMS, and become read-only. Files that cannot be natively protected have a .pfile file name extension after they are generically protected by RMS. For more information, see the [Levels of protection – native and generic](https://technet.microsoft.com/library/dn339003.aspx) and [Supported file types and file name extensions](https://technet.microsoft.com/library/dn339003.aspx) sections from the [Rights Management sharing application administrator guide](http://technet.microsoft.com/library/dn339003%28v=ws.10%29.aspx).

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

## <a name="BKMK_SupportedApplications"></a>Applications that support Azure RMS
The following applications natively support Azure RMS, which means that RMS is tightly integrated into these applications by using RMS APIs to support usage restrictions. These applications are also known as RMS-enlightened:

-   **Microsoft Office applications** (Word, Excel, PowerPoint, and Outlook) from the following suites can protect content by using Azure RMS:

    -   Office 365 ProPlus

    -   Office 365 Enterprise E3

    -   Office 365 Enterprise E4

    -   Office 365 Enterprise E5

    -   Office Professional Plus 2016

    -   Office Professional Plus 2013

    -   Office Professional Plus 2010

    Other editions of Office (with the exception of Office 2007) can consume protected content.

    > [!NOTE]
    > Azure RMS with Office Professional Plus 2010 or Office Professional 2010:
    > 
    > -   Requires the Rights Management sharing application for Windows
    > -   Not supported on Windows 10

-   **The Rights Management sharing application for Windows**

    For more information about the Rights Management sharing application for Windows, see the following resources:

    -   [Rights Management sharing application administrator guide](http://technet.microsoft.com/library/dn339003.aspx)

    -   [Rights Management sharing application user guide](http://technet.microsoft.com/library/dn339006.aspx)

-   **The Rights Management sharing application for mobile platforms**

    For more information about the Rights Management sharing application for mobile platforms, see the following resources:

    -   Download the relevant app by using the links on the [Microsoft Rights Management page](http://go.microsoft.com/fwlink/?LinkId=303970)
 
    -   [FAQ for Microsoft Rights Management Sharing Application for Mobile Platforms](http://technet.microsoft.com/dn451248)

-   **Other applications that support the RMS APIs**:

    -   Line-of-business applications that are written in-house by using the RMS SDK

    -   Applications from software vendors that are written by using the RMS SDK

    For more information about the SDK, see the [Microsoft Rights Management SDK](http://msdn.microsoft.com/library/hh552972%28v=vs.85%29.aspx).

> [!IMPORTANT]
> The following applications are not currently supported by Azure RMS:
> 
> -   Microsoft Office for Mac 2011
> -   Microsoft OneDrive for Business for SharePoint Server 2013
> -   XPS Viewer
> 
> In addition, the RMS sharing application has the following restrictions:
> 
> -   For Windows computers: Requires a minimum version of Windows 7 Service Pack 1

For more information about how these applications support Azure RMS, see [How Applications Support Azure Rights Management](../Topic/How-Applications-Support-Azure-Rights-Management.md).

For information about how to configure them, see [Configuring Applications for Azure Rights Management](../Topic/Configuring-Applications-for-Azure-Rights-Management.md).

## <a name="BKMK_SupportedServers"></a>On-premises servers that support Azure RMS
The following on-premises server products are supported with Azure RMS when you use the Azure RMS connector, which acts as a communications interface (a relay) between the on-premises servers and Azure RMS. In addition, this configuration requires that you configure directory synchronization between your Active Directory forests and Azure Active Directory.

-   **Exchange Server**:

    -   Exchange Server 2016

    -   Exchange Server 2013

    -   Exchange Server 2010

-   **Office SharePoint Server**:

    -   Office SharePoint Server 2013

    -   Office SharePoint Server 2010

-   **File servers that run Windows Server and use File Classification Infrastructure (FCI)**:

    -   Windows Server 2012 R2

    -   Windows Server 2012

    > [!NOTE]
    > Because file servers that run Windows Server 2008 R2 do not have a built-in file management task action to apply RMS protection, you cannot use the RMS connector for this scenario. However, you can use File Classification Infrastructure and Azure RMS on these operating systems if you configure a custom file management task to run an executable or script that can protect files by using Azure RMS. For example, a Windows PowerShell script that uses the [RMS Protection cmdlets](https://msdn.microsoft.com/library/azure/mt433195.aspx).
    > 
    > You can also use these cmdlets with servers running later versions of Windows Server, with the benefit that these cmdlets can protect all file types. The RMS connector protects Office files only. For how-to instructions, see [RMS Protection with Windows Server File Classification Infrastructure &#40;FCI&#41;](../Topic/RMS-Protection-with-Windows-Server-File-Classification-Infrastructure--FCI-.md).

The RMS connector is supported on Windows Server 2012 R2, Windows Server 2012, and Windows Server 2008 R2.

For more information about how to configure the RMS connector for these on-premises servers, see [Deploying the Azure Rights Management Connector](../Topic/Deploying-the-Azure-Rights-Management-Connector.md).

## See Also
[Getting Started with Azure Rights Management](../Topic/Getting-Started-with-Azure-Rights-Management.md)

