---
# required metadata

title: Azure Information Protection client - Version history & support policy
description: See what's new or changed in a release of the Azure Information Protection client for Windows, and understand the lifecycle policy for support. 
author: mlottner
ms.author: mlottner
manager: rkarlin
ms.date: 02/12/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:git
#ms.devlang:
ms.subservice: v1client
ms.reviewer: elkamins
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Azure Information Protection client: Version release history and support policy


>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows Server 2019, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012*
>
> *Instructions for: [Azure Information Protection client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*



You can download the latest general availability release version and the current preview version (if available) from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018). 

After a short delay of typically a couple of weeks, the latest general availability version is also included in the Microsoft Update Catalog with a product name of **Microsoft Azure Information Protection** > **Microsoft Azure Information Protection Client**, and the classification of **Updates**. This inclusion in the catalog means that you can upgrade the client by using WSUS or Configuration Manager, or other software deployment mechanisms that use Microsoft Update.

For more information, see [Upgrading and maintaining the Azure Information Protection client](client-admin-guide.md#upgrading-and-maintaining-the-azure-information-protection-client).

> [!TIP]
> Interested in using the Azure Information Protection unified labeling client because your labels are published from the Office 365 Security & Compliance Center, Microsoft 365 security center, or Microsoft 365 compliance center? When you download and then install the unified labeling client from the Microsoft Download Center, you can upgrade your Azure Information Protection client to the [unified labeling client](unifiedlabelingclient-version-release-history.md).

### Servicing information and timelines

Each general availability (GA) version of the Azure Information Protection client is supported for up to six months after the release of the subsequent GA version. With the exception of this section, the documentation does not include information about unsupported versions of the client. Fixes and new functionality are always applied to the latest GA version and will not be applied to older GA versions.

Preview versions should not be deployed for end users on production networks. Instead, use the latest preview version to see and try new functionality or fixes that are coming in the next GA version. Preview versions that are not current are not supported.

##### General availability versions that are no longer supported:

|Client version|Date released|
|--------------|-------------|
|1.48.204.0|04/16/2019|
|1.41.51.0|11/27/2018|
|1.37.19.0|09/17/2018|
|1.29.5.0|06/26/2018|
|1.27.48.0|05/30/2018|
|1.26.6.0|04/17/2018|
|1.10.56.0|09/18/2017|
|1.7.210.0|06/06/2017|
|1.4.21.0|03/15/2017|
|1.3.155.2|02/08/2017|
|1.2.4.0.0|10/27/2016|
|1.1.23.0|10/01/2016|

The date format used on this page is *month/day/year*.

Starting 6/2/2019, the labeling service for Azure Information Protection requires connections that use TLS 1.2.

All client versions from 1.4.21.0 released 03/15/2017 support TLS 1.2. Client versions **1.3.155.2**, **1.2.4.0**, and **1.1.23.0** do not use TLS 1.2 and therefore can no longer download the Azure Information Protection policy.

### Release history

Use the following information to see what’s new or changed for a supported release of the Azure Information Protection client for Windows. The most current release is listed first.

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the Azure Information Protection client, we recommend that you check whether it is fixed with the latest GA release. If the problem remains, check the current preview version (if available).
>  
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

## Version 1.54.59.0

**Released**: 12/02/2020

**Fixes**:

- Issue where files protected by IQP displayed **recover** and/or **save as** options after protection was removed, are resolved. 

- Numerous product feature tooltip texts were improved for clarity and ease of understanding. 

- Issues surrounding client stability when working with protected PDF files is resolved. 

- Protection labels are now removed as expected if the label is deleted on the email during the email creation process. 

## Version 1.54.33.0

**Released**: 10/23/2019

Supported through 08/12/2020

This version includes the MSIPC version 1.0.4008.0813 of the RMS client.

This release has general fixes for stability and performance.

## Version 1.53.10.0

**Released**: 07/15/2019

Supported through 04/23/2020

This version includes the MSIPC version 1.0.3889.0419 of the RMS client.

**New features:**

- New advanced client setting to exempt Outlook messages from the policy setting **All documents and emails must have a label**. [More information](client-admin-guide-customizations.md#exempt-outlook-messages-from-mandatory-labeling)

- New advanced client setting to further customize settings that implement pop-up messages in Outlook that warn, justify, or block emails being sent. With this new advanced setting, you can set a different action for email messages without attachments. [More information](client-admin-guide-customizations.md#to-specify-a-different-action-for-email-messages-without-attachments)

**Fixes**:

- When you use File Explorer, right-click to label a file that has protection applied independently from a label, that protection is preserved. For example, a user applied custom permissions to a file.

- When you replace the Do Not Forward option on an email thread with a label that's configured for user-defined permissions and Do Not Forward, original recipients can still open the email message.

- In the following scenario a user no longer sees in the label tooltip that the label was automatically set by them: A user receives a protected email with a document attached that isn't labeled, but automatically protected. When the user from the same organization as the sender opens the document, the corresponding label for the protection settings is applied to the document.

- The minimum [usage right](../configure-usage-rights.md#usage-rights-and-descriptions) to run the [Unprotect-RMSFile](/powershell/module/azureinformationprotection/unprotect-rmsfile) cmdlet is now **Save As, Export** (EXPORT) rather than **Copy** (EXTRACT).

## Next steps

Not sure if this is the right client to install?  See [Choose which labeling client to use for Windows computers](use-client.md#choose-which-labeling-client-to-use-for-windows-computers).

For more information about installing and using the client: 

- For users: [Download and install the client](install-client-app.md)

- For admins: [Azure Information Protection client administrator guide](client-admin-guide.md)
