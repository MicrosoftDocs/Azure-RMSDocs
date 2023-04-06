---
title: class DelegationLicenseSettings 
description: Documents the delegationlicensesettings::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class DelegationLicenseSettings 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr&lt;const PublishingLicenseInfo&gt; GetLicenseInfo() const  |  Gets the [PublishingLicenseInfo](class_mip_publishinglicenseinfo.md), the publishing license.
public const std::vector&lt;std::string&gt;& GetUsers() const  |  Gets the list of users for the request.
public bool GetAquireEndUserLicenses() const  |  Gets the boolean value that indicates whether or not to obtain end user license in addition to the delegate license.
  
## Members
  
### GetLicenseInfo function
Gets the [PublishingLicenseInfo](class_mip_publishinglicenseinfo.md), the publishing license.

  
**Returns**: The [PublishingLicenseInfo](class_mip_publishinglicenseinfo.md)
  
### GetUsers function
Gets the list of users for the request.

  
**Returns**: The users
  
### GetAquireEndUserLicenses function
Gets the boolean value that indicates whether or not to obtain end user license in addition to the delegate license.

  
**Returns**: Whether to aquire end user licenseses