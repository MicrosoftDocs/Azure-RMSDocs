---
# required metadata

title: Azure Information Protection mobile apps for iOS & Android
description: Learn the basics about the Azure Information Protection (AIP) mobile apps for iOS and Android devices
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/24/2020
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

>***Applies to**: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
>***Relevant for**: [AIP unified labeling client and classic client](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

The Azure Information Protection (AIP) mobile app for iOS and Android is a viewer app that enables you to view protected email messages, PDFs, images, and text files, and are useful if your regular apps for these file types do not support protection. 

For example, if protected emails show in your regular email mobile app as attachments, you may want to use the AIP mobile app to view that email.

For more information, see [Applications that support Azure Rights Management data protection](../requirements-applications.md).

> [!NOTE]
> The AIP mobile apps are *viewers only,* and do not enable you to create new emails or reply to emails, or create or edit protected files. The AIP mobile apps also cannot open attachments to protected PDFs or emails.
> 

## Download and install the AIP app for your device

Download and install AIP mobile apps from one of the following locations:

**iTunes**

:::image type="content" source="../media/develop/ios-icon.png" alt-text="iTunes" link="https://apps.apple.com/app/microsoft-rights-management/id689516635" border="false":::

**Google Play**

:::image type="content" source="../media/develop/android-icon.png" alt-text="Google Play" link="https://play.google.com/store/apps/details?id=com.microsoft.ipviewer" border="false":::

**AIP download page**

:::image type="content" source="../media/aip-icon.png" alt-text="Azure Information Protection download page" border="false":::

Select the [iOS](https://apps.apple.com/app/microsoft-rights-management/id689516635) or [Android](https://play.google.com/store/apps/details?id=com.microsoft.ipviewer) icons in the **Mobile Devices** section.

**Your company portal**

If your mobile device is managed by Microsoft Intune, you may be able to download the AIP mobile apps from your company portal. 

For more information, contact your system administrator.

## iOS: View protected files on your device

Once you've [installed the AIP mobile app](#download-and-install-the-aip-app-for-your-device), open a protected email or file. 

1. If you are prompted to select an app to open the file, tap the share button to share the file instead.

    Select **Share file via....** and then select **Copy to AIP Viewer.**

    For example:

    :::image type="content" source="../media/ios-share-to-aip-viewer.png" alt-text="Share to AIP Viewer in iOS" border="false":::

1. Sign in, or select a certificate as prompted.

    Once you've been authenticated, the your email or file will open in the AIP Viewer.
 
## Android: View protected files on your device

Once you've [installed the AIP mobile app](#download-and-install-the-aip-app-for-your-device), open a protected email or file. 

1. When prompted to select an app, select the AIP Viewer:

    :::image type="content" source="../media/select-aip-viewer.png" alt-text="Select the AIP Viewer mobile app":::

1. Sign in, or select a certificate as prompted.

    Once you've been authenticated, the your email or file will open in the AIP Viewer.

## AIP mobile app requirements

The AIP mobile apps for iOS and Android support the following file types and environments:

|Requirement  |Description  |
|---------|---------|
|**Supported OS versions**     | Minimum mobile OSs include: </br>- iOS 11  </br>- Android 6.0 </br></br>**Note:** The AIP mobile apps are not supported on Intel CPUs.  |
|**Supported sign in credentials**     | Sign in to the AIP mobile apps with one of the following: </br></br>**Work or school credentials.** Try logging in with your work or school credentials. If you have questions, contact your administrator to understand whether your organization has AD RMS on-premises with the mobile device extension, or uses Azure Information Protection. </br></br>**A Microsoft account**. If your personal email address was used to protect the file, sign in with a [Microsoft account](https://signup.live.com). If you need to apply for a Microsoft account, you can use your own Hotmail, Gmail, or any other email address to do so. </br></br>**Note:** Not all applications are able to open content protected with a Microsoft account. For more information, see [Supported scenarios for opening protected documents](../secure-collaboration-documents.md#supported-scenarios-for-opening-protected-documents).|
|**Supported file types**     | Supported files types include protected email messages, PDF files, images, and text files. </br></br>For example, these files include the following extensions: **rpmsg,** **.pdf,** **.ppdf,** **.pjpg,** **.pjpeg,** **.ptiff,** **.ppng,** **.ptxt,** **.pxml** </br></br>For a full list of supported file types, see [The AIP client admin guide](clientv2-admin-guide-file-types.md#supported-file-types-for-classification-and-protection).|
| | |

## Admins: Testing the AIP mobile apps

Most users will typically use the AIP mobile app to open a protected email or file that cannot be opened using their regular mobile apps.

If you're a system administrator who wants to test the AIP mobile apps for your org, or simply want to try it out for yourself, use the instructions below to walk you through the entire process.

1. Make sure that you have access to a file type supported by the AIP mobile app from your device. 

    For example, send yourself one of the following rights-protected files:

    |File type  |Instructions  |
    |---------|---------|
    |**Email (.rpmsg)**     | Use another device, such as Outlook from a Windows computer, to send yourself a rights-protected email message that you can access from your mobile device.  |
    |**PDF**     | 1. From a Windows computer, [protect a PDF](clientv2-classify-protect.md) file using the AIP client. </br>2. Send yourself the protected PDF, or upload it to a SharePoint protected library and share it to your own email address.        |
    |**Image (.ptxt, .pjpg, or .ppng)**     | 1. From a Windows computer, [protect a text or image file](clientv2-classify-protect.md) using the AIP client. </br></br>2. Send yourself the protected file, or upload it to a SharePoint protected library and share it to your own email address.   |
| | |

1. Open the protected file on your mobile device using the email attachment or link that you'd sent to yourself.

    For example, protected emails show in your regular email mobile app as attachments. 

1. When prompted to select an app to open the protected email or file, select the **AIP Viewer** app.

1. Sign in or select a certificate, as prompted. 

    Once authenticated, the AIP Viewer app displays the email or file for you.

> [!NOTE]
> Always open the AIP app by opening protected content. Do not try to sign in to the app until you're prompted, or open a protected file from inside the AIP Viewer app.
> 

## Next steps

Use one of the following methods to provide feedback about the AIP mobile apps:

- Go to **Settings** > **Send feedback**
- Post your question on our [Yammer site](https://www.yammer.com/AskIPTeam)
