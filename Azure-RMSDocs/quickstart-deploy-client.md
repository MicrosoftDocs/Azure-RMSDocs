---
# required metadata

title: Quickstart - Deploying the Azure Information Protection (AIP) unified labeling client 
description: A quick intro for deploying the Azure Information Protection (AIP) unified labeling client
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 11/09/2020
ms.topic: quickstart
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: aiplabels
#ms.reviewer: elina.kaminsky
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin, mode-api

---

# Quickstart: Deploying the Azure Information Protection (AIP) unified labeling client

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

The Azure Information Protection (AIP) unified labeling client is part of the [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) solution, and  extends the built-in capabilities for sensitivity labeling provided by Microsoft 365. 

The client provides end-user support for labeling and protection in the File Explorer and PowerShell, in addition to Office applications. The scanner provided with the unified labeling client enables admins to scan networks and content shares for sensitive content. 

For organizations without an information protection platform, the client provides a viewer for content protected by other organizations using Microsoft Purview Information Protection.

## Review AIP client prerequisites

Use the articles linked below to help you understand the prerequisites for deploying Azure Information Protection unified labeling in your organization:

- **[Azure Information Protection requirements](requirements.md)**. Describes detailed system requirements for deploying the AIP client in your organization, such as an Azure Information Protection subscription and Azure Active Directory. Also lists of supported client devices and supported applications.

- **[Unified labeling client requirements](./rms-client/reqs-ul-client.md)**. Lists system requirements for each machine where the AIP client is installed.

## Install the AIP client

AIP provides the following client installation options:

- **[Download and run the .exe file.](rms-client/clientv2-admin-guide-install.md#install-the-aip-unified-labeling-client-using-the-executable-installer)** This installation is the recommended option for most use cases. The installation can be run interactively or silently.

    When the installation is complete, you may be prompted to restart your computer or Office software. Restart as needed to continue.

- **[Download and run the .msi file.](rms-client/clientv2-admin-guide-install.md#install-the-unified-labeling-client-using-the-msi-installer)** Supported for silent installations that use a central deployment mechanism, such as group policies, Configuration Manger, or Microsoft Intune.

The AIP client installation files are available from the [Microsoft Download site](https://www.microsoft.com/download/details.aspx?id=53018). 

For more information, see [Admin Guide: Install the Azure Information Protection unified labeling client for users](rms-client/clientv2-admin-guide-install.md).

> [!TIP]
> To test-run the latest features available for the AIP client, deploy our public preview version on a testing system. For more information, see the AIP unified labeling client [version release history](rms-client/unifiedlabelingclient-version-release-history.md).
> 

## Next steps

See any of the following quickstarts and tutorials to get started with the Azure Information client:

- [Tutorial: Installing the Azure Information Protection (AIP) unified labeling scanner](tutorial-install-scanner.md)
- [Tutorial: Discovering your sensitive content with the Azure Information Protection (AIP) scanner](tutorial-scan-networks-and-content.md)
- [Tutorial: Preventing oversharing using Azure Information Protection (AIP)](/azure/information-protection/tutorial-scan-networks-and-content)

**See also**:

- [Known issues - Azure Information Protection](known-issues.md) 
- [Frequently asked questions for Azure Information Protection](faqs.md) 
- [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md)