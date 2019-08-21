---
title: class mip::AuthDelegate::OAuth2Challenge 
description: Documents the mip::authdelegate class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::AuthDelegate::OAuth2Challenge 
a class that contains all the information required from the calling application in order to generate an oauth2 token.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public OAuth2Challenge(const std::string& authority, const std::string& resource, const std::string& scope, const std::string& claims)  |  Construct a new [OAuth2Challenge](class_mip_authdelegate_oauth2challenge.md) object.
public const std::string& GetAuthority() const  |  Get the authority string.
public const std::string& GetResource() const  |  Get the resource string.
public const std::string& GetScope() const  |  Get the scope string.
public const std::string& GetClaims() const  |  Get the claims string.
  
## Members
  
### OAuth2Challenge function
Construct a new [OAuth2Challenge](class_mip_authdelegate_oauth2challenge.md) object.

Parameters:  
* **authority**: the authority the token needs to be generated against. 


* **resource**: the resource the token is set to. 


* **scope**: the scope the token is set to.


  
### GetAuthority function
Get the authority string.

  
**Returns**: The authority string.
  
### GetResource function
Get the resource string.

  
**Returns**: The resource string.
  
### GetScope function
Get the scope string.

  
**Returns**: The scope string.
  
### GetClaims function
Get the claims string.

  
**Returns**: The claims string.