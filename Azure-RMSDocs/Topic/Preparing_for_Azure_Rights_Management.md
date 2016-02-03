---
title: Preparing for Azure Rights Management
ms.custom: na
ms.reviewer: na
ms.service: rights-management
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: afbca2d6-32a7-4bda-8aaf-9f93f5da5abc
author: Cabailey
---
# Preparing for Azure Rights Management
After you have signed up for a cloud subscription and established your organization with an account for [!INCLUDE[o365_1](../Token/o365_1_md.md)] or Azure Active Directory, you’re ready to enable the [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] service.

However, before you do so, make sure that the following are in place:

-   User accounts and groups in the cloud that you create manually or that are automatically created and synchronized from Active Directory Domain Services (AD DS).

    When you synchronize your on-premises accounts and groups, not all attributes need to be synchronized. For a list of the attributes that must be synchronized for Azure RMS, see this [Azure RMS section](https://azure.microsoft.com/documentation/articles/active-directory-aadconnectsync-attributes-synchronized/) from the Azure Active Directory documentation. For ease of deployment, we recommend that you use [Azure AD Connect](http://azure.microsoft.com/documentation/articles/active-directory-aadconnect/) to connect your on-premises directories with Azure Active Directory but you can use any directory synchronization method that achieves the same result.

-   Mail-enabled groups in the cloud that you will use with Rights Management. These can be built-in groups or manually created groups that contain users who will use Rights Management.

    If you have Exchange Online, you can create and use mail-enabled groups by using the Exchange admin center. If you have AD DS and are synchronizing to Azure AD, you can create and use mail-enabled groups that are either security groups or distribution groups.

## Enable Rights Management
By default, [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] is disabled when you sign up for your [!INCLUDE[o365_2](../Token/o365_2_md.md)] or Azure AD account. To enable [!INCLUDE[aad_rightsmanagement_2](../Token/aad_rightsmanagement_2_md.md)] for your organization, you must activate the service. For more information, see [Activating Azure Rights Management](../Topic/Activating_Azure_Rights_Management.md).

## See Also
[Configuring Azure Rights Management](../Topic/Configuring_Azure_Rights_Management.md)

