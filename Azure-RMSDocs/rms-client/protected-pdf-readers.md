---
# required metadata

title: Protected PDF readers for Microsoft Information Protection
description: Install a reader for PDF documents that are labeled for classification and protection
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 07/17/2020
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

PDF readers for classified and/or protected PDFs enable you to open encrypted PDFs that contain sensitive information.

Encrypting your PDFs with [Azure Information Protection (AIP)](../what-is-information-protection.md) ensures that unauthorized people cannot read the file's content, and that even authorized people cannot share screens or screenshots that display the content.

Protected PDF readers that support Azure Information Protection verify that you've been granted permissions to open the document, and also decrypt the content for you.

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

This standard is used by default by both the AIP classic and unified labeling clients, unless it has been [disabled by an administrator](client-admin-guide-customizations.md#dont-protect-pdf-files-by-using-the-iso-standard-for-pdf-encryption).

### Viewing protected PDFs in Adobe Acrobat Reader

Adobe Acrobat Reader integrates with Microsoft Information Protection solutions, such as [Azure Information Protection](../what-is-information-protection.md) to provide users with a simplified and consistent experience for classified and/or protected PDFs.

The Adobe Acrobat Reader with Microsoft Information Protection integration is supported for [Windows](protected-pdf-readers-windows.md) and [macOS](protected-pdf-readers-mac.md).

For more information, see the following blog posts: 

- [General Availability of Adobe Acrobat Reader Integration with Microsoft Information Protection](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/General-Availability-of-Adobe-Acrobat-Reader-Integration-with/ba-p/298396)

- [Adobe reader and Microsoft Information Protection integration FAQs](https://techcommunity.microsoft.com/t5/Microsoft-Information-Protection/Adobe-reader-and-Microsoft-Information-Protection-integration/ba-p/482219)

## Viewing protected PDFs in Microsoft Edge on Windows or Mac

Microsoft Edge offers native support for viewing PDF files that are classified and protected. Use of Microsoft Edge ensures that users can open protected PDF files seamlessly without the need to install or configure any additional settings or software.

Supported versions include:

- **Windows:** Windows 10 and previous versions through Windows 8. 
    
    For more information about earlier versions, see [Support for previous formats](#support-for-previous-formats).

- **Mac:** macOS versions 10.12 and above 


**Instructions:** 

1. Check which [Microsoft Edge version](https://support.microsoft.com/help/4027011/microsoft-edge-find-out-which-version-you-have) is installed on your system. 
1. If the Microsoft Edge version is 83.0.478.37 or above, you can open protected files directly in the Edge browser. 

1. To open PDF files in SharePoint, click **Open** > **Open in browser**. 

    :::image type="content" source="../media/edge_open_browser.png" alt-text="Open a protected PDF using Microsoft Edge from the browser using the Open in browser option":::
 
## Installing a protected PDF reader for Windows or Mac

To open a protected PDF document on your desktop computer, we recommend that you install the relevant [Microsoft Information Protection (MIP) plug-in for Acrobat and Acrobat Reader](https://go.microsoft.com/fwlink/?linkid=2050049) for your operating system.

**Instructions:**

1. If you haven't already, install the Adobe Reader from the [Adobe site](https://www.adobe.com/).

    Make sure that you read and agree to the [Adobe General Terms of Use](https://www.adobe.com/legal/terms.html).

1. Install the [MIP plug-in for Acrobat and Acrobat Reader](https://go.microsoft.com/fwlink/?linkid=2050049) for your operating system.  

    Download: [![Download](../media/download.png "Download the MIP plug-in for Acrobat and Acrobat Reader")](https://go.microsoft.com/fwlink/?linkid=2050049)

    Supported versions include:

    - **Windows:** Windows 10 and previous versions through Windows 8. 
    
        For more information about earlier versions, see [Support for previous formats](#support-for-previous-formats).

    - **Mac:** macOS versions 10.12 - 10.14 

1. If prompted for admin approval, ask your admin to authorize the plug-in.

    For example:
    
    :::image type="content" source="../media/admin-approval-for-mip-in-adobe-reader.png" alt-text="Admin approval required to install the MIP plug-in for Acrobat and Acrobat Reader":::
    
> [!NOTE]
> For more information, see the [Microsoft Information Protection and Adobe release announcement](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/General-Availability-of-Adobe-Acrobat-Reader-integration-with/ba-p/298396).
> 

### Alternative protected PDF readers for Windows

Alternatively, use one of the following PDF readers for Windows that adhere to the ISO standard for PDF encryption:

- Azure Information Protection viewer [![Download](../media/download.png "Download the AIP viewer")](https://go.microsoft.com/fwlink/?linkid=838993) 

- Foxit Reader [![Download](../media/download.png "Download Foxit Reader viewer")](https://www.foxitsoftware.com/pdf-reader/)

## Installing a protected PDF reader for mobile (iOS/Android)

To open a protected PDF on your iOS or Android device, download and install the app for your operating system:

- Azure Information Protection app for iOS [![Download](../media/download.png "Azure Information Protection app for iOS")  ](https://go.microsoft.com/fwlink/?LinkId=325338)

- Azure Information Protection app for Android [![Download](../media/download.png "Azure Information Protection app for Android")](https://go.microsoft.com/fwlink/?LinkId=325340)

For more information, see [What is the Azure Information Protection app for iOS or Android?](mobile-app-faq.md).

## Support for previous formats

The following PDF readers support both protected PDFs with a **.ppdf** extension, as well as older formats with a **.pdf** extension.

If you're unable to open your protected PDF using the recommended reader, the document may be protected in a previous format. For example, Microsoft SharePoint currently uses an older format for PDF documents in IRM-protected libraries.

- **Windows 10 / previous versions through Windows 7 Service Pack 1**

    - [Azure Information Protection viewer](https://go.microsoft.com/fwlink/?linkid=838993)
    - Gaaiho Doc
    - GigaTrust Desktop PDF Client for Adobe
    - Foxit Reader
    - Nitro PDF Reader
    - Nuance Power PDF
    - Edge Chromium

- **Android**:

    - [Azure Information Protection app](mobile-app-faq.md)
    - Foxit MobilePDF with RMS
    - GigaTrust App for Android

- **iOS**:

    - [Azure Information Protection app](mobile-app-faq.md)
    - Foxit MobilePDF with RMS
    - TITUS Docs

- **MacOS Catalina**: Edge Chromium

## Next steps

If you need more help after installing, use the instructions and documentation for each reader. For example, see the following articles:

- [User Guide: View protected files with the Azure Information Protection unified labeling client](clientv2-view-use-files.md)
- [What is the Azure Information Protection app for iOS or Android?](mobile-app-faq.md)