---
title: namespace `mip::roles` 
description: Documents the mip::roles namespace of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/11/2019
---

# namespace `mip::roles` 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string Viewer()       |  Gets string identifier for 'viewer' role.
public std::string Reviewer()       |  Gets string identifier for 'reviewer' role.
public std::string Author()       |  Gets string identifier for 'author' role.
public std::string CoOwner()       |  Gets string identifier for 'co-owner' role.
  
## Members
  
### Viewer function
Gets string identifier for 'viewer' role.

  
**Returns**: String identifier for 'viewer' role
A viewer can only view the content. They cannot edit, copy, or print it.
  
### Reviewer function
Gets string identifier for 'reviewer' role.

  
**Returns**: String identifier for 'reviewer' role
A reviewer can view and edit the content. They cannot copy, or print it.
  
### Author function
Gets string identifier for 'author' role.

  
**Returns**: String identifier for 'author' role
An author can view, edit, copy, and print the content.
  
### CoOwner function
Gets string identifier for 'co-owner' role.

  
**Returns**: String identifier for 'co-owner' role
A co-owner has all permissions