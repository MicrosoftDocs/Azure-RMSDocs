---
# required metadata

title: Prepare for Azure Rights Management protection - AIP
description: Check that you have everything ready to use the Azure Rights Management service, so that your organization can protect documents and emails.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/21/2017
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

Before you deploy Azure Information Protection for your organization, make sure that you have accounts for users and groups in the cloud and that they have one or more email addresses. 

You can create these users and groups directly in Office 365 with Exchange Online, or you can create them on-premises and synchronize them from Active Directory Domain Services (AD DS).

## Type of groups supported

You can use any type of group (for example, security, distribution, Office 365). The only requirement is that the group has an email address. This is often referred to as a mail-enabled group.

## Email address requirements

The Azure Rights Management service from Azure Information Protection uses the email address to identify accounts. More specifically, it uses the **Azure AD proxyAddress** attribute, which stores all email addresses for an account. 

This attribute can be populated in different ways. For example, a user in Office 365 that has an Exchange Online mailbox will automatically have an email address that is stored in this attribute. If you assign an alternative email address an Office 365 user, it is also saved in this attribute. It can also be populated by email addresses that are synchronized from on-premises accounts. 

## Using accounts from Active Directory on-premises

If you have accounts that are managed on-premises that you want to use with the Azure Rights Management service, you must synchronize these to Azure AD. For ease of deployment, we recommend that you use [Azure AD Connect](/azure/active-directory/connect/active-directory-aadconnect). However, you can use any directory synchronization method that achieves the same result.

When you synchronize your accounts, you do not need to synchronize all attributes. For a list of the attributes that must be synchronized for the Azure Rights Management service, see the [Azure RMS section](/azure/active-directory/connect/active-directory-aadconnectsync-attributes-synchronized#azure-rms) from the Azure Active Directory documentation. 

From the attributes list for Azure Rights Management, you'll see that the on-premises AD attributes of **mail** and **proxyAddresses** are both required for synchronization. Values from these on-premises attributes are synchronized to the Azure AD proxyAddress attribute. Providing the accounts have an email address in one or both of these attributes, you can use the synchronized account with the Azure Rights Management service.

For more information about how the Azure AD proxyAddress attribute is populated, see [How the proxyAddresses attribute is populated in Azure AD](https://support.microsoft.com/help/3190357/how-the-proxyaddresses-attribute-is-populated-in-azure-ad).

## Confirming your users and groups are prepared

You can use Azure AD PowerShell to confirm that an account can be used by Azure Rights Management. Verify that the user or group has an email address assigned as an Azure AD **proxyaddresses** value. 

For example, using the V1 PowerShell module for Azure Active Directory, [M​SOnline](/powershell/module/msonline/?view=azureadps-1.0):

1. Connect to the service and supply your global admin credentials:
    
	Connect-MsolService
    
2. Run the following commands:
    
    - For users:
        
			get-msoluser | select display name, proxyaddresses
        
    - For groups:
         
			get-msolgroup | select displayname, proxyaddresses

3. Confirm that the users and groups that you want to use with Azure Rights Management have one or more email addresses. For example:
    
    |Display Name|ProxyAddresses|
    |-------------------|------------------------------|
    |Ankur Roy|{SMTP:ankur.roy@constoso.com, smtp: ankur.roy@onmicrosoft.constoso.com}|
    |Jagannath Reddy |{}|
    
    In this example, the user account for Ankur Roy can be used with the Azure Rights Management service but the user account for Jagannath Reddy cannot be used with the Azure Rights Management service.

## Considerations if email addresses change

If you change the email address of a user or group, we recommend that you add the old email address as a second email address (also known as a proxy address, alias, or alternate email address) to the user or group. When you do this, you ensure business continuity for any usage rights or other configurations that the Azure Rights Management service saved when the old email address was in use. 

If you cannot do this, the user or group with the new email address risks being denied access to documents and emails that were previously protected. In this case, you must grant them access again.

Note that it's rare for a group to change its email address and if you assign rights to a group rather than individual users, it doesn't matter if the user's email address changes. The rights are assigned to the group email address and not individual user email addresses. This is the most likely (and recommended) method for an administrator to configure usage rights. However, users might more typically assign custom permissions for individual users. Because you cannot always know whether a user account or group has been used to grant access, it's safest to always add the old email address as a second email address.

## Group membership caching

For performance reasons, group membership is cached by the Azure Rights Management service. This means that any changes to group membership can take up to 3 hours to take effect, and this time period is subject to change. Remember to factor this delay into any changes or testing that you do when you use groups in your configuration of the Azure Rights Management service, such as configuring [custom templates](../deploy-use/configure-custom-templates.md) or when you use a group for the [super user feature](../deploy-use/configure-super-users.md). 


## Next steps

When you have confirmed that your users and groups can be used with the Azure Rights Management service, and you are ready to start protecting documents and emails, activate the Rights Management service to enable this data protection service. For more information, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


