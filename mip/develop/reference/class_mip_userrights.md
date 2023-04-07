---
title: class UserRights 
description: Documents the userrights::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class UserRights 
A group of users and the rights associated with them.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public UserRights(const std::vector&lt;std::string&gt;& users, const std::vector&lt;std::string&gt;& rights)  |  [UserRights](class_mip_userrights.md) constructor.
public const std::vector&lt;std::string&gt;& Users() const  |  Gets users associated with a set of rights.
public const std::vector&lt;std::string&gt;& Rights() const  |  Gets rights associated with a group of users.
  
## Members
  
### UserRights function
[UserRights](class_mip_userrights.md) constructor.

Parameters:  
* **users**: Group of users that share the same rights 


* **rights**: Rights shared by group of users


  
### Users function
Gets users associated with a set of rights.

  
**Returns**: Users associated with a set of rights
  
### Rights function
Gets rights associated with a group of users.

  
**Returns**: Rights associated with a group of users.