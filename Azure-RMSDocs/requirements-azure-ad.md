---
# required metadata

title: Azure AD requirements for Azure Information Protection - AIP
description: Identify the Azure AD requirements to use Azure Information Protection, so that users can be successfully authenticated.
author: cabailey
ms.author: cabailey
manager: mbaldwin
ms.date: 04/26/2018
ms.topic: conceptual
ms.service: information-protection
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

# Azure Active Directory requirements for Azure Information Protection

>*Applies to: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](http://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*

You must have an Azure AD directory to use Azure Information Protection. You use an account from this directory to sign in to the Azure portal, where, for example, you can configure and manage Azure Information Protection labels and Azure Rights Management templates.

If you have a subscription that includes Azure Information Protection or Azure Rights Management, your Azure AD directory is automatically created for you if needed.  

For more information about Azure AD, see [What is Azure AD Directory?](/active-directory/active-directory-whatis)

To integrate your Azure AD directory with your on-premises AD forests, see [Integrating your on-premises identities with Azure Active Directory](/active-directory/active-directory-aadconnect).

### Scenarios that have specific requirements 

Computers running Office 2010: 

- These computers require the [Azure Information Protection client](./rms-client/aip-client.md) (recommended) or the [Rights Management sharing application for Windows](./rms-client/sharing-app-windows.md) to authenticate to Azure Information Protection and its data protection service, Azure Rights Management.

- If your user accounts are federated (for example, you use AD FS), they must use Windows Integrated Authentication. Forms-based authentication in this scenario fails to authenticate users for Azure Information Protection.

Support for certificate-based authentication (CBA):

- The Azure Information Protection apps for iOS and Android support certificate-based authentication. For instructions to configure certificate-based authentication, see [Get started with certificate-based authentication in Azure Active Directory](/azure/active-directory/active-directory-certificate-based-authentication-get-started).

Users' UPN value doesn't match their email address:

- This is not a recommended configuration. If you cannot change the UPN value, configure alternate login ID for users, and instruct them how to sign in to Office by using this alternate login. For more information, see [Configuring Alternate Login ID](/windows-server/identity/ad-fs/operations/configuring-alternate-login-id) and [Office applications periodically prompt for credentials to SharePoint Online, OneDrive, and Lync Online](https://support.microsoft.com/help/2913639/office-applications-periodically-prompt-for-credentials-to-sharepoint-online,-onedrive,-and-lync-online).
    
    When the domain name in the UPN value is a domain that is verified for your tenant, add the user's UPN value as another email address to the Azure AD proxyAddresses attribute. This lets the user be authorized for Azure Rights Management if their UPN value is specified at the time the usage rights are granted. For more information about this and how user accounts are authorized, see [Preparing users and groups for Azure Information Protection](prepare.md).

Mobile devices or Mac computers that authenticate on-premises by using AD FS or an equivalent authentication provider:

- You must use AD FS on the minimum server version of **Windows Server 2012 R2**, or an alternative authentication provider that supports the OAuth 2.0 protocol.

## Multi-factor authentication (MFA) and Azure Information Protection
To use multi-factor authentication (MFA) with Azure Information Protection requires at least one of the following:

-   Office 2013 (minimum version):

    -   If you have Office 2013, you might need to install an additional update to support Active Directory Authentication Library (ADAL). For example, the [June 9, 2015, update for Office 2013 (KB3054853)](https://support.microsoft.com/kb/3054853). For more information about this update and how modern authentication brings Active Directory Authentication Library (ADAL)-based sign-in to Office 2013, see [Office 2013 modern authentication public preview announced](https://blogs.office.com/2015/03/23/office-2013-modern-authentication-public-preview-announced/) on the Office blog.

- Azure Information Protection client:

    - The [Azure Information Protection client](./rms-client/aip-client.md) for Windows and for iOS and Android has always supported MFA; no minimum version is required. 

-   Rights Management sharing application for Windows:

    - You must have installed the minimum version of 1.0.1908.0, which you can confirm by using Control Panel > Programs and Features. Note that the Rights Management Sharing application is now replaced by the Azure Information Protection client. For more information about the sharing application, see [Rights Management sharing application for Windows](./rms-client/sharing-app-windows.md).

-   Rights Management sharing app for mobile devices and Mac computers:

    -   Make sure that you have the latest version installed. MFA support went into the September 2015 release of the RMS sharing app.

Then, configure your MFA solution:

-   For Microsoft-managed tenants (you have Azure Active Directory or Office 365):

    - Configure Azure MFA to enforce MFA for users. For instructions, see [Getting started with Azure Multi-Factor Authentication in the cloud](/multi-factor-authentication/multi-factor-authentication-get-started-cloud) from the Multi-factor Authentication documentation.

        For more information about Azure MFA, see [What is Azure Multi-Factor Authentication?](/multi-factor-authentication/multi-factor-authentication)

- For federated tenants (you operate federation servers on-premises):

    - Configure your federation servers for Azure Active Directory or Office 365. For example, if you are using AD FS, see [Configure Additional Authentication Methods for AD FS](https://technet.microsoft.com/library/dn758113.aspx) on TechNet.

        For more information about this scenario, see  [The Works with Office 365 – Identity program now streamlined](https://blogs.office.com/2014/01/30/the-works-with-office-365-identity-program-now-streamlined/) on the Office blog.

The Rights Management connector and the Azure Information Protection scanner do not support MFA. If you deploy the connector or scanner, the following accounts must not require MFA:

- The account that installs and configures the connector.

- The service principal account in Azure AD, **Aadrm_S-1-7-0**, that the connector creates.
 
- The service account that runs the scanner.

## Next steps
To check for other requirements, see [Requirements for Azure Information Protection](requirements.md).

