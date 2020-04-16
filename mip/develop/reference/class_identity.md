---
title: class Identity 
description: Documents the identity::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/16/2020
---

# class Identity 
Abstraction for identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Identity()  |  Default [Identity](#classIdentity) constructor used when a user email address is not known.
public Identity(const Identity& other)  |  [Identity](undefined) copy constructor.
public explicit Identity(const std::string& email)  |  [Identity](undefined) constructor used when a user email address is known.
public explicit Identity(const std::string& email, const std::string& name)  |  [Identity](undefined) constructor used when a user email address and user name is known.
public const std::string& GetEmail() const  |  Get the email.
public const std::string& GetName() const  |  Get the user's friendly name. used for text marking.
  
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
* **email**: must be valid email address.


  
### Identity function
[Identity](undefined) constructor used when a user email address and user name is known.

Parameters:  
* **email**: must be valid email address. 


* **name**: user name.


  
### GetEmail function
Get the email.

  
**Returns**: The email.
  
### GetName function
Get the user's friendly name. used for text marking.

  
**Returns**: The friendly name.