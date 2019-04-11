---
title: class mip::FileProfile::Settings 
description: Documents the mip::fileprofile class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::FileProfile::Settings 
[Settings](class_mip_fileprofile_settings.md) used by [FileProfile](class_mip_fileprofile.md) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::string& path, bool useInMemoryStorage, std::shared_ptr\<AuthDelegate\> authDelegate, std::shared_ptr\<ConsentDelegate\> consentDelegate, std::shared_ptr\<Observer\> observer, const ApplicationInfo& applicationInfo)  |  [FileProfile::Settings](class_mip_fileprofile_settings.md) constructor.
public const std::string& GetPath() const  |  Gets the path under which logging, telemetry, and other persistent state is stored.
public bool GetUseInMemoryStorage() const  |  Gets if all state should be stored in memory (as opposed to on disk)
public std::shared_ptr\<AuthDelegate\> GetAuthDelegate() const  |  Gets the auth delegate used for acquiring authentication tokens.
public std::shared_ptr\<ConsentDelegate\> GetConsentDelegate() const  |  Gets the consent delegate used to request user consent connecting to services.
public std::shared_ptr\<Observer\> GetObserver() const  |  Gets the observer that receives notifications of events related to [FileProfile](class_mip_fileprofile.md).
public const ApplicationInfo GetApplicationInfo() const  |  Gets info about application that is consuming the SDK.
public void SetNewFeaturesDisabled()  |  Disables new features.
public bool AreNewFeaturesDisabled() const  |  Gets if new features are disabled or not.
public std::shared_ptr\<LoggerDelegate\> GetLoggerDelegate() const  |  Get the logger delegate (if any) provided by the application.
public void SetLoggerDelegate(const std::shared_ptr\<LoggerDelegate\>& loggerDelegate)  |  Override default logger.
public std::shared_ptr\<HttpDelegate\> GetHttpDelegate() const  |  Get the HTTP delegate (if any) provided by the application.
public void SetHttpDelegate(const std::shared_ptr\<HttpDelegate\>& httpDelegate)  |  Override default HTTP stack with client's own.
public std::shared_ptr\<TaskDispatcherDelegate\> GetTaskDispatcherDelegate() const  |  Get the TaskDispatcher delegate (if any) provided by the application.
public void SetTaskDispatcherDelegate(const std::shared_ptr\<TaskDispatcherDelegate\>& taskDispatcherDelegate)  |  Override default asynchonous task dispatching handling with client's own.
public void OptOutTelemetry()  |  Opts out of all telemetry gathering.
public bool IsTelemetryOptedOut() const  |  Gets if telemetry gathering should be disabled or not.
public void SetSessionId(const std::string& sessionId)  |  Sets the session ID.
public const std::string& GetSessionId() const  |  Gets the session ID.
public void SetMinimumLogLevel(LogLevel logLevel)  |  Set the lowest log level that will trigger a logging event.
public LogLevel GetMinimumLogLevel() const  |  Get the lowest log level that will trigger a logging event.
  
## Members
  
### Settings function
[FileProfile::Settings](class_mip_fileprofile_settings.md) constructor.

Parameters:  
* **path**: File path under which logging, telemetry, and other persistent state is stored 


* **useInMemoryStorage**: true if all state should be stored in memory, false if state can be cached to disk 


* **authDelegate**: Auth delegate used for acquiring authentication tokens 


* **observer**: [Observer](class_mip_fileprofile_observer.md) instance that will receive notifications of events related to [FileProfile](class_mip_fileprofile.md)


* **applicationInfo**: Info about application that is consuming the SDK


  
### GetPath function
Gets the path under which logging, telemetry, and other persistent state is stored.

  
**Returns**: Path under which logging, telemetry, and other persistent state is stored
  
### GetUseInMemoryStorage function
Gets if all state should be stored in memory (as opposed to on disk)

  
**Returns**: If all state should be stored in memory (as opposed to on disk)
  
### GetAuthDelegate function
Gets the auth delegate used for acquiring authentication tokens.

  
**Returns**: Auth delegate used for acquiring authentication tokens
  
### GetConsentDelegate function
Gets the consent delegate used to request user consent connecting to services.

  
**Returns**: Consent delegate used for requesting user consent
  
### GetObserver function
Gets the observer that receives notifications of events related to [FileProfile](class_mip_fileprofile.md).

  
**Returns**: [Observer](class_mip_fileprofile_observer.md) that receives notifications of events related to [FileProfile](class_mip_fileprofile.md)
  
### GetApplicationInfo function
Gets info about application that is consuming the SDK.

  
**Returns**: Info about application that is consuming the SDK
  
### SetNewFeaturesDisabled function
Disables new features.
For applications that don't want to try new features
  
### AreNewFeaturesDisabled function
Gets if new features are disabled or not.

  
**Returns**: If new features are disabled or not
  
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

  
**Returns**: HTTP delegate to be used for HTTP operations
  
### SetHttpDelegate function
Override default HTTP stack with client's own.

Parameters:  
* **httpDelegate**: HTTP callback interface implemented by client application


  
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

  
**Returns**: If telemetry gathering should be disabled or not
  
### SetSessionId function
Sets the session ID.

Parameters:  
* **sessionId**: Session ID that will be used to correlate logs/telemetry


  
### GetSessionId function
Gets the session ID.

  
**Returns**: Session ID that will be used to correlate logs/telemetry
  
### SetMinimumLogLevel function
Set the lowest log level that will trigger a logging event.

Parameters:  
* **logLevel**: lowest log level that will trigger a logging event. 



  
**Returns**: True
  
### GetMinimumLogLevel function
Get the lowest log level that will trigger a logging event.

  
**Returns**: Lowest log level that will trigger a logging event.