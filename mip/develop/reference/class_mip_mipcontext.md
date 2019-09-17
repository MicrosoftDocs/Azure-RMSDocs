---
title: class mip::MipContext 
description: Documents the mip::mipcontext class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/27/2019
---

# class mip::MipContext 
MipContext represents state that is shared across all profiles, engines, handlers.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void ShutDown()  |  Terminate MIP.
public bool IsFeatureEnabled(FlightingFeature feature) const  |  Gets whether or not a feature is enabled.
public const ApplicationInfo& GetApplicationInfo() const  |  Get application description.
public const std::string& GetMipPath() const  |  Get file path for logs, caches, etc.
public std::shared_ptr\<LoggerDelegate\> GetLoggerDelegate()  |  Get logger implementation.
public LoggerDelegate* GetRawLoggerDelegate()  |  Get logger implementation.
public static MIP_API std::shared_ptr&lt;MipContext&gt; __CDECL mip::MipContext::Create | Create a new MipContext instance to be used when initializing profiles.
public static MIP_API std::shared_ptr&lt;MipContext&gt; __CDECL mip::MipContext::CreateWithCustomFeatureSettings | Create a new MipContext instance with custom feature settings.

## Members
  
### ShutDown function
Terminate MIP.
This method must be called prior to process/DLL shutdown
  
### IsFeatureEnabled function
Gets whether or not a feature is enabled.

Parameters:  
* **feature**: Feature to enable/disable



  
**Returns**: Whether or not a feature is enabled
If a FeatureFlightingDelegate has not been provided by an application, this will always return true
  
### GetApplicationInfo function
Get application description.

  
**Returns**: Application description
  
### GetMipPath function
Get file path for logs, caches, etc.

  
**Returns**: File path (with "mip" leaf directory)
  
### GetLoggerDelegate function
Get logger implementation.

  
**Returns**: Logger
  
### GetRawLoggerDelegate function
Get logger implementation.

**Returns**: Logger

### Create function
Create a new MipContext instance to be used when initializing profiles.

**Returns**: MipContext instance.

### CreateWithCustomFeatureSettings function
Create a new MipContext instance with custom feature settings.

**Returns**: MipContext instance.

