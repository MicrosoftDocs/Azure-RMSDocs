---
title: class AuthDelegate::OAuth2Challenge 
description: Documents the authdelegate::oauth2challenge class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class AuthDelegate::OAuth2Challenge 
a class that contains all the information required from the calling application in order to generate an oauth2 token.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public OAuth2Challenge(const std::string& authority, const std::string& resource, const std::string& scope, const std::string& claims)  |  Construct a new [OAuth2Challenge](#class_auth_delegate_1_1_o_auth2_challenge) object.
public const std::string& GetAuthority() const  |  Get the authority string.
public const std::string& GetResource() const  |  Get the resource string.
public const std::string& GetScope() const  |  Get the scope string.
public const std::string& GetClaims() const  |  Get the claims string.
  
## Members
  
### OAuth2Challenge function
Construct a new OAuth2Challenge object.

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