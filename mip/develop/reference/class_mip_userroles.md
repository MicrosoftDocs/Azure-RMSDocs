---
title: class UserRoles 
description: Documents the userroles::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class UserRoles 
A group of users and the roles associated with them.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public UserRoles(const std::vector\<std::string\>& users, const std::vector\<std::string\>& roles)  |  UserRoles constructor.
public const std::vector\<std::string\>& Users() const  |  Gets users associated with a set of roles.
public const std::vector\<std::string\>& Roles() const  |  Gets roles associated with a group of users.
  
## Members
  
### UserRoles function
UserRoles constructor.

Parameters:  
* **users**: Group of users that share the same roles 


* **roles**: Roles shared by group of users


  
### Users function
Gets users associated with a set of roles.

  
**Returns**: Users associated with a set of roles
  
### Roles function
Gets roles associated with a group of users.

  
**Returns**: Roles associated with a group of usersrs