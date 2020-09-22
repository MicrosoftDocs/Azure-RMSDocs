---
title: class NoPermissionsError 
description: Documents the nopermissionserror::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 09/21/2020
---

# class NoPermissionsError 
The user could not get access to the content. For example, no permissions, content revoked.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetReferrer() const  |  Gets the contact in case of missing rights to the document.
public std::string GetOwner() const  |  Gets the owner of the document.
  
## Members
  
### GetReferrer function
Gets the contact in case of missing rights to the document.

  
**Returns**: The contact in case of missing rights to the document.
  
### GetOwner function
Gets the owner of the document.

  
**Returns**: Document owner