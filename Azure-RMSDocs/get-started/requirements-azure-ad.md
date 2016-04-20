---
# required metadata

title: Azure RMS requirements&#58; Azure AD Directory | Azure RMS
description:
keywords:
author: cabailey
manager: mbaldwin
ms.date: 04/28/2016
ms.topic: article
ms.prod: azure
ms.service: rights-management
ms.technology: techgroup-identity
ms.assetid: ed25aa83-e272-437b-b445-3f01e985860c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.reviewer: esaggese
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Azure RMS requirements: Azure AD Directory

You must have an Azure AD directory to use Azure Rights Management (Azure RMS). You use your organization account for this directory to sign in to the Azure classic portal, where, for example, you can configure and manage Rights Management templates.

If you do not already have an Azure subscription for your organization, you can get one by signing up for a free trial.: Go to the [Azure Get started](https://account.windowsazure.com/organization) page and follow the instructions.

For more information, see the following resources in the Azure Active Directory documentation:

-   [What is an Azure AD directory?](https://azure.microsoft.com/en-us/documentation/articles/active-directory-whatis)

-   [How Azure subscriptions are associated with Azure AD]( https://azure.microsoft.com/en-us/documentation/articles/active-directory-how-subscriptions-associated-directory/)

If you want to integrate your Azure AD directory with your on-premises AD forests, see [Directory integration](https://azure.microsoft.com/en-us/documentation/articles/active-directory-aadconnect/).

> [!NOTE]
> If you have mobile devices or Mac computers that authenticate on-premises by using AD FS or an equivalent authentication provider:
> 
> -   You must use AD FS on the minimum server version of **Windows Server 2012 R2**, or an alternative authentication provider that supports the OAuth 2.0 protocol.

## Multi-factor authentication (MFA) and Azure RMS
To use multi-factor authentication (MFA) with Azure RMS requires at least one of the following:

-   Office 2013 (minimum version):

    -   If you have Office 2013, you must also install the [June 9, 2015, update for Office 2013 (KB3054853)](https://support.microsoft.com/kb/3054853). For more information about this update and how modern authentication brings Active Directory Authentication Library (ADAL)-based sign in to Office 2013, see [Office 2013 modern authentication public preview announced](https://blogs.office.com/2015/03/23/office-2013-modern-authentication-public-preview-announced/) on the Office blog.

-   Rights Management sharing application for Windows:

    -   You must have installed the minimum version of 1.0.1908.0, which can be confirmed by using Control Panel, Programs and Features. For more information about the sharing application, see  [Rights Management Sharing Application for Windows](../rms-client/sharing-app-windows.md).

-   Rights Management sharing app for mobile devices and Mac computers:

    -   Make sure that you have the latest version installed. MFA support went into the September 2015 release of the RMS sharing app.

Then, configure your MFA solution:

-   For Microsoft-managed tenants (you have Azure Active Directory or Office 365):

    -   Configure Azure MFA to enforce MFA for users. For instructions, see [Getting started with Azure Multi-Factor Authentication in the cloud](https://azure.microsoft.com/documentation/articles/multi-factor-authentication-get-started-cloud/) from the Azure documentation.

        For more information about Azure MFA, see [What is Azure Multi-Factor Authentication?](https://azure.microsoft.com/documentation/articles/multi-factor-authentication/)

-   For federated tenants (you operate federation servers on-premises):

    -   Configure your federation servers for Azure Active Directory or Office 365. For example, if you are using AD FS, see [Configure Additional Authentication Methods for AD FS](https://technet.microsoft.com/library/dn758113.aspx) on TechNet.

        For more information about this scenario, see  [The Works with Office 365 – Identity program now streamlined](https://blogs.office.com/2014/01/30/the-works-with-office-365-identity-program-now-streamlined/) on the Office blog.

## Next steps
To check for other requirements, see [Requirements for Azure Rights Management](requirements-azure-rms.md).

