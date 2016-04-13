---
# required metadata

title: Azure RMS requirements&#58; Applications | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 7b33bcb8-63da-46be-ad56-b06de97822fa

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Azure RMS requirements: Applications

The following applications natively support Azure Rights Management (Azure RMS), which means that Rights Management is tightly integrated into these applications by using RMS APIs to support usage restrictions. These applications are also known as RMS-enlightened:

-   **Microsoft Office applications** (Word, Excel, PowerPoint, and Outlook) from the following suites can protect content by using Azure RMS:

    -   Office 365 ProPlus

    -   Office 365 Enterprise E3

    -   Office 365 Enterprise E4

    -   Office 365 Enterprise E5

    -   Office Professional Plus 2016

    -   Office Professional Plus 2013

    -   Office Professional Plus 2010

    Other editions of Office (with the exception of Office 2007) can consume protected content.

    > [!NOTE]
    > Azure RMS with Office Professional Plus 2010 or Office Professional 2010:
    > 
    > -   Requires the Rights Management sharing application for Windows
    > -   Not supported on Windows 10

-   **The Rights Management sharing application for Windows**

    For more information about the Rights Management sharing application for Windows, see the following resources:

    -   [Rights Management sharing application administrator guide](../rms-client/rights-management-sharing-application-administrator-guide.md)

    -   [Rights Management sharing application user guide](../rms-client/rights-management-sharing-application-user-guide.md)

-   **The Rights Management sharing application for mobile platforms**

    For more information about the Rights Management sharing application for mobile platforms, see the following resources:

    -   Download the relevant app by using the links on the [Microsoft Rights Management page](http://go.microsoft.com/fwlink/?LinkId=303970)
 
    -   [FAQ for Microsoft Rights Management Sharing Application for Mobile Platforms](https://technet.microsoft.com/dn451248)

-   **Other applications that support the RMS APIs**:

    -   Line-of-business applications that are written in-house by using the RMS SDK

    -   Applications from software vendors that are written by using the RMS SDK

    For more information about the SDK, see the [Microsoft Rights Management SDK](developers-guide.md).

> [!IMPORTANT]
> The following applications are not currently supported by Azure RMS:
> 
> -   Microsoft Office for Mac 2011
> -   Microsoft OneDrive for Business for SharePoint Server 2013
> -   XPS Viewer
> 
> In addition, the RMS sharing application has the following restrictions:
> 
> -   For Windows computers: Requires a minimum version of Windows 7 Service Pack 1


## Next steps
To check for other requirements, see [Requirements for Azure Rights Management](requirements-for-azure-rights-management.md).

For more information about how these applications support Azure RMS, see [How applications support Azure Rights Management](../understand-explore/how-applications-support-azure-rights-management.md).

For information about how to configure these applications for Azure RMS, see [Configuring applications for Azure Rights Management](..deploy-use/configuring-applications-for-azure-rights-management.md).