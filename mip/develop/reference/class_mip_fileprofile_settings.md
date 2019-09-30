---
title: class mip::FileProfile::Settings 
description: Documents the mip::fileprofile class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/27/2019
---

# class mip::FileProfile::Settings 
[Settings](class_mip_fileprofile_settings.md) used by [FileProfile](class_mip_fileprofile.md) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::string& path, CacheStorageType cacheStorageType, std::shared_ptr\<AuthDelegate\> authDelegate, std::shared_ptr\<ConsentDelegate\> consentDelegate, std::shared_ptr\<Observer\> observer, const ApplicationInfo& applicationInfo)  |  [FileProfile::Settings](class_mip_fileprofile_settings.md) constructor.
public Settings(const std::shared_ptr\<MipContext\>& mipContext, CacheStorageType cacheStorageType, std::shared_ptr\<AuthDelegate\> authDelegate, std::shared_ptr\<ConsentDelegate\> consentDelegate, std::shared_ptr\<Observer\> observer)  |  [FileProfile::Settings](class_mip_fileprofile_settings.md) constructor.
public const std::string& GetPath() const  |  Gets the path under which logging, telemetry, and other persistent state is stored.
public CacheStorageType GetCacheStorageType() const  |  Get whether caches are stored in memory or on disk.
public std::shared_ptr\<AuthDelegate\> GetAuthDelegate() const  |  Gets the auth delegate used for acquiring authentication tokens.
public std::shared_ptr\<ConsentDelegate\> GetConsentDelegate() const  |  Gets the consent delegate used to request user consent connecting to services.
public std::shared_ptr\<Observer\> GetObserver() const  |  Gets the observer that receives notifications of events related to [FileProfile](class_mip_fileprofile.md).
public const ApplicationInfo& GetApplicationInfo() const  |  Gets info about application that is consuming the SDK.
public std::shared_ptr\<MipContext\> GetMipContext() const  |  Get MIP context which represents shared state across all profiles.
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
public void SetCanCacheLicenses(bool canCacheLicenses)  |  Configures whether or not end user licenses (EULs) will be cached locally.
public bool CanCacheLicenses() const  |  Gets whether or not end user licenses (EULs) are cached locally.
  
## Members
  
### Settings function
[FileProfile::Settings](class_mip_fileprofile_settings.md) constructor.

Parameters:  
* **path**: File path under which logging, telemetry, and other persistent state is stored 


* **cacheStorageType**: Store any cached state in memory or on disk 


* **authDelegate**: Auth delegate used for acquiring authentication tokens 


* **consentDelegate**: Delegate used to obtain user permission to access external resources 


* **observer**: [Observer](class_mip_fileprofile_observer.md) instance that will receive notifications of events related to [FileProfile](class_mip_fileprofile.md)


* **applicationInfo**: Info about application that is consuming the SDK


> Deprecated: This constructor will soon be deprecated in favor of one requiring a mip::MipContext parameter
  
### Settings function
[FileProfile::Settings](class_mip_fileprofile_settings.md) constructor.

Parameters:  
* **mipContext**: Global context settings 


* **cacheStorageType**: Store any cached state in memory or on disk 


* **authDelegate**: Auth delegate used for acquiring authentication tokens 


* **consentDelegate**: Delegate used to obtain user permission to access external resources 


* **observer**: [Observer](class_mip_fileprofile_observer.md) instance that will receive notifications of events related to [FileProfile](class_mip_fileprofile.md)


  
### GetPath function
Gets the path under which logging, telemetry, and other persistent state is stored.

  
**Returns**: Path under which logging, telemetry, and other persistent state is stored
> Deprecated: This method will soon be deprecated in favor of getting/setting common context data through mip::MipContext
  
### GetCacheStorageType function
Get whether caches are stored in memory or on disk.

  
**Returns**: Storage type used
  
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
> Deprecated: This method will soon be deprecated in favor of getting/setting common context data through mip::MipContext
  
### GetMipContext function
Get MIP context which represents shared state across all profiles.

  
**Returns**: MIP context
  
### GetLoggerDelegate function
Get the logger delegate (if any) provided by the application.

  
**Returns**: Logger
> Deprecated: This method will soon be deprecated in favor of getting/setting common context data through mip::MipContext
  
### SetLoggerDelegate function
Override default logger.

Parameters:  
* **loggerDelegate**: Logging callback interface implemented by client applications


This method should be called by client applications that use their own logger implementation 
> Deprecated: This method will soon be deprecated in favor of getting/setting common context data through mip::MipContext
  
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
> Deprecated: This method will soon be deprecated in favor of getting/setting common context data through mip::MipContext
  
### IsTelemetryOptedOut function
Gets if telemetry gathering should be disabled or not.

  
**Returns**: If telemetry gathering should be disabled or not
> Deprecated: This method will soon be deprecated in favor of getting/setting common context data through mip::MipContext
  
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


> Deprecated: This method will soon be deprecated in favor of getting/setting common context data through mip::MipContext
  
### GetMinimumLogLevel function
Get the lowest log level that will trigger a logging event.

  
**Returns**: Lowest log level that will trigger a logging event.
> Deprecated: This method will soon be deprecated in favor of getting/setting common context data through mip::MipContext
  
### SetCanCacheLicenses function
Configures whether or not end user licenses (EULs) will be cached locally.

Parameters:  
* **canCacheLicenses**: Whether or not engine should cache a license when opening protected content


If true, opening protected content will cache the associated license locally. If false, opening protected content will always perform HTTP operation to acquire the license from the RMS service.
  
### CanCacheLicenses function
Gets whether or not end user licenses (EULs) are cached locally.

  
**Returns**: License caching configuration