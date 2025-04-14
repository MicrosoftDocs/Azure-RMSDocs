---
# required metadata

title: RMS SDK 4.2 Deprecation notice
description: RMS SDK 4.2 Deprecation notice
keywords:
author: msmbaldwin
ms.author: mbaldwin
ms.date: 04/14/2025
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: dev

---

# RMS SDK 4.2 and RMS SDK 2.1 deprecation notice

## RMS SDK 4.2
*Applicable to all RMS SDK 4.2 versions*

Applications that use RMS SDK 4.2 to interact with the Azure Rights Management Service, Active Directory Rights Management Service, or Microsoft Purview Information Protection protection-enabled labels must migrate to the Microsoft Information Protection SDK. 

Microsoft support and development for RMS SDK 4.2, including security fixes, ends on November 28th, 2024.

There are no RMS SDK 4.2 feature releases or new platform version releases planned prior to the deprecation date.

## RMS SDK 2.1
*Applicable to all RMS SDK 2.1 versions*

Applications that use RMS SDK 2.1 to interact with the Azure Rights Management Service or Microsoft Purview Information Protection protection-enabled labels must migrate to the Microsoft Information Protection SDK.

Microsoft support and development for RMS SDK 2.1, including security fixes, ends on November 28th, 2024.

There are no RMS SDK 2.1 feature releases or new platform version releases planned prior to the deprecation date.

### AD RMS Guidance and Requirements

Migration from RMS SDK 2.1 (MSIPC) to MIP SDK requires customers using Active Directory Rights Management Service (AD RMS) to deploy Mobile Device Extensions (MDE) for AD RMS. With this feature, MIP SDK is able to communicate with AD RMS.

Configuration of MDE is non-trivial, requiring deployment of Active Directory Federation Services (ADFS), DNS record registration both in internal and external DNS zones, and possibly proxy configurations if the endpoint is to be exposed to the public internet.

Further, there's uncertainty with AD RMS + MDE with MIP SDK around specific scenarios, including:

- Offline protection
- Federated scenarios
- FIPS support for encryption endpoints
- User cert bootstrapping
- Pre-licensing
- Complex trust configurations

For AD RMS customers, MSIPC continues to be supported for the above scenarios.

