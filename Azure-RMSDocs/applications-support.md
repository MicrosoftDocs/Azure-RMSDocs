---
# required metadata

title: How apps support Azure Rights Management from AIP
description: Understand how the most commonly used applications (such as Office apps) and services (such as Exchange and SharePoint) can use the Azure Rights Management service from Azure Information Protection to help protect your organization's documents and emails. 
author: aashishr
ms.author: aashishr
manager: aashishr
ms.date: 06/06/2021
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: 2cdc7bde-4044-4021-b887-11476f99afd9

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin

---

# How applications support the Azure Rights Management service

Use the following information to help you understand how the most commonly used end-user applications and services can use the Azure Rights Management service from Azure Information Protection to help protect your organization's documents and emails. These applications include Word, Excel, PowerPoint, and Outlook. The services include Exchange and Microsoft SharePoint.

> [!NOTE]
> To verify the applications and versions that the Azure Rights Management service supports, see [Applications that support Azure Rights Management data protection](./requirements-applications.md).

In some cases, the Azure Rights Management service automatically applies protection, according to policies that administrators configure. For example, this is the case with SharePoint libraries and Exchange transport rules. In other cases, end users must apply the protection themselves from their applications. For example, users select a classification label that is configured to apply protection, or they select a template, or select specific options. Protection that is applied by users is typical when users protect a file to share and they also restrict access or usage to selected users or to users outside the organization.

Templates make it easier for users (and administrators who configure policies) to apply the correct level of protection and restrict access to people inside your organization. Although the Azure Rights Management service comes with two default templates, you probably want to create custom templates to reduce the times when users and administrators have to specify individual options. For more information about templates, see [Configuring and managing templates for Azure Information Protection](/previous-versions/azure/information-protection/configure-policy-templates).

For the cases where users must apply the protection themselves, be sure to provide them with instructions and guidance how and when to do this. Make the instructions specific for the application and versions that they use and how they use them. Also provide guidance for when and how users should apply the protection that is appropriate for your business. For more information, see [Helping users to protect files by using the Azure Rights Management service](help-users.md).

For information about how to configure these applications for the Azure Rights Management service from Azure Information Protection, see [Configuring applications for Azure Rights Management](configure-applications.md).

Search services can integrate with Rights Management in different ways. For example: 

- Exchange Online and Exchange Server use service-side indexing so that a user's protected emails are automatically displayed in their search results. 

- Windows desktop search uses a shared index between different users of the device, so to keep the data in the protected documents secure, it does not index protected files. This means that although your search results don't include files that you have protected, you can be assured that your files that contain sensitive data are not displayed in search results for other users who might sign in to your PC, or connect to your PC. 

## Next steps

Learn more about how each of the following applications and services supports the Azure Rights Management service:

-   [Office applications and services](office-apps-services-support.md)

-   [File servers that run Windows Server and use File Classification Infrastructure (FCI)](file-server-support.md)

-   [Other applications that support the RMS APIs](api-support.md)