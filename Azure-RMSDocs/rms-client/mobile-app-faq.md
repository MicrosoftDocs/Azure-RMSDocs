---
# required metadata

title: Azure Information Protection apps for iOS & Android
description: Learn the basics about the Azure Information Protection (AIP) apps for iOS and Android devices
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 07/07/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 539b4ff8-5d3b-4c4d-9c84-c14da83ff76d

# optional metadata

#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: user

---

# What is the Azure Information Protection app for iOS or Android?

*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*

The Azure Information Protection (AIP) apps for iOS and Android enable you to view rights-protected email messages (**.rpmsg** files) when your email app doesn't natively support rights management data protection.  

The AIP apps also enable you to view rights-protected PDF documents (protected PDF and**.ppdf** files), images, and text files.

> [!NOTE]
> The AIP apps are viewers only, and do not enable you to create new or reply to protected email messages, or create or edit protected files. The apps also cannot open attachments for files that you view, such as attachments to protected PDF documents or email messages.
>

## AIP mobile app requirements

The AIP mobile apps for iOS and Android can be used with the following systems:

- [Supported mobile OS versions](#supported-mobile-os-versions)
- [Supported sign in credentials](#supported-sign-in-credentials)
- [Supported file extensions](#supported-file-extensions)

### Supported mobile OS versions

The AIP mobile apps require one of the following minimum mobile operating systems: 

- iOS 11 
- Android 6.0 

> [!NOTE]
> The AIP mobile apps are not supported on Intel CPUs.
> 

### Supported sign in credentials

Use one of the following to sign in to AIP: 

- **Work or school credentials.** Use if your organization already has AD RMS on-premises with the mobile device extension, or uses Azure Information Protection.
 
- **A Microsoft account**. If your personal email address was used to protect the file, sign in with a [Microsoft account](https://signup.live.com). 

    - You can use your own Hotmail, Gmail, or any other email address you own when you apply for a Microsoft account.
    
> [!NOTE]
> Not all applications can open protected content when a Microsoft account is used. For more information, see [Supported scenarios for opening protected documents](../secure-collaboration-documents.md#supported-scenarios-for-opening-protected-documents).
> 

### Supported file extensions

You can open .rpmsg, .pdf, .ppdf, .pjpg, .pjpeg, .ptiff, .ppng, .ptxt, .pxml, and several other text and image file formats.

For the full list of text and image file name extensions, see the first table in the [Supported file types for classification and protection](clientv2-admin-guide-file-types.md#supported-file-types-for-classification-and-protection) section from the admin guide.

## Installing your AIP mobile apps and viewing files

If your mobile device is managed by Microsoft Intune, you may be able to download the apps from your company portal.

Otherwise, access the apps from:

- The [iTunes](https://apps.apple.com/app/microsoft-rights-management/id689516635) or [Google Play](https://play.google.com/store/apps/details?id=com.microsoft.ipviewer) store
- The [Azure Information Protection download page](https://portal.azurerms.com/#/download). Select the [iOS](https://apps.apple.com/app/microsoft-rights-management/id689516635) or [Android](https://play.google.com/store/apps/details?id=com.microsoft.ipviewer) icons in the **Mobile Devices** section.

Once installed, wait until you've received a protected email or file, and select the **AIP Viewer** when opening it.

You'll be prompted to sign in with your work or school account, or prompted to select a certificate. Once you've been authenticated, your email or file will open and you'll be able to read its contents.

> [!TIP]
> To try this out right away, send yourself a protected email or file to view. 
>
> For more information, see [Get started with the Microsoft Azure Information Protection app for iOS and Android](mobile-app-get-started.md).
> 

## Next steps

Use one of the following methods to provide feedback about the AIP mobile apps:

- Go to **Settings** > **Send feedback**
- Post your question on our [Yammer site](https://www.yammer.com/AskIPTeam)
