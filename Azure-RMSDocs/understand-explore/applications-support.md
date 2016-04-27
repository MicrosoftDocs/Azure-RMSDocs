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

*Applies to: Azure Rights Management, Office 365*

Use the following information to help you understand how the most commonly used end-user applications (such as the Office applications, Word, Excel, PowerPoint, and Outlook) and services (such as Exchange and SharePoint) can use Microsoft [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] to help protect your organization’s data. 
> [!NOTE]
> To verify the applications and versions that [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] (Azure RMS) supports, see [Requirements for Azure Rights Management](../get-started/requirements-azure-rms.md).

In some cases, information protection is automatically applied, according to policies that you configure. For example, this is the case with SharePoint libraries, classified files, and Exchange transport rules. In other cases, users must apply information protection themselves from their applications, either by selecting a template or by selecting specific options. For example, this is the case when users share a file by email, or protect a file in-place by restricting access or usage to selected users or to users outside the organization.

Templates make it easier for users (and administrators who configure policies) to apply the correct level of protection and restrict access to people inside your organization. Although [!INCLUDE[aad_rightsmanagement_1](../includes/aad_rightsmanagement_1_md.md)] comes with two default templates, you will probably want to create custom templates to reduce the times when they have to specify individual options. For more information, see [Configuring custom templates for Azure Rights Management](../deploy-use/configure-custom-templates.md).

For the cases where users must apply information protection themselves, be sure to provide them with instructions and guidance how and when to do this. The instructions should be specific for the application and versions that they use and how they use them, and the guidance for when and how to apply information protection should be appropriate for your business. For more information, see [Helping users to protect files by using Azure Rights Management](../deploy-use/help-users.md).

For information about how to configure these applications for Azure RMS, see [Configuring applications for Azure Rights Management](../deploy-use/configure-applications.md).

> [!TIP]
> For examples and screenshots of applications using Azure RMS, see [Azure RMS in action: What administrators and users see](what-admins-users-see.md).

Search and indexing solutions can integrate with RMS-protected content, but how they do this depends on whether the index is integrated into a server solution or runs in the user context: 

- Server solutions such as Microsoft Exchange and SharePoint create and manage the index and search results. When these solutions support Rights Management, they can use the Rights Management super user feature to decrypt protected content before indexing it. Information protection solutions from software vendors can also make use of the super user feature in this way to also index protected files. Although search operations return results for protected content in these scenarios, these solutions must implement additional safeguards to ensure that the index is protected from malicious or accidental disclosure. In addition, if these safeguards are not implemented, these solutions could enable users to see the indexed results of the protected content, even if they don't have RMS permissions to view the protected content itself.

- Indexing services that run in the user context (such as when a user searches in Explorer on a PC) don’t use the super user feature. To support Rights Management and return just the files that the logged on user is allowed to see, the indexing service must run Rights Management in the user context. Currently, the Windows indexing service does not support Rights Management, which means that RMS-protected files do not appear in Windows search results, independently from users’ RMS permissions to view them. 


## Next steps

Learn more about how each of the following supports Azure RMS:

-   [RMS sharing application for Windows and mobile platforms](sharing-app-support.md)

-   [Office applications and services](office-apps-services-support.md)

-   [File servers that run Windows Server and use File Classification Infrastructure (FCI)](file-server-support.md)

-   [Other applications that support the RMS APIs](api-support.md)

