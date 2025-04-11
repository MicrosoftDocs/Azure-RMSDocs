---
title: Required API permissions - Microsoft Information Protection SDK
description: Technical details about API permissions needed for Microsoft Purview Information Protection Software Development kit operations.
author: msmbaldwin
ms.author: mbaldwin
ms.date: 04/10/2025
ms.topic: conceptual
ms.service: information-protection

---

# API permissions for the Microsoft Information Protection SDK

The MIP SDK uses two backend Azure services for labeling and protection. In the Microsoft Entra app permissions blade, these services are:

- Azure Rights Management Service
- Microsoft Purview Information Protection Sync Service

Application permissions must be granted to one or more APIs when using the MIP SDK for labeling and protection. Various application authentication scenarios may require different application permissions. For application authentication scenarios, see [Authentication scenarios](/azure/active-directory/develop/authentication-flows-app-scenarios).

Tenant-wide admin consent should be granted for application permissions where Administrator consent is required. For more information, see the [Microsoft Entra documentation](/azure/active-directory/manage-apps/grant-admin-consent#grant-admin-consent-in-app-registrations).


## Application Permissions

Application permissions allow an application in Microsoft Entra ID to act as it’s own entity, rather than on behalf of a specific user.

| Service                         | Permission Name           | Description                                  | Admin Consent Required |
| ------------------------------- | ------------------------- | -------------------------------------------- | ---------------------- |
| Azure Rights Management Service | Content.SuperUser         | Read all protected content for this tenant   | Yes                    |
| Azure Rights Management Service | Content.DelegatedReader   | Read protected content on behalf of a user   | Yes                    |
| Azure Rights Management Service | Content.DelegatedWriter   | Create protected content on behalf of a user | Yes                    |
| Azure Rights Management Service | Content.Writer            | Create protected content                     | Yes                    |
| Azure Rights Management Service | Application.Read.All      | Permission not required for MIPSDK use       | Not Applicable         |
| MIP Sync Service                | UnifiedPolicy.Tenant.Read | Read all unified policies of the tenant      | Yes                    |

### Content.SuperUser

This permission is required when an application must be permitted to decrypt all content protected for the specific tenant. Examples of services that require `Content.Superuser` rights are data loss prevention or cloud access security broker services that must view all content in plaintext to make policy decisions about where that data may flow or be stored.  

### Content.DelegatedWriter

This permission is required when an application must be permitted to encrypt content protected by a specific user. Examples of services that require `Content.DelegatedWriter` rights are line-of-business applications that need to encrypt content, based on user’s label policies to apply labels and or encrypt content natively. This permission allows the application to encrypt content in the context of the user.

### Content.DelegatedReader

This permission is required when an application must be permitted to decrypt all content protected for a specific user. Examples of services that require `Content.DelegatedReader` rights are line-of-business applications that need to decrypt content, based on user’s label policies to display the content natively. This permission allows the application to decrypt and read content in the context of the user.

### Content.Writer

This permission is required when an application must be permitted to list templates and encrypt content. A service that attempts to list templates without this permission will receive a token rejected message from the service. Examples of services that require `Content.writer` are line-of-business application that applies classification labels to files on export. Content.Writer encrypts the content as the service principal identity and so the owner of the protected files will be the service principal identity.

### UnifiedPolicy.Tenant.Read

This permission is required when an application must be permitted to download unified labeling policies for the tenant. Examples of services that require `UnifiedPolicy.Tenant.Read` are applications which need work with labels as a service principal identity.

## Delegated Permissions

Delegated permissions allow an application in Microsoft Entra ID to perform actions on behalf of a particular user.

| Service                         | Permission Name         | Description                                      | Admin Consent Required |
| ------------------------------- | ----------------------- | ------------------------------------------------ | ---------------------- |
| Azure Rights Management Service | user_impersonation      | Create and access protected content for the user | No                     |
| MIP Sync Service                | UnifiedPolicy.User.Read | Read all unified policies a user has access to   | No                     |

### User_Impersonation

This permission is required when an application must be permitted to user Azure Rights Management Services on behalf of the user. Examples of services that require `User_Impersonation` rights are applications that need to encrypt, or access content, based on user’s label policies to apply labels or encrypt content natively.
  
### UnifiedPolicy.User.Read

This permission is required when an application must be permitted to read unified labeling policies related to a user. Examples of services that require `UnifiedPolicy.User.Read` permissions are applications that need to encrypt and decrypt content, based on user’s label policies.
