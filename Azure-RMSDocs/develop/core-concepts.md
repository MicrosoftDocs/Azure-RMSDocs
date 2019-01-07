---
# required metadata

title: Azure Information Protection SDK 4.2 developer guidance | Microsoft Docs
description: A collection of how-to topics for developing the AIP SDK 4.2
keywords:
author: bryanla
ms.author: bryanla
manager: mbaldwin
ms.date: 01/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: ae67523a-c094-44da-86b8-739bedba7111
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Developer guidance
The focus of Microsoft Rights Management SDK 4.2 is to help you build AD RMS-enabled applications that leverage Active Directory Right Management Services (AD RMS), as simply as possible.

The following topics are intended to support your design process for developing RMS-enabled applications.

- [How to register and RMS enable your app with Azure AD](authentication-integration.md) - Describes the basics of user authentication for your RMS-enabled app.
- [How to enable error and performance logging](enabling-logging.md) - RMS SDK 4.2 manages diagnosis and performance logs upload through a single device property.
- [How to use built-in rights](built-in-rights-usage-restriction-reference.md) - Outlines the built-in rights that the RMS SDK 4.2 provides and usage restrictions that an app should enforce in honoring those restrictions.
- [How to use document tracking](how-to-use-document-tracking.md) - Using the document tracking feature requires some simple understandings about managing the associated metadata and registration with the service.
