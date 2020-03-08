---
# required metadata

title: RMS SDK 4.2 Deprecation notice
description: RMS SDK 4.2 Deprecation notice
keywords:
author: msmbaldwin
ms.author: mbaldwin
ms.date: 03/08/2020
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

# RMS SDK 4.2 Deprecation Notice 

*Applicable to all RMS SDK 4.2 versions release before March 2020*

On March 3rd, 2020, an update to the RMS SDK 4.2 for Android, iOS, and OSX was released via Microsoft Download Center. This update is mandatory for all applications that use these RMS SDK platforms today.  

On Tuesday, September 15th, 2020 versions of the RMS SDK released prior to March of 2020 will fail to connect to the Azure Rights Management Service endpoint. Applications consuming RMS SDK 4.2 must update prior to this date. 

## Reason for Change 

Previous versions of the RMS SDK use certificate pinning to ensure that the RMS-enabled client is communicating with the RMS service, receiving a certificate chained to a specific, expected root CA.  

Modern browsers use certificate transparency logs to verify that certificates have been issued to legitimate domain owners and that those certificates are issued by trusted root certification authorities.  

To better support modern browsers, on September 15th, 2020, the Microsoft will update the certificate for https://api.aadrm.com to a new certificate issued by a globally trusted root CA that reports issued certificates to certificate transparency logs trusted by modern browsers. Once this change is complete, legacy versions of RMS SDK attempting to perform certificate pinning to the expected root certificate will fail to find that certificate and will fail to connect.  

## Client Impact 

The following Microsoft applications use the RMS SDKs today. Updates will be made available for these platforms and devices should be updated prior to the September deadline. 

- Office 2019 for Mac 
- Office 2016 for Mac 
- Word, Excel, and PowerPoint for iOS 
- Word, Excel, and PowerPoint for Android 

Resources 

- Android: https://www.microsoft.com/en-us/download/details.aspx?id=43673
- iOS: https://www.microsoft.com/en-us/download/details.aspx?id=43674 
- MacOS: https://www.microsoft.com/en-us/download/details.aspx?id=43675 
- Linux: https://azuread.github.io/rms-sdk-for-cpp/annotated.html