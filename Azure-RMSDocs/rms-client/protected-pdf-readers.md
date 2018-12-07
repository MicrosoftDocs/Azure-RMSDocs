---
# required metadata

title: Protected PDF readers for Microsoft Information Protection
description: Learn about PDF documents that are labeled for classification and protection, and how to view them.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/12/2018
ms.topic: article
ms.prod: azure
ms.service: information-protection
ms.assetid: aab59e02-930b-4a17-8442-2d5d081fe1a6

# optional metadata

#audience:
#ms.devlang:
ms.reviewer: kartikka
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Supported PDF readers for Microsoft Information Protection

Use the following information to learn more about PDF documents that are labeled for classification and protection, and how to view these documents.

A collaboration between Microsoft and Adobe brings you a more simplified and consistent experience for PDF documents that have been classified and optionally, protected. This collaboration provides support for Adobe Acrobat native integration with Microsoft Information Protection solutions, such as [Azure Information Protection](../what-is-information-protection.md). 

This native integration has the following benefits:

- You can view PDF documents that have been protected because they contain sensitive information.

- You can see the classification value for your organization's label that has been applied to the document.

- Support for the ISO standard for PDF encryption.
    
    Unless this capability has been [disabled by an administrator](client-admin-guide-customizations.md#dont-protect-pdf-files-by-using-the-iso-standard-for-pdf-encryption), this protected PDF file format is now enabled by default on the latest version of the Azure Information Protection client.

For more information, see the following blog post: [Starting October, use Adobe Acrobat Reader for PDFs protected by Microsoft Information Protection](https://techcommunity.microsoft.com/t5/Azure-Information-Protection/Starting-October-use-Adobe-Acrobat-Reader-for-PDFs-protected-by/ba-p/262738)

## Supported PDF readers

The following PDF readers can open protected PDF files that adhere to the ISO standard for PDF encryption:

|Operating system|Supported readers and download link|
|----------------|-----------------------------------|
|Windows 10 and previous versions<br />through Windows 7 Service Pack 1|Adobe Acrobat Reader (preferred):<br />-  1. Read the [Adobe General Terms of Use](https://www.adobe.com/legal/terms.html) <br />- 2. Install the Adobe Reader from the [Adobe site](adobe.com )<br />- 3. Install the [Adobe plug-in](https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/misc/MIP_Preview/1900820120/Adobe_MIP_Preview_1900820120.zip)<br />- 4. If prompted, ask your admin to [authorize the plug-in](blog.com) <br /><br /> Azure Information Protection viewer: [Download](https://go.microsoft.com/fwlink/?linkid=838993)<br /><br />Foxit Reader: [Download](https://www.foxitsoftware.com/pdf-reader/)|
|Android|Azure Information Protection app: [Download](https://go.microsoft.com/fwlink/?LinkId=325340)|
|iOS|Azure Information Protection app: [Download](https://go.microsoft.com/fwlink/?LinkId=325338)|

### Support for previous formats

The PDF readers in the next table support protected PDF documents that have a .ppdf file name extension and older formats that have a .pdf file name extension.

Currently, SharePoint Online and SharePoint on-premises use an older format for PDF documents in IRM-protected libraries.


|Operating system|Supported readers|
|----------------|-----------------------------------|
|Windows 10 and previous versions<br />through Windows 7 Service Pack 1|Azure Information Protection viewer<br /><br />Gaaiho Doc<br /><br />GigaTrust Desktop PDF Client for Adobe<br /><br />Foxit Reader<br /><br />Nitro PDF Reader<br /><br />RMS sharing app|
|Android|Azure Information Protection app<br /><br />Foxit MobilePDF with RMS<br /><br />GigaTrust App for Android|
|iOS|Azure Information Protection app<br /><br />Foxit MobilePDF with RMS<br /><br />TITUS Docs|
