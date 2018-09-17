---
# required metadata

title: Protected PDF readers for Microsoft Information Protection
description:
keywords: 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 10/02/2018
ms.topic: article
ms.prod: azure
ms.service: information-protection
ms.assetid: xxxxx

# optional metadata

#audience:
#ms.devlang:
ms.reviewer: esaggese
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
    
    This protected PDF file format must be [enabled by an administrator](https://review.docs.microsoft.com/en-us/azure/information-protection/rms-client/client-admin-guide-customizations?branch=pr-en-us-2117#protect-pdf-files-by-using-the-iso-standard-for-pdf-encryption). When this configuration is made, the file name extension remains as .pdf and does not change to .ppdf.

For more information, see the following blog post: [blog post](https://aka.ms/AIPblog)

## Supported PDF readers

The following PDF readers can open protected PDF files that adhere to the ISO standard for PDF encryption:

|Operating system|Supported readers and download link|
|----------------|-----------------------------------|
|Windows 10 and previous versions<br />through Windows 7 Service Pack 1|Adobe Acrobat Reader (preferred): [Download](https://go.microsoft.com/fwlink/?linkid=838993) <br /><br /> Azure Information Protection viewer: [Download](https://go.microsoft.com/fwlink/?linkid=838993)<br /><br />Foxit Reader: [Download](https://go.microsoft.com/fwlink/?linkid=838993)|
|Android|Azure Information Protection app: [Download](https://go.microsoft.com/fwlink/?linkid=838993)|
|iOS|Azure Information Protection app: [Download](https://go.microsoft.com/fwlink/?linkid=838993)|

### Support for previous formats

The PDF readers in the next table support protected PDF documents that have a .ppdf file name extensionand older formats that have a .pdf file name extension.

Currently, SharePoint Online and SharePoint on-premises use an older format for PDF documents in IRM-protected libraries.


|Operating system|Supported readers|
|----------------|-----------------------------------|
|Windows 10 and previous versions<br />through Windows 7 Service Pack 1|Azure Information Protection viewer<br /><br />Gaaiho Doc<br /><br />GigaTrust Desktop PDF Client for Adobe<br /><br />Foxit Reader<br /><br />Nitro PDF Reader<br /><br />RMS sharing app|
|Android|Azure Information Protection app<br /><br />Foxit MobilePDF with RMS<br /><br />GigaTrust App for Android|
|iOS|Azure Information Protection app<br /><br />Foxit MobilePDF with RMS<br /><br />TITUS Docs|
