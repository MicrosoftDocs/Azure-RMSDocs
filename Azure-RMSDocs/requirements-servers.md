---
# required metadata

title: Server support for Azure RMS data protection  - AIP
description: Identify the on-premises server products that can use the Azure Rights Management service from Azure Information Protection, by using the Rights Management connector.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 12/12/2018
ms.topic: conceptual
ms.service: information-protection
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


# On-premises servers that support Azure Rights Management data protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

The following on-premises server products are supported with Azure Information Protection when you use the Azure Rights Management connector. This connector acts as a communications interface (a relay) between the on-premises servers and the Azure Rights Management service that is used by Azure Information Protection to protect Office documents and emails. 

To use this connector, you must configure directory synchronization between your Active Directory forests and Azure Active Directory.

-   **Exchange Server**:

    -   Exchange Server 2016

    -   Exchange Server 2013

    -   Exchange Server 2010

-   **Office SharePoint Server**:

    -   Office SharePoint Server 2016

    -   Office SharePoint Server 2013

    -   Office SharePoint Server 2010

-   **File servers that run Windows Server and use File Classification Infrastructure (FCI)**:

    -   Windows Server 2016

    -   Windows Server 2012 R2

    -   Windows Server 2012

    > [!NOTE]
    > Because file servers that run Windows Server 2008 R2 do not have a built-in file management task action to apply Rights Management protection, you cannot use the Rights Management connector for this scenario. However, you can use File Classification Infrastructure and Azure RMS on these operating systems if you configure a custom file management task to run an executable or script that can protect files by using Azure RMS. For example, a Windows PowerShell script that uses the [AzureInformationProtection cmdlets](/powershell/azureinformationprotection/vlatest/aip).
    > 
    > You can also use these cmdlets with servers running later versions of Windows Server, with the benefit that these cmdlets can protect all file types. The RMS connector protects Office files only. For how-to instructions, see [RMS Protection with Windows Server File Classification Infrastructure &#40;FCI&#41;](./rms-client/configure-fci.md).

The Rights Management connector is supported on Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, and Windows Server 2008 R2.

For more information about how to configure the Rights Management connector for these on-premises servers, see [Deploying the Azure Rights Management connector](deploy-rms-connector.md).

## Next steps
To check for other requirements, see [Requirements for Azure Rights Management](requirements.md).
