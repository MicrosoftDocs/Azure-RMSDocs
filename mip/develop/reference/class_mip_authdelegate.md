---
title: class mip::AuthDelegate 
description: Documents the mip::authdelegate class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/27/2019
---

# class mip::AuthDelegate 
Delegate for auth related operations.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual bool AcquireOAuth2Token(const mip::Identity& identity, const OAuth2Challenge& challenge, OAuth2Token& token)  |  This method is called when an auth token is required for the policy engine with the given identity and the given challenge. The client should return whether acquiring token was successful. If successful, it should initialize the given token object.
public virtual bool AcquireOAuth2Token(const mip::Identity& identity, const OAuth2Challenge& challenge, const std::shared_ptr\<void\>& context, OAuth2Token& token)  |  This method is called when an auth token is required for the policy engine with the given identity and the given challenge. The client should return whether acquiring token was successful. If successful, it should initialize the given token object.
  
## Members
  
### AcquireOAuth2Token function
This method is called when an auth token is required for the policy engine with the given identity and the given challenge. The client should return whether acquiring token was successful. If successful, it should initialize the given token object.

Parameters:  
* **identity**: 


* **challenge**: 


* **token**: 


> Deprecated: This method will soon be deprecated in favor of the one accepting a context parameter. If the new version has been implemented, there is no need to implement this version.
  
### AcquireOAuth2Token function
This method is called when an auth token is required for the policy engine with the given identity and the given challenge. The client should return whether acquiring token was successful. If successful, it should initialize the given token object.

Parameters:  
* **identity**: User for whom a token is requested 


* **challenge**: OAuth2 challenge 


* **context**: Opaque context that was passed to the MIP API by the host application 


* **token**: [Output] Base64-encoded OAuth2 token

