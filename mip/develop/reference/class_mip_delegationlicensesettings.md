---
title: class DelegationLicenseSettings 
description: Documents the delegationlicensesettings::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 04/23/2021
---

# class DelegationLicenseSettings 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr\<const PublishingLicenseInfo\> GetLicenseInfo() const  |  Gets the PublishingLicenseInfo, the publishing license.
public const std::vector\<std::string\>& GetUsers() const  |  Gets the list of users for the request.
public bool GetAquireEndUserLicenses() const  |  Gets the boolean value that indicates whether or not to obtain end user license in addition to the delegate license.
  
## Members
  
### GetLicenseInfo function
Gets the PublishingLicenseInfo, the publishing license.

  
**Returns**: The PublishingLicenseInfo
  
### GetUsers function
Gets the list of users for the request.

  
**Returns**: The users
  
### GetAquireEndUserLicenses function
Gets the boolean value that indicates whether or not to obtain end user license in addition to the delegate license.

  
**Returns**: Whether to aquire end user licenses