---
# required metadata

title: Testing your application | Azure RMS
description: Instructions on how to setup your application for testing.
keywords:
author: bruceperlerms
ms.author: bruceper
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
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

This topic contains instructions about how to set up for your application testing.

## Instructions

### Step 1: Setup for testing

You can test with either Azure RMS or an RMS server running on Windows Server and, we suggest you begin your testing on Azure RMS then, if its required for your deployment, test with RMS Server.

1. For testing with Azure RMS, see [How-to: use ADAL authentication](how-to-use-adal-authentication.md).
2. For testing with RMS Server, see [How-to: install and configure an RMS server](how-to-install-and-configure-an-rms-server.md).
3. The following describes how to install the developer runtime.

   You must have the Rights Management Service Client 2.1 installed on the computer on which you will be testing your application.
   - If you will be testing your application on a computer other than your development computer, you can install the RMS Client 2.1 on that computer from the [AD RMS Client download page](http://www.microsoft.com/en-us/download/details.aspx?id=38396).
   - If you will be testing your application on your development computer then you should have already installed the Rights Management Services SDK 2.1. The RMS Client 2.1 will have been silently installed at this time.

    For information about how to install the RMS SDK 2.1, see [Install the SDK](install-the-rms-sdk.md).

## Remarks

The guidance in this topic is not comprehensive. For detailed information about how to configure the RMS Client 2.1, see [RMS Client 2.1 Deployment Notes](https://technet.microsoft.com/en-us/library/jj159267(WS.10).aspx).

### Related topics

* [How-to install and configure an RMS server](how-to-install-and-configure-an-rms-server.md)
* [How-to: use ADAL authentication](how-to-use-adal-authentication.md)
* [Install the SDK](install-the-rms-sdk.md)
* [RMS Client 2.1 Deployment Notes](https://technet.microsoft.com/en-us/library/jj159267(WS.10).aspx)

[!INCLUDE[Commenting house rules](../includes/houserules.md)]