---
# required metadata

title: Azure Information Protection Developer's Guide | Azure Information Protection
description: Developers can use RMS to protect and manage files of all types
author: BrucePerlerMS
ms.author: bruceper
manager: mbaldwin
ms.date: 11/22/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: a53c2df2-a0a2-4f1f-995b-75ba55e4489b
ms.suite: ems
ms.reviewer: kartikk

# optional metadata
#ROBOTS:
#audience:
#ms.devlang:
#ms.tgt_pltfrm: "na"

---

# Azure Information Protection Developer's Guide

Using Rights Management Services (RMS), the development aspect of Azure Information Protection, you will be able to rights-enable new and existing applications of different types for a range of supported platforms.

- [Service applications](#service-applications)
- [User applications](#user-applications)
- [PowerShell guides](#powershell-guides)
- [Development setup guides](#development-environment-setup-guides)
- [How-to guides](#how-tos)
- [Videos](#videos)
- [Other resources](#other-resources)

## Service Applications
Service applications leverage the Azure RMS protection capabilities to create data protection solutions. Examples of service applications are Data Leakage Protection applications (DLP) or Cloud Application Security applications. The RMS SDK 2.1, a native C++ library, provides a breadth of capacity for developing these types of applications. [Get started with RMS SDK 2.1](getting-started-with-ad-rms-2-0.md) building your own service applications. We also provide a [Managed API](https://github.com/Azure-Samples/active-directory-dotnet-rms) which is a C# wrapper for this SDK.

### Examples of service applications
- [IpcDlp](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a sample RMS-enabled Data Leak Protection (DLP) application that takes you through the basic steps that a DLP RMS-enabled application should perform by using File API for protecting and consuming restricted content.
- [IpcAzureApp](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a sample that demonstrates how to use RMS SDK in Azure application to protect data in Azure Blob Storage.
- [RmsFileWatcher](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a sample that demonstrates how to build a Windows application that watches directories in the file system and applies RMS protection policies on every change, for example file added or file modified.

## PowerShell guides
These scripts, generally used by Azure Rights management administrators, are useful for developing and testing your service applications.
- [Azure Rights Management Cmdlets](https://msdn.microsoft.com/library/azure/dn629398.aspx) let you administer Azure RMS from the command line. Although this enables automation, it also supports reliable and repeated processes to help reduce administrative overheads. In addition, some Azure RMS advanced configurations and operations require Azure PowerShell.+
- [RMS Protection Cmdlets](https://msdn.microsoft.com/library/azure/mt433195.aspx) can be used with Azure Rights Management (Azure RMS) data protection from Azure Information Protection, or with Active Directory Rights Management Services (AD RMS) and supplement other PowerShell modules for these Rights Management deployments. Use these RMS Protection cmdlets to bulk protect and unprotect files for any file type


## User Applications
User Applications are built using both the RMS SDK 2.1 and RMS SDK 4.2.
The 4.2 version is a REST based client. The 2.1 version is used for building native Windows based applications.


- [IPCNotepad](https://github.com/Azure-Samples/Azure-Information-Protection-Samples/tree/master/AzureIP_Test) is a sample RMS-enabled application that takes you through the basic steps each RMS-enabled application should perform when protecting and consuming restricted content.
- [RmsDocumentInspector](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a tool can give information about any RMS protected file such as content-id or user rights.

## Development environment
The following guides lead you through OS specific setup steps for an application development environment using common tools.
- [iOS setup](ios-sdk.md)
- [Android setup](android-sdk.md)
- [Windows Phone setup](windows-phone-apps.md)
- [Linux setup](linux-setup.md)

## How-tos
Each of the following topics presents specific guidance for an aspect of implementing your application. Service applications are built using the RMS SDK 2.x. User applications are built using RMS SDK 4.x.

### Service Application
- [Configure Azure RMS for ADAL authentication](adal-auth.md)
- [Enable your service applications to use Azure RMS](how-to-use-file-api-with-aadrm-cloud.md)
- [File API Configuration](file-api-configuration.md)
- [How to set the API security mode](setting-the-api-security-mode-api-mode.md)
- [How to add explicit owner rights](add-explicit-owner-rights.md)
- [How to enable document tracking and revocation](tracking-content.md)
- [How to use ADAL authentication](how-to-use-adal-authentication.md)
- [How to install and configure an RMS Server](how-to-install-and-configure-an-rms-server.md)
- [How to debug a rights enabled application](debugging-applications-that-use-ad-rms.md)

### User Application
- [Configure Azure RMS for ADAL authentication](adal-auth.md)
- [How to enable error and performance logging](enabling-logging.md)
- [How to register and RMS enable your app with Azure AD](authentication-integration.md)
- [How to use built in rights](built-in-rights-usage-restriction-reference.md)
- [How to use document tracking](how-to-use-document-tracking.md)



## Videos
Microsoft's Dan Plastina provides this [Introduction to Azure Information Protection](https://www.microsoft.com/en-us/cloud-platform/azure-information-protection)

These videos are from this year's Ignite conference

- [Email security inside your org](https://myignite.microsoft.com/videos/2787)
- [Adopt a comprehensive identity-driven solution for protecting and sharing data securely](https://myignite.microsoft.com/videos/2784)
- [Learn how classification, labeling and protection delivers persistent data protection](https://myignite.microsoft.com/videos/2786)


## Other resources
- [Security best practice guide](security-guidelines.md)
- [RMS Developer's Corner (blog)](https://blogs.msdn.microsoft.com/rms/)
- [RMS Frequently Asked Questions](http://social.technet.microsoft.com/wiki/contents/articles/3440.ad-rms-frequently-asked-questions-faq.aspx)

### Support articles
- [File API Configuration](file-api-configuration.md)
- [Supported file formats](supported-file-formats.md)
- [Supported platforms](supported-platforms.md)
- [Understanding usage restrictions](understanding-usage-restrictions.md)

### API reference
- [Windows API Reference](https://msdn.microsoft.com/en-us/library/hh535292.aspx)
  - [Windows SDK Error Codes](https://msdn.microsoft.com/library/hh535248.aspx)
- [iOS/OSX API reference](https://msdn.microsoft.com/en-us/library/dn758306.aspx)
- [Android API reference](https://msdn.microsoft.com/en-us/library/dn758245.aspx)
- [Linux API reference](http://azuread.github.io/rms-sdk-for-cpp/annotated.html)
- [Windows Phone and Windows Store API reference](https://msdn.microsoft.com/library/dn891914.aspx)

### Previous versions
- [AD RMS SDK](https://msdn.microsoft.com/en-us/library/cc530379.aspx) is the first version of the RMS SDK.
- [AD RMS Scripting Tool](https://msdn.microsoft.com/en-us/library/bb968797.aspx) is an administrative tool for an AD RMS installation.
