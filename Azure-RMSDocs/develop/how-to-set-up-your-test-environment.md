---
# required metadata

title: Testing your application | Azure RMS
description: Instructions on how to setup your application for testing.
keywords:
author: bryanla
ms.author: bryanla
manager: barbkess
ms.date: 02/23/2017
ms.topic: conceptual
ms.service: information-protection
ms.assetid: E480D8D6-F070-43D1-B2B0-6921459C3437
# optional metadata

#ROBOTS:
audience: developer
#ms.devlang:
ms.reviewer: shubhamp
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Testing your application

Here, you learn how to prepare for application testing.

## Instructions

You can test with either Azure RMS or an RMS server running on Windows Server.  Begin testing with Azure RMS and test with RMS Server (if required for your deployment).

- For testing with Azure RMS, see [How-to: use ADAL authentication](how-to-use-adal-authentication.md).
- For testing with RMS Server, see [How-to: install and configure an RMS server](how-to-install-and-configure-an-rms-server.md).
- To install the developer runtime:

   You must have the Rights Management Service Client 2.1 installed on the computer on which you will be testing your application.
  - To test your application on a computer other than your development computer, install the RMS Client 2.1 on that computer from the [AD RMS Client download page](https://www.microsoft.com/download/details.aspx?id=38396).
  - Your development computer should have the Rights Management Services SDK 2.1, which was previously installed.

    For help installing RMS SDK 2.1, see [Install the SDK](install-the-rms-sdk.md).

## Remarks

This guidance is not comprehensive. To learn how to configure the RMS Client 2.1, see [RMS Client 2.1 Deployment Notes](https://technet.microsoft.com/library/jj159267(WS.10).aspx).

## Related topics

* [How-to install and configure an RMS server](how-to-install-and-configure-an-rms-server.md)
* [How-to: use ADAL authentication](how-to-use-adal-authentication.md)
* [Install the SDK](install-the-rms-sdk.md)
* [RMS Client 2.1 Deployment Notes](https://technet.microsoft.com/library/jj159267(WS.10).aspx)

