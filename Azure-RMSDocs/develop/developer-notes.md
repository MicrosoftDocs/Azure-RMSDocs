---
# required metadata

title: Azure Information Protection SDK 2.1 developer guidance | Microsoft Docs
description: A collection of how-to topics for developing with the AIP SDK 2.1
keywords:
author: bryanla
ms.author: bryanla
manager: barbkess
ms.date: 01/23/2017
ms.topic: conceptual
ms.service: information-protection
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

# Developer guidance

This section covers specific guidance for several important development scenarios as well as general information about developing with this SDK. The scenarios in this section are specific to this release of the Rights Management Services SDK 2.1 and may be altered in subsequent releases.
- [How-to: use ADAL authentication](how-to-use-adal-authentication.md) - Authentication with Azure RMS for your app using Azure Active Directory Authentication Library (ADAL).
- [How-to: Add explicit owner rights](add-explicit-owner-rights.md) - Your application should explicitly add "Owner" rights when creating a license from scratch ([IpcCreateLicenseFromScratch](https://msdn.microsoft.com/library/hh535256.aspx)).
- [How-to: debug a rights-enabled application](debugging-applications-that-use-ad-rms.md) - This topic shows how to debug your application and use the Windows Event Log.
- [How-to: deploy an app into a customer's tenant](how-to-deploy-app.md) - Outlines the steps for deploying an app from its developement Azure AD tenant to a production Azure AD tenant.
- [How-to: enable document tracking and revocation](tracking-content.md) - This topic covers the basic guidance for implementing document tracking of content as well as example code for metadata updates and for creating a **Track Usage** button for your app.
- [How-to: enable email notification](how-to-enable-email-notification.md) - Email notification allows for a protected content owner to be notified when his or her content is accessed.
- [How-to: enable your service application to work with cloud based RMS](how-to-use-file-api-with-aadrm-cloud.md) - This topic outlines steps for setting up your service application to use Azure Rights Management.
- [How-to: install and configure an RMS server](how-to-install-and-configure-an-rms-server.md) - This topic covers the steps to connect to an RMS Sever or Azure RMS for testing your rights-enabled application.
- [How-to: set the API security mode](setting-the-api-security-mode-api-mode.md) - You can choose which security mode your File API application runs in by using the [IpcSetGlobalProperty](https://msdn.microsoft.com/library/hh535270.aspx) function.
- [How-to: work with encryption settings](working-with-encryption.md) - This topic orients you to our encryption packages and shows some code snips for their use.
- [Application types](application-types.md) - This topic covers types of applications that you might choose to create as rights-enabled.
- [File API configuration](file-api-configuration.md) - The File API's behavior can be configured through settings in the registry.
- [Security guidelines](security-guidelines.md) - provides orientation and direction to application developers for working well within the AIP ecosystem.
- [Supported file formats](supported-file-formats.md) - The File API supports native and Pfile formats
- [Supported platforms](supported-platforms.md) - This topic identifies the RMS SDK 2.1 supported client and server platforms.
- [Understanding usage restrictions](understanding-usage-restrictions.md) - All RMS enabled applications must enforce usage restrictions which are defined by the constants listed in this topic.

 
## Related topics
* [Overview](ad-rms-overview.md)
