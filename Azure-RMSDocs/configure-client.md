---
# required metadata

title: Azure Information Protection client &colon; Install & configure
description: Information for admins about deploying the Azure Information Protection client on Windows computers and mobile devices.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/01/2019
ms.topic: conceptual
ms.service: information-protection
ms.assetid: b1a19ae7-db26-40da-9e21-6620af3d0b02

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Azure Information Protection client: Installation and configuration for clients

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Computers running Office 2010 require the Azure Information Protection client (or the Rights Management sharing application) to authenticate to the Azure Rights Management service and the Azure Information Protection service. This client is also recommended for all Windows computers and iOS and Android devices that support the Azure Rights Management service and Azure Information Protection. 

The Azure Information Protection client integrates with Office applications by installing an Office add-in so that users can easily label and protect documents and emails directly from the Office ribbon. This client also offers labeling and protection for files types that are not natively supported by the Azure Rights Management service, a viewer for protected files, and a document tracking site for users to track and revoke files that they have protected.

## The Azure Information Protection client for Windows: Installation and configuration
For an enterprise installation and configuration of the client for Windows, see the [Azure Information Protection administrator guide](./rms-client/client-admin-guide.md).

> [!TIP]
> If you want to quickly install and test the Azure Information Protection client for a single computer, see [Download and install the Azure Information Protection client](./rms-client/install-client-app.md) from the [Azure Information Protection client user guide](./rms-client/client-user-guide.md).

## The Azure Information Protection client for iOS and Android: Installation and management
To install the Azure Information Protection client for these popular mobile platforms, you can download the relevant app by using the links on the [Microsoft Azure Information Protection page](https://go.microsoft.com/fwlink/?LinkId=303970). No configuration is required.

> [!NOTE]
> For Mac computers, links from this page download the RMS sharing apps for mobile devices. These computers do not support the Azure Information Protection client.

### Integration with Intune

Because the Azure Information Protection app uses the Microsoft Intune App Software Development Kit, when iOS and Android devices are enrolled by Intune, you can deploy and manage the Azure Information Protection app for these devices:

1. [Add the Azure Information Protection app to Intune](/intune/apps-add) 
    
    - For iOS: Search for the app, and the values that you need are specified for you.
    
    - For Android: You must specify the following **Appstore URL**:
        
            https://play.google.com/store/apps/details?id=com.microsoft.ipviewer

2. Do one or both of the following actions:
    
    - Deploy the app by [assigning it to users](/intune/apps-deploy)
    
    - Manage the app by using [app protection policies](/intune/app-protection-policies)

When you add the Azure Information Protection app to Intune:

- For iOS: Search for the app, and the values that you need are specified for you.

- For Android: You must specify the following **Appstore URL**:
        
        https://play.google.com/store/apps/details?id=com.microsoft.ipviewer

When the Azure Information Protection app is configured for an app protection policy for Android devices, in addition to opening protected text, images, and PDF documents, this app can also open audio and video files. For more information, see [View media files with the Azure Information Protection app](/intune/end-user-mam-apps-android#view-media-files-with-the-azure-information-protection-app).

## Next steps

After you have installed and configured the Azure Information Protection client, you might need to learn more about how the client interprets the different usage rights that can be used to protect documents and emails. For more information, see [Configuring usage rights for Azure Rights Management](configure-usage-rights.md).
