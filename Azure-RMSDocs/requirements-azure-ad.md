---
# required metadata

title: Additional prerequisites for Azure AD and Azure Information Protection
description: Understand additional Azure AD prerequisites for Azure Information Protection in specific scenarios, such as multi-factor or certificate-based authentication, or computers using Office 2010, and more.
author: batamig
ms.author: bagol
manager: rkarlin
ms.date: 07/22/2020
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: ed25aa83-e272-437b-b445-3f01e985860c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.subservice: prereqs
ms.suite: ems
#ms.tgt_pltfrm:
ms.custom: admin, has-adal-ref

---

# Additional Azure AD requirements for Azure Information Protection

>***Applies to**: [Azure Information Protection](https://azure.microsoft.com/pricing/details/information-protection), [Office 365](https://download.microsoft.com/download/E/C/F/ECF42E71-4EC0-48FF-AA00-577AC14D5B5C/Azure_Information_Protection_licensing_datasheet_EN-US.pdf)*
>
>***Relevant for**: [AIP unified labeling client and AIP classic client](faqs.md#whats-the-difference-between-the-azure-information-protection-classic-and-unified-labeling-clients).*

An [Azure AD directory is a requirement](requirements.md#azure-active-directory) for using Azure Information protection. Use an account from an Azure AD directory to sign in to the Azure portal, where you can configure Azure Information Protection settings.

If you have a subscription that includes Azure Information Protection or Azure Rights Management, your Azure AD directory is automatically created for you if needed.

The following sections list additional AIP and Azure AD requirements for specific scenarios. 

## Computers running Office 2010

In addition to an Azure AD account, computers running Microsoft 2010 require the Azure Information Protection client for Windows to authenticate to Azure Information Protection, and its data protection service, Azure Rights Management. 

If your user accounts are federated (for example, you use AD FS), these computers must use Windows-Integrated Authentication. Forms-based authentication in this scenario fails to authenticate users for Azure Information Protection.

We recommend that you deploy the Azure Information Protection unified labeling client. If you haven't yet upgraded, your system may still have the [Azure Information Protection classic client](./rms-client/aip-client.md) deployed. 

For more information, see [The client side of Azure Information Protection](rms-client/use-client.md) and [AIP and legacy Windows and Office versions](known-issues.md#aip-and-legacy-windows-and-office-versions).

> [!NOTE]
> To provide a unified and streamlined customer experience, the **Azure Information Protection classic client** and **Label Management** in the Azure Portal are being **deprecated** as of **March 31, 2021**. 
>
> This time-frame allows all current Azure Information Protection customers to transition to the Microsoft Information Protection unified labeling solution. Learn more in the official [deprecation notice](https://aka.ms/aipclassicsunset).

## Support for certificate-based authentication (CBA)

The Azure Information Protection apps for iOS and Android support certificate-based authentication. 

For more information, see [Get started with certificate-based authentication in Azure Active Directory](/azure/active-directory/active-directory-certificate-based-authentication-get-started).

## Multi-factor authentication (MFA) and Azure Information Protection

To use multi-factor authentication (MFA) with Azure Information Protection, you must have at least one of the following installed:

- **Microsoft Office**, version 2013 or higher
- **An AIP client**. No minimum version required. The AIP clients for Windows, as well as the viewer apps for iOS and Android all support MFA.
- **The Rights Management sharing app for Mac computers**. The RMS sharing apps have supported MFA since the September 2015 release.

> [!NOTE]
> If you have Office 2013, you might need to install an additional update to support Active Directory Authentication Library (ADAL), such as the [June 9, 2015, update for Office 2013 (KB3054853)](https://support.microsoft.com/kb/3054853). 
>
> For more information, see [Office 2013 modern authentication public preview announced](https://blogs.office.com/2015/03/23/office-2013-modern-authentication-public-preview-announced/) on the Office blog.       

Once you've confirmed these prerequisites, do one of the following, depending on your tenant configuration:

- **Microsoft-managed tenants, with Azure AD or Microsoft 365**. Configure Azure MFA to enforce MFA for users. 

    For more information, see: 
    - [Getting started with Azure Multi-Factor Authentication in the cloud](/multi-factor-authentication/multi-factor-authentication-get-started-cloud)
    - [What is Azure Multi-Factor Authentication?](/multi-factor-authentication/multi-factor-authentication)

- **Federated tenants, where federation servers operate on-premises**. Configure your federation servers for Azure Active Directory or Microsoft 365. 
For example, if you are using AD FS, see [Configure Additional Authentication Methods for AD FS](/windows-server/identity/ad-fs/operations/configure-additional-authentication-methods-for-ad-fs). 

    For more information about this scenario, see [The Works with Microsoft 365 – Identity program now streamlined](https://blogs.office.com/2014/01/30/the-works-with-office-365-identity-program-now-streamlined/) on the Office blog. 

## Rights Management connector / AIP scanner requirements

The Rights Management connector and the Azure Information Protection scanner do not support MFA. 

If you deploy the connector or scanner, the following accounts must not require MFA:

- The account that installs and configures the connector.
- The service principal account in Azure AD, **Aadrm_S-1-7-0**, that the connector creates.
- The service account that runs the scanner.

## User UPN values don't match their email addresses

Configurations where users' UPN values don't match their email addresses is not a recommended configuration, and does not support single-sign on for Azure Information Protection.

If you cannot change the UPN value, configure alternate IDs for the relevant users, and instruct them how to sign in to Office by using this alternate ID. 

For more information, see:

- [Configuring Alternate Login ID](/windows-server/identity/ad-fs/operations/configuring-alternate-login-id)
- [Office applications periodically prompt for credentials to SharePoint, OneDrive, and Lync Online](https://support.microsoft.com/help/2913639/office-applications-periodically-prompt-for-credentials-to-sharepoint-online,-onedrive,-and-lync-online).

> [!TIP]
> If the domain name in the UPN value is a domain that is verified for your tenant, add the user's UPN value as another email address to the Azure AD **proxyAddresses** attribute. This allows the user to be authorized for Azure Rights Management if their UPN value is specified at the time the usage rights are granted. 

For more information, see [Preparing users and groups for Azure Information Protection](prepare.md).

## Authenticating on-premises using AD FS or another authentication provider

If you're using a mobile device or Mac computer that authenticates on-premises using AD FS, or an equivalent authentication provider, you must use AD FS on one of the following configurations:

- A minimum server version of **Windows Server 2012 R2**
- An alternative authentication provider that supports the OAuth 2.0 protocol

## Next steps
To check for other requirements, see [Requirements for Azure Information Protection](requirements.md).
