---
title: class GetTemplatesSettings 
description: Documents the gettemplatessettings::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 04/23/2021
---

# class GetTemplatesSettings 
Settings to use when obtaining templates.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void SetDelegatedUserEmail(const std::string& delegatedUserEmail)  |  Sets the delegated user.
public const std::string& GetDelegatedUserEmail() const  |  Gets the delegated user.
public static std::shared_ptr<GetTemplatesSettings> __CDECL CreateGetTemplatesSettings() | Creates a GetTemplatesSettings object

## Members
  
### SetDelegatedUserEmail function
Sets the delegated user.

Parameters:  
* **delegatedUserEmail**: the delegation email.


A delegated user is specified when the authenticating user/application is acting on behalf of another user
  
### GetDelegatedUserEmail function
Gets the delegated user.

  
**Returns**: Delegated user
A delegated user is specified when the authenticating user/application is acting on behalf of another user

### CreateGetTemplatesSettings function

Creates a GetTemplatesSettings object

**Returns** A GetTemplatesSettings object