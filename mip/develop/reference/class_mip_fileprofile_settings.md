---
title: class mip::FileProfile::Settings 
description: Documents the mip::fileprofile class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/23/2019
---

# class mip::FileProfile::Settings 
[Settings](class_mip_fileprofile_settings.md) used by [FileProfile](class_mip_fileprofile.md) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::string& path, bool useInMemoryStorage, std::shared_ptr<AuthDelegate> authDelegate, std::shared_ptr<ConsentDelegate> consentDelegate, std::shared_ptr<Observer> observer, const ApplicationInfo& applicationInfo)  |  [FileProfile::Settings](class_mip_fileprofile_settings.md) constructor.
public const std::string& GetPath() const  |  Gets the path under which logging, telemetry, and other persistent state is stored.
public bool GetUseInMemoryStorage() const  |  Gets if all state should be stored in memory (as opposed to on disk)
public std::shared_ptr<AuthDelegate> GetAuthDelegate() const  |  Gets the auth delegate used for acquiring authentication tokens.
public std::shared_ptr<ConsentDelegate> GetConsentDelegate() const  |  Gets the consent delegate used to request user consent connecting to services.
public std::shared_ptr<Observer> GetObserver() const  |  Gets the observer that receives notifications of events related to [FileProfile](class_mip_fileprofile.md).
public const ApplicationInfo GetApplicationInfo() const  |  Gets info about application that is consuming the SDK.
public bool GetSkipTelemetryInit() const  |  Gets if telemetry initialization should be skipped or not.
public void SetSkipTelemetryInit()  |  Disables telemetry initialization.
public void SetNewFeaturesDisabled()  |  Disables new features.
public bool AreNewFeaturesDisabled() const  |  Gets if new features are disabled or not.
public std::shared_ptr<LoggerDelegate> GetLoggerDelegate() const  |  Get the logger delegate (if any) provided by the application.
public void SetLoggerDelegate(const std::shared_ptr<LoggerDelegate>& loggerDelegate)  |  Override default logger.
public std::shared_ptr<HttpDelegate> GetHttpDelegate() const  |  Get the HTTP delegate (if any) provided by the application.
public void SetHttpDelegate(const std::shared_ptr<HttpDelegate>& httpDelegate)  |  Override default HTTP stack with client's own.
public void OptOutTelemetry()  |  Opts out of all telemetry gathering.
public bool IsTelemetryOptedOut() const  |  Gets if telemetry gathering should be disabled or not.
public void SetSessionId(const std::string& sessionId)  |  Sets the session ID.
public const std::string& GetSessionId() const  |  Gets the session ID.
public void SetMinimumLogLevel(LogLevel logLevel)  |  Set the lowest log level that will trigger a logging event.
public LogLevel GetMinimumLogLevel() const  |  Get the lowest log level that will trigger a logging event.
  
## Members
  
### Settings
[FileProfile::Settings](class_mip_fileprofile_settings.md) constructor.

Parameters:  
* **path**: File path under which logging, telemetry, and other persistent state is stored 


* **useInMemoryStorage**: true if all state should be stored in memory, false if state can be cached to disk 


* **authDelegate**: Auth delegate used for acquiring authentication tokens 


* **observer**: [Observer](class_mip_fileprofile_observer.md) instance that will receive notifications of events related to [FileProfile](class_mip_fileprofile.md)


* **applicationInfo**: Info about application that is consuming the SDK


  
### GetPath
Gets the path under which logging, telemetry, and other persistent state is stored.

  
**Returns**: Path under which logging, telemetry, and other persistent state is stored
  
### GetUseInMemoryStorage
Gets if all state should be stored in memory (as opposed to on disk)

  
**Returns**: If all state should be stored in memory (as opposed to on disk)
  
### AuthDelegate
Gets the auth delegate used for acquiring authentication tokens.

  
**Returns**: Auth delegate used for acquiring authentication tokens
  
### ConsentDelegate
Gets the consent delegate used to request user consent connecting to services.

  
**Returns**: Consent delegate used for requesting user consent
  
### Observer
Gets the observer that receives notifications of events related to [FileProfile](class_mip_fileprofile.md).

  
**Returns**: [Observer](class_mip_fileprofile_observer.md) that receives notifications of events related to [FileProfile](class_mip_fileprofile.md)
  
### ApplicationInfo
Gets info about application that is consuming the SDK.

  
**Returns**: Info about application that is consuming the SDK
  
### GetSkipTelemetryInit
Gets if telemetry initialization should be skipped or not.

  
**Returns**: If telemetry initialization should be skipped or not
  
### SetSkipTelemetryInit
Disables telemetry initialization.
This method is not typically called by client applications, rather it is used by File SDK to prevent duplicate initialization
  
### SetNewFeaturesDisabled
Disables new features.
For applications that don't want to try new features
  
### AreNewFeaturesDisabled
Gets if new features are disabled or not.

  
**Returns**: If new features are disabled or not
  
### LoggerDelegate
Get the logger delegate (if any) provided by the application.

  
**Returns**: Logger
  
### SetLoggerDelegate
Override default logger.

Parameters:  
* **loggerDelegate**: Logging callback interface implemented by client applications


This method should be called by client applications that use their own logger implementation
  
### HttpDelegate
Get the HTTP delegate (if any) provided by the application.

  
**Returns**: HTTP delegate to be used for HTTP operations
  
### SetHttpDelegate
Override default HTTP stack with client's own.

Parameters:  
* **httpDelegate**: HTTP callback interface implemented by client application


  
### OptOutTelemetry
Opts out of all telemetry gathering.
  
### IsTelemetryOptedOut
Gets if telemetry gathering should be disabled or not.

  
**Returns**: If telemetry gathering should be disabled or not
  
### SetSessionId
Sets the session ID.

Parameters:  
* **sessionId**: Session ID that will be used to correlate logs/telemetry


  
### GetSessionId
Gets the session ID.

  
**Returns**: Session ID that will be used to correlate logs/telemetry
  
### SetMinimumLogLevel
Set the lowest log level that will trigger a logging event.

Parameters:  
* **logLevel**: lowest log level that will trigger a logging event. 



  
**Returns**: True
  
### LogLevel
Get the lowest log level that will trigger a logging event.

  
**Returns**: Lowest log level that will trigger a logging event.