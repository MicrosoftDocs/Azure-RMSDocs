---
# required metadata

title: Configuration for clients to use Office apps with Azure RMS from AIP
description: Information and instructions for admins to configure Office apps to work with the Azure Rights Management service from Azure Information Protection.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/30/2019
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: ec269afe-4e87-4cc1-9144-5fbb594b412e

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: azurerms
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Office apps: Configuration for clients to use the Azure Rights Management service

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), [Office 365](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4Dz8M)*
>
>***Relevant for**: [AIP unified labeling client and classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

[!INCLUDE [AIP classic client is sunset](includes/classic-client-sunset.md)]


Use this information to determine what you need to do so that Office apps work with the Azure Rights Management service from Azure Information Protection.

## Office 365 apps, Office 2019, Office 2016, and Office 2013

Because these later versions of Office provide built-in support for the Azure Rights Management service, no client computer configuration is required to support the information rights management (IRM) features for applications such as Word, Excel, PowerPoint, Outlook, and Outlook on the web. 

All users have to do for these apps on Windows, is sign in to their Office applications with their Microsoft 365 credentials. They can then can protect files and emails, and use files and emails that have been protected by others.

### User instructions for Office for Mac

Users who have Office for Mac must first verify their credentials before they can protect content. For example:

1. Open Outlook and create a profile by using your Microsoft 365 work or school account. 

2. Create a new message and on the **Options** tab, select **Permissions**, and then select **Verify Credentials**. When prompted, specify your Microsoft 365 work or school account details again, and select **Sign in**.
    
    This action downloads the Azure Rights Management templates and **Verify Credentials** is now replaced with options that include **No Restrictions**, **Do Not Forward**, and any Azure Rights Management templates that are published for your tenant. 

3. You can now cancel this new message.

4. To protect an email message or a document: On the **Options** tab, select **Permissions** and choose an option or template that protects your email or document.

## Office 2010

For client computers to use the Azure Rights Management service with Office 2010, they must have the Azure Information Protection client. No further configuration is required other than users must sign in with their Microsoft 365 credentials and they can then protect files and use files that have been protected by others.

For more information, see [Azure Information Protection client: Installation and configuration for clients](configure-client.md).
