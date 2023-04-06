---
title: class LicenseRightsData 
description: Documents the licenserightsdata::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class LicenseRightsData 

The rights related information of the publishing license.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public LicenseRightsData(const ProtectionType type, const std::vector&lt;DirectoryObjectRights&gt;& directoryObjectsRights, const std::chrono::time_point&lt;std::chrono::system_clock&gt;& contentValidUntil)  |  [LicenseRightsData](#class_license_rights_data) constructor.
public const ProtectionType GetProtectionType() const  |  Gets type of protection, whether it originated from protection SDK template or not.
public const std::vector&lt;DirectoryObjectRights&gt;& GetDirectoryObjectsRights() const  |  Gets the set of directory objects and the rights associated with them.
public bool DoesContentExpire()  |  Checks if content has an expiration time or not.
public const std::chrono::time_point&lt;std::chrono::system_clock&gt; GetContentValidUntil() const  |  Gets protection expiration time.
  
## Members
  
### LicenseRightsData function
[LicenseRightsData](class_mip_licenserightsdata.md) constructor.

Parameters:  
* **type**: The type of protection, whether it originated from protection SDK template or not 


* **directoryObjectsRights**: The set of directory objects and the rights associated with them 


* **contentValidUtil**: Protection expiration time


  
### GetProtectionType function
Gets type of protection, whether it originated from protection SDK template or not.

  
**Returns**: Type of protection
  
### GetDirectoryObjectsRights function
Gets the set of directory objects and the rights associated with them.

  
**Returns**: The set of directory objects and the rights associated with them
  
### DoesContentExpire function
Checks if content has an expiration time or not.

  
**Returns**: True if content can expire, else false
  
### GetContentValidUntil function
Gets protection expiration time.

  
**Returns**: Protection expiration timetime