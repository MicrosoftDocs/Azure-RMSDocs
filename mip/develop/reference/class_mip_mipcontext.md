---
title: class MipContext 
description: Documents the mipcontext::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 05/31/2022
---

# class MipContext 
MipContext represents state that is shared across all profiles, engines, handlers.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void ShutDown()  |  Terminate MIP.
public bool IsFeatureEnabled(FlightingFeature feature) const  |  Gets whether or not a feature is enabled.
public const ApplicationInfo& GetApplicationInfo() const  |  Get application description.
public const std::string& GetMipPath() const  |  Get file path for logs, caches, etc.
public bool IsOfflineOnly() const  |  Get offline-only setting.
public LogLevel GetThresholdLogLevel() const  |  Get threshold log level.
public std::shared_ptr\<LoggerDelegate\> GetLoggerDelegate() const  |  Get logger implementation.
public std::shared_ptr\<HttpDelegate\> GetHttpDelegate() const  |  Get Http implementation.
public LoggerDelegate* GetRawLoggerDelegate() const  |  Get raw logger implementation.
public std::shared_ptr\<StorageDelegate\> GetStorageDelegate() const  |  Get Storage Delegate implementation if provided.
public const std::map\<FlightingFeature, bool\>& GetFlightingFeatures() const  |  Get flighting feature set.
public const std::shared_ptr\<const MipConfiguration\>& GetMipConfiguration() const  |  Gets the mip configuration that was used to create the MipContext.
  
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

  
**Returns**: HttpDelegate
  
### GetRawLoggerDelegate function
Get raw logger implementation.

  
**Returns**: Logger
  
### GetStorageDelegate function
Get Storage Delegate implementation if provided.

  
**Returns**: StorageDelegate
  
### GetFlightingFeatures function
Get flighting feature set.

  
**Returns**: Flighting feature map
  
### GetMipConfiguration function
Gets the mip configuration that was used to create the MipContext.

  
**Returns**: The mip configuration