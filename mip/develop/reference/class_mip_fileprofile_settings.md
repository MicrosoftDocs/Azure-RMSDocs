# class mip::FileProfile::Settings 
[Settings](class_mip_fileprofile_settings.md) used by [FileProfile](class_mip_fileprofile.md) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::string& path, bool useInMemoryStorage, bool isLicenseCachingEnabled, std::shared_ptr<AuthDelegate> authDelegate, std::shared_ptr<ConsentDelegate> consentDelegate, std::shared_ptr<Observer> observer, const ApplicationInfo& applicationInfo)  |  [FileProfile::Settings](class_mip_fileprofile_settings.md) constructor.
 public const std::string& GetPath() const  |  Gets the path under which logging, telemetry, and other persistent state is stored.
 public bool GetUseInMemoryStorage() const  |  Gets whether or not all state should be stored in memory (as opposed to on disk)
 public bool IsLicenseCachingEnabled() const  |  Get whether or caching of licenses is enabled.
public std::shared_ptr<AuthDelegate> GetAuthDelegate() const  |  Gets the auth delegate used for acquiring authentication tokens.
public std::shared_ptr<ConsentDelegate> GetConsentDelegate() const  |  Gets the consent delegate used to request user consent connecting to services.
public std::shared_ptr<Observer> GetObserver() const  |  Gets the observer which receives notifications of events related to [FileProfile](class_mip_fileprofile.md).
 public const ApplicationInfo GetApplicationInfo() const  |  Gets info regarding application that is consuming the SDK.
 public bool GetSkipTelemetryInit() const  |  Gets whether or not telemetry initialization should be skipped.
 public void SetSkipTelemetryInit()  |  Disables telemetry initialization.
public std::shared_ptr<LoggerDelegate> GetLoggerDelegate() const  |  Get the logger delegate (if any) provided by the application.
public void SetLoggerDelegate(const std::shared_ptr<LoggerDelegate>& loggerDelegate)  |  Use external logger implementation.
 public void OptOutTelemetry()  |  Opts out of all telemetry gathering.
 public bool IsTelemetryOptedOut() const  |  Gets whether or not telemetry gathering should be disabled.
 public void SetSessionId(const std::string& sessionId)  |  Sets the session id.
 public const std::string& GetSessionId() const  |  Gets the session id.
  
## Members
  
### Settings
[FileProfile::Settings](class_mip_fileprofile_settings.md) constructor.

Parameters:  
* **path**: File path under which logging, telemetry, and other persistent state is stored 


* **useInMemoryStorage**: Whether or not all state should be stored in memory (as opposed to on disk) 


* **isLicenseCachingEnabled**: Enable or disable caching of protection licenses 


* **authDelegate**: Auth delegate used for acquiring authentication tokens 


* **observer**: [Observer](class_mip_fileprofile_observer.md) instance which will receive notifications of events related to [FileProfile](class_mip_fileprofile.md)


* **applicationInfo**: Info regarding application that is consuming the SDK


  
### GetPath
Gets the path under which logging, telemetry, and other persistent state is stored.

  
**Returns**: Path under which logging, telemetry, and other persistent state is stored
  
### GetUseInMemoryStorage
Gets whether or not all state should be stored in memory (as opposed to on disk)

  
**Returns**: Whether or not all state should be stored in memory (as opposed to on disk)
  
### IsLicenseCachingEnabled
Get whether or caching of licenses is enabled.

  
**Returns**: True if caches are stored in memory only
  
### GetAuthDelegate
Gets the auth delegate used for acquiring authentication tokens.

  
**Returns**: Auth delegate used for acquiring authentication tokens
  
### ConsentDelegate
Gets the consent delegate used to request user consent connecting to services.

  
**Returns**: Consent delegate used for requesting user consent
  
### Observer
Gets the observer which receives notifications of events related to [FileProfile](class_mip_fileprofile.md).

  
**Returns**: [Observer](class_mip_fileprofile_observer.md) which receives notifications of events related to [FileProfile](class_mip_fileprofile.md)
  
### ApplicationInfo
Gets info regarding application that is consuming the SDK.

  
**Returns**: Info regarding application that is consuming the SDK
  
### GetSkipTelemetryInit
Gets whether or not telemetry initialization should be skipped.

  
**Returns**: Whether or not telemetry initialization should be skipped
  
### SetSkipTelemetryInit
Disables telemetry initialization.
This should not normally be called by client applications, rather it is used by File SDK (which already initializes telemetry) to prevent duplicate initialization
  
### LoggerDelegate
Get the logger delegate (if any) provided by the application.

  
**Returns**: Logger delegate to be used for logging
  
### SetLoggerDelegate
Use external logger implementation.
This should be called by client applications if they want to use their own logger implementation
  
### OptOutTelemetry
Opts out of all telemetry gathering.
  
### IsTelemetryOptedOut
Gets whether or not telemetry gathering should be disabled.

  
**Returns**: Whether or not telemetry gathering should be disabled
  
### SetSessionId
Sets the session id.

Parameters:  
* **sessionId**: Session id which will be used to correlate logs/telemetry


  
### GetSessionId
Gets the session id.

  
**Returns**: Session id which will be used to correlate logs/telemetry