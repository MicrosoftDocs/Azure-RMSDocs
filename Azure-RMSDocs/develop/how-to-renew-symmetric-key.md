---
# required metadata

title: How to renew the symmetric key in Azure Information Protection
description: This article describes the process of renewing a symmetric key in Azure Information Protection.
keywords:
author: msmbaldwin
manager: barbkess
ms.author: mbaldwin
ms.date:  03/27/2017
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.service: information-protection
ms.assetid: a0b8c8f0-6ed5-48bb-8155-ac4f319ec178

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
#ms.reviewer: kartikk
#ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:
---

# How-to: Renew the symmetric key in Azure Information Protection

A **symmetric key** is a secret that encrypts and decrypts a message in symmetric-key cryptography.  

In Azure Active Directory (Azure AD), when you create a service principal object to represent an application, the process also generates a 256-bit symmetric key to verify the application. This symmetric key is valid for one year by default. 

The following steps show how to renew the symmetric key. 

## Prerequisites

* Azure Active Directory (Azure AD) PowerShell module must be installed as directed in the [Azure AD Powershell Reference](https://docs.microsoft.com/powershell/msonline/).


## Renewing the symmetric key after expiry

You don't have to create a new service principal when the symmetric key associated with your application has expired. Instead, you can use the [PowerShell commandlets](https://docs.microsoft.com/powershell/module/msonline) provided by Microsoft Online Services (MSol) to issue a new symmetric key for an existing service principal.

To illustrate this process, let's assume you have already created a new service principal using the [`New-MsolServicePrincipal`](https://docs.microsoft.com/powershell/msonline/v1/new-msolserviceprincipalcredential) command.

```
New-MsolServicePrincipalCredential -ServicePrincipalName "SupportExampleApp"
```

The creation process creates a symmetric key and an **AppPrincipalId** as shown.

```
The following symmetric key was created as one was not supplied
ZYbF/lTtwE28qplQofCpi2syWd11D83+A3DRlb2Jnv8=

DisplayName : SupportExampleApp
ServicePrincipalNames : {7d9c1f38-600c-4b4d-8249-22427f016963}
ObjectId : 0ee53770-ec86-409e-8939-6d8239880518
AppPrincipalId : 7d9c1f38-600c-4b4d-8249-22427f016963
TrustedForDelegation : False
AccountEnabled : True
Addresses : []
KeyType : Symmetric
KeyId : acb9ad1b-36ce-4a7d-956c-40e5ac29dcbe
StartDate : 3/22/2017 3:27:53 PM
EndDate : 3/22/2018 3:27:53 PM
Usage : Verify
```

This symmetric key expires on 3/22/2018 at 3:27:53PM. To use the service principal beyond this time, you need to renew the symmetric key. To do so, use the [`New-MsolServicePrincipalCredential`](https://docs.microsoft.com/powershell/msonline/v1/new-msolserviceprincipalcredential) command. 

```
New-MsolServicePrincipalCredential -AppPrincipalId 7d9c1f38-600c-4b4d-8249-22427f016963
```

This creates a new symmetric key for the specified **AppPrincipalId**.

```
The following symmetric key was created as one was not supplied ON8YYaMYNmwSfMX625Ei4eC6N1zaeCxbc219W090v28-
```
You can use the [`GetMsolServicePrincipalCredential`](https://docs.microsoft.com/powershell/msonline/v1/get-msolserviceprincipalcredential) command to verify that the new symmetric key is associated with the correct service principal as shown. Notice that the command lists all keys that currently associated with the service principal.

```
Get-MsolServicePrincipalCredential -AppPrincipalId 7d9c1f38-600c-4b4d-8249-22427f016963 -ReturnKeyValues $true

Type : Symmetric
Value :
KeyId : c1ac145f-e899-4c90-8a02-2cef40054fc5
StartDate : 3/24/2017 10:11:07 PM
EndDate : 3/24/2018 10:11:07 PM
Usage : Verify

Type : Symmetric
Value :
KeyId : acb9ad1b-36ce-4a7d-956c-40e5ac29dcbe
StartDate : 3/22/2017 3:27:53 PM
EndDate : 3/22/2018 3:27:53 PM
Usage : Verify
```

Once you have verified that the symmetric key is indeed associated with the right service principal, you can update the service principal's authentication parameters with the new key. 

You can then remove the old symmetric key using the [`Remove-MsolServicePrincipalCredential`](https://docs.microsoft.com/powershell/msonline/v1/remove-msolserviceprincipalcredential) command and verify that the key is removed using the `Get-MsolServicePrincipalCredential` command.

```
Remove-MsolServicePrincipalCredential -KeyId acb9ad1b-36ce-4a7d-956c-40e5ac29dcbe -ObjectId 0ee53770-ec86-409e-8939-6d8239880518
```

## Related topics

* [How-to: enable your service application to work with cloud-based RMS](how-to-use-file-api-with-aadrm-cloud.md)
* [Azure Active Directory MSOnline Powershell reference](https://docs.microsoft.com/powershell/msonline/)
