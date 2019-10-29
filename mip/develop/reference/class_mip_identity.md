---
title: class mip::Identity 
description: Documents the mip::identity class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 10/29/2019
---

# class mip::Identity 
Abstraction for identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Identity()  |  Default [Identity](#classmip_1_1Identity) constructor used when a user email address is not known.
public Identity(const Identity& other)  |  [Identity](undefined) copy constructor.
public explicit Identity(const std::string& email)  |  [Identity](undefined) constructor used when a user email address is known.
public const std::string& GetEmail() const  |  Get the email.
  
## Members
  
### Identity function
Default [Identity](undefined) constructor used when a user email address is not known.
  
### Identity function
[Identity](undefined) copy constructor.

Parameters:  
* **[Identity](undefined)**: used to create the copy.


  
### Identity function
[Identity](undefined) constructor used when a user email address is known.

Parameters:  
* **email**: user email address.


  
### GetEmail function
Get the email.

  
**Returns**: The email.