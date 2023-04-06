---
title: class MipContext 
description: Documents the mipcontext::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class MipContext 
[MipContext](class_mip_mipcontext.md) represents state that is shared across all profiles, engines, handlers.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void ShutDown()  |  Terminate MIP.
public bool IsFeatureEnabled(FlightingFeature feature) const  |  Gets whether or not a feature is enabled.
public const ApplicationInfo& GetApplicationInfo() const  |  Get application description.
public const std::string& GetMipPath() const  |  Get file path for logs, caches, etc.
public bool IsOfflineOnly() const  |  Get offline-only setting.
public LogLevel GetThresholdLogLevel() const  |  Get threshold log level.
public std::shared_ptr&lt;LoggerDelegate&gt; GetLoggerDelegate() const  |  Get logger implementation.
public std::shared_ptr&lt;HttpDelegate&gt; GetHttpDelegate() const  |  Get Http implementation.
public LoggerDelegate* GetRawLoggerDelegate() const  |  Get raw logger implementation.
public std::shared_ptr&lt;StorageDelegate&gt; GetStorageDelegate() const  |  Get Storage Delegate implementation if provided.
public const std::map&lt;FlightingFeature, bool&gt;& GetFlightingFeatures() const  |  Get flighting feature set.
public const std::shared_ptr&lt;const MipConfiguration&gt;& GetMipConfiguration() const  |  Gets the mip configuration that was used to create the [MipContext](class_mip_mipcontext.md).
  
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
  
### IsOfflineOnly function
Get offline-only setting.

  
**Returns**: Whether or not application is running in offline-only mode
  
### GetThresholdLogLevel function
Get threshold log level.

  
**Returns**: Threshold log level
  
### GetLoggerDelegate function
Get logger implementation.

  
**Returns**: Logger
  
### GetHttpDelegate function
Get Http implementation.

  
**Returns**: [HttpDelegate](class_mip_httpdelegate.md)
  
### GetRawLoggerDelegate function
Get raw logger implementation.

  
**Returns**: Logger
  
### GetStorageDelegate function
Get Storage Delegate implementation if provided.

  
**Returns**: [StorageDelegate](class_mip_storagedelegate.md)
  
### GetFlightingFeatures function
Get flighting feature set.

  
**Returns**: Flighting feature map
  
### GetMipConfiguration function
Gets the mip configuration that was used to create the [MipContext](class_mip_mipcontext.md).

  
**Returns**: The mip configurationation