---
# required metadata

title: Overview - RMS SDK 2.1 | Azure RMS
description: Rights Management Services (RMS) is an information protection technology that helps safeguard digital information from unauthorized use.
keywords:
author: msmbaldwin
ms.author: mbaldwin
manager: barbkess
ms.date: 02/23/2017
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: B546B6C1-ADC1-4EBD-95E2-B4A74E4E980B
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Overview

Rights Management Services SDK 2.1 is an information protection technology that helps safeguard digital information from unauthorized use. Through your rights-enabled application, content owners will be able to define who can open, modify, print, forward, or take other actions with the content.

AD RMS consists of both [server](ad-rms-server.md) and [client](ad-rms-client.md) components. The server, running on Azure or Windows Server, consists of multiple web services.

The [client](ad-rms-client.md) component can be run on either a client or server operating system and contains functions that enable an application to encrypt and decrypt content, retrieve templates and revocation lists, acquire licenses and certificates from a server, and other related rights management tasks.

For more information, see [Application types](application-types.md).

The following are just a few of the scenarios to which applications built on the Rights Management Services SDK 2.1 can be applied.

-   A law firm wants to prevent sensitive email messages from being printed or forwarded.
-   The developers of computer-aided design and manufacturing software want to limit drawing access to a small group of users within the research division without requiring the use of passwords.
-   The owners of a graphic design website want to use a single license that allows free viewing of low-resolution copies of their images but requires payment for access to the high-resolution versions.
-   The owners of an online document library want to enable rights to view, print, or edit documents based on the identity of the user.
-   A corporation wants to publish sensitive employee information to an internal website that restricts viewing and editing privileges to certain users.

For more information on AD RMS server, AD RMS client and their functionality, see the TechNet content for [IT Pro documentation for AD RMS](https://TechNet.Microsoft.Com/library/cc771234.aspx).

The remaining topics in this section cover the RMS Architecture and its implementations.

## In this section

| Topic | Description |
|-------|-------------|
|[Client](ad-rms-client.md) |This topic describes the purpose and function of the Rights Management Service Client 2.1 |
|[Server](ad-rms-server.md) | This topic describes the purpose and functions of the RMS Server; for Azure and Windows Server.|


## Related topics

* [RMS Concepts](application-types.md)
* [Get started](getting-started-with-ad-rms-2-0.md)
* [IT Pro documentation for AD RMS](https://technet.microsoft.com/library/cc771234.aspx)
