---
# required metadata

title: Azure Information Protection client&colon; Version release history
description: See what's new or changed in a release of the Azure Information Protection client for Windows. 
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/08/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: 6ebd0ca3-1864-4b3d-bb3e-a168eee5eb1d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Azure Information Protection client: Version release history

>*Applies to: Azure Information Protection*

The Azure Information Protection team regularly updates the Azure Information Protection client for fixes and new functionality. The client is included in the Microsoft Update Catalog (category: **Azure Information Protection**) and you can always download the latest version from the [Microsoft Download Center](https://www.microsoft.com/en-us/download/details.aspx?id=53018).

Use the following information to see what’s new or changed in a release. The most current release is listed first. Versions before General Availability are not listed.

> [!NOTE]
> Minor fixes are not listed so if you experience a problem with the Azure Information Protection client, first check that it is not a problem with the latest release.
>  
> If the problem remains, see the [Support options and community resources](../get-started/information-support.md#support-options-and-community-resources) information. We also invite you to engage with the Azure Information Protection team, on their [Yammer site](https://www.yammer.com/askipteam/).

## Version 1.3.155.2

**Released**: 02/08/2017

**New requirements**:

Microsoft .NET Framework

- This version of the Azure Information Protection client requires a minimum version of Microsoft .NET Framework 4.6.2 and if this is missing, the installer tries to download and install it. A computer restart might be required after the Azure Information Protection client installation is complete.

- If the Azure Information Protection Viewer is installed separately, this requires a minimum version of Microsoft .NET Framework 4.5.2 and if this is missing, the installer does not download or install it.

**New features**:

- A new, unified client that combines the features from the Rights Management sharing application for Windows with the Azure Information Protection client. Includes:
    
    - Integration with Windows File Explorer (right-click) to apply labels and protection. Supports additional file formats and multiple file selection.
    - A viewer for protected documents (includes protected PDF for SharePoint).
    - PowerShell cmdlets to get and set labels for files that are stored locally or on network shares. These cmdlets install with the cmdlets that previously shipped with the RMS Protection Tool (RMSProtection module).
    - Client usage logs that record information such as which label was applied, how, and by whom.

This client version is the [General Availability release](https://blogs.technet.microsoft.com/enterprisemobility/2017/02/08/azure-information-protection-december-update-moves-to-general-availability/) of the preview client that was first announced in December 2016. For more information about this version of the client, see the following guides:

- [Azure Information Protection client administrator guide](client-admin-guide.md)

- [Azure Information Protection user guide](client-user-guide.md)


## Version 1.2.4.0

**Released**: 10/27/2016

**Fixes**:

- Client installation completes when the Windows Update service is disabled.

- In Office 2016, when you save a document and an applied label is configured for a header or footer, the cursor does not jump to the header or footer.

- Automatic classification works in Word for text in bundled text boxes.

**New feature**:

- Diagnostic tests and a reset option that a user can run from the Office application when the Azure Information Protection client is installed: On the **Home** tab, in the **Protection** group, click **Protect**, click **Help and feedback**, and then click **Run diagnostics**. 

    For more information about this option, see the [To verify installation, connection status, or send feedback](client-admin-guide.md#to-verify-installation-connection-status-or-send-feedback) section from the client installation documentation.

## Version 1.1.23.0

**Released**: 10/01/2016

General Availability.

## Next steps

For more information about installing the client:

- For users: [Download and install the client](install-client-app.md)

- For admins: [Azure Information Protection client administrator guide](client-admin-guide.md)


[!INCLUDE[Commenting house rules](../includes/houserules.md)]