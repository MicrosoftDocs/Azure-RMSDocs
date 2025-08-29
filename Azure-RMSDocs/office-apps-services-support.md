---
# required metadata

title: How Office apps & services support Azure RMS from AIP
description: How end-user Office applications such as Word and Outlook, and Office services such as Exchange and SharePoint, can use the Azure Rights Management service from AIP to help protect your organization's data.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 05/31/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 388e67cd-c16f-4fa0-a7bb-ffe0def2be81

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: azurerms
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---


# How Office applications and services support Azure Rights Management 



End-user Office applications and Office services can use the Azure Rights Management service from Azure Information Protection to help protect your organization’s data. These Office applications are Word, Excel, PowerPoint, and Outlook. The Office services are Exchange and Microsoft SharePoint. The Office configurations that support the Azure Rights Management service often use the term **information rights management (IRM)**.

## Office applications: Word, Excel, PowerPoint, Outlook
These applications support Azure Rights Management built-in, and let users apply protection to a saved document or to an email message to be sent. Users can apply templates to apply the protection. Or, for Word, Excel, and PowerPoint, users can choose customized settings for access, rights, and usage restrictions.

For example, users can configure a Word document so that it can be accessed only by people in your organization. Or, control whether an Excel spreadsheet can be edited, or restricted to read-only, or prevent it from being printed. For time-sensitive files, an expiration time can be configured for when the file can no longer be accessed. This configuration can be made directly by users or by applying a protection template. For Outlook, users can also choose the **Do Not Forward** option to help prevent data leakage.

If you are ready to configure Office apps see [Restrict access to content by using sensitivity labels to apply encryption](/purview/encryption-sensitivity-labels).

## Exchange Online and Exchange Server
When you use Exchange Online or Exchange Server, you can configure options for Azure Information Protection. This configuration lets Exchange provide the following protection solutions:

-   **Exchange ActiveSync IRM** so that mobile devices can protect and consume protected email messages.

-   Email protection support for **Outlook on the web**, which is implemented similarly to the Outlook client. This configuration lets users protect email messages by using protection templates or options. Users can read and use protected email messages that are sent to them.

-   **Protection rules** for Outlook clients that an administrator configures to automatically apply protection templates and options to email messages for specified recipients. For example, when internal emails are sent to your legal department, they can only be read by members of the legal department and cannot be forwarded. Users see the protection applied to the email message before sending it, and by default, they can remove this protection if they decide it is not necessary. Emails are encrypted before they are sent. For more information, see [Outlook Protection Rules](/exchange/outlook-protection-rules-exchange-2013-help) and [Create an Outlook Protection Rule](/exchange/create-an-outlook-protection-rule-exchange-2013-help) in the Exchange library.

-   **Mail flow rules** that an administrator configures to automatically apply protection templates or options to email messages. These rules are based on properties such as sender, recipient, message subject, and content. These rules are similar in concept to protection rules but don't allow users to remove the protection because the protection is set by the Exchange service rather than by the client. Because protection is set by the service, it doesn't matter what device or what operating system the users have. For more information, see [Mail flow rules (transport rules) in Exchange Online](/exchange/security-and-compliance/mail-flow-rules/mail-flow-rules) and [Create a Transport Protection Rule](/exchange/create-a-transport-protection-rule-exchange-2013-help) for Exchange on-premises.

-   **Data loss prevention (DLP) policies** that contain sets of conditions to filter email messages and take actions, to help prevent data loss for confidential or sensitive content. One of the actions that you can specify is to apply encryption as protection, by specifying one of the protection templates or options. Policy Tips can be used when sensitive data is detected, to alert users that they might need to apply protection. For more information, see [Data loss prevention](/exchange/security-and-compliance/data-loss-prevention/data-loss-prevention) in the Exchange Online documentation.

-   **Message Encryption** that supports sending a protected email message and protected Office documents as attachments to any email address on any device. For user accounts that don't use Microsoft Entra ID, a web experience supports social identity providers or a one-time passcode. For more information, see [Set up new Microsoft 365 Message Encryption capabilities built on top of Azure Information Protection](/microsoft-365/compliance/set-up-new-message-encryption-capabilities) from the Microsoft 365 documentation. To help you find additional information that is related to this configuration, see [Microsoft 365 Message Encryption](/microsoft-365/compliance/ome).

If you use Exchange on-premises, you can use the IRM features with the Azure Rights Management service by deploying the Microsoft Rights Management connector. This connector acts as a relay between your on-premises servers and the Azure Rights Management service.

For more information about the email options that you can use to protect emails, see [Do Not Forward option for emails](/purview/rights-management-usage-rights#do-not-forward-option-for-emails) and [encrypt-only option for emails](/purview/rights-management-usage-rights#encrypt-only-option-for-emails).

## SharePoint in Microsoft 365 and SharePoint Server

When you use SharePoint in Microsoft 365 or SharePoint Server, you can protect documents by using the SharePoint information rights management (IRM) feature. This feature lets administrators protect lists or libraries so that when a user checks out a document, the downloaded file is protected so that only authorized people can view and use the file according to the information protection policies that you specify. For example, the file might be read-only, disable the copying of text, prevent saving a local copy, and prevent printing the file.

Word, PowerPoint, Excel, and PDF documents support this SharePoint IRM protection. By default, the protection is restricted to the person who downloads the document. You can change this default with a configuration option named **Allow group protection**, which extends the protection to a group that you specify. For example, you could specify a group that has permission to edit documents in the library so that the same group of users can edit the document outside SharePoint, regardless of which user downloaded the document. Or, you could specify a group that isn't granted permissions in SharePoint but users in this group need to access the document outside SharePoint. 
For SharePoint lists and libraries, this protection is always configured by an administrator, never an end user. You set the permissions at the site level, and these permissions, by default, are inherited by any list or library in that site. If you use SharePoint in Microsoft 365, users can also configure their Microsoft OneDrive library for IRM protection.

For more fine-grained control, you can configure a list or library in the site to stop inheriting permissions from its parent. You can then configure IRM permissions at that level (list or library) and they are then referred to as "unique permissions." However, permissions are always set at the container level; you cannot set permissions on individual files. 

The IRM service must first be enabled for SharePoint. Then, you specify IRM permissions for a library. For SharePoint and OneDrive, users can also specify IRM permissions for their OneDrive library. SharePoint does not use rights policy templates, although there are SharePoint configuration settings that you can select that match some settings that you can specify in the templates.

If you use SharePoint Server, you can use this IRM protection by deploying the Microsoft Rights Management connector. This connector acts as a relay between your on-premises servers and the Rights Management cloud service. For more information, see [Deploying the Microsoft Rights Management connector](deploy-rms-connector.md).

> [!NOTE]
> There are some limitations when you use SharePoint IRM:
> 
> - You cannot use the default or custom protection templates that you manage in the Azure portal. 
> 
> - Files that have a .ppdf file name extension for protected PDF files are not supported. For more information about viewing protected PDF documents, see [Protected PDF readers for Microsoft Purview Information Protection](./rms-client/protected-pdf-readers.md).
> 
> - Coauthoring, when more than one person edits a document at the same time, is not supported. To edit a document in an IRM-protected library, you must first check out the document and download it, and then edit it in your Office application. Consequently, only one person can edit the document at a time.

For libraries that are not IRM-protected, if you apply protection-only to a file that you then upload to SharePoint or OneDrive, the following do not work with this file: Co-authoring, Office for the web, search, document preview, thumbnail, eDiscovery, and data loss prevention (DLP).

> [!IMPORTANT]
> SharePoint IRM can be used in combination with sensitivity labels that apply protection. When you use both features together, the behavior changes for protected files. For more information, see [Enable sensitivity labels for Office files in SharePoint and OneDrive](/microsoft-365/compliance/sensitivity-labels-sharepoint-onedrive-files).

When you use SharePoint IRM protection, the Azure Rights Management service applies usage restrictions and data encryption for documents when they are downloaded from SharePoint, and not when the document is first created in SharePoint or uploaded to the library. For information about how documents are protected before they are downloaded, see [Data Encryption in OneDrive and SharePoint](/microsoft-365/compliance/data-encryption-in-odb-and-spo?redirectSourcePath=%252fen-us%252farticle%252f6501b5ef-6bf7-43df-b60d-f65781847d6c) from the SharePoint documentation.

For changes that are coming, see [Updates to SharePoint security, administration, and migration](https://techcommunity.microsoft.com/t5/Microsoft-SharePoint-Blog/Updates-to-SharePoint-security-administration-and-migration/ba-p/549585).

## Next steps

If you have Microsoft 365, you might be interested in reviewing [File Protection Solutions in Microsoft 365](/office365/enterprise/microsoft-cloud-it-architecture-resources#BKMK_O365fileprotect), which provides recommended capabilities for protecting files in Microsoft 365.

If you are ready to start deployment, which includes configuring these applications and services, see the [AIP deployment roadmap for classification, labeling, and protection](deployment-roadmap-classify-label-protect.md).
