---
title: Required API permissions - Microsoft Information Protection SDK
description: Technical details about API permissions needed for Microsoft Information Protection Software Development kit operations.
author: Pathak-Aniket
ms.author: v-anikep
ms.date: 08/20/2020
ms.topic: conceptual
ms.service: information-protection

---

# Required API permissions for Microsoft Information Protection SDK

The MIP SDK uses two backend Azure services for labeling and protection. In the Azure Active Directory app permissions blade, these services are:

- Azure Rights Management Service
- Microsoft Information Protection Sync Service

Application permissions must be granted to all APIs when using the MIP SDK for labeling and protection. Various application authentication scenarios necessitate different application permissions. For application authentication scenarios please refer to [Authentication scenarios](https://docs.microsoft.com/azure/active-directory/develop/authentication-flows-app-scenarios).

Tenant wide admin consent should be granted for application permissions where Admin consent is required as described in [AAD documentation](https://docs.microsoft.com/azure/active-directory/manage-apps/grant-admin-consent#grant-admin-consent-in-app-registrations).

## Application Permissions

Application permissions allow an application in Azure Active Directory to act as it’s own entity, rather than on behalf of a specific user.

| Service                         | Permission Name           | Description                                  | Admin Consent Required |
| ------------------------------- | ------------------------- | -------------------------------------------- | ---------------------- |
| Azure Rights Management Service | Content.SuperUser         | Read all protected content for this tenant   | Yes                    |
| Azure Rights Management Service | Content.DelegatedReader   | Read protected content on behalf of a user   | Yes                    |
| Azure Rights Management Service | Content.DelegatedWriter   | Create protected content on behalf of a user | Yes                    |
| Azure Rights Management Service | Content.Writer            | Create protected content                     | Yes                    |
| MIP Sync Service                | UnifiedPolicy.Tenant.Read | Read all unified policies of the tenant      | Yes                    |

### Content.SuperUser

This permission is required when an application must be permitted to decrypt all content protected for the specific tenant. Examples of services that require super user rights are data loss prevention or cloud access security broker services that must be able to view all content in plaintext to make policy decisions about where that data may flow or be stored.  

### Content.DelegatedWriter

This permission is required when an application must be permitted to encrypt content protected by a specific user. Examples of services that require Delegated Write rights are line of business applications that need to encrypt content based on user’s label policies to apply labels and or encrypt content natively. This permission allows the application to encrypt content in the context of the user.

### Content.DelegatedReader

This permission is required when an application must be permitted to decrypt all content protected for a specific user. Examples of services that require Delegated Reader rights are line of business applications that need to decrypt content based on user’s label policies to display the content natively. This permission allows the application to decrypt and read content in the context of the user.

### Content.Writer

This permission is required when an application must be permitted to encrypt content. Examples of services that require writer are line-of-business application that applies classification labels to files on export. Content.Writer encrypts the content as the service principal identity and hence the owner of the protected files will be the service principal identity.

### UnifiedPolicy.Tenant.Read

This permission is required when an application must be permitted to download unified labeling policies for the tenant. Examples of services that require Unified Policy Tenant Read are applications which need work with labels as a service principal identity.

## Delegated Permissions

Delegated permissions allow an application in Azure Active Directory to perform actions on behalf of a particular user.

| Service                         | Permission Name         | Description                                      | Admin Consent Required |
| ------------------------------- | ----------------------- | ------------------------------------------------ | ---------------------- |
| Azure Rights Management Service | User_Impersonation      | Create and access protected content for the user | No                     |
| MIP Sync Service                | UnifiedPolicy.User.Read | Read all unified policies a user has access to   | No                     |

### User_Impersonation

This permission is required when an application must be permitted to user Azure Rights Management Services on behalf of the user. Examples of services that require User_Impersonation rights are applications that need to encrypt, or access content based on user’s label policies to apply labels or encrypt content natively.
  
### UnifiedPolicy.User.Read

This permission is required when an application must be permitted to read unified labeling policies related to a user. encrypt content protected by a specific user. Examples of services that require Delegated Write rights are applications that need to encrypt content based on user’s label policies to apply labels and or encrypt content natively.
