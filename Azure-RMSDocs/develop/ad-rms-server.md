---
# required metadata

title: AD RMS Server | Azure RMS
description: The server component of Rights Management Services (RMS) is implemented by a set of web services that run on Microsoft Internet Information Services.
keywords:
author: bruceperlerms
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: a7f11e25-9d27-4083-b604-a2d437671d91

# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# AD RMS Server

This topic describes the purpose and functions of the RMS Server.

The server component of Rights Management Services (RMS) is implemented by a set of web services that run on [Microsoft Internet Information Services](http://www.iis.net/overview) (IIS). You can also use the cloud based implementation via RMS on Azure. For more on using the Azure Rights Management service, see [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md).

For on premise servers, beginning with Windows Server 2008, you can install and configure the RMS service by adding it as a role. To install the service on prior operating systems, download it from the Microsoft download center at [Microsoft Windows Rights Management Services with Service Pack 2](http://www.microsoft.com/download/en/details.aspx?id=4909).

Of the many web services installed, the following are important for application development.

**Administration** - Hosts the Administration website that enables you to manage RMS. The service runs on root certification servers and on licensing servers. You can use the [Active Directory Rights Management Services Scripting API](https://msdn.microsoft.com/library/Bb968797) to write administration scripts.

**Account Certification** - Creates machine certificates that identify computers in the RMS certificate hierarchy and rights account certificates that associate users with specific computers. For more information, see [Activating a User](https://msdn.microsoft.com/library/Cc530378).

This service runs on the root certification server.

**Licensing** - Issues an end-user license that enables end users to consume protected content. The service runs on root certification servers and on licensing servers.

**Publishing** - Creates an [Creating an Issuance License](https://msdn.microsoft.com/library/Aa362355). The service runs on root certification servers and on licensing servers.

**Pre-certification** - Enables a server to request a Rights Account Certificate (RAC) on behalf of a user. A RAC uses the machine certificate from RMS activation to bind user accounts to specific computers or groups of computers and is used to enable consumers to use protected content. The service runs on root certification servers and on licensing servers.

**Service Locator**  - Provides the URL of the account certification, licensing, and publishing services to Active Directory so that they can be discovered by RMS clients. The service runs on root certification servers and on licensing servers.

 

## Related topics ##
* [Overview](ad-rms-overview.md)
* [Microsoft Internet Information Services](http://www.iis.net/overview)
* [Enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md)
* [Microsoft Windows Rights Management Services with Service Pack 2](http://www.microsoft.com/download/en/details.aspx?id=4909)
* [Active Directory Rights Management Services Scripting API](https://msdn.microsoft.com/library/Bb968797)
* [Activating a Computer](https://msdn.microsoft.com/library/Cc530377)
* [Activating a User](https://msdn.microsoft.com/library/Cc530378)
* [Creating an Issuance License](https://msdn.microsoft.com/library/Aa362355)

 

 
