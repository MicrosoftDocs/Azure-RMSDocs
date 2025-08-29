---

# required metadata

title: Additional prerequisites for Microsoft Entra ID and Azure Information Protection
description: Understand additional Microsoft Entra prerequisites for Azure Information Protection in specific scenarios, such as multi-factor or certificate-based authentication and more.
author: aashishr
ms.author: aashishr
manager: aashishr
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

# Additional Microsoft Entra requirements for Azure Information Protection

[!INCLUDE [looking-for-mip](includes/looking-for-mip.md)]

A Microsoft Entra directory is a requirement for using Azure Information protection. Use an account from a Microsoft Entra directory to sign in to the Microsoft Purview compliance portal or Microsoft Purview portal.

If you have a subscription that includes Microsoft Purview Information Protection or Azure Rights Management, your Microsoft Entra directory is automatically created for you if needed.

The following sections list additional AIP and Microsoft Entra requirements for specific scenarios. 

## Support for certificate-based authentication (CBA)

The information protection apps for iOS and Android support certificate-based authentication. 

For more information, see [Get started with certificate-based authentication in Microsoft Entra ID](/azure/active-directory/active-directory-certificate-based-authentication-get-started).

## Multi-factor authentication (MFA) and Azure Information Protection

To use multi-factor authentication (MFA) with Azure Information Protection, you must have at least one of the following installed:

- **Microsoft-managed tenants, with Microsoft Entra ID or Microsoft 365**. Configure Azure MFA to enforce MFA for users. 

    For more information, see: 
    - [Getting started with Azure Multi-Factor Authentication in the cloud](/multi-factor-authentication/multi-factor-authentication-get-started-cloud)
    - [What is Azure Multi-Factor Authentication?](/multi-factor-authentication/multi-factor-authentication)

- **Federated tenants, where federation servers operate on-premises**. Configure your federation servers for Microsoft Entra ID or Microsoft 365. 
For example, if you are using AD FS, see [Configure Additional Authentication Methods for AD FS](/windows-server/identity/ad-fs/operations/configure-additional-authentication-methods-for-ad-fs). 

## Rights Management connector requirements

The Rights Management connector and the Microsoft Purview Information Protection scanner do not support MFA. 

If you deploy the connector or scanner, the following accounts must not require MFA:

- The account that installs and configures the connector.
- The service principal account in Microsoft Entra ID, **Aadrm_S-1-7-0**, that the connector creates.
- The service account that runs the scanner.

## User UPN values don't match their email addresses

Configurations where users' UPN values don't match their email addresses is not a recommended configuration, and does not support single-sign on for Azure Information Protection.

If you cannot change the UPN value, configure alternate IDs for the relevant users, and instruct them how to sign in to Office by using this alternate ID. 

For more information, see:

- [Configuring Alternate Login ID](/windows-server/identity/ad-fs/operations/configuring-alternate-login-id)
- [Office applications periodically prompt for credentials to SharePoint, OneDrive, and Lync Online](https://support.microsoft.com/help/2913639/office-applications-periodically-prompt-for-credentials-to-sharepoint-online,-onedrive,-and-lync-online).

> [!TIP]
> If the domain name in the UPN value is a domain that is verified for your tenant, add the user's UPN value as another email address to the Microsoft Entra ID **proxyAddresses** attribute. This allows the user to be authorized for Azure Rights Management if their UPN value is specified at the time the usage rights are granted. 

For more information, see [Learn how user accounts and groups use the Azure Rights Management service](/purview/rights-management-users-groups).

## Authenticating on-premises using AD FS or another authentication provider

If you're using a mobile device or Mac computer that authenticates on-premises using AD FS, or an equivalent authentication provider, you must use AD FS on one of the following configurations:

- A minimum server version of **Windows Server 2016**
- An alternative authentication provider that supports the OAuth 2.0 protocol


## Next steps
To check for other requirements, see [Requirements for Azure Information Protection](requirements.md).
