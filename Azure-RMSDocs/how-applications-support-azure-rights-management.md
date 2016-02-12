---
title: How Applications Support Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 2cdc7bde-4044-4021-b887-11476f99afd9
author: Cabailey
---
# How Applications Support Azure Rights Management
Use the following information to help you understand how your end-user applications (such as the Office applications, Word, Excel, PowerPoint, and Outlook) and services (such as Exchange and SharePoint) can use Microsoft [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] to help protect your organization’s data:

-   [RMS sharing application for Windows and mobile platforms](../Topic/How-Applications-Support-Azure-Rights-Management.md#BKMK_SharingAppIntro)

-   [Office applications: Word, Excel, PowerPoint, Outlook](../Topic/How-Applications-Support-Azure-Rights-Management.md#BKMK_OfficeAppsIntro)

    -   [Exchange Online and Exchange Server](../Topic/How-Applications-Support-Azure-Rights-Management.md#BKMK_ExchangeIntro)

    -   [SharePoint Online and SharePoint Server](../Topic/How-Applications-Support-Azure-Rights-Management.md#BKMK_SharePointIntro)

-   [File servers that run Windows Server and use File Classification Infrastructure (FCI)](../Topic/How-Applications-Support-Azure-Rights-Management.md#BKMK_FCIIntro)

-   [Other applications that support the RMS APIs](../Topic/How-Applications-Support-Azure-Rights-Management.md#BKMK_APIAppsIntro)

> [!NOTE]
> To verify the applications and versions that [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] (Azure RMS) supports, see [Requirements for Azure Rights Management](../Topic/Requirements-for-Azure-Rights-Management.md).

In some cases, information protection is automatically applied, according to policies that you configure. For example, this is the case with SharePoint libraries, classified files, and Exchange transport rules. In other cases, users must apply information protection themselves from their applications, either by selecting a template or by selecting specific options. For example, this is the case when users share a file by email, or protect a file in-place by restricting access or usage to selected users or to users outside the organization.

Templates make it easier for users (and administrators who configure policies) to apply the correct level of protection and restrict access to people inside your organization. Although [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] comes with two default templates, you will probably want to create custom templates to reduce the times when they have to specify individual options. For more information, see [Configuring Custom Templates for Azure Rights Management](../Topic/Configuring-Custom-Templates-for-Azure-Rights-Management.md).

For the cases where users must apply information protection themselves, be sure to provide them with instructions and guidance how and when to do this. The instructions should be specific for the application and versions that they use and how they use them, and the guidance for when and how to apply information protection should be appropriate for your business. For more information, see [Helping Users to Protect Files by Using Azure Rights Management](../Topic/Helping-Users-to-Protect-Files-by-Using-Azure-Rights-Management.md).

For information about how to configure these applications for Azure RMS, see [Configuring Applications for Azure Rights Management](../Topic/Configuring-Applications-for-Azure-Rights-Management.md).

> [!TIP]
> For examples and screenshots of applications using Azure RMS, see the [Azure RMS in action: What administrators and users see](../Topic/What-is-Azure-Rights-Management-.md#BKMK_RMSpictures) section from the [What is Azure Rights Management?](../Topic/What-is-Azure-Rights-Management-.md) topic.

## <a name="BKMK_SharingAppIntro"></a>RMS sharing application for Windows and mobile platforms
The RMS sharing application is a free, downloadable application that is required to support Office 2010, but also recommended for Windows computers, Mac computers, and mobile devices. One of its benefits is that it can apply generic protection for applications and files that do not natively support [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)], which means that all files can be protected. For more information about the different protection levels, see the [Level of protection – native and generic](http://technet.microsoft.com/library/dn339003.aspx) section from the [Rights Management sharing application administrator guide](http://technet.microsoft.com/library/dn339003.aspx).

When users protect their files by using the RMS sharing application, they can also track the documents that they protected, and if necessary, revoke access to them. They do this by using the [document tracking site](http://go.microsoft.com/fwlink/?LinkId=529562).

For Windows computers, the RMS sharing application unobtrusively integrates with and enhances the  applications that users already use:

-   An Office add-in for Word, Excel, PowerPoint, and Outlook is installed. This provides users with a **Share Protected** button on the ribbon, which invokes an easy-to-use dialog box of settings that are most commonly used to protect files to be emailed. This button also provides a quick way to access the document tracking site.

-   A new right-click option for File Explorer. This provides users with a **Protect in-place** option, which invokes an easy-to-use dialog box of settings that are most commonly used to protect files stored on a disk.

-   A viewer to open files that have been protected by [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)]. This viewer is automatically invoked when there is no other application installed that could open the protected file.

-   Backend configuration for Office 2010 that lets Word, Excel, PowerPoint, and Outlook from this suite work seamlessly with [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)].

Although the RMS sharing application for Windows can be downloaded and installed for a single computer by using the [Microsoft Rights Management page](http://go.microsoft.com/fwlink/?LinkId=303970), it also supports an enterprise deployment for silent installation and custom configuration. For more information, see the following resources:

-   [Rights Management sharing application administrator guide](http://technet.microsoft.com/library/dn339003.aspx)

-   [Rights Management sharing application user guide](http://technet.microsoft.com/library/dn339006.aspx)

The RMS sharing application for mobile devices supports the most commonly used mobile devices, such as iPad and iPhone, Android, Windows Phone, and Windows RT. Users can download this app from the relevant store, and there are links to these from the [Microsoft Rights Management page](http://go.microsoft.com/fwlink/?LinkId=303970).

**If you have Microsoft Intune**: Because the RMS sharing app includes the Microsoft Intune App Software Development Kit, you can use  the following options:

-   Deploy and manage the app for iOS and Android devices that are enrolled by Intune.

-   Manage the app for Android devices that are not enrolled by Intune.

## <a name="BKMK_OfficeAppsIntro"></a>Office applications: Word, Excel, PowerPoint, Outlook
These applications natively support Rights Management by using information rights management (IRM) and let users apply protection to a saved document or to an email message to be sent. Users can apply templates or choose very customized settings for access, rights, and usage restrictions. For example, users can configure a file so that it can be accessed only by people in your organization, or control whether the file can be edited, or restricted to read-only, or prevent it from being printed. For time-sensitive files, an expiration time can be configured (directly by users or by applying a template) for when the file can no longer be accessed. For Outlook, users can also choose the **Do Not Forward** option to help prevent data leakage.

### <a name="BKMK_ExchangeIntro"></a>Exchange Online and Exchange Server
When you use Exchange Online or Exchange Server, you can use information rights management (IRM) integration, which provides additional information protection solutions:

-   **Exchange ActiveSync IRM** so that mobile devices can protect and consume protected email messages.

-   RMS support for the **Outlook Web App**, implemented similarly to the Outlook client, so that users can protect email messages by templates or by specifying individual options, and users can read and use protected email messages that are sent to them.

-   **Protection rules** for Outlook clients that an administrator configures to automatically apply RMS templates to email messages for specified recipients. For example, when internal emails are sent to your legal department, they can only be read by members of the legal department and cannot be forwarded. Users see the protection applied to the email message before sending it, and by default, they can remove it if they decide it is not necessary. Emails are encrypted before they are sent. For more information, see [Outlook Protection Rules](http://technet.microsoft.com/library/dd638178%28v=exchg.150%29.aspx) and [Create an Outlook Protection Rule](http://technet.microsoft.com/library/dd638196%28v=exchg.150%29.aspx) in the Exchange library.

-   **Transport rules** that an administrator configures to automatically apply RMS templates to email messages based on properties such as sender, recipient, message subject, and content. These are similar in concept to protection rules but do not let users remove the protection, can be applied to Outlook Web Access and emails sent by mobile devices, and do not encrypt email messages before they are sent from the client. For more information, see [Create a Transport Protection Rule](http://technet.microsoft.com/library/dd302432.aspx) in the Exchange library.

-   **Data loss prevention (DLP) policies** that contain sets of conditions to filter email messages, and take actions to help prevent data loss for confidential or sensitive content (for example, personal information or credit card information). Policy Tips can be used when sensitive data is detected, to alert users that they might need to apply information protection, based on the information in the email message. For more information, see [Data Loss Prevention](http://technet.microsoft.com/library/jj150527%28v=exchg.150%29.aspx) in the Exchange library.

-   **Office 365 Message Encryption** that uses transport rules to send encrypted emails to people outside your company, and the email is read in a browser with an interface similar to the Outlook Web App. You can customize the disclaimer text and header text in your company’s encrypted emails, and even add your company logo. For more information, see [Office 365 Message Encryption](http://office.microsoft.com/o365-message-encryption-FX104179182.aspx) from the Office website.

If you use Exchange Server, you can use the information protection features with [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] by deploying the RMS connector, which acts as a relay between your on-premises servers and the RMS cloud service. For more information, see [Deploying the Azure Rights Management Connector](../Topic/Deploying-the-Azure-Rights-Management-Connector.md).

### <a name="BKMK_SharePointIntro"></a>SharePoint Online and SharePoint Server
When you use SharePoint Online or SharePoint Server, you can use information rights management (IRM) integration, which lets administrators protect lists or libraries so that when a user checks-out a document, the file is protected so that only authorized people can view and use the file according to the information protection policies that you specify. For example, the file might be read-only, disable the copying of text, prevent saving a local copy, and prevent printing the file.

For lists and libraries,  information protection is always applied by an administrator, never an end user. And it is applied at the list or library level for all documents in that container, rather than on individual files.  If you use SharePoint Online, users can also apply IRM to their OneDrive for Business library.

The IRM service must first be enabled for SharePoint. Then, you specify Information Rights Management for a library. In the case of SharePoint Online and OneDrive for Business, users can also specify Information Rights Management for their OneDrive for Business library. SharePoint does not use rights policy templates, although there are SharePoint configuration settings that you can select that closely match the settings that you can specify in templates.

If you use SharePoint Server, you can use the information protection features with [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] by deploying the RMS connector, which acts as a relay between your on-premises servers and the RMS cloud service. For more information, see [Deploying the Azure Rights Management Connector](../Topic/Deploying-the-Azure-Rights-Management-Connector.md).

> [!NOTE]
> Currently, there are some limitations when you use IRM with SharePoint:
> 
> -   You cannot use the default or custom templates that you manage in the Azure classic portal.
> -   Files that have a .PPDF file name extension for protected PDF files are not supported. Files that have .PDF file name extension and that have been natively protected by RMS are supported when you use a PDF reader that natively supports RMS.
> -   Because Office on mobile devices does not yet support RMS, these devices must use a browser to view files that have been protected with RMS, and the files are read-only.

Azure RMS applies usage restrictions and data encryption for documents when they are downloaded from SharePoint, and not when the document is first created in SharePoint or uploaded to the library. For information about how documents are protected before they are downloaded, see [Data Encryption in OneDrive for Business and SharePoint Online](https://technet.microsoft.com/library/dn905447.aspx) from the SharePoint documentation.

For more information about using Azure RMS with SharePoint, see the following  post from the Office blog: [What’s New with Information Rights Management in SharePoint and SharePoint Online](http://blogs.office.com/2012/11/09/whats-new-with-information-rights-management-in-sharepoint-and-sharepoint-online/)

## <a name="BKMK_FCIIntro"></a>File servers that run Windows Server and use File Classification Infrastructure (FCI)
When you configure Windows Server to use File Classification Infrastructure, this File Server Resource Manager feature can scan local files and determine whether they contain sensitive data. For files that meet this criteria, they are tagged with classification properties that an administrator defines. The File Classification Infrastructure can then take automatic action, according to the classification. One of these actions include applying information protection by using [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] and the deployment of the Rights Management connector (also known as the RMS connector). Office files are then automatically protected by Azure RMS.

To protect all file types, you would not use the RMS connector, but instead, run a Windows PowerShell script, using cmdlets from the [RMS Protection tool](https://www.microsoft.com/en-us/download/details.aspx?id=47256).

The classification policies are fully configurable and highly extensible so that you can prevent potential data leakage from unauthorized and authorized users. It can even help to reduce the risk of data leakage by network administrators because you can configure policies that don’t require these administrators to have access to the files.

For instructions to deploy and configure the RMS connector for Office files, see [Deploying the Azure Rights Management Connector](../Topic/Deploying-the-Azure-Rights-Management-Connector.md).

For instructions to use the Windows PowerShell script for all file types, see [RMS Protection with Windows Server File Classification Infrastructure &#40;FCI&#41;](../Topic/RMS-Protection-with-Windows-Server-File-Classification-Infrastructure--FCI-.md).

## <a name="BKMK_APIAppsIntro"></a>Other applications that support the RMS APIs
By using the RMS SDK, your internal developers can write line-of-business applications to natively support [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)]. How information protection is integrated with these applications depends on how they are written. For example, the integration might be automatically applied with minimal user interaction required, or for a more customized experience, users might be prompted to configure settings to apply information protection to files. For more information about the SDK, see the [Microsoft Rights Management SDK](http://msdn.microsoft.com/library/hh552972%28v=vs.85%29.aspx).

Similarly, many software vendors provide applications to provide  information protection solutions, also known as enterprise rights management (ERM) products. A popular example is a PDF reader that supports [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] for specific platforms. You can use the table in the [Client device capabilities](../Topic/Requirements-for-Azure-Rights-Management.md#BKMK_ClientCapabilities) section of the [Requirements for Azure Rights Management](../Topic/Requirements-for-Azure-Rights-Management.md) topic to identify applications that support RMS (RMS-enlightened applications), and then use a web search to purchase or download the application.

> [!TIP]
> For newly released applications, check the RMS community channels, listed in [Information and Support for Azure Rights Management](../Topic/Information-and-Support-for-Azure-Rights-Management.md).

## See Also
[Getting Started with Azure Rights Management](../Topic/Getting-Started-with-Azure-Rights-Management.md)

