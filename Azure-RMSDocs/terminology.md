---
# required metadata

title: Terminology for Azure Information Protection (AIP)
description: Confused by a word, phrase, or acronym that's related to Microsoft Azure Information Protection (AIP)? Find the definition here for terms and abbreviations that are either specific to AIP or have a specific meaning when used in the context of this service.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/08/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 742877bf-26f5-40e3-b1f7-8475e7c3ce11

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin
search.appverid:
- MET150

---

# Terminology for Azure Information Protection

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

Confused by a word, phrase, or acronym that's related to Azure Information Protection? Find the definition here for terms and abbreviations that are either specific to Azure Information Protection or have a specific meaning when used in the context of this service.

## Word, phrase, or acronym

[A](#a) | [B](#b) | [C](#c) | [D](#d) | [E](#e) | [G](#g) | [I](#i) | [K](#k) | [L](#l) | [M](#m) [N](#n) | [O](#o) | [P](#p) | [R](#r) | [S](#s) | [T](#t) | [U](#u)

### A
|Term|Definition|
|--------|--------------|
|**AADRM**|The name of the first PowerShell module for the protection service (Azure Rights Management), which was derived from the unofficial abbreviation for Azure Rights Management when it was previously named (Windows) Microsoft Entra Rights Management. </br></br>This PowerShell module is now replaced with the AIPService module.|
|**activate**|Enable the Azure Rights Management protection service so that an organization can protect their documents and email. </br></br>This action also enables IRM features in Exchange Online and Microsoft SharePoint.|
|**Active Directory Rights Management Services**|Frequently abbreviated to *AD RMS*.<br /><br />A Windows Server role that provides rights management protection by using encryption and policy to help secure documents, files, and email.|
|**AD RMS**|See *Active Directory Rights Management Services*.|
|**AIP** |See *Azure Information Protection*.|
|**AIPService**|The current name of the PowerShell module for the protection service, which replaces with the older, AADRM module.|
|**AzureInformationProtection**|The name of the PowerShell module for the Azure Information Protection classic or unified labeling client.|
|**Azure Information Protection**|A cloud-based service that uses labels to classify and protect documents and emails. </br></br> Azure Rights Management provides the protection by using encryption, identity, and authorization policies.|
|**Azure Information Protection classic client**|Deprecated. Sometimes abbreviated to *classic client*.<br /><br />The original, legacy client side of Azure Information Protection that let users, administrators, and services use the labels and settings from your Azure Information Protection policy. </br></br> Replaced with the Azure Information Protection unified labeling client. |
|**Azure Information Protection label**|An item that always applies a classification value to documents and emails, and can also protect them. </br></br>When a label is applied, the label information is stored in the metadata for applications and services to read and optionally, act on it.|
|**Azure Information Protection policy**|Administrator-defined configuration for clients and services that use Azure Information Protection labels and policy settings.|
|**Azure Information Protection scanner**|A service that runs on Windows Server and lets you discover, classify, and protect documents on network shares, and SharePoint Server sites and libraries.|
|**Azure Information Protection unified labeling client**|Sometimes abbreviated to *unified labeling client*.<br /><br />The client for Windows computers that lets users, administrators, and services use the sensitivity labels and label policy settings from the Microsoft Purview compliance portal. </br></br>Replaces the Azure Information Protection classic client.|
|**Azure RMS**|See *Azure Rights Management*.|
|**Azure Information Protection viewer**|An app that runs on Windows computers and mobile devices, to display protected files.|
|**Azure Rights Management**|Also known as *Azure Rights Management service*, and Frequently abbreviated to *Azure RMS*.<br /><br />An Azure service used by Azure Information Protection that uses encryption and policy to help secure documents, files, and email. </br></br>Previous names have included:<br /><br />- *Windows Azure Active Directory Rights Management*: Frequently abbreviated to Windows Azure AD Rights Management Service.<br /><br />- *RMS Online*: The original, proposed name, which you might sometimes see in error messages and log file entries.|

### B

|Term|Definition|
|--------|--------------|
|**bring your own key**|Frequently abbreviated to *BYOK*.<br /><br />A configuration and topology option chosen by an organization that wants to generate and manage their own tenant key for Azure Information Protection.|
|**built-in labeling**|A Microsoft 365 app or service capability to support sensitivity labels without the requirement to install an additional labeling client. Also known as *native labeling*.|
|**BYOK**|See *bring your own key*.|

### C

|Term|Definition|
|--------|--------------|
|**consume**|**In the context of protection only**: </br>To open a document or email to read or use it when that content has been protected by a rights management service. </br>For a document, consuming includes editing and adding new content to a protected document. For an email message, consuming includes replying to a protected message.<br /><br/>**In the context of labeling (with or without protection)**: </br>To read and potentially act on the label information stored in the metadata of files and emails.|
|**content key**|A unique key that is created by RMS-enlightened applications for each document or email that is protected by using Rights Management and that helps to limit the risk of information disclosure.|

### D

|Term|Definition|
|--------|--------------|
|**deactivate**|To disable the Rights Management service so that the organization can no longer use Azure Information Protection.|
|**default template**|A protection template that is automatically created for you when you obtain a subscription for Azure Information Protection, so that you can immediately start protecting documents and emails that contain sensitive information.|
|**departmental template**|A protection template that you create and that is configured to be visible for selected users rather than all users in your organization. Also known as a *scoped template*.|
|**Double Key Encryption** |Also known as *DKE*, a method of securing content that uses two keys: one held in Azure and another held by the custer. </br></br>DKE is supported by the AIP unified client only, and is configured in Microsoft 365. |

### E

|Term|Definition|
|--------|--------------|
|**enlightened applications**|Applications that natively support Rights Management, which includes Office applications, such as Word and Excel. </br></br>Independent software vendors (ISVs) and developers can also write applications that natively support Rights Management.|
|**enterprise rights management**|An industry-standard, generic term that is often used to describe products and solutions that help organizations protect sensitive or valuable information by using a combination of encryption and policy authorization tools. </br></br>Azure Information Protection is an example of an enterprise rights management (ERM) solution.|
|**ERM**|See *enterprise rights management*.|

### G

|Term|Definition|
|--------|--------------|
|**generic protection**|A level of protection that encrypts any file type and prevents unauthorized people from opening the file. </br></br>After the file is opened, the file is now unencrypted and usable in an application that doesn’t natively support Rights Management.|


### I

|Term|Definition|
|--------|--------------|
|**information protection**|Sometimes abbreviated to *IP*.<br /><br />An industry-standard, generic term that refers to protecting data and files from unauthorized access, even after the data and files leave the organizational boundaries by using email or document sharing. </br></br>Microsoft Azure Information Protection is an example of an information protection (IP) solution.|
|**Information Rights Management**|Frequently abbreviated to *IRM*.<br /><br />A term used in conjunction with Office services, such as Exchange Server, Word, and SharePoint, to describe the ability to support the Microsoft Rights Management services.|
|**IRM**|See *Information Rights Management*.|

### K

|Term|Definition|
|--------|--------------|
|**key object**|In the context of the tenant key, an entity that contains metadata that is required by the Azure Rights Management service for cryptographic operations.|

### L

|Term|Definition|
|--------|--------------|
|**label**|See *Azure Information Protection label*.|

### M

|Term|Definition|
|--------|--------------|
|**Microsoft Purview Information Protection**| Formerly Microsoft Information Protection that was sometimes abbreviated to *MIP*.<br /><br /> A framework for products and integrated capabilities that use the same labeling store ("unified labels") and help you protect your organization's sensitive information.|
|**MIP**| See *Microsoft Purview Information Protection*|
|**MSDRM**|Sometimes seen as references for the RMS client 1.0, which has been replaced with the newer client, MSIPC. This older client works with applications that were developed with the RMS SDK 1.0 like Office 2010 and Office 2007, Exchange 2010 and Exchange 2013, and SharePoint 2010 and SharePoint 2007. <br><br>**Note**: Some of these applications are no longer supported by Microsoft. |
|**MSIPC**|Sometimes seen as references for the RMS client 2.0, which replaced the older RMS client, MSDRM. </br></br>This later client supports applications that are developed with the RMS SDK 2.0 and supports Office 365 ProPlus, Office 2019, Office 2016, Office 2013, SharePoint 2013, and the Azure Information Protection client.|

### N

|Term|Definition|
|--------|--------------|
|**native protection**|A level of protection available in all enlightened applications that prevents unauthorized people from opening a file and that can also enforce more stringent policies, such as read-only, and do not print. </br></br>In addition, this protection stays with the file, even when the file is forwarded to other people or saved in a public location that others can access.|

### O

|Term|Definition|
|--------|--------------|
|**Office Message Encryption**|Frequently abbreviated to *OME*.<br /><br />The new Office 365 Message Encryption capabilities have built-in integration with the Azure Rights Management service to provide the same email protection for internal and external users, automatic refresh of templates, and support for the bring your own key (BYOK) scenario. </br></br>The previous OME implementation was designed for external recipients only, required a mail flow rule, and did not support BYOK.|

### P

|Term|Definition|
|--------|--------------|
|**.pfile**|The file name extension that is appended to all files that a rights management service generically protects.|
|**permissions level**|A logical grouping of usage rights that make it easier for end-users and administrators to choose configuration options that are role-based. For example, Reviewer and Co-Author.|
|**protect**|Apply rights management controls to files or email messages by using encryption, identity, and access control policies to help secure your data.|
|**protection-only mode**|An operational mode for the Azure Information Protection client when there is no Azure Information Protection policy to apply labels. </br></br>In this mode, classification labels are not displayed but users can still apply Rights Management protection.|
|**protection template**|Also known as a *rights policy template*, *Rights Management template*, and *RMS template*.<br /><br />A group of protection settings that are managed by an administrator and that include the defined usage rights for authorized users, and access controls for expiry and offline access. |
|**publish**|To protect a file in order to safeguard it from unauthorized access and use. </br></br>Also used as a term in conjunction with protection templates and the Azure Information Protection policy, to make these items available for use by clients and services.|

### R

|Term|Definition|
|--------|--------------|
|**Rights Management connector**|An outbound proxy relay that you can deploy for on-premises services such as Exchange Server and SharePoint, to protect data by using the Azure Rights Management service.|
|**Rights Management issuer**|The account that protected a document or email.|
|**Rights Management owner**|The account that retains full control of a protected document or email by being automatically granted the Rights Management Full Control usage right and is exempt from any expiry date or offline setting.|
|**Rights Management services**|The generic term that applies to both the cloud version of Rights Management (Azure Rights Management) and the on-premises version of Rights Management (AD RMS).|
|**Rights Management sharing application**|Now replaced by the Azure Information Protection client.|
|**RMS**|See *Rights Management services*.|
|**RMS connector**|See *Rights Management connector*.|
|**RMS for individuals**|A free subscription for a user to use Rights Management when their organization does not have a subscription to Office 365 or Microsoft Entra ID.|
|**RMS sharing app**|See *Rights Management sharing application*.|
|**RMS template**|See *protection template*.|

### S

|Term|Definition|
|--------|--------------|
|**scanner**|See *Azure Information Protection scanner*.|
|**super user**|A group of highly trusted administrators who can decrypt and access files that the organization has protected by using a rights management service. </br></br>Typically, this level of access is required for legal eDiscovery and by auditing teams.|

### T

|Term|Definition|
|--------|--------------|
|**tenant key**|Also known as the *server licensor certificate (SLC) key*.<br /><br />The key that is unique to an organization and ultimately secures all Rights Management cryptographic functions that chain to this tenant key.|

### U

|Term|Definition|
|--------|--------------|
|**unified label**| Also known as *unified sensitivity label*.<br /><br /> A label that can be applied by apps, clients, and services that support Microsoft Purview Information Protection, to apply classification and optionally, protection. </br></br>In Office apps and services, unified labels are implemented as sensitivity labels.|
|**unprotect**|Remove protection controls from files or email messages, which used encryption, identity, usage rights, and access control policies to help secure your data.|
|**use license**|A per-document certificate that is granted to a user who opens a file or email message that has been protected by a rights management service. </br></br>This certificate contains that user’s rights for the file or email message and the encryption key that was used to encrypt the content, as well as additional access restrictions defined in the document’s policy.|

