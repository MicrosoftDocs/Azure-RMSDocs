---
# required metadata

title: Developer notes | Azure RMS
description: This topic covers specific guidance for several important development scenarios. 
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 5A9F04FD-0FCD-482F-8671-36FE93B783B0
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

﻿# Developer notes

This section covers specific guidance for several important development scenarios. The scenarios in this section are specific to this release of the Rights Management Services SDK 2.1 and may be altered in subsequent releases.

- [Add explicit owner rights](add-explicit-owner-rights.md) - Your application should explicitly add &quot;Owner&quot; rights when creating a license from scratch ([IpcCreateLicenseFromScratch](/rights-management/sdk/2.1/api/win/functions#msipc_ipccreatelicensefromscratch)).
- [Common error conditions and solutions](common-error-conditions-and-solutions.md) - The most common error messages that you might encounter when using the RMS SDK 2.1 developer tools.
- [Enabling email notification](how-to-enable-email-notification.md) - Email notification allows for a protected content owner to be notified when his or her content is accessed.
- [File API configuration](file-api-configuration.md) - The File API's behavior can be configured through settings in the registry.
- [IPCHelloWorld - an example application](how-to-build-your-first-application.md) - This topic contains instructions to create an example rights-enabled application.
- [Setting the API security mode](setting-the-api-security-mode-api-mode.md) - You can choose which security mode your File API application runs in by using the [IpcSetGlobalProperty](/rights-management/sdk/2.1/api/win/functions#msipc_ipcsetglobalproperty) function.
- [Supported file formats](supported-file-formats.md) - The File API supports native and Pfile formats.
- [Tracking content](tracking-content.md) - This topic covers basic guidance for implementing document tracking of content protected with RMS SDK 2.1.
- [Working with encryption](working-with-encryption.md) - This topic orients you to our encryption packages and shows some code snips for their use.

 

## Related topics ##
* [Overview](ad-rms-overview.md)
* [How-to use](how-to-use-msipc.md)
 

 
