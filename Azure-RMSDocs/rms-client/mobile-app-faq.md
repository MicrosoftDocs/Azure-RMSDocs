---
# required metadata

title: FAQs for Azure Information Protection app for iOS & Android
description:
keywords: Some frequently asked questions to help you use the Azure Information Protection app for iOS and Android
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 08/31/2018
ms.topic: conceptual
ms.service: information-protection
ms.custom: askipteam
ms.assetid: 539b4ff8-5d3b-4c4d-9c84-c14da83ff76d

# optional metadata

#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# FAQs for Microsoft Azure Information Protection app for iOS and Android

*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*

This page provides answers to frequently asked questions about the Azure Information Protection app for iOS and Android.

## What can I do with the Azure Information Protection app?

This app lets you view rights-protected email messages (.rpmsg files) if your email app doesn't natively support rights management data protection. This app also lets you view rights-protected PDF files, and pictures and text files that are rights-protected. Currently, you cannot use this app to create new protected email messages, reply to them, or create or edit protected files.

## Can I open PDF files that are in SharePoint protected libraries and OneDrive for Business?

Yes, you can open protected PDF files that others have shared with you via SharePoint and OneDrive for Business. Tap the link, and choose this app to open the file for you. 

This app can also open PDF files that have been protected outside SharePoint and OneDrive for Business (protected PDF and .ppdf files).

## Can my mobile device run the Azure Information Protection app?

The Azure Information Protection app requires a minimum version of **iOS 8** or **Android 4.4**.

If you have these versions or higher, you can install the app to run on your mobile device:

- If your mobile device is managed by Microsoft Intune, you might be able to install the Azure Information Protection app from your company portal.

- If your mobile device is not managed by Microsoft Intune or the Azure Information Protection app isn't available from your company portal, you can install the app either directly from the iTunes store and the Google Play store, or by clicking the iOS or Android icon from the **Mobile Devices** section on the [Azure Information Protection download page](https://portal.azurerms.com/#/download). 

## How do I get started with the viewer app?

After you've installed the app, you don't need to do anything more at that point. Wait until you get a protected email or file that you want to view, and then choose the **AIP Viewer** to open it. You will then be asked to sign in with your work or school account, or prompted to select a certificate. After these credentials are authenticated, you can then read the contents.

However, if you don't want to wait, you can use the following instructions to send yourself a protected email or file to view: [Get started with the Microsoft Azure Information Protection app for iOS and Android](mobile-app-get-started.md) 

## What credentials should I use to sign in to this app?

If your organization already has AD RMS on-premises (with the mobile device extension) or uses the Azure Rights Management service, use your work credentials to sign in. 

If your personal email address was used to protect the file, use credentials from a free [Microsoft account](https://signup.live.com) to sign in.

## Can I sign up for the free account with my personal email address, such as a Hotmail or Gmail account?

Yes, when you apply for a Microsoft account, you can specify your Hotmail or Gmail email address, or any other email address that you own. 

However, although this viewer can open protected files with this account, not all applications can open protected content when a Microsoft account is used for authentication. [More information](../secure-collaboration-documents.md#supported-scenarios-for-opening-protected-documents)

## Which file extensions can I open with this app?

You can open .rpmsg, .pdf, .ppdf, .pjpg, .pjpeg, .ptiff, .ppng, .ptxt, .pxml, and several other text and image file formats.

For the full list of text and image file name extensions, see the first table in the [Supported file types for classification and protection](client-admin-guide-file-types.md#supported-file-types-for-classification-and-protection) section from the admin guide.

##  How do I provide feedback about this app?

In the app, go to **Settings** > **Send feedback**.


## My question has not been answered—what should I do?

Post your question on our [Yammer site](https://www.yammer.com/AskIPTeam).
