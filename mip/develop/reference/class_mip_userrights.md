---
title: class UserRights 
description: Documents the userrights::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 11/15/2021
---

# class UserRights 
A group of users and the rights associated with them.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public UserRights(const std::vector\<std::string\>& users, const std::vector\<std::string\>& rights)  |  [UserRights](undefined) constructor.
public const std::vector\<std::string\>& Users() const  |  Gets users associated with a set of rights.
public const std::vector\<std::string\>& Rights() const  |  Gets rights associated with a group of users.
  
## Members
  
### UserRights function
[UserRights](undefined) constructor.

Parameters:  
* **users**: Group of users that share the same rights 


* **rights**: Rights shared by group of users


  
### Users function
Gets users associated with a set of rights.

  
**Returns**: Users associated with a set of rights
  
### Rights function
Gets rights associated with a group of users.

  
**Returns**: Rights associated with a group of users