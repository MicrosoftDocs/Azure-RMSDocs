---
# required metadata

title: Protected PDF viewers for Microsoft Information Protection
description: Learn how to open and view PDFs that are labeled for classification and protection.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 06/21/2021
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: aab59e02-930b-4a17-8442-2d5d081fe1a6

# optional metadata

#audience:
#ms.devlang:
ms.reviewer: kartikka
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: user
search.appverid:
- MET150

---

# Which PDF readers are supported for protected PDFs?


>

This article describes the protected PDF readers that are supported for Azure Information Protection (AIP). Protected PDF readers enable users to open those encrypted PDFs and view the sensitive information contained.

Encrypting your PDFs with AIP ensures that unauthorized people cannot read the file's content. Protected PDF readers that support AIP verify that you've been granted permissions to open the document, and also decrypt the content for you.

For example, the following image shows an encrypted document open in Adobe Acrobat Reader. The bar at the top indicates that the document is protected by a Microsoft Information Protection solution.

:::image type="content" source="../media/protected-pdf-in-adobe-reader.png" alt-text="Protected PDF open in Adobe Acrobat Reader":::

For instructions, see the following sections:

- [Viewing protected PDFs in Microsoft Edge on Windows or Mac](#viewing-protected-pdfs-in-microsoft-edge-on-windows-or-mac)

- [Installing a protected PDF reader for Windows or Mac](#installing-a-protected-pdf-reader-for-windows-or-mac)

- [Installing a protected PDF reader for mobile (iOS/Android)](#installing-a-protected-pdf-reader-for-mobile-iosandroid)

> [!TIP]
> If your document doesn't open after installing a recommended reader, the document may be protected in an older format. 
>
> In this case, try one of the readers listed as supported for previous formats. For more information, see [Support for previous formats](#support-for-previous-formats).
> 
### ISO standards for PDF encryption

The PDF readers referenced on this page can all open protected documents that adhere to the ISO standard for PDF encryption. 

This standard is used by default by the AIP client.

### Viewing protected PDFs in Adobe Acrobat Reader

Adobe Acrobat Reader integrates with Microsoft Information Protection solutions, such as Azure Information Protection to provide users with a simplified and consistent experience for classified and/or protected PDFs.

The Adobe Acrobat Reader with Microsoft Information Protection integration is supported for [Windows](#installing-a-protected-pdf-reader-for-windows-or-mac) and [macOS](#installing-a-protected-pdf-reader-for-windows-or-mac).

For more information, see the following blog posts: 

- [General Availability of Adobe Acrobat Reader Integration with Microsoft Information Protection](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/General-Availability-of-Adobe-Acrobat-Reader-Integration-with/ba-p/298396)

- [Adobe reader and Microsoft Information Protection integration FAQs](https://techcommunity.microsoft.com/t5/Microsoft-Information-Protection/Adobe-reader-and-Microsoft-Information-Protection-integration/ba-p/482219)

## Viewing protected PDFs in Microsoft Edge on Windows or Mac

Microsoft Edge offers built-in support for viewing PDF files that are classified and protected. Use of Microsoft Edge ensures that users can open protected PDF files seamlessly without the need to install or configure any extra settings or software.

Supported versions include:

- **Windows**: Windows 11 and previous versions through Windows 8. 
    
    For more information about earlier versions, see [Support for previous formats](#support-for-previous-formats).

- **Mac**: macOS versions 10.12 and above 


**Instructions**: 

1. Check which [Microsoft Edge version](https://support.microsoft.com/help/4027011/microsoft-edge-find-out-which-version-you-have) is installed on your system. 
1. If the Microsoft Edge version is 83.0.478.37 or above, you can open protected files directly in the Edge browser. 

1. To open PDF files in SharePoint, click **Open** > **Open in browser**. 

    :::image type="content" source="../media/edge_open_browser.png" alt-text="Open a protected PDF using Microsoft Edge from the browser using the Open in browser option":::
 
## Installing a protected PDF reader for Windows or Mac

To open a protected PDF document on your desktop computer, we recommend that you install the relevant [Microsoft Information Protection (MIP) plug-in for Acrobat and Acrobat Reader](https://go.microsoft.com/fwlink/?linkid=2050049) for your operating system.

**Instructions**:

1. If you haven't already, install the Adobe Reader from the [Adobe site](https://www.adobe.com/).

    Make sure that you read and agree to the [Adobe General Terms of Use](https://www.adobe.com/legal/terms.html).

1. Install the [MIP plug-in for Acrobat and Acrobat Reader](https://go.microsoft.com/fwlink/?linkid=2050049) for your operating system.  

    Supported versions include:

    - **Windows**: Windows 10 and previous versions through Windows 8. 
    
        For more information about earlier versions, see [Support for previous formats](#support-for-previous-formats).

    - **Mac**: macOS versions 10.12 - 10.14 

1. If prompted for admin approval, ask your admin to authorize the plug-in.

    For example:
    
    :::image type="content" source="../media/admin-approval-for-mip-in-adobe-reader.png" alt-text="Admin approval required to install the MIP plug-in for Acrobat and Acrobat Reader":::
    
> [!NOTE]
> For more information, see the [Microsoft Information Protection and Adobe release announcement](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/General-Availability-of-Adobe-Acrobat-Reader-integration-with/ba-p/298396).
> 

### Alternative protected PDF readers for Windows

Alternatively, use one of the following PDF readers for Windows that adhere to the ISO standard for PDF encryption:

- [Azure Information Protection viewer](https://go.microsoft.com/fwlink/?linkid=838993) 

- [Foxit Reader](https://www.foxitsoftware.com/pdf-reader/)

## Installing a protected PDF reader for mobile (iOS/Android)

To open a protected PDF on your iOS or Android device, download and install the app for your operating system:

|OS  |Link  |
|---------|---------|
|**iTunes**     | [![Install from iTunes.](../media/small/ios-icon-small.png)](https://apps.apple.com/app/microsoft-rights-management/id689516635)        |
|**Google Play**     |[![Install from Google Play.](../media/small/android-icon-small.png)](https://play.google.com/store/apps/details?id=com.microsoft.ipviewer)         |
| | |

For more information, see [Mobile viewer apps for Azure Information Protection (iOS and Android)](mobile-app-faq.md).

## Support for previous formats

The following PDF readers support both protected PDFs with a **.ppdf** extension, and older formats with a **.pdf** extension.

If you're unable to open your protected PDF using the recommended reader, the document may be protected in a previous format. For example, Microsoft SharePoint currently uses an older format for PDF documents in IRM-protected libraries.

- **Windows 11 / previous versions through Windows 7 Service Pack 1**

    - [Azure Information Protection viewer](https://go.microsoft.com/fwlink/?linkid=838993)
    - Gaaiho Doc
    - GigaTrust Desktop PDF Client for Adobe
    - Foxit Reader
    - Nitro PDF Reader
    - Nuance Power PDF

- **Android**:

    - [Azure Information Protection app](mobile-app-faq.md)
    - Foxit MobilePDF with RMS

- **iOS**:

    - [Azure Information Protection app](mobile-app-faq.md)
    - Foxit MobilePDF with RMS
    - TITUS Docs

- **macOS Catalina**: Edge Chromium

## Next steps

If you need more help after installing, use the instructions and documentation for each reader. For example, see the following articles:

- [User Guide: View protected files with the Azure Information Protection unified labeling client](clientv2-view-use-files.md)
- [Mobile viewer apps for Azure Information Protection (iOS and Android)](mobile-app-faq.md)
