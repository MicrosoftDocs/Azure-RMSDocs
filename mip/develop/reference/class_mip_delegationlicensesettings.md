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
public static std::shared_ptr<DelegationLicenseSettings> __CDECL CreateDelegationLicenseSettings(const PublishingLicenseInfo& licenseInfo, const std::vector<std::string>& users, bool aquireEndUserLicenses) | Creates a DelegationLicenseSettings object

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

### DelegationLicenseSettings function

Creates a DelegationLicenseSettings object

Parameters:

* **licenseInfo** The publishing license to request licenses for
* **users** A list of user email addresses to create licenses for
* **aquireEndUserLicenses** Whether to include end user licenses (license bound to the users) or to only include a delegated license (bound to the identity on the engine)


**Returns** A DelegationLicenseSettings object
