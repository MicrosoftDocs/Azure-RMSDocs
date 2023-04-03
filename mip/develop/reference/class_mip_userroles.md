---
title: class UserRoles 
description: Documents the userroles::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class UserRoles 
A group of users and the roles associated with them.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public UserRoles(const std::vector\&lt;std::string\&gt;& users, const std::vector\&lt;std::string\&gt;& roles)  |  [UserRoles](#class_user_roles) constructor.
public const std::vector\&lt;std::string\&gt;& Users() const  |  Gets users associated with a set of roles.
public const std::vector\&lt;std::string\&gt;& Roles() const  |  Gets roles associated with a group of users.
  
## Members
  
### UserRoles function
[UserRoles](undefined) constructor.

Parameters:  
* **users**: Group of users that share the same roles 


* **roles**: Roles shared by group of users


  
### Users function
Gets users associated with a set of roles.

  
**Returns**: Users associated with a set of roles
  
### Roles function
Gets roles associated with a group of users.

  
**Returns**: Roles associated with a group of users