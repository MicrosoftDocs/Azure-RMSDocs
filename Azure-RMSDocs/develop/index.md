---
# required metadata

title: RMS Developer's Guide | Azure RMS
description: Three generations of the Rights Management SDK are now available.
keywords:
author: bryanla
manager: mbaldwin
ms.author: bryanla
ms.date: 12/11/2018
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 0510ead4-2fe7-4269-885b-fe16bcc69888
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# RMS Developer's Guide

## Overview ##
Three generations of the Rights Management SDK are now available: **Microsoft Rights Management SDK 4.2** for Android, iOS/OS X, Windows devices and Linux, **Microsoft Rights Management SDK 2.1** for Windows Desktop Client and the superseded **AD RMS SDK**.

## Software Development Kits ##
| SDK | Description |
|------|---------|
| [RMS SDK 4.2](active-directory-rights-management-services-multi-platform-thin-client-sdk-portal.md) | A simplified, next-generation tool set that provides a lightweight development experience for enabling your Android, iOS, Mac OS X, Windows Phone/RT and Linux/C++ device apps with information protection via Microsoft Rights Management services |
| [RMS SDK 2.1](microsoft-information-protection-and-control-client-portal.md) | A powerful SDK offering for Windows desktop application developers and server based solution providers to enable their products with rights management|
|[AD RMS SDK](/azure/information-protection/develop/) |** NOTE ** - AD RMS SDK leveraging functionality exposed by the client in Msdrm.dll is available for use in Windows Server 2012, Windows 8, Windows Server 2008 R2, Windows 7, Windows Server 2008, and Windows Vista. It may be altered or unavailable in subsequent versions. Instead, use Microsoft Rights Management Services SDK 2.1, which leverages functionality exposed by the client in Msipc.dll.|
|[AD RMS Scripting API](/azure/information-protection/develop/) | Used to create scripts to administer an AD RMS installation|

## Code Samples and Tools ##
This collection of Microsoft supplied RMS code samples and developer support tools spans all supported operating systems; Android, iOS/OS X, Windows Phone and Windows Desktop and is updated periodically to maintained compatibility with its supported SDK.

| Item | Operating System | Supporting SDK Version | Description |
|------|------------------|------------------------|-------------|
| [IpcManagedAPI](https://github.com/Azure-Samples/active-directory-dotnet-rms) | Windows Desktop | [RMS SDK 2.1](microsoft-information-protection-and-control-client-portal.md) and later versions of the 2.x SDK | **IpcManagedAPI** is a .NET (C#) representation of RMS SDK 2.1 to make it easy for your managed application to be RMS-enabled.|
| [IPCNotepad](https://code.msdn.microsoft.com/ipcnotepad-sample-f67dae80) | Windows Desktop | [RMS SDK 2.1](microsoft-information-protection-and-control-client-portal.md) and later versions of the 2.x SDK| **IPCNotepad** is a sample RMS-enabled application that takes you through the basic steps that each RMS-enabled application should perform when protecting and consuming restricted content.|
| [IpcDlp](https://github.com/Azure-Samples/active-directory-dotnet-rms)|Windows Desktop|[RMS SDK 2.1](microsoft-information-protection-and-control-client-portal.md) and later versions of the 2.x SDK|**IpcDlp** is a sample RMS-enabled Data Leak Protection (DLP) application that takes you through the basic steps that a DLP RMS-enabled application should perform by using File API for protecting and consuming restricted content.|
| [IpcAzureApp](https://github.com/Azure-Samples/active-directory-dotnet-rms) | Windows Desktop|[RMS SDK 2.1](microsoft-information-protection-and-control-client-portal.md) and later versions of the 2.x SDK|**IpcAzureApp** is a sample that demonstrates how to use RMS SDK in Azure application to protect data in Azure Blob Storage.|
| [RmsDocumentInspector](https://github.com/Azure-Samples/active-directory-dotnet-rms) | Windows Desktop|[RMS SDK 2.1](microsoft-information-protection-and-control-client-portal.md) and later versions of the 2.x SDK|**RmsDocumentInspector** is a tool can give information about any RMS protected file such as content-id or user rights.|
| [RmsFileWatcher](https://github.com/Azure-Samples/active-directory-dotnet-rms) | Windows Desktop|[RMS SDK 2.1](microsoft-information-protection-and-control-client-portal.md) and later versions of the 2.x SDK|**RmsFileWatcher** is a sample that demonstrates how to build a Windows application that watches directories in the file system and applies RMS protection policies on every change, for example file added or file modified.|
| [iOS/OS X usage scenarios](https://msdn.microsoft.com/library/dn758307(v=vs.85).aspx) |iOS / OS X|[RMS SDK 4.2](active-directory-rights-management-services-multi-platform-thin-client-sdk-portal.md) and later versions of the 4.x SDK|**Objective C**  code examples representing important development scenarios to get you accustomed to the RMS SDK. Examples include use of Microsoft Protected File format, custom protected file formats, and custom UI controls.|
| [UI Library and Sample app](https://github.com/AzureAD/rms-sdk-ui-for-ios) |iOS|[RMS SDK 4.2](active-directory-rights-management-services-multi-platform-thin-client-sdk-portal.md) and later versions of the 4.x SDK|**UI libraries and sample app for iOS** at GitHub, so you can get started quickly and re-use our standard UI in your apps.|
| [UI Library and Sample app](https://github.com/AzureAD/rms-sdk-ui-for-android) |Android|[RMS SDK 4.2](active-directory-rights-management-services-multi-platform-thin-client-sdk-portal.md) and later versions of the 4.x SDK|**UI libraries and sample app for Android** at GitHub, so you can get started quickly and re-use our standard UI in your apps.|
| [Android usage scenarios](https://msdn.microsoft.com/en-us/library/dn758246(v=vs.85).aspx) |Android|[RMS SDK 4.2](active-directory-rights-management-services-multi-platform-thin-client-sdk-portal.md) and later versions of the 4.x SDK|**Java code examples** representing important development scenarios to get you accustomed to the RMS SDK. Examples include use of Microsoft Protected File format, custom protected file formats, and custom UI controls.|