---
# required metadata

title: Prepare for Azure Rights Management protection - AIP
description: Check that you have everything ready to use the Azure Rights Management service, so that your organization can protect documents and emails.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 03/28/2017
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

### Group membership caching

For performance reasons, group membership is cached by the Azure Rights Management service. This means that any changes to group membership can take up to 3 hours to take effect, and this time period is subject to change. Remember to factor this delay into any changes or testing that you do when you use groups in your configuration of the Azure Rights Management service, such as configuring [custom templates](../deploy-use/configure-custom-templates.md) or when you use a group for the [super user feature](../deploy-use/configure-super-users.md). 

### Considerations if email addresses change

When you configure usage rights for users or groups and select them by their display name, your selection saves and uses that object's email address. If the email address is later changed, your selected users will not be successfully authorized.

If email addresses are changed, we recommend you add the old email address as a proxy email address (also known as an alias or alternate email address) to the user or group, so that usage rights that were assigned previously are retained. If you cannot do that, you must remove the user or group from your configuration, and select it again to save the updated email address so that newly protected content uses the new email address.

Custom Rights Management templates are an example of where you might select users or groups by the display name to assign usage rights. Users can also select users and groups by their display name when they configure custom permissions with the Azure Information Protection client.

## Activate the Rights Management service for data protection
When you are ready to start protecting documents and emails, activate the Rights Management service to enable this technology. For more information, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


