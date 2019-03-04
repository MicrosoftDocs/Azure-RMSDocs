---
title: class mip::UserRights 
description: Documents the mip::userrights class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::UserRights 
A group of users and the rights associated with them.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public UserRights(const std::vector\<std::string\>& users, const std::vector\<std::string\>& rights)  |  [UserRights](class_mip_userrights.md) constructor.
public const std::vector\<std::string\>& Users() const  |  Gets users associated with a set of rights.
public const std::vector\<std::string\>& Rights() const  |  Gets rights associated with a group of users.
  
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

  
**Returns**: Rights associated with a group of users
