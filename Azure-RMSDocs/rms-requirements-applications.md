---
title: Azure RMS Requirements&#58; Applications
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: EMS
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: TBD
author: Cabailey
---

# Azure RMS Requirements: Applications

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

    -   [Rights Management sharing application administrator guide](rights-management-sharing-application-administrator-guide.md)

    -   [Rights Management sharing application user guide](rights-management-sharing-application-user-guide.md)

-   **The Rights Management sharing application for mobile platforms**

    For more information about the Rights Management sharing application for mobile platforms, see the following resources:

    -   Download the relevant app by using the links on the [Microsoft Rights Management page](http://go.microsoft.com/fwlink/?LinkId=303970)
 
    -   [FAQ for Microsoft Rights Management Sharing Application for Mobile Platforms](frequently-asked-questions-for-azure-rights-management.md)

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

For more information about how these applications support Azure RMS, see [How Applications Support Azure Rights Management](how-applications-support-azure-rights-management.md).

For information about how to configure thess applications for Azure RMS, see [Configuring Applications for Azure Rights Management](configuring-applications-for-azure-rights-management.md).