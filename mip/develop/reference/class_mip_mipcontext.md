---
title: class MipContext 
description: Documents the mipcontext::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 04/23/2021
---

# class MipContext 
MipContext represents state that is shared across all profiles, engines, handlers.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public static std::shared_ptr<MipContext> __CDECL Create(const ApplicationInfo& appInfo, const std::string& path, LogLevel thresholdLogLevel, bool isOfflineOnly, const std::shared_ptr<LoggerDelegate>& loggerDelegateOverride, const std::shared_ptr<DiagnosticConfiguration>& diagnosticOverride) | Create a new MipContext instance to be used when initializing profiles
public static std::shared_ptr<MipContext> __CDECL CreateWithCustomFeatureSettings(const ApplicationInfo& appInfo, const std::string& path, LogLevel thresholdLogLevel, bool isOfflineOnly, const std::shared_ptr<LoggerDelegate>& loggerDelegateOverride, const std::shared_ptr<DiagnosticConfiguration>& diagnosticOverride, const std::map<FlightingFeature, bool>& featureSettingsOverride) | Create a new MipContext instance to be used when initializing profiles
public void ShutDown()  |  Terminate MIP.
public bool IsFeatureEnabled(FlightingFeature feature) const  |  Gets whether or not a feature is enabled.
public const ApplicationInfo& GetApplicationInfo() const  |  Get application description.
public const std::string& GetMipPath() const  |  Get file path for logs, caches, etc.
public bool IsOfflineOnly()  |  Get offline-only setting.
public LogLevel GetThresholdLogLevel() const  |  Get threshold log level.
public std::shared_ptr\<LoggerDelegate\> GetLoggerDelegate()  |  Get logger implementation.
public LoggerDelegate* GetRawLoggerDelegate()  |  Get logger implementation.
public const std::map\<FlightingFeature, bool\>& GetFlightingFeatures() const  |  Get flighting feature set.
  
## Members

### Create function

Create a new MipContext instance to be used when initializing profiles

Parameters:  
* **appInfo** Description of host application
* **path** File path for logs, caches, etc.
* **thresholdLogLevel** Minimum log level for .miplog
* **isOfflineOnly** Enable/disable network operations (not all actions supported when offline)
* **loggerDelegateOverride** (Optional) LoggerDelegate override implementation
* **diagnosticOverride** DiagnosticConfiguration override for audit/telemetry

**Returns** MipContext instance


### CreateWithCustomFeatureSettings function

Parameters:  
* **appInfo** Description of host application
* **path** File path for logs, caches, etc.
* **thresholdLogLevel** Minimum log level for .miplog
* **isOfflineOnly** Enable/disable network operations (not all actions supported when offline)
* **loggerDelegateOverride** (Optional) LoggerDelegate override implementation
* **diagnosticOverride** TDiagnosticConfiguration override for audit/telemetry
* **featureSettingsOverride** Flighting features which should be set to non-default values


**Returns** MipContext instance


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
  
### GetRawLoggerDelegate function
Get logger implementation.

  
**Returns**: Logger
  
### GetFlightingFeatures function
Get flighting feature set.

  
**Returns**: Flighting feature map