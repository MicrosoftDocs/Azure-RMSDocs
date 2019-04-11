---
title: class mip::PolicyProfile::Settings 
description: Documents the mip::policyprofile class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::PolicyProfile::Settings 
[Settings](class_mip_policyprofile_settings.md) used by [PolicyProfile](class_mip_policyprofile.md) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::string& path, bool useInMemoryStorage, const std::shared_ptr\<AuthDelegate\>& authDelegate, const std::shared_ptr\<PolicyProfile::Observer\>& observer, const ApplicationInfo& applicationInfo)  |  Interface for configuring the profile.
public const std::string& GetPath() const  |  Get the path to the stored state.
public bool GetUseInMemoryStorage() const  |  Get the Use In Memory Storage flag.
public const std::shared_ptr\<AuthDelegate\>& GetAuthDelegate() const  |  Get the Auth Delegate.
public const std::shared_ptr\<PolicyProfile::Observer\>& GetObserver() const  |  Get the event observer.
public const ApplicationInfo GetApplicationInfo() const  |  Get the application info.
public std::shared_ptr\<LoggerDelegate\> GetLoggerDelegate() const  |  Get the logger delegate (if any) provided by the application.
public void SetLoggerDelegate(const std::shared_ptr\<LoggerDelegate\>& loggerDelegate)  |  Override default logger.
public std::shared_ptr\<HttpDelegate\> GetHttpDelegate() const  |  Get the HTTP delegate (if any) provided by the application.
public void SetHttpDelegate(const std::shared_ptr\<HttpDelegate\>& httpDelegate)  |  Override default HTTP stack with client's own.
public std::shared_ptr\<TaskDispatcherDelegate\> GetTaskDispatcherDelegate() const  |  Get the TaskDispatcher delegate (if any) provided by the application.
public void SetTaskDispatcherDelegate(const std::shared_ptr\<TaskDispatcherDelegate\>& taskDispatcherDelegate)  |  Override default asynchonous task dispatching handling with client's own.
public void OptOutTelemetry()  |  Opts out of all telemetry gathering.
public bool IsTelemetryOptedOut() const  |  Gets if telemetry gathering should be disabled or not.
public void SetMinimumLogLevel(LogLevel logLevel)  |  Set the minimum log level that will trigger a logging event.
public LogLevel GetMinimumLogLevel() const  |  Get the Minimum Log Level object.
  
## Members
  
### Settings function
Interface for configuring the profile.

Parameters:  
* **path**: The path to a directory in which the SDK will store the profile state. 


* **useInMemoryStorage**: Store any cached state in memory rather than on disk. 


* **authDelegate**: The authentication delegate used by the SDK to acquire authentication tokens. 


* **observer**: A class implementing the [PolicyProfile::Observer](class_mip_policyprofile_observer.md) interface. Can be nullptr. 


* **applicationInfo**: The application identifiers used for service access.


  
### GetPath function
Get the path to the stored state.

  
**Returns**: Path to stored state.
  
### GetUseInMemoryStorage function
Get the Use In Memory Storage flag.

  
**Returns**: True if use in memory is set else false.
  
### GetAuthDelegate function
Get the Auth Delegate.

  
**Returns**: The Auth Delegate.
  
### GetObserver function
Get the event observer.

  
**Returns**: The event observer.
  
### GetApplicationInfo function
Get the application info.

  
**Returns**: The application info.
  
### GetLoggerDelegate function
Get the logger delegate (if any) provided by the application.

  
**Returns**: Logger
  
### SetLoggerDelegate function
Override default logger.

Parameters:  
* **loggerDelegate**: Logging callback interface implemented by client applications


This method should be called by client applications that use their own logger implementation
  
### GetHttpDelegate function
Get the HTTP delegate (if any) provided by the application.

  
**Returns**: Http delegate to be used for HTTP operations
  
### SetHttpDelegate function
Override default HTTP stack with client's own.

Parameters:  
* **httpDelegate**: Http callback interface implemented by client application


  
### GetTaskDispatcherDelegate function
Get the TaskDispatcher delegate (if any) provided by the application.

  
**Returns**: TaskDispatcher delegate to be used for executing asynchronous tasks
  
### SetTaskDispatcherDelegate function
Override default asynchonous task dispatching handling with client's own.

Parameters:  
* **taskDispatcherDelegate**: Task dispatching callback interface implemented by client application


  
### OptOutTelemetry function
Opts out of all telemetry gathering.
  
### IsTelemetryOptedOut function
Gets if telemetry gathering should be disabled or not.

  
**Returns**: True if telemetry gathering should be disabled else false
  
### SetMinimumLogLevel function
Set the minimum log level that will trigger a logging event.

Parameters:  
* **logLevel**: minimum log level that will trigger a logging event. 



  
**Returns**: True
  
### GetMinimumLogLevel function
Get the Minimum Log Level object.

  
**Returns**: Minimum log level that will trigger a logging event.