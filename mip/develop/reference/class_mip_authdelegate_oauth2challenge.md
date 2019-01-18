---
title: class mip::AuthDelegate::OAuth2Challenge 
description: Documents the mip::authdelegate class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/18/2019
---

# class mip::AuthDelegate::OAuth2Challenge 
a class that contains all the information required from the calling application in order to generate an oauth2 token.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public OAuth2Challenge(const std::string& authority, const std::string& resource, const std::string& scope)  |  Construct a new [OAuth2Challenge](undefined) object.
public const std::string& GetAuthority() const  |  Get the authority string.
public const std::string& GetResource() const  |  Get the resource string.
public const std::string& GetScope() const  |  Get the scope string.
  
## Members
  
### OAuth2Challenge
Construct a new [OAuth2Challenge](undefined) object.

Parameters:  
* **authority**: the authority the token needs to be generated against. 


* **resource**: the resource the token is set to. 


* **scope**: the scope the token is set to.


  
### GetAuthority
Get the authority string.

  
**Returns**: The authority string.
  
### GetResource
Get the resource string.

  
**Returns**: The resource string.
  
### GetScope
Get the scope string.

  
**Returns**: The scope string.