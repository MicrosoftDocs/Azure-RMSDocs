---
title: class NoPermissionsError 
description: Documents the nopermissionserror::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 04/23/2021
---

# class NoPermissionsError 
The user could not get access to the content. For example, no permissions, content revoked.
  
## Summary

Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetReferrer() const  |  Gets the contact in case of missing rights to the document.
public std::string GetOwner() const  |  Gets the owner of the document.
public Category GetCategory() const  |  Gets the category of no permissions failure.
enum Category  |  Category of no permissions error.
  
## Members
  
### GetReferrer function
Gets the contact in case of missing rights to the document.

  
**Returns**: The contact in case of missing rights to the document.
  
### GetOwner function
Gets the owner of the document.

  
**Returns**: Document owner
  
### GetCategory function
Gets the category of no permissions failure.

  
**Returns**: Category of no permissions failure
  
### Category enum

Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Unknown            | Unknown no permissions failure
UserNotFound            | Requested user was not found failure
AccessDenied            | 
AccessExpired            | 
Category of no permissions error.