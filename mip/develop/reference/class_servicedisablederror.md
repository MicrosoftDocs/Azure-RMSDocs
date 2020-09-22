---
title: class ServiceDisabledError 
description: Documents the servicedisablederror::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 09/21/2020
---

# class ServiceDisabledError 
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