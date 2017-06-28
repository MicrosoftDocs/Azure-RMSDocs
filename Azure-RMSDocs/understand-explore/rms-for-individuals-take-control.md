---
# required metadata

title: Control the accounts created for RMS for individuals - AIP
description: How you can control the user accounts in Azure Active Directory if you do not want to convert your organization's RMS for individuals subscription to a paid subscription.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 02/23/2017
ms.topic: article
ms.prod:
ms.service: information-protection
ms.technology: techgroup-identity
ms.assetid: a83880d0-f0f9-4a32-9e00-2f6635d7cc8d

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---



# How administrators can control the accounts created for RMS for individuals

>*Applies to: Azure Information Protection*


If you do not want to convert your organization’s RMS for individuals subscription to a paid subscription, you can still control the user accounts in the Azure directory that was created for your organization in the following ways:

-   Implement directory integration solutions for Azure Active Directory and your Active Directory Domain Services infrastructure. You can synchronize accounts and passwords so that users will not have to create new accounts to use Rights Management and your on-premises password policies will apply to the new Azure user accounts. You can also synchronize passwords so that users do not have to remember a different password to use Rights Management.

-   You could prevent users from signing up to use Azure Rights Management with the RMS for individuals subscription. In most cases, there is little advantage in doing this because users will either share files without protection (which could put your company at risk), or will use another file protection mechanism that doesn’t provide the IT department with the option to access the data. However, if you want to prevent users from signing up to use RMS for individuals, do one of the following after you have taken ownership of your organization’s directory in Azure:

    -   Prevent all users from signing up for self-service subscriptions, which includes RMS for individuals.  Currently, you cannot set this by service; the setting applies to all Azure subscriptions that use the self-service process. To do this, set the **AllowAdHocSubscriptions** parameter to false with the [Set-MsolCompanySettings](http://technet.microsoft.com/library/dn194127.aspx) cmdlet from the PowerShell module for Azure Active Directory. For example: **Set-MsolCompanySettings -AllowAdHocSubscriptions $false**

    -   Prevent users from creating a new account in Azure, which means that only users who already have an account in Azure can sign up for self-service subscriptions, which includes RMS for individuals.  To do this, set the **AllowEmailVerifiedUsers** parameter to false with the [Set-MsolCompanySettings](http://technet.microsoft.com/library/dn194127.aspx) cmdlet from the PowerShell module for Azure Active Directory. For example: **Set-MsolCompanySettings -AllowEmailVerifiedUsers $false -AllowAdHocSubscriptions $true**

    -   Synchronize your Active Directory Domain Services infrastructure with Azure Active Directory. This action prevents new accounts from being created when users sign up for self-service subscriptions such as RMS for individuals, and you can delete or disable accounts that were previously created in the Azure directory.

To control the user accounts in the Azure directory, or to prevent users from signing up for RMS for individuals, you must have an Azure subscription and own the directory. If you don't already have an Azure subscription, you can obtain one without charge. If a directory was automatically created for you during the self-service process, take ownership of the domain that was used to create it. If you already own a directory in Azure but users specified a new domain that you use in your organization, merge that domain into your existing directory. For more information, see the instructions in [What is Self-Service Signup for Azure?](https://azure.microsoft.com/documentation/articles/active-directory-self-service-signup/)


## Next steps

If users rather than administrators can create their accounts in Azure Active Directory for RMS for individuals, how can you find out if they have done this?  See  [How to find out if your users have signed up for RMS for individuals](rms-for-individuals-identify-sign-up.md).

[!INCLUDE[Commenting house rules](../includes/houserules.md)]