---
# required metadata

title: Preparing for Azure Rights Management protection| Azure Information Protection
description: Check that you have everything ready to use the Azure Rights Management service, so that your organization can protect documents and emails.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 09/25/2016
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: afbca2d6-32a7-4bda-8aaf-9f93f5da5abc

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Preparing for Azure Information Protection

>*Applies to: Azure Information Protection, Office 365*

Before you deploy Azure Information Protection for your organization, make sure that the following are in place:

-   User accounts and groups in the cloud that you create manually or that are automatically created and synchronized from Active Directory Domain Services (AD DS).

    When you synchronize your on-premises accounts and groups, not all attributes need to be synchronized. For a list of the attributes that must be synchronized for the Azure Rights Management service that is used by Azure Information Protection, see the [Azure RMS section](/active-directory/active-directory-aadconnectsync-attributes-synchronized#azure-rms) from the Azure Active Directory documentation. For ease of deployment, we recommend that you use [Azure AD Connect](/active-directory/active-directory-aadconnectsync-whatis) to connect your on-premises directories with Azure Active Directory but you can use any directory synchronization method that achieves the same result.

-   Mail-enabled groups in the cloud that you will use with Azure Information Protection. These can be built-in groups or manually created groups that contain users who will use protected documents and emails.

    If you have Exchange Online, you can create and use mail-enabled groups by using the Exchange admin center. If you have AD DS and are synchronizing to Azure AD, you can create and use mail-enabled groups that are either security groups or distribution groups.

## Activate the Rights Management service for data protection
When you are ready to start protecting documents and emails, activate the Rights Management service to enable this technology. For more information, see [Activating Azure Rights Management](../deploy-use/activate-service.md).



