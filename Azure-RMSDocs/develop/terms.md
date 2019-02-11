---
# required metadata

title: AIP Developer Terminology | Microsoft Docs
description: A collection of developer terminology definitions specific to Rights Management Services.
keywords:
author: bryanla
ms.author: bryanla
manager: barbkess
ms.date: 01/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: adb1f868-0da7-431b-83d1-86f41c2da4ae
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Terms

A collection of developer terminology definitions specific to Azure Information Protection.

**Deprecated Algorithm**  
A modal setting that implements an older content protection scheme, specifically referring to electronic codebook cipher mode (ECB). In this SDK, the setting allows you to generate licenses compatible with the MSDRM library used by the [AD Rights Management Services SDK](https://msdn.microsoft.com/library/windows/desktop/cc530379.aspx).

This setting may cause your application to protect content in a way that does not conform to your customers' standards for content protection.

This setting will prevent your application from benefitting from any cryptographic enhancements added to Microsoft Rights Management SDK 3.0 or later.

**Microsoft Protected File Format**

Also referred to as PFile format, it is the default file format for AD RMS and functions as a standard across RMS-enabled applications.

PFile format is transparent to the application developer as it is embedded in the way Microsoft Rights Management SDK 4.2 is designed.

