---
# required metadata

title: AD RMS Server | Azure RMS
description: The server component of Rights Management Services (RMS) is implemented by a set of web services that run on Microsoft Internet Information Services.
keywords:
author: lleonard-msft
ms.author: alleonar
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: 17B05780-B0EF-4805-8304-52DCDEB3AADB
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Server

This topic describes the purpose and functions of the RMS Server; for Azure and Windows Server.

**Azure RMS** - For information on using the Azure Rights Management service, see [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md).

> [!IMPORTANT] 
> We recommend developing and testing your application via Azure RMS.

**Windows Server** - For RMS on premise servers, beginning with Windows Server 2008, you can install and configure the RMS service by adding it as a role. To install the service on prior operating systems, download it from the Microsoft download center at [Microsoft Windows Rights Management Services with Service Pack 2](https://www.microsoft.com/download/details.aspx?id=4909).

Of the many web services installed, the following are important for application development for RMS Server on Windows Server.

| Service | Description |
|---------|-------------|
| Administration | Hosts the Administration website that enables you to manage RMS. The service runs on root certification servers and on licensing servers. You can use the Active Directory Rights Management Services Scripting API to write administration scripts.|
| Account Certification |Creates machine certificates that identify computers in the RMS certificate hierarchy and rights account certificates that associate users with specific computers. For more information, see Activating a Computer and Activating a User.<p><p>This service runs on the root certification server. |
|Licensing | Issues an *end-user license*. The service runs on root certification servers and on licensing servers.|
|Publishing | Creates an *issuance license* which define the policies that can be enumerated in an end-user license. For more information, see [Creating an Issuance License](https://msdn.microsoft.com/library/Aa362355).<p><p>The service runs on root certification servers and on licensing servers.|
|Pre-certification | Enables a server to request a *rights account certificate* on behalf of a user. The service runs on root certification servers and on licensing servers.|
|Service Locator | Provides the URL of the account certification, licensing, and publishing services to Active Directory so that they can be discovered by RMS clients. The service runs on root certification servers and on licensing servers.|

## Related topics ##
* [Overview](ad-rms-overview.md)
* [Microsoft Internet Information Services](https://www.iis.net/overview)
* [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md)
* [Microsoft Windows Rights Management Services with Service Pack 2](https://www.microsoft.com/download/details.aspx?id=4909)
* [Active Directory Rights Management Services Scripting API](https://msdn.microsoft.com/library/Bb968797)
* [Activating a Computer](https://msdn.microsoft.com/library/Cc530377)
* [Activating a User](https://msdn.microsoft.com/library/Cc530378)
* [Creating an Issuance License](https://msdn.microsoft.com/library/Aa362355)
