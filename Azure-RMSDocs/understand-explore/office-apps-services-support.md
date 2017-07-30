---
# required metadata

title: How Office apps & services support Azure RMS from AIP
description: How end-user Office applications such as Word and Outlook, and Office services such as Exchange and SharePoint, can use the Azure Rights Management service from AIP to help protect your organization's data.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 07/27/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 388e67cd-c16f-4fa0-a7bb-ffe0def2be81

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# How Office applications and services support Azure Rights Management 

>*Applies to: Azure Information Protection, Office 365*

End-user Office applications and Office services can use the Azure Rights Management service from Azure Information Protection to help protect your organization’s data. These Office applications are Word, Excel, PowerPoint, and Outlook. The Office services are Exchange and SharePoint. The Office configurations that support the Azure Rights Management service often use the term **information rights management (IRM)**.

## Office applications: Word, Excel, PowerPoint, Outlook
These applications natively support Azure Rights Management and let users apply protection to a saved document or to an email message to be sent. Users can apply templates to apply the protection. Or, for Word, Excel, and PowerPoint, users can choose customized settings for access, rights, and usage restrictions. 

For example, users can configure a Word document so that it can be accessed only by people in your organization, or control whether an Excel spreadsheet can be edited, or restricted to read-only, or prevent it from being printed. For time-sensitive files, an expiration time can be configured (directly by users or by applying a template) for when the file can no longer be accessed. For Outlook, users can choose the **Do Not Forward** option to help prevent data leakage, in addition to choosing a template.

In addition to native Office support for Azure Rights Management, these applications also support the Azure Information Protection bar that is installed with the [Azure Information Protection client](../rms-client/aip-client.md). This bar displays labels that makes it easier for users to automatically apply protection to documents and emails that contain sensitive data.

If you are ready to configure Office apps and the Azure Information Protection client:

- To configure Office apps, see [Office apps: Configuration for clients](../deploy-use/configure-office-apps.md).

- To install and configure the Azure Information Protection client, see [Azure Information Protection client: Installation and configuration for clients](../deploy-use/configure-client.md).

## Exchange Online and Exchange Server
When you use Exchange Online or Exchange Server, you can configure  information rights management (IRM) options that support Azure Rights Management. This configuration lets Exchange provide the following protection solutions:

-   **Exchange ActiveSync IRM** so that mobile devices can protect and consume protected email messages.

-   Email protection support for **Outlook on the web**, which is implemented similarly to the Outlook client. This configuration lets users protect email messages by using templates or by specifying individual options. Users can read and use protected email messages that are sent to them.

-   **Protection rules** for Outlook clients that an administrator configures to automatically apply protection templates to email messages for specified recipients. For example, when internal emails are sent to your legal department, they can only be read by members of the legal department and cannot be forwarded. Users see the protection applied to the email message before sending it, and by default, they can remove this protection if they decide it is not necessary. Emails are encrypted before they are sent. For more information, see [Outlook Protection Rules](https://technet.microsoft.com/library/dd638178%28v=exchg.150%29.aspx) and [Create an Outlook Protection Rule](https://technet.microsoft.com/library/dd638196%28v=exchg.150%29.aspx) in the Exchange library.

-   **Transport rules** that an administrator configures to automatically apply protection templates to email messages. These rules are based on properties such as sender, recipient, message subject, and content. These rules are similar in concept to protection rules but do not let users remove the protection. The rules can be applied to Outlook on the web and to emails that are sent by mobile devices. In addition, these rules do not encrypt email messages before they are sent from the client. For more information, see [Create a Transport Protection Rule](https://technet.microsoft.com/library/dd302432.aspx) in the Exchange library.

-   **Data loss prevention (DLP) policies** that contain sets of conditions to filter email messages, and take actions to help prevent data loss for confidential or sensitive content. Examples of confidential or sensitive content include personal information or credit card information. Policy Tips can be used when sensitive data is detected, to alert users that they might need to apply protection. For more information, see [Data loss prevention](https://technet.microsoft.com/library/jj150527(v=exchg.160).aspx) in the Exchange library.

-   **Office 365 Message Encryption** that uses transport rules to send encrypted emails to people outside your company, and the email is read in a browser with an interface similar to Outlook on the web. You can customize the disclaimer text and header text in your company’s encrypted emails, and even add your company logo. For more information, see [Office 365 Message Encryption](https://office.microsoft.com/o365-message-encryption-FX104179182.aspx) from the Office website.

If you use Exchange on-premises, you can use the IRM features with the Azure Rights Management service by deploying the Azure Rights Management connector. This connector acts as a relay between your on-premises servers and the Azure Rights Management service.

If you are ready to configure Exchange for IRM:

- For Exchange Online, see [Exchange Online: IRM Configuration](../deploy-use/configure-office365.md#exchange-online-irm-configuration).

- For Exchange on-premises, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).


## SharePoint Online and SharePoint Server

When you use SharePoint Online or SharePoint Server, you can protect documents by using the SharePoint information rights management (IRM) feature. This feature lets administrators protect lists or libraries so that when a user checks-out a document, the downloaded file is protected so that only authorized people can view and use the file according to the information protection policies that you specify. For example, the file might be read-only, disable the copying of text, prevent saving a local copy, and prevent printing the file.

Word, PowerPoint, Excel, and PDF documents support this SharePoint IRM protection. By default, the protection is restricted to the person who downloads the document. You can change this default with a configuration option that extends the protection to all users who have access to the document on SharePoint, or to a group that you specify.

For SharePoint lists and libraries, this protection is always configured by an administrator, never an end user. You set the permissions at the site level, and these permissions, by default, are inherited by any list or library in that site. If you use SharePoint Online, users can also configure their OneDrive for Business library for IRM protection.

For more fine-grained control, you can configure a list or library in the site to stop inheriting permissions from its parent. You can then configure IRM permissions at that level (list or library) and they are then referred to as "unique permissions." However, permissions are always set at the container level; you cannot set permissions on individual files. 

The IRM service must first be enabled for SharePoint. Then, you specify IRM permissions for a library. For SharePoint Online and OneDrive for Business, users can also specify IRM permissions for their OneDrive for Business library. SharePoint does not use rights policy templates, although there are SharePoint configuration settings that you can select that match some settings that you can specify in the templates.

If you use SharePoint Server, you can use this IRM protection by deploying the Azure Rights Management connector. This connector acts as a relay between your on-premises servers and the Rights Management cloud service. For more information, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).

> [!NOTE]
> Currently, there are some limitations when you use SharePoint IRM:
> 
> - You cannot use the default or custom templates that you manage in the Azure portal. 
> 
> - Files that have a .PPDF file name extension for protected PDF files are not supported. Files that have .PDF file name extension and that have been natively protected by Rights Management are supported when you use a PDF reader that natively supports Rights Management.
> 
> - If you protect a file that you then upload to a SharePoint library or OneDrive for Business, the following do not work with this file: Co-authoring, Office Online, search, document preview, thumbnail, and eDiscovery.

When you use SharePoint IRM protection, the Azure Rights Management service applies usage restrictions and data encryption for documents when they are downloaded from SharePoint, and not when the document is first created in SharePoint or uploaded to the library. For information about how documents are protected before they are downloaded, see [Data Encryption in OneDrive for Business and SharePoint Online](https://technet.microsoft.com/library/dn905447.aspx) from the SharePoint documentation.

Although no longer new, the following post from the Office blog has some additional information that you might find useful: [What’s New with Information Rights Management in SharePoint and SharePoint Online](https://blogs.office.com/2012/11/09/whats-new-with-information-rights-management-in-sharepoint-and-sharepoint-online/)

If you are ready to configure SharePoint for IRM:

- For SharePoint Online, see [SharePoint Online and OneDrive for Business: IRM Configuration](../deploy-use/configure-office365.md#sharepoint-online-and-onedrive-for-business-irm-configuration).

- For Sharepoint Server, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).


## Next steps

If you have Office 365, you might be interested in reviewing [File Protection Solutions in Office 365](https://technet.microsoft.com/library/dn919927.aspx#BKMK_O365fileprotect), which provides recommended capabilities for protecting files in Office 365.

To see how other applications and services support the Azure Rights Management service from Azure Information Protection, see [How applications support the Azure Rights Management service](applications-support.md).

If you are ready to start deployment, which includes configuring these applications and services, see the [Azure Information Protection deployment roadmap](../plan-design/deployment-roadmap.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]