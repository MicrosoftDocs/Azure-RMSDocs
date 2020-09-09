---
# required metadata

title: Quickstart - Deploying the Azure Information Protection (AIP) unified labeling client 
description: A quick intro for deploying the Azure Information Protection (AIP) unified labeling client
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 09/09/2020
ms.topic: quickstart
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: aiplabels
#ms.reviewer: eymanor
#ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Quickstart: Deploying the Azure Information Protection (AIP) unified labeling client

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

The Azure Information Protection (AIP) unified labeling client is part of the [Microsoft Information Protection](https://aka.ms/MIPdocs) solution, and  extends the built-in capabilities for sensitivity labeling provided by Microsoft 365. 

The client provides additional support for labeling and protection of all file types from the File Explorer and PowerShell, and enables admins to scan network and content shares for sensitive content.

For companies that don't have their own information protection platform, the AIP client also provides a viewer that enables users to open and view content protected by other organizations using Microsoft Information Protection.

## Review AIP client prerequisites

Use the articles linked below to help you understand the prerequisites for deploying Azure Information Protection unified labeling in your organization:

- **[Azure Information Protection requirements](requirements.md).** Describes detailed system requirements for deploying the AIP client in your organization, such as an Azure Information Protection subscription and Azure Active Directory. Also lists of supported client devices and supported applications.

- **[Unified labeling client prerequisites](rms-client/clientv2-admin-guide-install.md#additional-prerequisites-for-the-azure-information-protection-unified-labeling-client).** Lists system requirements for each machine where the AIP client is installed.

## Install the AIP client

AIP provides the following client installation options:

- **[Download and run the .exe file.](rms-client/clientv2-admin-guide-install.md#to-install-the-azure-information-protection-unified-labeling-client-by-using-the-executable-installer)** This is the recommended option for most use cases. The installation can be run interactively or silently.

    When the installation is complete, you may be prompted to restart your computer or Office software. Restart as needed to continue.

- **[Download and run the .msi file.](rms-client/clientv2-admin-guide-install.md#to-install-the-azure-information-protection-unified-labeling-client-by-using-the-msi-installer)** Supported for silent installations that use a central deployment mechanism, such as group policies, Configuration Manger, or Microsoft Intune.

The AIP client installation files are available from the [Microsoft Download site](https://www.microsoft.com/download/details.aspx?id=53018). 

For more information, see: [Options for installing the AIP client](rms-client/clientv2-admin-guide-install.md#options-to-install-the-azure-information-protection-unified-labeling-client-for-users)

> [!TIP]
> To test-run the latest features available for the AIP client, deploy our public preview version on a testing system. For more information, see the AIP unified labeling client [version release history](rms-client/unifiedlabelingclient-version-release-history.md).
> 

## Next steps

Perform any of the following quickstarts and tutorials to get started with the Azure Information client:

- [Quickstart: Installing the Azure Information Protection (AIP) unified labeling scanner](quickstart-install-scanner.md)
- [Tutorial: Finding your sensitive content with the Azure Information Protection (AIP) scanner](tutorial-scan-networks-and-content.md)
- [Tutorial: Migrating from the Azure Information Protection (AIP) classic client to the unified labeling client](tutorial-migrating-to-ul.md) 
- [Tutorial: Preventing oversharing using Azure Information Protection (AIP)](tutorial-preventing-oversharing.md)

**See also**:

- [Known issues - Azure Information Protection](known-issues.md) 
- [Frequently asked questions for Azure Information Protection](faqs.md) 
- [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md)        
    
