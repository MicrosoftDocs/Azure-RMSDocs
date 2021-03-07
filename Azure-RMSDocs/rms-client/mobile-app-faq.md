---
# required metadata

title: Mobile viewer apps for Azure Information Protection (iOS and Android) - AIP
description: Learn how to view protected files on your iOS and Android devices using the Azure Information Protection (AIP) viewer apps.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 02/22/2021
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

# Mobile viewer apps for Azure Information Protection on iOS and Android

>***Applies to**: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
>***Relevant for**: [AIP unified labeling client and classic client](../faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

The Azure Information Protection (AIP) mobile apps enable you to view protected emails, PDFs, images, and text file when you can't open them with your regular apps for these file types. For example, if protected emails show in your regular email mobile app as attachments, you may want to use the AIP mobile app to view that email.

**Protection and sensitivity labels are supported in mobile Office versions**. If you have mobile Office apps installed on your device, we recommend that you use the Office apps to view protected files. For more information, see [Sensitivity label capabilities in Word, Excel, and PowerPoint](/microsoft-365/compliance/sensitivity-labels-office-apps#sensitivity-label-capabilities-in-word-excel-and-powerpoint).

**If you are opening your file on a desktop**, use the [desktop version of the AIP Viewer](clientv2-view-use-files.md). 

> [!NOTE]
> The AIP mobile apps are *viewers only,* and do not enable you to create new emails or reply to emails, or create or edit protected files. The AIP mobile apps also cannot open attachments to protected PDFs or emails.
> 

## AIP mobile viewer app requirements

The AIP mobile viewer apps for iOS and Android support the following file types and environments:

|Requirement  |Description  |
|---------|---------|
|**Supported OS versions**     | Minimum mobile OSs include: </br>- iOS 11  </br>- Android 6.0 </br></br>**Note**: The AIP mobile viewer apps are not supported on Intel CPUs.  |
|**Supported sign in credentials**     | Sign in to the AIP mobile viewer apps with one of the following: </br></br>**Work or school credentials.** Try logging in with your work or school credentials. If you have questions, contact your administrator to understand whether your organization has AD RMS on-premises with the mobile device extension, or uses Azure Information Protection. </br></br>**A Microsoft account.** If your personal email address was used to protect the file, sign in with a [Microsoft account](https://signup.live.com). If you need to apply for a Microsoft account, you can use your own Hotmail, Gmail, or any other email address to do so. </br></br>**Note**: Not all applications are able to open content protected with a Microsoft account. For more information, see [Supported scenarios for opening protected documents](../secure-collaboration-documents.md#supported-scenarios-for-opening-protected-documents).|
|**Supported file types**     | Supported files types include protected email messages, PDF files, images, and text files. </br></br>For example, these files include the following extensions: **rpmsg**, **.pdf**, **.ppdf**, **.pjpg**, **.pjpeg**, **.ptiff**, **.ppng**, **.ptxt**, **.pxml** </br></br>For a full list of supported file types, see [The AIP client admin guide](clientv2-admin-guide-file-types.md#supported-file-types-for-classification-and-protection).|
| | |

## Download and install the AIP app for your device

If you do not have [Office apps](/microsoft-365/compliance/sensitivity-labels-office-apps#sensitivity-label-capabilities-in-word-excel-and-powerpoint) that you can use to open your protected files, download and install AIP mobile viewer apps.

Download and install the mobile viewer apps from the following locations:

|Location  |Details / Link  |
|---------|---------|
|**iTunes**     | [![Install from iTunes.](../media/small/ios-icon-small.png)](https://apps.apple.com/app/microsoft-rights-management/id689516635)        |
|**Google Play**     |[![Install from Google Play.](../media/small/android-icon-small.png)](https://play.google.com/store/apps/details?id=com.microsoft.ipviewer)         |
|**Your company portal**     |  If your mobile device is managed by Microsoft Intune, you may be able to download the AIP mobile viewer apps from your company portal. <br><br>For more information, contact your system administrator.        |
|     |         |

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


## Admins: Testing the AIP mobile viewer apps

Most users will typically use the AIP mobile app to open a protected email or file that cannot be opened using their regular mobile apps.

If you're a system administrator who wants to test the AIP mobile viewer apps for your org, or simply want to try it out for yourself, use the instructions below to walk you through the entire process.

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

Use one of the following methods to provide feedback about the AIP mobile viewer apps:

- Go to **Settings** > **Send feedback**
- Post your question on our [Yammer site](https://www.yammer.com/AskIPTeam)

For more information about the protection features supported in your apps, see [Applications that support Azure Rights Management data protection](../requirements-applications.md).
