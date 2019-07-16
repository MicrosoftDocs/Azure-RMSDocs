---
title: class mip::ServiceDisabledError 
description: Documents the mip::servicedisablederror class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::ServiceDisabledError 
The user could not get access to the content due to a service being disabled.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Extent GetExtent() const  |  Gets the extent for which the service is disabled.
enum Extent  |  Describes the extent for which the service is disabled.
  
## Members
  
### GetExtent function
Gets the extent for which the service is disabled.

  
**Returns**: Extent for which the service is disabled
  
### Extent enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
User            | Service is disabled for the user.
Device            | Service is disabled for the device.
Platform            | Service is disabled for the platform.
Tenant            | Service is disabled for the tenant.
Describes the extent for which the service is disabled.