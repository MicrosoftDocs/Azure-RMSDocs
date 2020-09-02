---
# required metadata

title: Tutorial - Deploying the Azure Information Protection (AIP) unified labeling client 
description: A step-by-step tutorial for deploying the Azure Information Protection (AIP) unified labeling client
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 08/04/2020
ms.topic: tutorial
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

# Tutorial: Deploying the Azure Information Protection (AIP) unified labeling client

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection)*
>
> *Instructions for: [Azure Information Protection client for Windows](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients)*

The Azure Information Protection unified labeling client is part of the Microsoft Information Protection solution. The client enables you to:

- **Extend functionality for built-in sensitivity labels,** including labeling and protecting all file types from the File Explorer and PowerShell.

- **View and open files protected by other organizations** using Microsoft Information Protection, if your organization does not use an information protection solution yourselves.

- **Scan your network and content shares** for sensitive content.

For more information about Microsoft Information Protection, see [Microsoft Information Protection in Microsoft 365](https://aka.ms/MIPdocs).

## AIP client prerequisites

Use the following links to understand the prerequisites for using the Azure Information Protection unified client in your organization:

- [Azure Information Protection requirements](requirements.md). Describes detailed system requirements, such as an Azure Information Protection subscription, Azure Active Directory, supported client devices, and supported applications.

- [Unified labeling client prerequisites](rms-client/clientv2-admin-guide-install.md#additional-prerequisites-for-the-azure-information-protection-unified-labeling-client). Lists system requirements for each machine where the AIP client is installed.

> [!NOTE]
> We also recommend that a system administrator [configures your group policy to prevent users from disabling AIP](rms-client/clientv2-admin-guide-install.md#configure-your-group-policy-to-prevent-disabling-aip).
> 

## Installing the AIP client

If you are an administrator who needs to install the AIP client across user machines, use one or both of the following options:

- **[Download and run the .exe file.](rms-client/clientv2-admin-guide-install.md#to-install-the-azure-information-protection-unified-labeling-client-by-using-the-executable-installer)** Recommended option, and can be run interactively or silently. 

- **[Download and run the .msi file.](rms-client/clientv2-admin-guide-install.md#to-install-the-azure-information-protection-unified-labeling-client-by-using-the-msi-installer)** Supported for silent installations that use a central deployment mechanism, such as group policy, Configuration Manger, or Microsoft Intune.

The AIP client installation files are available from the [Microsoft Download site](https://www.microsoft.com/download/details.aspx?id=53018). 

For more information, see: [Options for installing the AIP client](rms-client/clientv2-admin-guide-install.md#options-to-install-the-azure-information-protection-unified-labeling-client-for-users)

> [!TIP]
> If you want to test-run the latest features available for the client, deploy a public preview version on a testing system. For more information, see the AIP unified labeling client [version release history](rms-client/unifiedlabelingclient-version-release-history.md).
> 

## Next steps

- **Additional AIP client tutorials**: 

    - [Tutorial: Migrating from the Azure Information Protection (AIP) classic client to the unified labeling client](tutorial-migrating-to-ul.md) 
    - [Tutorial: Preventing oversharing using Azure Information Protection (AIP)](tutorial-preventing-oversharing.md)

- **AIP scanner quickstarts**:

    - [Quickstart: Installing the Azure Information Protection (AIP) unified labeling scanner](quickstart-install-client-scanner.md)
    - [Quickstart: Scanning your network for risky repositories (Public preview)](quickstart-scan-network.md)
    - [Quickstart: Finding your sensitive content with the Azure Information Protection (AIP) scanner](quickstart-scan-content.md)     
    
- **See also**:

    - [Known issues - Azure Information Protection](known-issues.md) 
    - [Frequently asked questions for Azure Information Protection](faqs.md) 
    - [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](rms-client/clientv2-admin-guide-customizations.md)        
    
