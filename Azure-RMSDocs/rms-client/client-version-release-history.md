---
# required metadata

title: Azure Information Protection client&colon; Version release history | Azure Information Protection
description: See what's new or changed in a release of the Azure Information Protection client for Windows. 
author: cabailey
manager: mbaldwin
ms.date: 10/27/2016
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
> Minor fixes are not listed so if you experience a problem with the Azure Information Protection client, first check that it is not a problem with the latest release. If it is, open an Office application and on the **Home** tab, in the **Protection** group, click **Protect**, and then click **Help and feedback**. Click the **Send feedback** link, which you can use to automatically attach your client logs to an email message that can be sent to the Information Protection team to investigate.

## Version 1.2.4.0

**Released**: 10/27/2016

**Fixes**:

- You can successfully apply a label that protects content when you use Office 2010 and your environment has not been initialized for the Azure Rights Management service (also known as "bootstrapping").

- Client installation completes when the Windows Update service is disabled.

- In Office 2016, when you save a document and an applied label is configured for a header or footer, the cursor does not jump to the header or footer.

- Automatic classification works in Word for text in bundled text boxes.

**New feature**:

- Diagnostic tests and a reset option that a user can run from the Office application when the Azure Information Protection client is installed: On the **Home** tab, in the **Protection** group, click **Protect**, click **Help and feedback**, and then click **Run diagnostics**. 

    For more information about this option, see the [To verify installation, connection status, or report a problem](info-protect-client.md#to-verify-installation-connection-status-or-report-a-problem) section from the client installation documentation.

## Version 1.1.23.0

**Released**: 10/01/2016

General Availability.

## Next steps

For more information about installing the client, see [Installing the Azure Information Protection client](info-protect-client.md).
