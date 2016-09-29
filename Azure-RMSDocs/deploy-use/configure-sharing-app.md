---
# required metadata

title: Rights Management sharing application&colon; Installation and configuration for clients | Azure Information Protection
description: Information for admins about deploying the Rights Management (RMS) sharing application on Windows computers and mobile devices.
author: cabailey
manager: mbaldwin
ms.date: 09/25/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: b9af5dc3-73d4-4147-b7ef-f6803b0d5216

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Rights Management sharing application: Installation and configuration for clients

>*Applies to: Azure Information Protection, Office 365*

The Rights Management (RMS) sharing application is required for client computers to use the Azure Rights Management service with Office 2010, and recommended for all computers and mobile devices that support the Azure Rights Management service from Azure Information Protection. The RMS sharing application integrates with Office applications by installing an Office add-in so that users can easily protect files and emails directly from the ribbon. It also offers generic protection for files types that are not natively supported by the Azure Rights Management service, and a document tracking site for users to track and revoke files that they have protected.

## The RMS sharing application for Windows: Installation and configuration
To install and configure the RMS sharing application for Windows for an enterprise deployment, see the [Rights Management sharing application administrator guide](../rms-client/sharing-app-admin-guide.md).

> [!TIP]
> If you want to quickly install and test the RMS sharing application for a single computer, see [Download and install the Rights Management sharing application](../rms-client/install-sharing-app.md) from the [Rights Management sharing application user guide](../rms-client/sharing-app-user-guide.md).

## The RMS sharing application for mobile platforms: Installation and management
To install the RMS sharing application for mobile platforms, you can download the relevant app by using the links on the [Microsoft Rights Management page](http://go.microsoft.com/fwlink/?LinkId=303970). No configuration is required to use the Azure Rights Management service with this app.

> [!NOTE]
> The RMS sharing application for iOS and Android is now replaced by the Azure Information Protection app.

**If you have Microsoft Intune**: Because the Azure Information Protection app includes the Microsoft Intune App Software Development Kit, when iOS and Android devices are enrolled by Intune, you can deploy and manage the Azure Information Protection app for these devices. For more information, see [Configure and deploy mobile application management policies in the Microsoft Intune console](/intune/deploy-use/configure-and-deploy-mobile-application-management-policies-in-the-microsoft-intune-console) from the Intune documentation. For Step 2, use the instructions to publish a policy managed app.



