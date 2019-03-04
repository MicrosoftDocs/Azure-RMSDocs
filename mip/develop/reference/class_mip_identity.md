---
title: class mip::Identity 
description: Documents the mip::identity class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::Identity 
Abstraction for identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Identity()  |  Default [Identity](class_mip_identity.md) constructor used when a user email address is not known.
public explicit Identity(const std::string& email)  |  [Identity](class_mip_identity.md) constructor used when a user email address is known.
public const std::string& GetEmail() const  |  Get the email.
public void SetDelegatedEmail(const std::string& delegatedEmail)  |  Sets the delegated email, A delegated email address is an on behalf of user for which the opertations are performed.
public const std::string& GetDelegatedEmail() const  |  Get the delegated email, A delegated email address is an on behalf of user for which the opertations are performed.
  
## Members
  
### Identity function
Default [Identity](class_mip_identity.md) constructor used when a user email address is not known.
  
### Identity function
[Identity](class_mip_identity.md) constructor used when a user email address is known.

Parameters:  
* **email**: user email address.


  
### GetEmail function
Get the email.

  
**Returns**: The email.
  
### SetDelegatedEmail function
Sets the delegated email, A delegated email address is an on behalf of user for which the opertations are performed.

Parameters:  
* **delegatedEmail**: the delegation email.


  
### GetDelegatedEmail function
Get the delegated email, A delegated email address is an on behalf of user for which the opertations are performed.

  
**Returns**: The delegated email.
