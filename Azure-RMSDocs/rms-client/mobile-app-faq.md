---
# required metadata

title: FAQs for Azure Information Protection app for iOS and Android | Azure Information Protection
description:
keywords: Some frequently asked questions to help you use the Azure Information Protection app for iOS and Android
author: cabailey
manager: mbaldwin
ms.date: 10/11/2016
ms.topic: article
ms.prod: azure
ms.service: information-protection
ms.technology: techgroup-identity
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

*Applies to: Active Directory Rights Management Services, Azure Information Protection*

This page provides answers to frequently asked questions about the Azure Information Protection app for iOS and Android.

## What can I do with the Azure Information Protection app?

This app lets you view rights-protected email messages (.rpmsg files) if your email app doesn't natively support rights management data protection. This app also lets you view rights-protected PDF files, pictures and text files that are rights-protected, and generically protected files (these have a .pfile file name extension). Currently, you cannot use this app to create new protected email messages, reply to them, or create or edit protected files.

## Can I open PDF files that are in SharePoint protected libraries and OneDrive For Business?

Yes, you can open protected PDF files that others have shared with you via SharePoint and OneDrive for Business. Tap the link, and this app opens the file for you. 

## I've just downloaded the app, how do I confirm it's working?

Because the app is designed to open and display specific file types, you will need to access one of these files from your mobile device to see the viewer in action. For example:

- **A .rpmsg file**: This is a rights-protected email message that displays as an attachment in an email message when your email app on your mobile device does not natively support rights management data protection. 
    
    Use another device to send yourself a rights-protected email message that you can access from your mobile device. For example, use Outlook from a Windows computer. For a list of email clients that natively support rights management, see the EMAIL column from the [Applications that support Azure Rights Management data protection](../get-started/requirements-applications.md) page.

- **A rights-protected PDF file**: Use a PDF application that natively supports rights management to send yourself a rights-protected PDF file as an attachment in email. Or, upload a PDF file to a SharePoint protected library and then share it, using your email address.

- **A .ptxt or .pjpg or .pfile**: Use the Rights Management sharing application from a Windows computer and the [Share Protected](sharing-app-protect-by-email.md) option to send yourself a protected file as an email attachment. For the full list of file types that you can use for testing, see the first table from the [Supported file types and file name extensions](sharing-app-admin-guide-technical.md#supported-file-types-and-file-name-extensions) section in the Rights Management sharing application admin guide. 

To view these encrypted files, tap the email attachment or link. When you're prompted to select an app to open them with, select the **AIP Viewer** app. You'll then be prompted to sign in for your work or school account. After you're successfully authenticated, the Azure Information Protection app displays an unencrypted version of the email or file for you to read.

## What credentials should I use to sign in to this app?

If your organization already has AD RMS on-premises (with the mobile device extension) or uses the Azure Rights Management service, you can use your credentials to sign in. If not, you can sign up for a free new account by using the [Azure Rights Management page](https://portal.office.com/signup?sku=rms&ru=https%3A%2F%2Fportal.azurerms.com%2F%23%2Fdownload).

## Can I sign up for the free account with my personal email address, such as a Hotmail or Gmail account?

Not yet. Today, you can sign up only with your business email address (work or school account). We’re working on support for personal email addresses and will update this entry when it’s available.

## Which file extensions can I open with this app?

You can open .rpmsg, .pdf, .ppdf, .pjpg, .ptxt, and several other text and image file formats.

## Why do I have to consent before viewing a protected .pfile?

Consent is required to validate that you are aware of the following:

- The owner of the document expects you to honor the rights.

- Opening this content in a third-party application will be audited.

##  How do I provide feedback about this app?

In the app, go to **Settings** > **send feedback**.


## My question has not been answered—what should I do?

Post your question to our [Yammer site](http://www.yammer.com/AskIPTeam), or [send an email to the Information Protection team](mailto:askIPteam@microsoft.com?subject=Question%20about%20Azure%20Information%20Protection%20app).
