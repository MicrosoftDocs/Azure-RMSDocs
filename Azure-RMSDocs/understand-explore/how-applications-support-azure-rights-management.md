---
# required metadata

title: How applications support Azure Rights Management | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: 2cdc7bde-4044-4021-b887-11476f99afd9

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# How applications support Azure Rights Management
Use the following information to help you understand how your end-user applications (such as the Office applications, Word, Excel, PowerPoint, and Outlook) and services (such as Exchange and SharePoint) can use Microsoft [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] to help protect your organization’s data. 
> [!NOTE]
> To verify the applications and versions that [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] (Azure RMS) supports, see [Requirements for Azure Rights Management](../get-started/requirements-for-azure-rights-management.md).

In some cases, information protection is automatically applied, according to policies that you configure. For example, this is the case with SharePoint libraries, classified files, and Exchange transport rules. In other cases, users must apply information protection themselves from their applications, either by selecting a template or by selecting specific options. For example, this is the case when users share a file by email, or protect a file in-place by restricting access or usage to selected users or to users outside the organization.

Templates make it easier for users (and administrators who configure policies) to apply the correct level of protection and restrict access to people inside your organization. Although [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] comes with two default templates, you will probably want to create custom templates to reduce the times when they have to specify individual options. For more information, see [Configuring custom templates for Azure Rights Management](..deploy-use/configure-custom-templates-for-azure-rights-management.md).

For the cases where users must apply information protection themselves, be sure to provide them with instructions and guidance how and when to do this. The instructions should be specific for the application and versions that they use and how they use them, and the guidance for when and how to apply information protection should be appropriate for your business. For more information, see [Helping users to protect files by using Azure Rights Management](../deploy-use/helping-users-to-protect-files-by-using-azure-rights-management.md).

For information about how to configure these applications for Azure RMS, see [Configuring applications for Azure Rights Management](../deploy-use/configuring-applications-for-azure-rights-management.md).

> [!TIP]
> For examples and screenshots of applications using Azure RMS, see [Azure RMS in action: What administrators and users see](what-do-admins-users-see.md).


## Next steps

Learn more about how each of the following supports Azure RMS:

-   [RMS sharing application for Windows and mobile platforms](sharing-application-for-windows-and-mobile-platforms.md)

-   [Office applications and services](rights-management-sharing-application-for-office.md)

-   [File servers that run Windows Server and use File Classification Infrastructure (FCI)](how-fileservers-support-azure-rights-management.md)

-   [Other applications that support the RMS APIs](other-apps-support-apis.md)

