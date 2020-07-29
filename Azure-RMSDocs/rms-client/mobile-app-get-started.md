---
# required metadata

title: Get started - AIP app for iOS & Android
description: View emails or files with the Azure Information Protection app for iOS and Android
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 07/07/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 3d5d18d8-7b2e-456c-bb45-48da4eb55544

# optional metadata

#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: user

---

# Get started with the Microsoft Azure Information Protection app for iOS and Android

*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*

This page describes how to test run the Azure Information Protection apps for iOS or Android.

Most users will typically use the Azure Information Protection app when they need to open a protected email or file. However, if you're an admin testing the app for your users, or if you simply want to try it out before you need it, use the instructions below to view protected files on your device.

> [!IMPORTANT]
> Before you start, read through the requirements and instructions on [What is the Azure Information Protection app for iOS or Android?](mobile-app-faq.md)
> 

## Access a protected file from your device

To test out the AIP mobile app, make sure that you can access one of the following types of protected files from your device:

|File type  |Instructions  |
|---------|---------|
|**A .rpmsg file**     | A rights-protected email message. If your mobile email app doesn't natively support rights management data protection, protected email messages are displayed as email attachments. </br></br>Use another device, such as Outlook from a Windows computer, to send yourself a rights-protected email message that you can access from your mobile device. </br></br>**Note:**For a list of email clients that natively support rights management, see the **Email** rows in [Applications that support Azure Rights Management data protection](../requirements-applications.md). |
|**A rights-protected PDF file**     | 1. From a Windows computer, protect a PDF file using the AIP [classic](client-classify-protect.md) or [unified labeling client](clientv2-classify-protect.md) client. </br>2. Send yourself the protected PDF, or upload it to a SharePoint protected library and share it to your own email address.        |
|**A .ptxt or .pjpg or .ppng**     | 1. From a Windows computer, protect a text or image file using the AIP [classic](client-classify-protect.md) or [unified labeling client](clientv2-classify-protect.md) client. </br></br>2. Send yourself the protected file, or upload it to a SharePoint protected library and share it to your own email address. </br></br>**Note:** For more information, see [Supported file types for classification and protection](client-admin-guide-file-types.md#supported-file-types-for-classification-and-protection)   |
| | |

### Open the protected file on your mobile

1. Tap the email attachment or link to open your protected content.

1. When prompted, select the **AIP Viewer** app to view the protected content.

1. When prompted, sign in with your work or school account or select a certificate.

Once authenticated, the AIP Viewer app displays the email or file for you.

> [!NOTE]
> Always open the AIP app by opening protected content. Do not try to sign in to the app until you're prompted, or open a protected file from inside the AIP Viewer app.
> 

## Next steps

Use one of the following methods to provide feedback about the AIP mobile apps:

- Go to **Settings** > **Send feedback**
- Post your question on our [Yammer site](https://www.yammer.com/AskIPTeam)