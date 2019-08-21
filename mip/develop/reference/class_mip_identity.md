---
title: class mip::Identity 
description: Documents the mip::identity class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::Identity 
Abstraction for identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Identity()  |  Default [Identity](class_mip_identity.md) constructor used when a user email address is not known.
public Identity(const Identity& other)  |  [Identity](class_mip_identity.md) copy constructor.
public explicit Identity(const std::string& email)  |  [Identity](class_mip_identity.md) constructor used when a user email address is known.
public const std::string& GetEmail() const  |  Get the email.
  
## Members
  
### Identity function
Default [Identity](class_mip_identity.md) constructor used when a user email address is not known.
  
### Identity function
[Identity](class_mip_identity.md) copy constructor.

Parameters:  
* **[Identity](class_mip_identity.md)**: used to create the copy.


  
### Identity function
[Identity](class_mip_identity.md) constructor used when a user email address is known.

Parameters:  
* **email**: user email address.


  
### GetEmail function
Get the email.

  
**Returns**: The email.