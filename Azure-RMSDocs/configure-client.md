---
# required metadata

title: Azure Information Protection client - Install & configure
description: Information for admins about deploying the Azure Information Protection clients on Windows computers and mobile devices.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 03/16/2020
ms.topic: how-to
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: b1a19ae7-db26-40da-9e21-6620af3d0b02

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Azure Information Protection client: Installation and configuration for clients

>***Applies to**: [Azure Information Protection](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection), [Office 365](https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4Dz8M)*
>
The AIP unified labeling client is recommended for all Windows computers, because it installs an Office add-in that enables users to easily label and protect documents directly from the Office ribbon. 

The client also offers:

- Labeling and protection for file types that are not supported by the built-in protection service (Azure Rights Management).
- A viewer for protected files that can't be opened by Office apps. There's a similar viewer for iOS and Android.
- Features for tracking and revoking access to protected files.

Computers running Office 2010 require the Azure Information Protection client to authenticate to the Azure Information Protection service. Note that Office 2010 extended support ended on October 13, 2020. For more information, see [AIP and legacy Windows and Office versions](known-issues.md#aip-and-legacy-windows-and-office-versions).
## The Azure Information Protection client for Windows: Installation and configuration

For an enterprise installation and configuration of the client for Windows, see the [Azure Information Protection unified labeling client administrator guide](./rms-client/clientv2-admin-guide.md).

If you want to quickly install and test these clients for a single computer, see [Download and install the Azure Information Protection unified labeling client](./rms-client/install-unifiedlabelingclient-app.md).

**Classic client only**: If you have the classic client installed, use these links instead:

- [Azure Information Protection client administrator guide](./rms-client/client-admin-guide.md)
- [Download and install the Azure Information Protection client](./rms-client/install-client-app.md).

## The Azure Information Protection app for iOS and Android: Installation and management

To install the Azure Information Protection app viewer for iOS and Android, use the links on the [Microsoft Azure Information Protection page](https://go.microsoft.com/fwlink/?LinkId=303970). No configuration is required.

> [!NOTE]
> For Mac computers, links from this page download the RMS sharing app. These computers do not support the Azure Information Protection client.

### Integration with Intune

Because the Azure Information Protection viewer app uses the Microsoft Intune App Software Development Kit, when iOS and Android devices are enrolled by Intune, you can deploy and manage the Azure Information Protection viewer app for these devices:

1. [Add the Azure Information Protection app to Intune](/intune/apps/apps-add)

2. Do one or both of the following actions:

    - Deploy the app by [assigning it to users](/intune/apps/apps-deploy)

    - Manage the app by using [app protection policies](/intune/apps/app-protection-policies)

Additional information for when you add the Azure Information Protection app to Intune:

- **For iOS**: Search for and add the app from Intune.

- **For Android**: When you add the app, use the following **Google Play URL**:

    ```md
    https://play.google.com/store/apps/details?id=com.microsoft.ipviewer
    ```

## Next steps

After you have installed and configured Azure Information Protection clients, you might need to learn more about how the client interprets the different usage rights that can be used to protect documents and emails. For more information, see [Configuring usage rights for Azure Information Management](configure-usage-rights.md).
