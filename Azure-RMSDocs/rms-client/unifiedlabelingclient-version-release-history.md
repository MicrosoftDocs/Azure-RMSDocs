---
# required metadata

title: Azure Information Protection unified labeling client - Version release information
description: See the release information for the Azure Information Protection unified labeling client for Windows. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 10/06/2018
ms.topic: conceptual
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
> This client is in preview and is subject to changes. It uses the unified labeling store and downloads policy from the Office 365 Security & Compliance Center.

You can download the latest preview version of the Azure Information Protection unified labeling client from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

### Release information

Use the following information to see what’s supported for the latest preview version of the Azure Information Protection unified labeling client. This client installs as an Office add-on for Windows computers. 

## Current preview version

**Released**: 10/xx/2018

This preview version of the Azure Information Protection unified labeling client for Windows supports the following features:

- Upgrade from the Azure Information Protection client

- Manual labeling that applies classification and protection for Word, Excel, PowerPoint, and Outlook.

- Visual marking (headers, footers, watermarks)

- Mandatory labeling 

- Default labeling 

- Justification prompts if users lower the sensitivity level, removing a label, or remove protection

- Help and feedback dialog box, which includes reset settings and export logs

The next set of features is "best effort":

- Labels that apply Do Not Forward

- Custom permissions

- Labels that remove protection

The following features do not work in this preview version:

- Automatic and recommended classification

- The Azure Information Protection viewer

- File Explorer, right-click actions

- PowerShell commands and the scanner

- Support for languages other than English

## Instructions

Install the client as you would the Azure Information Protection client: 

- For users: [Download and install the client](install-client-app.md)

- For admins: [Azure Information Protection client administrator guide](client-admin-guide.md)

Use the client in Office apps as you would the Azure Information Protection client, except that the button on the Office ribbon is named **Sensitivity** rather than **Protect**:

- [Classify a file or email](client-classify.md) 

- [Classify and protect a file or email](client-classify-protect.md)
