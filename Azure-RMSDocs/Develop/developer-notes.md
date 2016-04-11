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
ms.assetid: 65c2f3d1-0852-41fa-a95a-53dcec787680

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

- [Add explicit owner rights](add_explicit_owner_rights.md) - Your application should explicitly add &quot;Owner&quot; rights when creating a license from scratch ([IpcCreateLicenseFromScratch](xref:msipc.ipccreatelicensefromscratch)).
- [Common error conditions and solutions](common_error_conditions_and_solutions.md) - The most common error messages that you might encounter when using the RMS SDK 2.1 developer tools.
- [Enabling email notification](how-to__enable_email_notification.md) - Email notification allows for a protected content owner to be notified when his or her content is accessed.
- [File API configuration](file_api_configuration.md) - The File API's behavior can be configured through settings in the registry.
- [IPCHelloWorld - an example application](how_to_build_your_first_application.md) - This topic contains instructions to create an example rights-enabled application.
- [Setting the API security mode](setting_the_api_security_mode__api_mode_.md) - You can choose which security mode your File API application runs in by using the [IpcSetGlobalProperty](xref:msipc.ipcsetglobalproperty) function.
- [Supported file formats](supported_file_formats.md) - The File API supports native and Pfile formats.
- [Tracking content](tracking_content.md) - This topic covers basic guidance for implementing document tracking of content protected with RMS SDK 2.1.
- [Working with encryption](working_with_encryption.md) - This topic orients you to our encryption packages and shows some code snips for their use.

 

## Related topics ##
* [Overview](ad_rms_overview.md)
* [How-to use](how_to_use_msipc.md)
 

 
