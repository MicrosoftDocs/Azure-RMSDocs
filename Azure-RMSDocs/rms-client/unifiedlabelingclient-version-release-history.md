---
# required metadata

title: Azure Information Protection unified labeling client - Version history & support policy
description: See the release information for the Azure Information Protection unified labeling client for Windows. 
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 05/02/2019
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

# Azure Information Protection unified labeling client - Version release history and support policy

>*Applies to: Active Directory Rights Management Services, [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), Windows 10, Windows 8.1, Windows 8, Windows 7 with SP1, Windows Server 2016, Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2*
>
> *Instructions for: [Azure Information Protection unified labeling client for Windows](../faqs.md#whats-the-difference-between-the-azure-information-protection-client-and-the-azure-information-protection-unified-labeling-client)*


You can download the Azure Information Protection unified labeling client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

### Servicing information and timelines

Each general availability (GA) version of the Azure Information Protection unified labeling client is supported for up to six months after the release of the subsequent GA version. The documentation does not include information about unsupported versions of the client. Fixes and new functionality are always applied to the latest GA version and will not be applied to older GA versions.

Preview versions should not be deployed for end users on production networks. Instead, use the latest preview version to see and try new functionality or fixes that are coming in the next GA version. Preview versions that are not current are not supported.

> [!NOTE]
> For technical support, see the [Support options and community resources](../information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

### Release information

Use the following information to see what’s supported for the general availability version of the Azure Information Protection unified labeling client.

This client installs an Office add-on for Windows computers, an extension for File Explorer, and a PowerShell module. This client has the same [prerequisites](../requirements.md) as the Azure Information Protection client that downloads policy from Azure.

To compare features and functionality with the Azure Information Protection client, see [Compare the clients](use-client.md#compare-the-clients).

This release was first released 04/16/2019 as version 2.0.778.0, and subsequently updated to fix a race-condition issue where sometimes, no labels display in Office apps or File Explorer.

## Version 2.0.xxx.0

**Released**: 05/01/2019

This release has a single fix to resolve a race-condition issue where sometimes, no labels display in Office apps or File Explorer.


## Version 2.0.778.0

**Released**: 04/16/2019

This first general availability version of the Azure Information Protection unified labeling client for Windows supports the following features: 

- Upgrade from the Azure Information Protection client.

- Manual, automatic, and recommended labeling: For more information about configuring automatic and recommended labeling for this client, see [Apply a sensitivity label to content automatically](/Office365/SecurityCompliance/apply_sensitivity_label_automatically).

- File Explorer, right-click actions to classify and protect files, remove protection, and apply custom permissions.

- A viewer for protected text and image files, protected PDF files, and files that are generically protected.

- PowerShell commands to do the following:
    - [Set or remove a label on a document](/powershell/module/azureinformationprotection/set-aipfilelabel)
    - [Label a document after inspecting its contents](/powershell/module/azureinformationprotection/set-aipfileclassification)
    - [Read label information applied to a document](/powershell/module/azureinformationprotection/get-aipfilestatus)
    - [Authenticate to support unattended PowerShell sessions](/powershell/module/azureinformationprotection/set-aipauthentication)

- Auditing data and endpoint discovery support for central reporting by using [Azure Information Protection analytics](../reports-aip.md).

- The following label and policy settings:
    - Visual marking (headers, footers, watermarks)
    - Default labeling
    - Labels that apply Do Not Forward and display in Outlook only
    - Justification prompts if users lower the classification level or remove a label
    - Colors for the labels

- Policy refresh from the admin centers:
    - Each time an Office app starts and every 4 hours
    - When you right-click to classify and protect a file or folder
    - When you run the PowerShell cmdlets for labeling and protection

- A Help and feedback dialog box, which includes reset settings and export logs.


## Next steps

For full details, see the [comparison tables](use-client.md#compare-the-clients).

For more information about installing and using this client: 

- For users: [Download and install the client](install-unifiedlabelingclient-app.md)

- For admins: [Azure Information Protection unified labeling client administrator guide](clientv2-admin-guide.md)

