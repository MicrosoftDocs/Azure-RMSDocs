---
# required metadata

title: Configuring applications for Azure Rights Management - AIP
description: Instructions for admins to configure applications and services to support the Azure Rights Management protection service for Azure Information Protection.
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 11/11/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: ea09cbc5-b98b-444e-8b60-5bc3cb199c36

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: azurerms
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# Configuring applications for Azure Rights Management

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

This article is for IT administrators and consultants who have deployed Azure Information Protection. If you are looking for user help and information about how to use the Rights Management functionality for a specific application or how to open a file that is rights-protected, use the help and guidance that accompanies your application.

For example, for Office applications, click the Help icon and enter search terms such as **Rights Management** or **IRM**. For the Azure Information Protection client for Windows, see the [Azure Information Protection client user guide](./rms-client/clientv2-user-guide.md).

## Resources for configuring applications, the AIP client, and services

After you have deployed Azure Information Protection for your organization, use the following information to configure applications, the Azure Information Protection client, and services, such as:

- **Office applications**, such as Word 2019, Word 2016, and Word 2013. 
- **Services**, such as Exchange Online (transport rules, data loss prevention, do not forward, and message encryption) and Microsoft SharePoint (protected libraries). 

For information about how these applications and services support the data protection service from Azure Information Protection, see [How applications support the Azure Rights Management service](applications-support.md).

For information about supported versions and other requirements, see [Requirements for Azure Information Protection](requirements.md).

-   [Microsoft 365: Configuration for online services](configure-office365.md)

    -   [Exchange Online: IRM Configuration](configure-office365.md#exchangeonline-irm-configuration)

    -   [SharePoint in Microsoft 365 and OneDrive: IRM Configuration](configure-office365.md#sharepoint-in-microsoft-365-and-onedrive-irm-configuration)

- [Office applications: Configuration for clients](configure-office-apps.md)

	-   [Microsoft 365 apps, Office 2021, Office 2019, Office 2016, and Office 2013](configure-office-apps.md#microsoft365-apps-office-2021-office-2019-office-2016-and-office-2013)

-   [Azure Information Protection client: Installation and configuration for clients](configure-client.md)

To configure on-premises servers such as Exchange Server and SharePoint Server, see [Deploying the Microsoft Rights Management connector](deploy-rms-connector.md).

In addition to these applications and services, there are other applications that support the Rights Management APIs. This category includes line-of-business applications that are written in-house by using the Rights Management SDK, and applications from software vendors that are written by using the Rights Management SDK. For these applications, follow the instructions that are provided with the application.

## Next steps

After you’ve configured your applications to support the Azure Rights Management service, use the [AIP deployment roadmap for classification, labeling, and protection](deployment-roadmap-classify-label-protect.md) to check whether there are other configuration steps that you might want to do before you roll out Azure Information Protection to users and administrators. 

If not, you might find the following operational information useful:

- [Verifying the Azure Rights Management service](verify.md)

- [Helping users to protect files by using the Azure Rights Management service](help-users.md)

- [Usage logging for the Azure Rights Management service](/purview/rights-management-usage)

- [Operations for your Azure Information Protection tenant key](operations-tenant-key.md)
