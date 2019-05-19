---
# required metadata

title: Prepare users and groups for Azure Information Protection
description: Check that you have the user and group accounts that you need to start classifying, labeling, and protecting your organization's documents and emails.
author: cabailey
ms.author: cabailey
manager: barbkess
ms.date: 02/15/2019
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
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

# Preparing users and groups for Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

Before you deploy Azure Information Protection for your organization, make sure that you have accounts for users and groups in Azure AD for your organization's tenant.

There are different ways to create these accounts for users and groups, which include:

- You create the users in the Microsoft 365 admin center, and the groups in the Exchange Online admin center.

- You create the users and groups in the Azure portal.

- You create the users and group by using Azure AD PowerShell and Exchange Online cmdlets.

- You create the users and groups in your on-premises Active Directory and synchronize them to Azure AD.

- You create the users and groups in another directory and synchronize them to Azure AD.

When you create users and groups by using the first three methods from this list, with one exception, they are automatically created in Azure AD, and Azure Information Protection can use these accounts directly. However, many enterprise networks use an on-premises directory to create and manage users and groups. Azure Information Protection cannot use these accounts directly; you must synchronize them to Azure AD.

The exception referred to in the previous paragraph is dynamic distribution lists that you can create for Exchange Online. Unlike static distribution lists, these groups are not replicated to Azure AD and so cannot be used by Azure Information Protection. 

## How users and groups are used by Azure Information Protection

There are three scenarios for using users and groups with Azure Information Protection:

**For assigning labels to users** when you configure the Azure Information Protection policy so that labels can be applied to documents and emails. Only administrators can select these users and groups:

- The default Azure Information Protection policy is automatically assigned to all users in your tenant's Azure AD. However, you can also assign additional labels to specified users or groups by using scoped policies.     

**For assigning usage rights and access controls** when you use the Azure Rights Management service to protect documents and emails. Administrators and users can select these users and groups:

- Usage rights determine whether a user can open a document or email and how they can use it. For example, whether they can only read it, or read and print it, or read and edit it. 

- Access controls include an expiry date and whether a connection to the Internet is required for access. 

**For configuring the Azure Rights Management service** to support specific scenarios, and therefore only administrators select these groups. Examples include configuring the following:

- Super users, so that designated services or people can open encrypted content if required for eDiscovery or data recovery.

- Delegated administration of the Azure Rights Management service.

- Onboarding controls to support a phased deployment.

## Azure Information Protection requirements for user accounts

For assigning labels:

- All user accounts in Azure AD can be used to configure scoped policies that assign additional labels to users.

For assigning usage rights and access controls, and configuring the Azure Rights Management service:

- To authorize users, two attributes in Azure AD are used: **proxyAddresses** and **userPrincipalName**.

- The **Azure AD proxyAddresses** attribute stores all email addresses for an account and can be populated in different ways. For example, a user in Office 365 that has an Exchange Online mailbox automatically has an email address that is stored in this attribute. If you assign an alternative email address for an Office 365 user, it is also saved in this attribute. It can also be populated by the email addresses that are synchronized from on-premises accounts. 

    Azure Information Protection can use any value in this Azure AD proxyAddresses attribute, providing the domain has been added to your tenant (a "verified domain"). For more information about verifying domains:

    - For Azure AD: [Add a custom domain name to Azure Active Directory](/azure/active-directory/fundamentals/add-custom-domain)

    - For office 365: [Add a domain to Office 365](/office365/admin/setup/add-domain?view=o365-worldwide)

- The **Azure AD userPrincipalName** attribute is used only when an account in your tenant doesn't have values in the Azure AD proxyAddresses attribute. For example, you create a user in the Azure portal, or create a user for Office 365 that doesn't have a mailbox.

### Assigning usage rights and access controls to external users

In addition to using the Azure AD proxyAddresses and Azure AD userPrincipalName for users in your tenant, Azure Information Protection also uses these attributes in the same way to authorize users from another tenant.

Other authorization methods:

- For email addresses that are not in Azure AD, Azure Information Protection can authorize these when they are authenticated with a Microsoft account. However, not all applications can open protected content when a Microsoft account is used for authentication. [More information](./secure-collaboration-documents.md#supported-scenarios-for-opening-protected-documents)

- When an email is sent by using Office 365 Message Encryption with new capabilities to a user who doesn't have an account in Azure AD, the user is first authenticated by using federation with a social identity provider or by using a one-time passcode. Then the email address specified in the protected email is used to authorize the user.

## Azure Information Protection requirements for group accounts

For assigning labels:

- To configure scoped policies that assign additional labels to group members, you can use any type of group in Azure AD that has an email address that contains a verified domain for the user's tenant. A group that has an email address is often referred to as a mail-enabled group.

    For example, you can use a mail-enabled security group, a static distribution group, and an Office 365 group. You cannot use a security group (dynamic or static) because this group type doesn't have an email address. You also cannot use a dynamic distribution list from Exchange Online because this group isn't replicated to Azure AD.

For assigning usage rights and access controls:

- You can use any type of group in Azure AD that has an email address that contains a verified domain for the user's tenant. A group that has an email address is often referred to as a mail-enabled group. 

For configuring the Azure Rights Management service:

- You can use any type of group in Azure AD that has an email address from a verified domain in your tenant, with one exception. That exception is when you configure onboarding controls to use a group, which must be a security group in Azure AD for your tenant.

- You can use any group in Azure AD (with or without an email address) from a verified domain in your tenant for delegated administration of the Azure Rights Management service.

### Assigning usage rights and access controls to external groups

In addition to using the Azure AD proxyAddresses for groups in your tenant, Azure Information Protection also uses this attribute in the same way to authorize groups from another tenant.

## Using accounts from Active Directory on-premises for Azure Information Protection

If you have accounts that are managed on-premises that you want to use with Azure Information Protection, you must synchronize these to Azure AD. For ease of deployment, we recommend that you use [Azure AD Connect](/azure/active-directory/hybrid/whatis-azure-ad-connect). However, you can use any directory synchronization method that achieves the same result.

When you synchronize your accounts, you do not need to synchronize all attributes. For a list of the attributes that must be synchronized, see the [Azure RMS section](/azure/active-directory/connect/active-directory-aadconnectsync-attributes-synchronized#azure-rms) from the Azure Active Directory documentation.

From the attributes list for Azure Rights Management, you see that for users, the on-premises AD attributes of **mail**, **proxyAddresses**, and **userPrincipalName** are required for synchronization. Values for **mail** and **proxyAddresses** are synchronized to the Azure AD proxyAddresses attribute. For more information, see [How the proxyAddresses attribute is populated in Azure AD](https://support.microsoft.com/help/3190357/how-the-proxyaddresses-attribute-is-populated-in-azure-ad)

## Confirming your users and groups are prepared for Azure Information Protection

You can use Azure AD PowerShell to confirm that users and groups can be used with Azure Information Protection. You can also use PowerShell to confirm the values that can be used to authorize them. 

For example, using the V1 PowerShell module for Azure Active Directory, [MSOnline](/powershell/module/msonline/?view=azureadps-1.0), in a PowerShell session, first connect to the service and supply your global admin credentials:

    Connect-MsolService


Note: If this command doesn't work, you can run `Install-Module MSOnline` to install the MSOnline module.

Next, configure your PowerShell session so that it doesn't truncate the values:

    $Formatenumerationlimit =-1

### Confirm user accounts are ready for Azure Information Protection

To confirm the user accounts, run the following command:

    Get-Msoluser | select DisplayName, UserPrincipalName, ProxyAddresses

Your first check is to make sure that the users you want to use with Azure Information Protection are displayed.

Then check whether the **ProxyAddresses** column is populated. If it is, the email values in this column can be used to authorize the user for Azure Information Protection.

If the **ProxyAddresses** column is not populated, the value in the **UserPrincipalName** is used to authorize the user for the Azure Rights Management service.

For example:


|  Display Name   |     UserPrincipalName      |                            ProxyAddresses                             |
|-----------------|----------------------------|-----------------------------------------------------------------------|
| Jagannath Reddy | jagannathreddy@contoso.com |                                  {}                                   |
|    Ankur Roy    |    ankurroy@contoso.com    | {SMTP:ankur.roy@contoso.com, smtp: ankur.roy@onmicrosoft.contoso.com} |

In this example:

- The user account for Jagannath Reddy will be authorized by <strong>jagannathreddy@contoso.com</strong>.

- The user account for Ankur Roy can be authorized by using <strong>ankur.roy@contoso.com</strong> and <strong>ankur.roy@onmicrosoft.contoso.com</strong>, but not <strong>ankurroy@contoso.com</strong>.

In most cases, the value for UserPrincipalName matches one of the values in the ProxyAddresses field. This is the recommended configuration but if you cannot change your UPN to match the email address, you must take the following steps:

1. If the domain name in the UPN value is a verified domain for your Azure AD tenant, add the UPN value as another email address in Azure AD so that the UPN value can now be used to authorize the user account for Azure Information Protection.

    If the domain name in the UPN value is not a verified domain for your tenant, it cannot be used with Azure Information Protection. However, the user can still be authorized as a member of a group when the group email address uses a verified domain name.

2. If the UPN is not routable (for example, <strong>ankurroy@contoso.local</strong>), configure alternate login ID for users and instruct them how to sign in to Office by using this alternate login. You must also set a registry key for Office.

    For more information, see [Configuring Alternate Login ID](/windows-server/identity/ad-fs/operations/configuring-alternate-login-id) and [Office applications periodically prompt for credentials to SharePoint Online, OneDrive, and Lync Online](https://support.microsoft.com/help/2913639/office-applications-periodically-prompt-for-credentials-to-sharepoint-online,-onedrive,-and-lync-online).

> [!TIP]
> You can use the Export-Csv cmdlet to export the results to a spreadsheet for easier management, such as searching and bulk-editing for import.
>
> For example: `Get-MsolGroup | select DisplayName, ProxyAddresses | Export-Csv -Path UserAccounts.csv`

### Confirm group accounts are ready for Azure Information Protection

To confirm group accounts, use the following command:

    Get-MsolGroup | select DisplayName, ProxyAddresses

Make sure that the groups you want to use with Azure Information Protection are displayed. For the groups displayed, the email addresses in the **ProxyAddresses** column can be used to authorize the group members for the Azure Rights Management service.

Then check that the groups contain the users (or other groups) that you want to use for Azure Information Protection. You can use PowerShell to do this (for example, [Get-MsolGroupMember](/powershell/module/msonline/Get-MsolGroupMember?view=azureadps-1.0)), or use your management portal.

For the two Azure Rights Management service configuration scenarios that use security groups, you can use the following PowerShell command to find the object ID and display name that can be used to identify these groups. You can also use the Azure portal to find these groups and copy the values for the object ID and the display name:

    Get-MsolGroup | where {$_.GroupType -eq "Security"}

## Considerations for Azure Information Protection if email addresses change

If you change the email address of a user or group, we recommend that you add the old email address as a second email address (also known as a proxy address, alias, or alternate email address) to the user or group. When you do this, the old email address is added to the Azure AD proxyAddresses attribute. This account administration ensures business continuity for any usage rights or other configurations there were saved when the old email address was in use. 

If you cannot do this, the user or group with the new email address risks being denied access to documents and emails that were previously protected with the old email address. In this case, you must repeat the protection configuration to save the new email address. For example, if the user or group was granted usage rights in templates or labels, edit those templates or labels and specify the new email address with same usage rights as you granted to the old email address.

Note that it's rare for a group to change its email address and if you assign usage rights to a group rather to than individual users, it doesn't matter if the user's email address changes. In this scenario, the usage rights are assigned to the group email address and not individual user email addresses. This is the most likely (and recommended) method for an administrator to configure usage rights that protect documents and emails. However, users might more typically assign custom permissions for individual users. Because you cannot always know whether a user account or group has been used to grant access, it's safest to always add the old email address as a second email address.

## Group membership caching by Azure Information Protection

For performance reasons, Azure Information Protection caches group membership. This means that any changes to group membership in Azure AD can take up to three hours to take effect when these groups are used by Azure Information Protection and this time period is subject to change. 

Remember to factor this delay into any changes or testing that you do when you use groups for granting usage rights or configuring the Azure Rights Management service, or when you configure scoped policies.


## Next steps

When you have confirmed that your users and groups can be used with Azure Information Protection and you are ready to start protecting documents and emails, check whether you need to activate the Azure Rights Management service. This service must be activated before you can protect your organization's documents and emails: 

- Beginning with February 2018: If your subscription that includes Azure Rights Management or Azure Information Protection was obtained during or after this month, the service is automatically activated for you. 

- If your subscription was obtained before February 2018: You must activate the service yourself. 

For more information, which includes checking the activation status, see [Activating the protection service from Azure Information Protection](./activate-service.md).

