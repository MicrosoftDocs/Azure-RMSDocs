---
# required metadata

title: Azure Information Protection unified labeling client - Version release information
description: See the release information for the Azure Information Protection unified labeling client for Windows. 
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 02/26/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection

# optional metadata

#ROBOTS:
#audience:git
#ms.devlang:
ms.reviewer: maayan
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Azure Information Protection unified labeling client: Version release information

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*

> [!NOTE]
> This client is in preview and is subject to changes. It uses the unified labeling store and downloads policy with labels from the Office 365 Security & Compliance Center. [More information](/Office365/SecurityCompliance/sensitivity-labels)

You can download the latest preview version of the Azure Information Protection unified labeling client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=57440).

### Release information

Use the following information to see what’s supported for the latest preview version of the Azure Information Protection unified labeling client.

This client installs an Office add-on for Windows computers, an extension for File Explorer, and a PowerShell module. This client has the same [prerequisites](../requirements.md) as the Azure Information Protection client that downloads policy from Azure.

To compare features and functionality with the Azure Information Protection client, see [Feature comparisons for the clients](use-client.md#feature-comparisons-for-the-clients).

## Current preview version

**Released**: 02/25/2019

This preview version of the Azure Information Protection unified labeling client for Windows supports the following features: 

- Upgrade from the Azure Information Protection client.

- Manual, automatic, and recommended labeling: Use **Auto labeling** from the Office 365 Security & Compliance Center to configure automatic and recommended labeling.

- File Explorer, right-click actions to classify and protect files, remove protection, and apply custom permissions.

- A viewer for protected text and image files, protected PDF files, and files that are generically protected.

- PowerShell commands to do the following:
    - [Set or remove a label on a document](/powershell/module/azureinformationprotection/set-aipfilelabel)
    - [Label a document after inspecting its contents](/powershell/module/azureinformationprotection/set-aipfileclassification)
    - [Read label information applied to a document](/powershell/module/azureinformationprotection/get-aipfilestatus)
    - [Authenticate to support unattended PowerShell sessions](/powershell/module/azureinformationprotection/set-aipauthentication)

- Support for central reporting using [Azure Information Protection analytics](../reports-aip.md).

- The following label and policy settings:
    - Visual marking (headers, footers, watermarks)
    - Default labeling
    - Labels that apply Do Not Forward and display in Outlook only
    - Justification prompts if users lower the classification level or remove a label
    - Colors for the labels

- Policy refresh from the Security & Compliance Center:
    - Each time an Office app starts and every 4 hours
    - When you right-click to classify and protect a file or folder
    - When you run the PowerShell cmdlets for labeling and protection

- A Help and feedback dialog box, which includes reset settings and export logs.

### Features that do not work in this preview version or are not available

Includes:

- The scanner to discover, label, and protect files on on-premises data stores is not available.

- Labels that are migrated from the Azure portal and configured for HYOK protection display in the client when they are published, but these labels do not apply protection.

- The full set of cmdlets from the AzureInformationProtection module aren't available, which includes cmdlets that connect directly to a protection service. For example, Unprotect-RMSFile, to unprotect files in bulk.

For full details, see the [comparison tables](use-client.md#feature-comparisons-for-the-clients).

## Instructions

1. Install the client by using the following instructions: [User Guide: Download and install the Azure Information Protection client (Preview)](install-unifiedlabelingclient-app.md) 

2. Use the client as you would the Azure Information Protection client, with the following exceptions for Office apps:
    - The button on the Office ribbon is named **Sensitivity** rather than **Protect**.
    - Admins can't display the Information Protection bar by default, but users can display it by selecting **Show Bar** from the **Sensitivity** button. 
    - Custom permissions are not available
    - Track and revoke is not available
    
    For user instructions:
    
    - [Classify a file or email](client-classify.md) 
    
    - [Classify and protect a file or email](client-classify-protect.md)

3. Share your experience: 
    
    - To provide feedback or ask questions about this preview client, use the [Yammer site for Azure Information Protection](https://www.yammer.com/AskIPTeam).
