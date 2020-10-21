---
# required metadata

title: Application types | Azure RMS
description: This topic covers types of applications that you might choose to create as rights-enabled.
keywords:
author: msmbaldwin
ms.author: mbaldwin
manager: barbkess
ms.date: 02/23/2017
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 97169FC3-1395-4433-A632-7B0F020FABFE
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: dev

---

# Application types


This topic covers types of applications that you might choose to create as rights-enabled.

The following application types are currently supported by Rights Management Services SDK 2.1

## Simple applications

A simple application could be a command line tool built to encrypt a provided file. For an example of a simple, rights-enabled application see our implementation of *IPCHelloWorld*, described in [Developing your application](developing-your-application.md).

### Server mode applications

*Server mode* is meant for non-interactive applications that consume, protect or process RMS-protected content. An example would be a *Data Loss Prevention* application that runs as a service on a file server and automatically protects sensitive documents. See the [IpcDlp sample](https://github.com/Azure-Samples/Azure-Information-Protection-Samples/tree/master/IpcDlpApp) for an example of this application type.

If your application uses the *server mode*, it should authenticate to the RMS server silently. Unlike the *client mode*, the RMS SDK 2.1 will not open a credential prompt when it fails to authenticate silently. Also, when running in *server mode*, no application manifest is needed.

For more information on setting the API security mode see, [Setting the API security mode](setting-the-api-security-mode-api-mode.md).

### Rich client applications

A rich client application allows users to view and manipulate data through a graphical user interface (GUI). Often, the data presented in this GUI is high-value and sensitive to theft or accidental exposure. Information protection support typically enhances existing scenarios but, is not the primary motivation for developing the application.

Using RMS SDK 2.1 with rich client applications helps you:

-   Ensure that this data is always encrypted.

-   Prevent users from extracting data to an unprotected format (for example, prevent using the clipboard to copy and paste).

Microsoft Notepad is a simple rich client application. Microsoft Office is a more complex rich client application.

For more information on protecting your application, see [Understanding usage restrictions](understanding-usage-restrictions.md).

## Related topics

- [IpcDlp sample](https://Code.MSDN.Microsoft.Com/IpcDlp-Sample-Application-d30bb99d)
- [Developing your application](developing-your-application.md)
- [Setting the API security mode](setting-the-api-security-mode-api-mode.md)
- [Understanding usage restrictions](understanding-usage-restrictions.md)
