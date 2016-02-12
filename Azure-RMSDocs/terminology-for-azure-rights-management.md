---
title: Terminology for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 742877bf-26f5-40e3-b1f7-8475e7c3ce11
author: Cabailey
---
# Terminology for Azure Rights Management
Confused by a word, phrase, or acronym that’s related to Microsoft [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] (Azure RMS)? Find the definition here for terms and abbreviations that are either specific to Azure RMS or have a specific meaning when used in the context of [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)].

|Term|Definition|
|--------|--------------|
|AADRM|The name of the Windows PowerShell module for Azure Rights Management, which was derived from the unofficial abbreviation for [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] when it was previously named (Windows) Azure Active Directory Rights Management.|
|activate|To enable the [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)] service so that an organization can add information protection to their documents and email. This action also enables Rights Management features in Exchange Online and SharePoint Online.|
|Active Directory Rights Management Services|Frequently abbreviated to *AD RMS*.<br /><br />A Windows Server role that that provides information protection by using encryption and policy to help secure documents, files, and email.|
|AD RMS|See *Active Directory Rights Management Services*.|
|Azure Rights Management|Frequently abbreviated to *Azure RMS*.<br /><br />An Azure service that provides information protection by using encryption and policy to help secure documents, files, and email.  Also known as *Azure Rights Management service*. Previous names have included:<br /><br />*Windows Azure Active Directory Rights Management*: Frequently abbreviated to Windows Azure AD Rights Management Service.<br /><br />*RMS Online*: The original, proposed name, which you might sometimes see in error messages and log file entries.|
|Azure RMS|See *Azure Rights Management*.|
|BYOK|See *bring your own key*.|
|bring your own key|Frequently abbreviated to *BYOK*.<br /><br />A configuration option chosen by an organization that wants to generate and manage their own tenant key for [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)].|
|content key|A unique key that is created by RMS-enlightened applications for each document or email that is protected by using [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] and that helps to limit the risk of information disclosure.|
|consume|To unlock a file to read or use it when that file has been protected by [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)].|
|deactivate|To disable the Rights Management service so that the organization can no longer use [!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)].|
|departmental template|A rights policy template that you create (a custom template) and is configured to be visible for selected users rather than all users in your organization.|
|enlightened applications|Applications that natively support Rights Management, which includes Office applications, such as Word and Excel. Independent software vendors (ISVs) and developers can also write applications that natively support [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)].|
|enterprise rights management|An industry-standard, generic term that is often used to describe products and solutions that help organizations protect sensitive or valuable information by using a combination of encryption and policy authorization tools. Microsoft Rights Management is an example of an enterprise rights management (ERM) solution.|
|ERM|See *enterprise rights management*.|
|generic protection|A level of protection that encrypts any file type and prevents unauthorized people from opening the file. After the file is opened, the file is now unencrypted and usable in an application that doesn’t natively support [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)].|
|information protection|Sometimes abbreviated to *IP*.<br /><br />An industry-standard, generic term that refers to protecting data and files from unauthorized access, even after the data and files leave the organizational boundaries by using email or document sharing. Microsoft Rights Management is an example of an information protection (IP) solution.|
|Information Rights Management|Frequently abbreviated to *IRM*.<br /><br />A term used in conjunction with Office services, such as Exchange Server, Word, and SharePoint Online, to describe the ability to support Rights Management.|
|IRM|See *Information Rights Management*.|
|MSDRM|Sometimes seen as references for the RMS client 1.0, which is replaced with the newer RMS client, MSIPC. This older client supports applications that are developed with the RMS SDK 1.0 and supports Office 2010 and Office 2007, Exchange 2010 and Exchange 2013, and SharePoint 2010 and SharePoint 2007.|
|MSIPC|Sometimes seen as references for the RMS client 2.0, which replaced the older RMS client, MSDRM. This later client supports applications that are developed with the RMS SDK 2.0 and supports Office 2016 and Office 2013, SharePoint 2013, and the RMS sharing application.|
|native protection|A level of protection available in all enlightened applications that prevents unauthorized people from opening a file and that can also enforce more stringent policies, such as read-only, and do not print. In addition, this protection stays with the file, even when the file is forwarded to other people or saved in a public location that others can access.|
|.pfile|The file name extension that is appended to all files that Rights Management generically protects.|
|.ppdf|The file name extension that Rights Management creates when it automatically creates a PDF copy of a file (Word, Excel, PowerPoint, or PDF) that you share by email, so that the file can be read (but not edited) on all devices.|
|permissions level|A logical grouping of usage rights that make it easier for end-users and administrators to choose configuration options that are role-based. For example, Reviewer and Co-Author.|
|protect|Apply Rights Management controls to files or email messages by using encryption, identity, and access control policies to help secure your data.|
|publish|To protect a file in order to safeguard it from unauthorized access and use.|
|Rights Management connector|An outbound proxy relay that you can deploy for on-premises services such as Exchange Server and SharePoint, to protect data by using Azure Rights Management.|
|Rights Management services|The generic term that applies to both the cloud version of [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] ([!INCLUDE[aad_rightsmanagement_1](../Token/aad_rightsmanagement_1_md.md)]) and the on-premises version of [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] (AD RMS).|
|Rights Management sharing application|An optional downloadable application for Windows and most popular mobile devices, which supports safely sharing files in-place and by email.|
|RMS|See *Rights Management services*.|
|RMS connector|See *Rights Management connector*.|
|RMS for individuals|A free subscription for a user to use [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] when their organization does not have a subscription to Office 365 or Azure Active Directory.|
|RMS sharing app|See *Rights Management sharing application*.|
|super user|A group of highly trusted administrators who can decrypt and access files that the organization has protected by using Rights Management. Typically, this level of access is required for legal eDiscovery and by auditing teams.|
|tenant key|Also known as the server licensor certificate (SLC) key.<br /><br />The key that is unique to an organization and ultimately secures all [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] cryptographic functions that chain to this tenant key.|
|unprotect|Remove Rights Management controls from files or email messages, which used encryption, identity, and access control policies to help secure your data.|
|use license|A per-document certificate that is granted to a user who opens a file or email message that has been protected by [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)]. This certificate contains that user’s rights for the file or email message and the encryption key that was used to encrypt the content, as well as additional access restrictions defined in the document’s policy.|

## See Also
[Getting Started with Azure Rights Management](../Topic/Getting-Started-with-Azure-Rights-Management.md)

