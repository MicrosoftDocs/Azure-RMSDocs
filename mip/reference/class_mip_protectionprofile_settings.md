# class mip::ProtectionProfile::Settings 
[Settings](class_mip_protectionprofile_settings.md) used by [ProtectionProfile](class_mip_protectionprofile.md) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::string& path, bool useInMemoryStorage, bool isLicenseCachingEnabled, const std::shared_ptr<AuthDelegate>& authDelegate, const std::shared_ptr<ConsentDelegate>& consentDelegate, const std::shared_ptr<ProtectionProfile::Observer>& observer, const ApplicationInfo& applicationInfo)  |  [ProtectionProfile::Settings](class_mip_protectionprofile_settings.md) constructor.
 public const std::string& GetPath() const  |  Gets the path under which logging, telemetry, and other protection collateral is stored.
 public bool GetUseInMemoryStorage() const  |  Get whether or caches are stored in memory only (as opposed to on disk)
 public bool IsLicenseCachingEnabled() const  |  Get whether or caching of licenses is enabled.
public std::shared_ptr<AuthDelegate> GetAuthDelegate() const  |  Gets the auth delegate used for acquiring authentication tokens.
public std::shared_ptr<ConsentDelegate> GetConsentDelegate() const  |  Gets the consent delegate used for connecting to services.
public const std::shared_ptr<ProtectionProfile::Observer>& GetObserver() const  |  Gets the observer which receives notifications of events related to [ProtectionProfile](class_mip_protectionprofile.md).
 public const ApplicationInfo& GetApplicationInfo() const  |  Gets info regarding application which is consuming the protection SDK.
 public void OptOutTelemetry()  |  Opts out of all telemetry gathering.
 public bool IsTelemetryOptedOut() const  |  Gets whether or not telemetry gathering should be disabled.
public std::shared_ptr<LoggerDelegate> GetLoggerDelegate() const  |  Get the logger delegate (if any) provided by the application.
public void SetLoggerDelegate(const std::shared_ptr<LoggerDelegate>& loggerDelegate)  |  Use external logger implementation.
 public bool GetSkipTelemetryInit() const  |  Gets whether or not telemetry initialization should be skipped.
 public void SetSkipTelemetryInit()  |  Disables telemetry initialization.
 public void SetSessionId(const std::string& sessionId)  |  Sets the session id.
 public const std::string& GetSessionId() const  |  Gets the session id.
  
## Members
  
### Settings
[ProtectionProfile::Settings](class_mip_protectionprofile_settings.md) constructor.

Parameters:  
* **path**: File path under which logging, telemetry, and other protection collateral is stored 


* **useInMemoryStorage**: Store any cached state in memory rather than on disk 


* **isLicenseCachingEnabled**: Enable or disable caching of protection sdk licenses 


* **authDelegate**: Callback object to be used for authentication, implemented by client application 


* **observer**: [Observer](class_mip_protectionprofile_observer.md) instance which will receive notifications of events related to [ProtectionProfile](class_mip_protectionprofile.md)


* **applicationInfo**: Info regarding application which is consuming the protection SDK


  
### GetPath
Gets the path under which logging, telemetry, and other protection collateral is stored.

  
**Returns**: Path under which logging, telemetry, and other protection collateral is stored
  
### GetUseInMemoryStorage
Get whether or caches are stored in memory only (as opposed to on disk)

  
**Returns**: True if caches are stored in memory only
  
### IsLicenseCachingEnabled
Get whether or caching of licenses is enabled.

  
**Returns**: True if protection SDK license caching is enabled
  
### GetAuthDelegate
Gets the auth delegate used for acquiring authentication tokens.

  
**Returns**: Auth delegate used for acquiring authentication tokens
  
### ConsentDelegate
Gets the consent delegate used for connecting to services.

  
**Returns**: Consent delegate used for connecting to services
  
### ProtectionProfile::Observer
Gets the observer which receives notifications of events related to [ProtectionProfile](class_mip_protectionprofile.md).

  
**Returns**: [Observer](class_mip_protectionprofile_observer.md) which receives notifications of events related to [ProtectionProfile](class_mip_protectionprofile.md)
  
### ApplicationInfo
Gets info regarding application which is consuming the protection SDK.

  
**Returns**: Info regarding application which is consuming the protection SDK
  
### OptOutTelemetry
Opts out of all telemetry gathering.
  
### IsTelemetryOptedOut
Gets whether or not telemetry gathering should be disabled.

  
**Returns**: Whether or not telemetry gathering should be disabled
  
### LoggerDelegate
Get the logger delegate (if any) provided by the application.

  
**Returns**: Logger delegate to be used for logging
  
### SetLoggerDelegate
Use external logger implementation.
This should be called by client applications if they want to use their own logger implementation
  
### GetSkipTelemetryInit
Gets whether or not telemetry initialization should be skipped.

  
**Returns**: Whether or not telemetry initialization should be skipped
  
### SetSkipTelemetryInit
Disables telemetry initialization.
This should not normally be called by client applications, rather it is used by File SDK (which already initializes telemetry) to prevent duplicate initialization
  
### SetSessionId
Sets the session id.

Parameters:  
* **sessionId**: Session id which will be used to correlate logs/telemetry


  
### GetSessionId
Gets the session id.

  
**Returns**: Session id which will be used to correlate logs/telemetry