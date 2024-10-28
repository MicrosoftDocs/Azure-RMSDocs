---
title: class PublishingUseLicenseRequest 
description: Documents the publishinguselicenserequest::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/07/2023
---

# class PublishingUseLicenseRequest 
Request for a use license in the publishing request.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void SetDelegatedUserEmail(const std::string& delegatedUserEmail)  |  Sets the optional delegated user. If this is not set then the prelicense is for the user in the token.
public const std::string& GetDelegatedUserEmail() const  |  Gets the delegated user.
  
## Members
  
### SetDelegatedUserEmail function
Sets the optional delegated user. If this is not set then the prelicense is for the user in the token.

Parameters:  
* **delegatedUserEmail**: the delegation email.


A delegated user is specified when the authenticating user/application is acting on behalf of another user
  
### GetDelegatedUserEmail function
Gets the delegated user.

  
**Returns**: Delegated user
A delegated user is specified when the authenticating user/application is acting on behalf of another user