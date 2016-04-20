---
# required metadata

title: Office applications and services | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
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


# Office applications and services
End-user Office applications (such as the Word, Excel, PowerPoint, and Outlook) and Office services (such as Exchange and SharePoint) can use Microsoft Azure Rights Management to help protect your organization’s data.

## Office applications: Word, Excel, PowerPoint, Outlook
These applications natively support Rights Management by using information rights management (IRM) and let users apply protection to a saved document or to an email message to be sent. Users can apply templates or choose very customized settings for access, rights, and usage restrictions. 

For example, users can configure a file so that it can be accessed only by people in your organization, or control whether the file can be edited, or restricted to read-only, or prevent it from being printed. For time-sensitive files, an expiration time can be configured (directly by users or by applying a template) for when the file can no longer be accessed. For Outlook, users can also choose the **Do Not Forward** option to help prevent data leakage.

## Exchange Online and Exchange Server
When you use Exchange Online or Exchange Server, you can use information rights management (IRM) integration, which provides additional information protection solutions:

-   **Exchange ActiveSync IRM** so that mobile devices can protect and consume protected email messages.

-   RMS support for the **Outlook Web App**, implemented similarly to the Outlook client, so that users can protect email messages by templates or by specifying individual options, and users can read and use protected email messages that are sent to them.

-   **Protection rules** for Outlook clients that an administrator configures to automatically apply RMS templates to email messages for specified recipients. For example, when internal emails are sent to your legal department, they can only be read by members of the legal department and cannot be forwarded. Users see the protection applied to the email message before sending it, and by default, they can remove it if they decide it is not necessary. Emails are encrypted before they are sent. For more information, see [Outlook Protection Rules](https://technet.microsoft.com/library/dd638178%28v=exchg.150%29.aspx) and [Create an Outlook Protection Rule](https://technet.microsoft.com/library/dd638196%28v=exchg.150%29.aspx) in the Exchange library.

-   **Transport rules** that an administrator configures to automatically apply RMS templates to email messages based on properties such as sender, recipient, message subject, and content. These are similar in concept to protection rules but do not let users remove the protection, can be applied to Outlook Web Access and emails sent by mobile devices, and do not encrypt email messages before they are sent from the client. For more information, see [Create a Transport Protection Rule](https://technet.microsoft.com/library/dd302432.aspx) in the Exchange library.

-   **Data loss prevention (DLP) policies** that contain sets of conditions to filter email messages, and take actions to help prevent data loss for confidential or sensitive content (for example, personal information or credit card information). Policy Tips can be used when sensitive data is detected, to alert users that they might need to apply information protection, based on the information in the email message. For more information, see [Data Loss Prevention](https://technet.microsoft.com/library/jj150527%28v=exchg.150%29.aspx) in the Exchange library.

-   **Office 365 Message Encryption** that uses transport rules to send encrypted emails to people outside your company, and the email is read in a browser with an interface similar to the Outlook Web App. You can customize the disclaimer text and header text in your company’s encrypted emails, and even add your company logo. For more information, see [Office 365 Message Encryption](https://office.microsoft.com/o365-message-encryption-FX104179182.aspx) from the Office website.

If you use Exchange Server, you can use the information protection features with [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] by deploying the RMS connector, which acts as a relay between your on-premises servers and the RMS cloud service. For more information, see [Deploying the Azure Rights Management connector](../deploy-use/deploying-the-azure-rights-management-connector.md).

## SharePoint Online and SharePoint Server
When you use SharePoint Online or SharePoint Server, you can use information rights management (IRM) integration, which lets administrators protect lists or libraries so that when a user checks-out a document, the file is protected so that only authorized people can view and use the file according to the information protection policies that you specify. For example, the file might be read-only, disable the copying of text, prevent saving a local copy, and prevent printing the file.

For lists and libraries,  information protection is always applied by an administrator, never an end user. And it is applied at the list or library level for all documents in that container, rather than on individual files.  If you use SharePoint Online, users can also apply IRM to their OneDrive for Business library.

The IRM service must first be enabled for SharePoint. Then, you specify Information Rights Management for a library. In the case of SharePoint Online and OneDrive for Business, users can also specify Information Rights Management for their OneDrive for Business library. SharePoint does not use rights policy templates, although there are SharePoint configuration settings that you can select that closely match the settings that you can specify in templates.

If you use SharePoint Server, you can use the information protection features with [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] by deploying the RMS connector, which acts as a relay between your on-premises servers and the RMS cloud service. For more information, see [Deploying the Azure Rights Management connector](../deploy-use/deploying-the-azure-rights-management-connector.md).

> [!NOTE]
> Currently, there are some limitations when you use IRM with SharePoint:
> 
> -   You cannot use the default or custom templates that you manage in the Azure classic portal.
> -   Files that have a .PPDF file name extension for protected PDF files are not supported. Files that have .PDF file name extension and that have been natively protected by RMS are supported when you use a PDF reader that natively supports RMS.
> -   Because Office on mobile devices does not yet support RMS, these devices must use a browser to view files that have been protected with RMS, and the files are read-only.

Azure RMS applies usage restrictions and data encryption for documents when they are downloaded from SharePoint, and not when the document is first created in SharePoint or uploaded to the library. For information about how documents are protected before they are downloaded, see [Data Encryption in OneDrive for Business and SharePoint Online](https://technet.microsoft.com/library/dn905447.aspx) from the SharePoint documentation.

For more information about using Azure RMS with SharePoint, see the following  post from the Office blog: [What’s New with Information Rights Management in SharePoint and SharePoint Online](http://blogs.office.com/2012/11/09/whats-new-with-information-rights-management-in-sharepoint-and-sharepoint-online/)

## Next steps

To see how other applications and services support Azure Rights Management, see [How applications support Azure Rights Management](how-applications-support-azure-rights-management.md).