---
# required metadata

title: How applications support Azure Rights Management | Azure RMS
description: Use the following information to help you understand how the most commonly used end-user applications (such as the Office applications, Word, Excel, PowerPoint, and Outlook) and services (such as Exchange and SharePoint) can use Microsoft Azure Rights Management to help protect your organization's data. 
author: cabailey
manager: mbaldwin
ms.date: 05/13/2016
ms.topic: article
ms.prod:
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

>*Applies to: Azure Rights Management, Office 365*

Use the following information to help you understand how the most commonly used end-user applications (such as the Office applications, Word, Excel, PowerPoint, and Outlook) and services (such as Exchange and SharePoint) can use Microsoft [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] to help protect your organization’s data. 
> [!NOTE]
> To verify the applications and versions that [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] (Azure RMS) supports, see [Requirements for Azure Rights Management](../get-started/requirements-azure-rms.md).

In some cases, information protection is automatically applied, according to policies that you configure. For example, this is the case with SharePoint libraries, classified files, and Exchange transport rules. In other cases, users must apply information protection themselves from their applications, either by selecting a template or by selecting specific options. For example, this is the case when users share a file by email, or protect a file in-place by restricting access or usage to selected users or to users outside the organization.

Templates make it easier for users (and administrators who configure policies) to apply the correct level of protection and restrict access to people inside your organization. Although [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] comes with two default templates, you will probably want to create custom templates to reduce the times when they have to specify individual options. For more information, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

For the cases where users must apply information protection themselves, be sure to provide them with instructions and guidance how and when to do this. The instructions should be specific for the application and versions that they use and how they use them, and the guidance for when and how to apply information protection should be appropriate for your business. For more information, see [Helping users to protect files by using Azure Rights Management](../deploy-use/help-users.md).

For information about how to configure these applications for Azure RMS, see [Configuring applications for Azure Rights Management](../deploy-use/configure-applications.md).

> [!TIP]
> For examples and screenshots of applications using Azure RMS, see [Azure RMS in action: What administrators and users see](what-admins-users-see.md).

Search services can integrate with Rights Management in different ways. For example: 

- Exchange Online and Exchange Server use service-side indexing so that a user's RMS-protected emails are automatically displayed in their search results. 

- SharePoint Online and SharePoint Server apply RMS protection to files only on download, which means that indexing and search results on SharePoint are not affected by this document protection solution. However, if you have a document that you want to store in SharePoint and should not be returned in search results, RMS-protect the file before uploading it to SharePoint.

- Windows desktop search uses a shared index between different users of the device, so to keep the data in the protected documents secure, it does not index RMS-protected files. This means that although your search results don’t include files that you have protected, you can be assured that your files containing sensitive data will not be displayed in search results for other users who might sign in to or connect to your PC. 



## Next steps

Learn more about how each of the following supports Azure RMS:

-   [RMS sharing application for Windows and mobile platforms](sharing-app-support.md)

-   [Office applications and services](office-apps-services-support.md)

-   [File servers that run Windows Server and use File Classification Infrastructure (FCI)](file-server-support.md)

-   [Other applications that support the RMS APIs](api-support.md)

