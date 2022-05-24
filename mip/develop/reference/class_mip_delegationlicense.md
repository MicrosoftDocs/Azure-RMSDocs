---
title: class DelegationLicense 
description: Documents the delegationlicense::undefined class of the Microsoft Purview Information Protection SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class DelegationLicense 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<uint8_t\>& GetSerializedDelegationJsonLicense()  |  Gets the delegation license in Json format.
public const std::vector\<uint8_t\>& GetSerializedUserLicense(ProtectionHandler::PreLicenseFormat format)  |  Gets the user license, if requested.
public const std::string& GetUser()  |  Gets the user that this license was created for.
public const std::vector\<uint8_t\>& GetSerializedDelegationXrmlLicense()  |  Gets the delegation license in Xrml format.
  
## Members
  
### GetSerializedDelegationJsonLicense function
Gets the delegation license in Json format.

  
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
  
### GetSerializedDelegationXrmlLicense function
Gets the delegation license in Xrml format.

  
**Returns**: Serialized license
This license is bound to the identity of the user that made the requestst