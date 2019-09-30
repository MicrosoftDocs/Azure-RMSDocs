---
# required metadata

title: Configuration for clients to use Office apps with Azure RMS from AIP
description: Information and instructions for admins to configure Office apps to work with the Azure Rights Management service from Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 09/24/2019
ms.topic: conceptual
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

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*


Use this information to determine what you need to do so that Office apps work with the Azure Rights Management service from Azure Information Protection.

## Office 365 apps, Office 2019, Office 2016, and Office 2013
Because these later versions of Office natively support the Azure Rights Management service, no client computer configuration is required to support the information rights management (IRM) features for applications such as Word, Excel, PowerPoint, Outlook, and Outlook on the web. All users have to do for these apps on Windows, is sign in to their Office applications with their Office 365 credentials. They can then can protect files and emails, and use files and emails that have been protected by others.

### User instructions for Office for Mac

Users who have Office for Mac must first verify their credentials before they can protect content. For example:

1. Open Outlook and create a profile by using your Office 365 work or school account. 

2. Create a new message and on the **Options** tab, select **Permissions**, and then select **Verify Credentials**. When prompted, specify your Office 365 work or school account details again, and select **Sign in**.
    
    This action downloads the Azure Rights Management templates and **Verify Credentials** is now replaced with options that include **No Restrictions**, **Do Not Forward**, and any Azure Rights Management templates that are published for your tenant. 

3. You can now cancel this new message.

4. To protect an email message or a document: On the **Options** tab, select **Permissions** and choose an option or template that protects your email or document.

## Office 2010
For client computers to use the Azure Rights Management service with Office 2010, they must have the Azure Information Protection client (classic). No further configuration is required other than users must sign in with their Office 365 credentials and they can then protect files and use files that have been protected by others.

For more information about the Azure Information Protection client (classic), see [Azure Information Protection client: Installation and configuration for clients](configure-client.md).

