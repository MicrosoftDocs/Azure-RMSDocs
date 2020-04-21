---
title: class AuthDelegate 
description: Documents the authdelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/16/2020
---

# class AuthDelegate 
Delegate for auth related operations.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual bool AcquireOAuth2Token(const Identity& identity, const OAuth2Challenge& challenge, OAuth2Token& token)  |  This method is called when an auth token is required for the policy engine with the given identity and the given challenge. The client should return whether acquiring token was successful. If successful, it should initialize the given token object.
public virtual bool AcquireOAuth2Token(const Identity& identity, const OAuth2Challenge& challenge, const std::shared_ptr\<void\>& context, OAuth2Token& token)  |  This method is called when an auth token is required for the policy engine with the given identity and the given challenge. The client should return whether acquiring token was successful. If successful, it should initialize the given token object.
  
## Members
  
### AcquireOAuth2Token function
This method is called when an auth token is required for the policy engine with the given identity and the given challenge. The client should return whether acquiring token was successful. If successful, it should initialize the given token object.

Parameters:  
* **identity**: User for whom a token is requested 


* **challenge**: OAuth2 challenge 


* **token**: [Output] Base64-encoded OAuth2 token



  
**Returns**: True if token successfully acquired, else false
On failure, if token output parameter contains an error message, it will be included in the NoAuthTokenError exception that will later be raised to the application.
> Deprecated: This method will soon be deprecated in favor of the one accepting a context parameter. If the new version has been implemented, there is no need to implement this version.
  
### AcquireOAuth2Token function
This method is called when an auth token is required for the policy engine with the given identity and the given challenge. The client should return whether acquiring token was successful. If successful, it should initialize the given token object.

Parameters:  
* **identity**: User for whom a token is requested 


* **challenge**: OAuth2 challenge 


* **context**: Opaque context that was passed to the MIP API by the host application 


* **token**: [Output] Base64-encoded OAuth2 token



  
**Returns**: True if token successfully acquired, else false
On failure, if token output parameter contains an error message, it will be included in the NoAuthTokenError exception that will later be raised to the application.