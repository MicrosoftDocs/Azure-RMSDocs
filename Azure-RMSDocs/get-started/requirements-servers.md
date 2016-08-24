---
# required metadata

title: Azure RMS requirements&#58; On-premises servers that support Azure Rights Management | Azure RMS
description: The following on-premises server products are supported with Azure RMS when you use the Azure RMS connector, which acts as a communications interface (a relay) between the on-premises servers and Azure RMS. In addition, this configuration requires that you configure directory synchronization between your Active Directory forests and Azure Active Directory.
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: get-started-article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: e7d91f2d-d6a7-4c7e-821f-c94e4be9967d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---


# Azure RMS requirements: On-premises servers that support Azure RMS

*Applies to: Azure Rights Management, Office 365*

The following on-premises server products are supported with Azure RMS when you use the Azure RMS connector, which acts as a communications interface (a relay) between the on-premises servers and Azure RMS. In addition, this configuration requires that you configure directory synchronization between your Active Directory forests and Azure Active Directory.

-   **Exchange Server**:

    -   Exchange Server 2016

    -   Exchange Server 2013

    -   Exchange Server 2010

-   **Office SharePoint Server**:

    -   Office SharePoint Server 2016

    -   Office SharePoint Server 2013

    -   Office SharePoint Server 2010

-   **File servers that run Windows Server and use File Classification Infrastructure (FCI)**:

    -   Windows Server 2012 R2

    -   Windows Server 2012

    > [!NOTE]
    > Because file servers that run Windows Server 2008 R2 do not have a built-in file management task action to apply RMS protection, you cannot use the RMS connector for this scenario. However, you can use File Classification Infrastructure and Azure RMS on these operating systems if you configure a custom file management task to run an executable or script that can protect files by using Azure RMS. For example, a Windows PowerShell script that uses the [RMS Protection cmdlets](https://msdn.microsoft.com/library/azure/mt433195.aspx).
    > 
    > You can also use these cmdlets with servers running later versions of Windows Server, with the benefit that these cmdlets can protect all file types. The RMS connector protects Office files only. For how-to instructions, see [RMS Protection with Windows Server File Classification Infrastructure &#40;FCI&#41;](../rms-client/configure-fci.md).

The RMS connector is supported on Windows Server 2012 R2, Windows Server 2012, and Windows Server 2008 R2.

For more information about how to configure the RMS connector for these on-premises servers, see [Deploying the Azure Rights Management connector](../deploy-use/deploy-rms-connector.md).

## Next steps
To check for other requirements, see [Requirements for Azure Rights Management](requirements-azure-rms.md).
