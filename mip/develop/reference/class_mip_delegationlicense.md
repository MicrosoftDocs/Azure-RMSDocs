---
title: class DelegationLicense 
description: Documents the delegationlicense::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/23/2021
---

# class DelegationLicense 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<uint8_t\>& GetSerializedDelegationJsonLicense()  |  Gets the delegation license.
public const std::vector\<uint8_t\>& GetSerializedUserLicense(ProtectionHandler::PreLicenseFormat format)  |  Gets the user license, if requested.
public const std::string& GetUser()  |  Gets the user that this license was created for.
  
## Members
  
### GetSerializedDelegationJsonLicense function
Gets the delegation license.

  
**Returns**: Serialized license
This license is bound to the identity of the user that made the request
  
### GetSerializedUserLicense function
Gets the user license, if requested.

Parameters:  
* **format**: License format



  
**Returns**: Serialized user license if requested, otherwise empty vector
This license is bound to the delegated user in the request
  
### GetUser function
Gets the user that this license was created for.

  
**Returns**: The user