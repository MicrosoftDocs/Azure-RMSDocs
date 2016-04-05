---
# required metadata

title: How this SDK is better | Azure RMS
description:
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: ee4989d6-3903-4ed2-ac62-d5692e2ef494

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

﻿
# How this SDK is better
This topic describes how Rights Management Services SDK 2.1 is a significant improvement over the original [Active Directory Rights Management Services SDK](https://msdn.microsoft.com/library/Cc530379) in terms of required developer effort to create a rights-enabled application.

**API surface** - The API surface has been reduced significantly through abstraction, freeing you from many of the details of back-end implementation. From an API surface of 84 functions for RMS SDK, the RMS SDK 2.1 includes only 20 API functions. Most applications will need to use only a small subset of this API surface.

**Ramp up time** - With the RMS SDK 2.1, you will be able to follow a step-by-step guide to identify which of your application's resources are sensitive and how to protect them. This is unlike the RMS SDK, with which you had to have detailed knowledge of certificates, formats, and topologies and write complex code for multithreading.

**Multi-topology support** - RMS SDK 2.1 helps you minimize code rewriting; your application should work with all topologies as we abstract the topology complexity away from the developer. With the RMS SDK, you had to understand all supported topologies, then write and test specific code for each.

**Future-proof** - RMS SDK 2.1 helps you minimize rewriting your rights-enablement code; your application should work in any RMS environment and automatically take advantage of new features when updated core RMS features are released. This is unlike AD RMS SDK, where you had to update your application to take advantage of any new features explicitly.

**Important Notice**  
All the topics in the original [Active Directory Rights Management Services SDK](https://msdn.microsoft.com/library/Cc530379) on MSDN Library now begin with the following support statement:

The AD RMS SDK leveraging functionality exposed by the client in Msdrm.dll is available for use in Windows Server 2008, Windows Vista, Windows Server 2008 R2, Windows 7, Windows Server 2012, and Windows 8. It may be altered or unavailable in subsequent versions. Instead, use [Active Directory Rights Management Services SDK 2.1](microsoft_information_protection_and_control_client_portal.md), which leverages functionality exposed by the client in *Msipc.dll*.

 

## Related topics ##
* [Overview](ad_rms_overview.md)
* [Active Directory Rights Management Services SDK](https://msdn.microsoft.com/library/Cc530379)
* [Rights Management Services SDK 2.1](microsoft_information_protection_and_control_client_portal.md)
 

 
