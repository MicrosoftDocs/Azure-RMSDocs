---
title: class mip UserRights 
description: Reference for class mip UserRights 
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 09/27/2018
ms.author: bryanla
---
# class mip::UserRights 
A group of users and the rights associated with them.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public UserRights(const std::vector<std::string>& users, const std::vector<std::string>& rights)  |  [UserRights](class_mip_userrights.md) constructor.
public const std::vector<std::string>& Users() const  |  Gets users associated with a set of rights.
public const std::vector<std::string>& Rights() const  |  Gets rights associated with a group of users.
  
## Members
  
### UserRights
[UserRights](class_mip_userrights.md) constructor.

Parameters:  
* **users**: Group of users that share the same rights 


* **rights**: Rights shared by group of users


  
### Users
Gets users associated with a set of rights.

  
**Returns**: Users associated with a set of rights
  
### Rights
Gets rights associated with a group of users.

  
**Returns**: Rights associated with a group of users