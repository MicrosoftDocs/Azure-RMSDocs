---
# required metadata

title: Protected PDF readers for Windows
description: Install a reader on Windows for PDF documents that are labeled for classification and protection
author: mlottner
ms.author: mlottner
manager: rkarlin
ms.date: 07/17/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#audience:
#ms.devlang:
ms.reviewer: kartikka
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: user

---

# Install a PDF reader for Windows

[![Windows icon](../media/develop/windows-icon.png)](https://go.microsoft.com/fwlink/?linkid=2050049)

If you need to open a protected PDF document on your Windows computer, use the new [Microsoft Edge](https://www.microsoft.com/edge?form=MY01BL&OCID=MY01BL) browser, or install the Adobe plug-in for the Adobe Acrobat Reader.

## Use Microsoft Edge to view protected files

**Supported versions**: Windows 10 and previous versions through Windows 7

Instructions:

1. Check which [Microsoft Edge version](https://support.microsoft.com/help/4027011/microsoft-edge-find-out-which-version-you-have) is installed on your system. 
1. If the Microsoft Edge version is 83.0.478.37 or above, you can open protected files directly in the Edge browser. 
1. To open PDF files in SharePoint, click **Open** > **Open in browser**. 
:::image type="content" source="../media/edge_open_browser.png" alt-text="Open a protected PDF in SharePoint by selecting the Open in browser option":::


## Use Adobe Acrobat Reader to view protected files

**Supported versions**: Windows 10 and previous versions through Windows 8

Instructions: 

1. Read the [Adobe General Terms of Use](https://www.adobe.com/legal/terms.html).

2. If you haven't already, install the Adobe Reader for Windows from the [Adobe site](https://www.adobe.com/).

3. Install the [Adobe plug-in](https://go.microsoft.com/fwlink/?linkid=2050049) for Windows.

4. If prompted for admin approval, ask your admin to authorize the plug-in.
    
    The admin instructions for this step are included in the release announcement: [General Availability of Adobe Acrobat Reader Integration with Microsoft Information Protection](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/General-Availability-of-Adobe-Acrobat-Reader-integration-with/ba-p/298396).

Alternative readers that open protected PDF documents that adhere to the ISO standard for PDF encryption:

- Azure Information Protection viewer: [Download](https://go.microsoft.com/fwlink/?linkid=838993)

- Foxit Reader: [Download](https://www.foxitsoftware.com/pdf-reader/)


If the document doesn't open, it might be because it has been protected with an older format. In this case, try one of the readers listed as [supported for previous formats](protected-pdf-readers.md#support-for-previous-formats).

## Next steps

For more information about readers for protected documents, and links to download readers for other platforms, see [PDF readers that supports Microsoft Information Protection](protected-pdf-readers.md).

