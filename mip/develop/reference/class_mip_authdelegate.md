---
title: class mip::AuthDelegate 
description: Documents the mip::authdelegate class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/22/2019
---

# class mip::AuthDelegate 
Delegate for auth related operations.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public bool AcquireOAuth2Token(const mip::Identity& identity, const OAuth2Challenge& challenge, OAuth2Token& token)  |  This method is called when an auth token is required for the policy engine with the given identity and the given challenge. The client should return whether acquiring token was successful. If successful, it should initialize the given token object.
  
## Members
  
### AcquireOAuth2Token
This method is called when an auth token is required for the policy engine with the given identity and the given challenge. The client should return whether acquiring token was successful. If successful, it should initialize the given token object.

Parameters:  
* **identity**: 


* **challenge**: 


* **token**:

