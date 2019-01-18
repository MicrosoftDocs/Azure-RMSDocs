---
title: class mip::Identity 
description: Documents the mip::identity class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/18/2019
---

# class mip::Identity 
Abstraction for identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Identity()  |  Default [Identity](undefined) constructor used when a user email address is not known.
public explicit Identity(const std::string& email)  |  [Identity](undefined) constructor used when a user email address is known.
public const std::string& GetEmail() const  |  Get the email.
public void SetDelegatedEmail(const std::string& delegatedEmail)  |  Sets the delegated email, A delegated email address is an on behalf of user for which the opertations are performed.
public const std::string& GetDelegatedEmail() const  |  Get the delegated email, A delegated email address is an on behalf of user for which the opertations are performed.
  
## Members
  
### Identity
Default [Identity](undefined) constructor used when a user email address is not known.
  
### Identity
[Identity](undefined) constructor used when a user email address is known.

Parameters:  
* **email**: user email address.


  
### GetEmail
Get the email.

  
**Returns**: The email.
  
### SetDelegatedEmail
Sets the delegated email, A delegated email address is an on behalf of user for which the opertations are performed.

Parameters:  
* **delegatedEmail**: the delegation email.


  
### GetDelegatedEmail
Get the delegated email, A delegated email address is an on behalf of user for which the opertations are performed.

  
**Returns**: The delegated email.