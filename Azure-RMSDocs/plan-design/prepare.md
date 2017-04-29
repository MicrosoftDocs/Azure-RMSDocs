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

Before you deploy Azure Information Protection for your organization, make sure that you have accounts for users and groups in Azure AD for your organization's tenant.

There are different ways to create these users and groups, which include:

- You create the users in the Office 365 admin center, and the groups in the Exchange Online admin center.

- You create the users and groups in the Azure portal.

- You create the users and group by using Azure AD PowerShell and Exchange Online cmdlets.

- You create the users and groups in your on-premises Active Directory and synchronize them to Azure AD.

- You create the users and groups in another directory and synchronize them to Azure AD.

When you create users and groups by using the first three methods from this list, they are automatically created in Azure AD, and Azure Information Protection can use these accounts directly. However, many enterprise networks use an on-premises directory to create and manage users and groups. Azure Information Protection cannot use these accounts directly; you must synchronize them to Azure AD.

## How users and groups are used by Azure Information Protection

There are three scenarios for using users and groups with Azure Information Protection:

- For assigning labels to users when you use labeling and classification. Applicable for administrators only:
    
    -The default Azure Information Protection policy is automatically assigned to all users in your tenant's Azure AD. However, you can also assign additional labels to specified users or groups by using scoped policies.

- For assigning usage rights and access controls when you use the Azure Rights Management service to protect documents and emails. Applicable for administrators and users:
    
    - Usage rights determine whether a user can open a document or email and how they can use it. For example, whether they can only read it, or read and print it, or read and edit it. 
    
    - Access controls include an expiry date and whether a connection to the Internet is required for access. 

- For administration of the Azure Rights Management service to support specific scenarios, and therefore applicable to administrators only. Examples include configuring the following:
    
    - Super users, so that designated services or people can open encrypted content if required for eDiscovery or data recovery.
    
    - Delegated administration of the Azure Rights Management service.
    
    - Onboarding controls to support a phased deployment.

## Azure Information Protection requirements for users

The requirements for users are the same for all three scenarios listed in the previous section. To authorize users, two attributes in Azure AD are used: **ProxyAddresses** and **UserPrincipalName**.

The Azure AD ProxyAddresses attribute stores all email addresses for an account and can be populated in different ways. For example, a user in Office 365 that has an Exchange Online mailbox will automatically have an email address that is stored in this attribute. If you assign an alternative email address for an Office 365 user, it is also saved in this attribute. It can also be populated by the email addresses that are synchronized from on-premises accounts.

The **UserPrincipalName** attribute is used only when an account doesn't have values in the Azure AD ProxyAddresses attribute. For example, you create a user in the Azure portal, or create a user for Office 365 that doesn't have a mailbox.

## Azure Information Protection requirements for groups

For assigning labels, and for assigning usage rights and access controls:

- You can use any type of group in Azure AD that has an email address. This is often referred to as a mail-enabled group. For example, you can use a mail-enabled security group, a distribution group (which can be static or dynamic), and an Office 365 group. You cannot use a security group (dynamic or static) because this group type doesn't have an email address.

For administration of the Azure Rights Management service:

- With just one exception, you can always use any type of group in Azure AD that has an email address. That exception is when you configure onboarding controls to use a group, and that group must be a security group in Azure AD.
    
- In addition, you can also use a security group in Azure AD for delegated administration of the Azure Rights Management service.

## Using accounts from Active Directory on-premises for Azure Information Protection

If you have accounts that are managed on-premises that you want to use with Azure Information Protection, you must synchronize these to Azure AD. For ease of deployment, we recommend that you use [Azure AD Connect](/azure/active-directory/connect/active-directory-aadconnect). However, you can use any directory synchronization method that achieves the same result.

When you synchronize your accounts, you do not need to synchronize all attributes. For a list of the attributes that must be synchronized, see the [Azure RMS section](/azure/active-directory/connect/active-directory-aadconnectsync-attributes-synchronized#azure-rms) from the Azure Active Directory documentation. 

From the attributes list for Azure Rights Management, you'll see that for users, the on-premises AD attributes of **mail**, **proxyAddresses**, and **userPrincipalName** are required for synchronization. Values for **mail** and **proxyAddresses** are synchronized to the Azure AD proxyAddress attribute. For more information, see [How the proxyAddresses attribute is populated in Azure AD](https://support.microsoft.com/help/3190357/how-the-proxyaddresses-attribute-is-populated-in-azure-ad)

## Confirming your users and groups are prepared for Azure Information Protection

You can use Azure AD PowerShell to confirm that users and groups can be used by Azure Information Protection, and the values that can be used to authorize them. 

For example, using the V1 PowerShell module for Azure Active Directory, [M​SOnline](/powershell/module/msonline/?view=azureadps-1.0), first connect to the service and supply your global admin credentials:

	Connect-MsolService
    
To confirm users, use the following command:
    
	Get-Msoluser | select DisplayName, UserPrincipalName, ProxyAddresses
        
First, make sure that the users you want to use with Azure Information Protection are displayed. 

Then check whether the **ProxyAddresses** column is populated. If it is, the email values in this column can be used to authorize the user for Azure Information Protection. 

If the **ProxyAddresses** column is not populated, the value in the **UserPrincipalName** will be used to authorize the user for Azure Information Protection.

For example: 
    
|Display Name|UserPrincipalName|ProxyAddresses
|-------------------|-----------------|--------------------|
|Jagannath Reddy |jagannathreddy@contoso.com|{}|
|Ankur Roy|ankurroy@contoso.com|{SMTP:ankur.roy@contoso.com, smtp: ankur.roy@onmicrosoft.contoso.com}|

In this example:

- The user account for Jagannath Reddy will be authorized by **jagannathreddy@contoso.com**.

-  The user account for Ankur Roy can be authorized by using **ankur.roy@contoso.com** and **ankur.roy@onmicrosoft.contoso.com**, but not **ankurroy@contoso.com**.

To confirm groups, use the following command:
         
	Get-MsolGroup | select DisplayName, ProxyAddresses

Make sure that the groups you want to use with Azure Information Protection are displayed. For the groups displayed, the email addresses in the **ProxyAddresses** column can be used to authorize the group members for Azure Information Protection.

For the two administration scenarios that use security groups, you can use the following PowerShell command to find the object ID and display name that might be needed to specify these groups:

	Get-MsolGroup | where {$_.GroupType -eq "Security"}	

For onboarding controls, you must specify the object ID. For delegated administration, if you want to use a security group instead of a mail-enabled group, you can specify the object ID or display name. If you prefer, you can also use the Azure portal to copy the values for the object ID and the display name.

## Considerations for Azure Information Protection if email addresses change

If you change the email address of a user or group, we recommend that you add the old email address as a second email address (also known as a proxy address, alias, or alternate email address) to the user or group. When you do this, the old email address is added to the Azure AD ProxyAddresses attribute. This account administration ensure business continuity for any usage rights or other configurations that the Azure Rights Management service saved when the old email address was in use. 

If you cannot do this, the user or group with the new email address risks being denied access to documents and emails that were previously protected. In this case, you must grant them access again.

Note that it's rare for a group to change its email address and if you assign usage rights to a group rather to than individual users, it doesn't matter if the user's email address changes. In this scenario, the usage rights are assigned to the group email address and not individual user email addresses. This is the most likely (and recommended) method for an administrator to configure usage rights that protect documents and emails. However, users might more typically assign custom permissions for individual users. Because you cannot always know whether a user account or group has been used to grant access, it's safest to always add the old email address as a second email address.

## Group membership caching by Azure Information Protection

For performance reasons, group membership is cached by Azure Information Protection. This means that any changes to group membership can take up to 3 hours to take effect, and this time period is subject to change. Remember to factor this delay into any changes or testing that you do when you use groups in your configuration of the Azure Rights Management service, such as configuring [custom templates](../deploy-use/configure-custom-templates.md) or when you use a group for the [super user feature](../deploy-use/configure-super-users.md). 


## Next steps

When you have confirmed that your users and groups can be used with the Azure Rights Management service, and you are ready to start protecting documents and emails, activate the Rights Management service to enable this data protection service. For more information, see [Activating Azure Rights Management](../deploy-use/activate-service.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]


