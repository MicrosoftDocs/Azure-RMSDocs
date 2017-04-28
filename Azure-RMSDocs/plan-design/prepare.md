---
# required metadata

title: Prepare for Azure Rights Management protection - AIP
description: Check that you have everything ready to use the Azure Rights Management service, so that your organization can protect documents and emails.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/28/2017
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

Before you deploy Azure Information Protection for your organization, make sure that you have accounts for users and groups in Azure AD.

There are different ways to create these users and groups, which include:

- You create the users in the Office 365 admin center, and the groups in Exchange Online admin center.

- You create the users in the Azure portal.

- You create the users and groups on-premises and synchronize them from Active Directory Domain Services (AD DS) to Azure AD.

- You create the users and groups in another directory and synchronize them to Azure AD.


## Azure Rights Management requirements for groups

To authorize members of a group, the Azure Rights Management service can use any type of group in Azure AD that has an email address. This is often referred to as a mail-enabled group.

For example, you can use mail-enabled security group, a distribution group, and an Office 365 group.


## Azure Rights Management requirements for users

The Azure Rights Management service uses two attributes in Azure AD to authorize users: **Azure AD proxyAddress** and **UserPrincipalName**.

The **Azure AD proxyAddress** attribute stores all email addresses for an account and can be populated in different ways. For example, a user in Office 365 that has an Exchange Online mailbox will automatically have an email address that is stored in this attribute. If you assign an alternative email address an Office 365 user, it is also saved in this attribute. It can also be populated by the email addresses that are synchronized from on-premises accounts.

The **UserPrincipalName** attribute is used only when an account doesn't have values in the **Azure AD proxyAddress** attribute. For example, you create a user in the Azure portal, or a user for Office 365 that doesn't have a mailbox.


## Using accounts from Active Directory on-premises for Azure Rights Management

If you have accounts that are managed on-premises that you want to use with the Azure Rights Management service, you must synchronize these to Azure AD. For ease of deployment, we recommend that you use [Azure AD Connect](/azure/active-directory/connect/active-directory-aadconnect). However, you can use any directory synchronization method that achieves the same result.

When you synchronize your accounts, you do not need to synchronize all attributes. For a list of the attributes that must be synchronized for the Azure Rights Management service, see the [Azure RMS section](/azure/active-directory/connect/active-directory-aadconnectsync-attributes-synchronized#azure-rms) from the Azure Active Directory documentation. 

From the attributes list for Azure Rights Management, you'll see that for users, the on-premises AD attributes of **mail**, **proxyAddresses**, and **userPrincipalName** are required for synchronization. Values for **mail** and **proxyAddresses** are synchronized to the Azure AD proxyAddress attribute. For more information, see [How the proxyAddresses attribute is populated in Azure AD](https://support.microsoft.com/help/3190357/how-the-proxyaddresses-attribute-is-populated-in-azure-ad)


## Confirming your users and groups are prepared for Azure Rights Management

You can use Azure AD PowerShell to confirm that users and groups can be used by Azure Rights Management, and the email addresses that can be used to authorize them. 

For example, using the V1 PowerShell module for Azure Active Directory, [M​SOnline](/powershell/module/msonline/?view=azureadps-1.0):

1. Connect to the service and supply your global admin credentials:
    
		Connect-MsolService
    
2. To confirm users, use the following command:
    
		Get-Msoluser | select DisplayName, UserPrincipalName, Proxyaddresses
        
    First, make sure that the user you want to use with Azure Rights Management is displayed. Then check whether the **ProxyAddresses** column is populated. If it is, the email values in this column can be used to authorize the user for Azure Rights Management. If the **ProxyAddresses** column is not populated, the value in the **UserPrincipalName** will be used to authorize the user for Azure Rights Management.
    
    For example: 
    
    |Display Name|UserPrincipalName|ProxyAddresses|
    |-------------------|-------------------|------------------------------|
    |Jagannath Reddy |jagannathreddy@constoso.com|{}|
    |Ankur Roy|ankurroy@constoso.com|{SMTP:ankur.roy@constoso.com, smtp: ankur.roy@onmicrosoft.constoso.com}|
    
    
    In this example:
    
    - The user account for Jagannath Reddy will be authorized by **jagannathreddy@constoso.com**.
            
    -  The user account for Ankur Roy can be authorized by using **ankur.roy@constoso.com** and **ankur.roy@onmicrosoft.constoso.com**, but not **ankurroy@constoso.com**.

3. To confirm groups, use the following command:
         
			get-msolgroup | select DisplayNname, ProxyAddresses
    
    First, make sure that the group that you want to use with Azure Rights Management is displayed. For the groups displayed, the email addresses in the **ProxyAddresses** column can be used to authorize the group members for Azure Rights Management.

## Considerations for Azure Rights Management if email addresses change

If you change the email address of a user or group, we recommend that you add the old email address as a second email address (also known as a proxy address, alias, or alternate email address) to the user or group. When you do this, you ensure business continuity for any usage rights or other configurations that the Azure Rights Management service saved when the old email address was in use. 

If you cannot do this, the user or group with the new email address risks being denied access to documents and emails that were previously protected. In this case, you must grant them access again.

Note that it's rare for a group to change its email address and if you assign usage rights to a group rather to than individual users, it doesn't matter if the user's email address changes. In this scenario, the usage rights are assigned to the group email address and not individual user email addresses. This is the most likely (and recommended) method for an administrator to configure usage rights that protect documents and emails. However, users might more typically assign custom permissions for individual users. Because you cannot always know whether a user account or group has been used to grant access, it's safest to always add the old email address as a second email address.

## Group membership caching by Azure Rights Management

For performance reasons, group membership is cached by the Azure Rights Management service. This means that any changes to group membership can take up to 3 hours to take effect, and this time period is subject to change. Remember to factor this delay into any changes or testing that you do when you use groups in your configuration of the Azure Rights Management service, such as configuring [custom templates](../deploy-use/configure-custom-templates.md) or when you use a group for the [super user feature](../deploy-use/configure-super-users.md). 


## Next steps

When you have confirmed that your users and groups can be used with the Azure Rights Management service, and you are ready to start protecting documents and emails, activate the Rights Management service to enable this data protection service. For more information, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


