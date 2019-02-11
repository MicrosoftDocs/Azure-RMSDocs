---
title: Azure Information Protection Developer's Guide
description: Developers can use Azure Information Protection to protect and manage files of all types
author: bryanla
ms.author: bryanla
manager: barbkess
ms.date: 10/11/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: a53c2df2-a0a2-4f1f-995b-75ba55e4489b
ms.suite: ems
ms.reviewer: kartikk
---
# Azure Information Protection Developer's Guide

This guide will orient you to tools for extending and integrating with Azure Information Protection’s rights management service.

>The current Azure Information Protection SDK has the rights management component. A classification and labeling component are under development.

## Service Applications

Service applications provide capabilities to protect information when exporting from an enterprise content management system, a business application, or a cloud-based business solution. Data Loss Prevention (DLP) and Cloud Application Security (CAS) applications are examples of service applications. Our SDK for developing service applications is available through two programming models.

- [C++](https://www.microsoft.com/download/details.aspx?id=38397)
- [C# Managed API](https://github.com/Azure-Samples/Azure-Information-Protection-Samples/tree/master/IpcManagedAPI)

### Examples of service applications

- [IpcDlp](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a sample RMS-enabled DLP application that takes you through the basic steps that a DLP RMS-enabled application should perform by using the RMS File API for protecting and consuming restricted content.
- [IpcAzureApp](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a sample that demonstrates how to use RMS SDK in Azure applications to protect data in an Azure Blob Storage.
- [RmsFileWatcher](https://github.com/Azure-Samples/active-directory-dotnet-rms) is a sample that demonstrates how to build a Windows application that watches directories in the file system and applies RMS protection policies on every change, for example file added or file modified.
- [ProtectFilesInDir](https://github.com/Azure-Samples/Azure-Information-Protection-Samples/tree/master/ProtectFilesInDir) is a simple console application sample that takes a directory as input and protects all the files in that directory only, no recursion.

## PowerShell guides

Used by Azure Rights management administrators, PowerShell cmdlets are also useful for developing and testing your service applications. For more information, see [Using PowerShell with the Azure Information Protection client](/azure/information-protection/rms-client/client-admin-guide-powershell).

## User applications

User applications can be built with either the RMS SDK 2.1 or the RMS SDK 4.2.
The 4.2 version is REST client based with operating system specific APIs for several popular OSs; iOS/OSX, Android, Linux, Windows. The 2.1 version is used for building native Windows-based applications.

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
- [How to deploy your service app into a different tenant](how-to-deploy-app.md)
- [How to install and configure an RMS Server (service)](how-to-install-and-configure-an-rms-server.md)
- [How to use document tracking (user)](how-to-use-document-tracking.md)
- [How to renew a symmetric key in Azure Information Protection](how-to-renew-symmetric-key.md)

### Security and authentication

- [How to configure your app service application to use Azure Active Directory login](https://docs.microsoft.com/azure/app-service-mobile/app-service-mobile-how-to-configure-active-directory-authentication)
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

## Introduction and datasheets

[Introduction to Azure Information Protection](https://www.microsoft.com/cloud-platform/azure-information-protection)

## Other resources

- [Security best practice guide](security-guidelines.md)
- [Frequently Asked Questions for Azure Information Protection](/azure/information-protection/faqs)

### Support articles

- [Supported file formats](supported-file-formats.md)
- [Supported platforms](supported-platforms.md)
- [Understanding usage restrictions](understanding-usage-restrictions.md)

### Message protocol and file formats

- [Client-to-Server Protocol](https://msdn.microsoft.com/library/cc243191.aspx)
- [Rights-Managed Email Object Protocol](https://msdn.microsoft.com/library/cc463909(v=EXCHG.80).aspx)
- [Compound File Binary File Format](https://msdn.microsoft.com/library/dd942138.aspx)

#### Rights Managed email message

- [.MSG File Format (Part 1)](https://blogs.msdn.microsoft.com/openspecification/2009/11/06/msg-file-format-part-1/)
- [.MSG File Format (Part 2)](https://blogs.msdn.microsoft.com/openspecification/2010/06/20/msg-file-format-rights-managed-email-message-part-2/)

### API reference

- [Windows API Reference](https://msdn.microsoft.com/library/hh535292.aspx)
  - [Windows SDK Error Codes](https://msdn.microsoft.com/library/hh535248.aspx)
- [Windows Phone and Windows Store API reference](https://msdn.microsoft.com/library/dn891914.aspx)
- [iOS/OSX API reference](https://msdn.microsoft.com/library/dn758306.aspx)
- [Android API reference](https://msdn.microsoft.com/library/dn758245.aspx)
- [Linux API reference](https://azuread.github.io/rms-sdk-for-cpp/annotated.html)

### Previous versions

- [AD RMS SDK](https://msdn.microsoft.com/library/cc530379.aspx) is the first version of the RMS SDK.
- [AD RMS Scripting Tool](https://msdn.microsoft.com/library/bb968797.aspx) is an administrative tool for an AD RMS installation.

### See also

- [Developer terminology](terms.md)
- [Terminology for Azure Information Protection - ITPro](../terminology.md)

