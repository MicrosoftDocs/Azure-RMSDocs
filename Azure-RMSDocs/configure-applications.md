---
# required metadata

title: Configuring applications for Azure Rights Management - AIP
description: Instructions for admins to configure applications and services to support the Azure Rights Management protection service for Azure Information Protection.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 06/24/2019
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

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

> [!NOTE]
> This information is for IT administrators and consultants who have deployed Azure Information Protection. If you are looking for user help and information about how to use the Rights Management functionality for a specific application or how to open a file that is rights-protected, use the help and guidance that accompanies your application.
>
> For example, for Office applications, click the Help icon and enter search terms such as **Rights Management** or **IRM**. For the Azure Information Protection client for Windows, see the [Azure Information Protection client user guide](./rms-client/client-user-guide.md).

After you have deployed Azure Information Protection for your organization, use the following information to configure applications, the Azure Information Protection client, and services. For example, Office applications such as Word 2019, Word 2016, and Word 2013. Also services such as Exchange Online (transport rules, data loss prevention, do not forward, and message encryption) and SharePoint Online (protected libraries). For information about how these applications and services support the data protection service from Azure Information Protection, see [How applications support the Azure Rights Management service](applications-support.md).

> [!IMPORTANT]
> For information about supported versions and other requirements, see [Requirements for Azure Information Protection](requirements.md).

-   [Office 365: Configuration for online services](configure-office365.md)

    -   [Exchange Online: IRM Configuration](configure-office365.md#exchangeonline-irm-configuration)

    -   [SharePoint Online and OneDrive for Business: IRM Configuration](configure-office365.md#sharepointonline-and-onedrive-for-business-irm-configuration)

- [Office applications: Configuration for clients](configure-office-apps.md)

	-   [Office 365 apps, Office 2019, Office 2016, and Office 2013](configure-office-apps.md#office365-apps-office-2019-office-2016-and-office-2013)

	-   [Office 2010](configure-office-apps.md#office2010)

-   [Azure Information Protection client: Installation and configuration for clients](configure-client.md)

To configure on-premises servers such as Exchange Server and SharePoint Server, see [Deploying the Azure Rights Management connector](deploy-rms-connector.md).

In addition to these applications and services, there are other applications that support the Rights Management APIs. This category includes line-of-business applications that are written in-house by using the Rights Management SDK, and applications from software vendors that are written by using the Rights Management SDK. For these applications, follow the instructions that are provided with the application.

## Next steps
After you’ve configured your applications to support the Azure Rights Management service, use the [Azure Information Protection deployment roadmap](deployment-roadmap.md) to check whether there are other configuration steps that you might want to do before you roll out Azure Information Protection to users and administrators. If not, you might find the following operational information useful:

- [Verifying the Azure Rights Management service](verify.md)

- [Helping users to protect files by using the Azure Rights Management service](help-users.md)

- [Logging and analyzing the Azure Rights Management service](log-analyze-usage.md)

- [Operations for your Azure Information Protection tenant key](operations-tenant-key.md)


