---
title: class NoPermissionsError 
description: Documents the nopermissionserror::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 05/31/2022
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
AccessDenied            | Access to content or action was not permitted
AccessExpired            | Access to content or action has expired
InvalidEmail            | 
UnknownTenant            | 
NotOwner            | User needs to be owner to perform action
NotPremiumLicenseUser            | User needs to be a premium license holder to perform action. Tracking and Revocation for example
Category of no permissions error.