---
# required metadata

title: Developer's Guide - AIP
description: Developers can use Azure Information Protection to protect and manage files of all types
author: lleonard-msft
ms.author: alleonar
manager: mbaldwin
ms.date: 03/13/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: a53c2df2-a0a2-4f1f-995b-75ba55e4489b
ms.suite: ems
ms.reviewer: kartikk
---
# Azure Information Protection Developer's Guide

This guide will orient you to tools for extending and integrating with Azure Information Protection’s rights management service. The intent of this guide is allow developers who want to leverage the rights management system to build different types of applications for a range of supported platforms.

>The current Azure Information Protection SDK has the rights management component and the classification and labelling are under development.

## Service Applications

Service applications provide capabilities to protect information when exporting from an enterprise content management system, a business application, or a cloud based business solution. Data Loss Prevention (DLP) and Cloud Application Security (CAS) applications are examples of service applications. Our SDK for developing service applications is available through two programming models.

- [C++](https://www.microsoft.com/en-us/download/details.aspx?id=38397)
- [C# Managed API](https://github.com/Azure-Samples/Azure-Information-Protection-Samples/tree/master/IpcManagedAPI)

### Examples of service applications

- [IpcDlp](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a sample RMS-enabled DLP application that takes you through the basic steps that a DLP RMS-enabled application should perform by using the RMS File API for protecting and consuming restricted content.
- [IpcAzureApp](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a sample that demonstrates how to use RMS SDK in Azure applications to protect data in an Azure Blob Storage.
- [RmsFileWatcher](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a sample that demonstrates how to build a Windows application that watches directories in the file system and applies RMS protection policies on every change, for example file added or file modified.
- [ProtectFilesInDir](https://github.com/Azure-Samples/Azure-Information-Protection-Samples/tree/master/ProtectFilesInDir) is a simple console application sample that takes a directory as input and protects all the files in that directory only, no recursion.

## PowerShell guides

These scripts, generally used by Azure Rights management administrators, are useful for developing and testing your service applications.

- [Azure Rights Management Cmdlets](https://msdn.microsoft.com/library/azure/dn629398.aspx) let you administer Azure RMS from the command line. Although this enables automation, it also supports reliable and repeated processes to help reduce administrative overheads. In addition, some Azure RMS advanced configurations and operations require Azure PowerShell.
- [RMS Protection Cmdlets](https://msdn.microsoft.com/library/azure/mt433195.aspx) can be used with Azure Rights Management (Azure RMS) data protection from Azure Information Protection, or with Active Directory Rights Management Services (AD RMS) and supplement other PowerShell modules for these Rights Management deployments. Use these RMS Protection cmdlets to bulk protect and unprotect files for any file type

## User applications

User applications can be built with either the RMS SDK 2.1 or the RMS SDK 4.2.
The 4.2 version is REST client based with operating system specific APIs for several popular OSs; iOS/OSX, Android, Linux, Windows. The 2.1 version is used for building native Windows based applications.

### User application development guides

- [Developing your application](developing-your-application.md)
- [Testing your application](how-to-set-up-your-test-environment.md)
- [Deploying your application](deploying-your-application.md)

### User application samples

- [AzureIP Test](https://github.com/Azure-Samples/Azure-Information-Protection-Samples/tree/master/AzureIP_Test) is a sample console application that allows you to encrypt documents with an Azure template or an ad-hoc policy.
- [IPCNotepad](https://github.com/Azure-Samples/Azure-Information-Protection-Samples/tree/master/AzureIP_Test) is a sample RMS-enabled application that takes you through the basic steps each RMS-enabled application should perform when protecting and consuming restricted content.
- [RmsDocumentInspector](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a tool can give information about any RMS protected file such as content-id or user rights.

## Development environment setup

The following guides lead you through OS specific setup steps for an application development environment using common tools.

[![iOS/OSX setup](../media/develop/ios-icon.png)](ios-sdk.md)
[![Android setup](../media/develop/android-icon.png)](android-sdk.md)
[![Windows Phone setup](../media/develop/windows-phone-icon.png)](windows-phone-apps.md)
[![Windows Service setup](../media/develop/windows-icon.png)](install-the-rms-sdk.md)
[![Linux setup](../media/develop/linux-icon.png)](linux-setup.md)


## How-tos

Each of the following topics presents specific guidance for an aspect of implementing your application. Service applications are built using the RMS SDK 2.x. User applications are built using RMS SDK 4.x. The article link is attributed with the application type; service, user.

### General

- [How to enable document tracking and revocation (service)](tracking-content.md)
- [How to deploy your client](../rms-client/client-deployment-notes.md)
- [How to deploy your service app into a different tenant] (how-to-deploy-app.md)
- [How to install and configure an RMS Server (service)](how-to-install-and-configure-an-rms-server.md)
- [How to use document tracking (user)](how-to-use-document-tracking.md)
- [How to renew a symmetric key in Azure Information Protection](how-to-renew-symmetric-key.md)

### Security and authentication

- [How to configure your app service application to use Azure Active Directory login](https://docs.microsoft.com/en-us/azure/app-service-mobile/app-service-mobile-how-to-configure-active-directory-authentication)
- [How to use Azure Active Directory Authentication (ADAL) authentication](how-to-use-adal-authentication.md)
- [Configuring Azure RMS for authentication (service)](adal-auth.md)
- [How to set the API security mode (service)](setting-the-api-security-mode-api-mode.md)
- [Enable your applications to use Azure RMS (service)](how-to-use-file-api-with-aadrm-cloud.md)
- [How to register and RMS enable your app with Azure AD (user)](authentication-integration.md)

### Configuration and performance management

- [How to add explicit owner rights (service)](add-explicit-owner-rights.md)
- [File API configuration (service)](file-api-configuration.md)
- [How to use built in rights (user)](built-in-rights-usage-restriction-reference.md)
- [How to enable error and performance logging (user)](enabling-logging.md)

## Videos

Microsoft's Dan Plastina provides this [Introduction to Azure Information Protection](https://www.microsoft.com/cloud-platform/azure-information-protection)

These videos are from the Micorsoft 2016 Ignite conference

- [Email security inside your org](https://myignite.microsoft.com/videos/2787)
- [Adopt a comprehensive identity-driven solution for protecting and sharing data securely](https://myignite.microsoft.com/videos/2784)
- [Learn how classification, labeling and protection delivers persistent data protection](https://myignite.microsoft.com/videos/2786)

## Other resources

- [Security best practice guide](security-guidelines.md)
- [RMS Developer's Corner (blog)](https://blogs.msdn.microsoft.com/rms/)
- [Frequently Asked Questions for Azure Information Protection](https://docs.microsoft.com/en-us/information-protection/get-started/faqs)

### Support articles

- [Supported file formats](supported-file-formats.md)
- [Supported platforms](supported-platforms.md)
- [Understanding usage restrictions](understanding-usage-restrictions.md)

### API reference

- [Windows API Reference](https://msdn.microsoft.com/en-us/library/hh535292.aspx)
  - [Windows SDK Error Codes](https://msdn.microsoft.com/library/hh535248.aspx)
- [Windows Phone and Windows Store API reference](https://msdn.microsoft.com/library/dn891914.aspx)
- [iOS/OSX API reference](https://msdn.microsoft.com/en-us/library/dn758306.aspx)
- [Android API reference](https://msdn.microsoft.com/en-us/library/dn758245.aspx)
- [Linux API reference](http://azuread.github.io/rms-sdk-for-cpp/annotated.html)

### Previous versions

- [AD RMS SDK](https://msdn.microsoft.com/en-us/library/cc530379.aspx) is the first version of the RMS SDK.
- [AD RMS Scripting Tool](https://msdn.microsoft.com/en-us/library/bb968797.aspx) is an administrative tool for an AD RMS installation.

### See also

- [Developer terminlogy](terms.md)
- [Terminology for Azure Information Protection - ITPro](../get-started/terminology.md)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]