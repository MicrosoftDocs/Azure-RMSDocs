# class mip::Profile::Settings 
[Settings](class_mip_profile_settings.md) used by [Profile](class_mip_profile.md) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::string& path, bool useInMemoryStorage, const std::shared_ptr<AuthDelegate>& authDelegate, const std::shared_ptr<Profile::Observer>& observer, const ApplicationInfo& applicationInfo)  |  Interface for configuring the profile.
 public const std::string& GetPath() const  |  Get the path to the stored state.
 public bool GetUseInMemoryStorage() const  |  Get the Use In Memory Storage flag.
public const std::shared_ptr<AuthDelegate>& GetAuthDelegate() const  |  Get the Auth Delegate.
public const std::shared_ptr<Profile::Observer>& GetObserver() const  |  Get the event observer.
 public const ApplicationInfo GetApplicationInfo() const  |  Get the application info.
public std::shared_ptr<LoggerDelegate> GetLoggerDelegate() const  |  Get the logger delegate (if any) provided by the application.
public void SetLoggerDelegate(const std::shared_ptr<LoggerDelegate>& loggerDelegate)  |  Override default logger.
public std::shared_ptr<HttpDelegate> GetHttpDelegate() const  |  Get the http delegate (if any) provided by the application.
public void SetHttpDelegate(const std::shared_ptr<HttpDelegate>& httpDelegate)  |  Override default http stack with client's own.
 public void OptOutTelemetry()  |  Opts out of all telemetry gathering.
 public bool IsTelemetryOptedOut() const  |  Gets whether or not telemetry gathering should be disabled.
 public void SetMinimumLogLevel(LogLevel logLevel)  |  Set the minimum log level that will trigger a logging event.
 public LogLevel GetMinimumLogLevel() const  |  Get the Minimum Log Level object.
  
## Members
  
### Settings
Interface for configuring the profile.

Parameters:  
* **path**: The path to a directory in which the sdk will store the profile state. 


* **useInMemoryStorage**: A flag indicating whether or not state should be stored on disk. 


* **authDelegate**: The authentication delegate used by the SDK to acquire authentication tokens. 


* **observer**: A class implementing the [Profile::Observer](class_mip_profile_observer.md) interface. Can be nullptr. 


* **applicationInfo**: The application identifiers used for service access.


  
### GetPath
Get the path to the stored state.

  
**Returns**: Path to stored state.
  
### GetUseInMemoryStorage
Get the Use In Memory Storage flag.

  
**Returns**: True if use in memory is set else false.
  
### GetAuthDelegate
Get the Auth Delegate.

  
**Returns**: The Auth Delegate.
  
### Profile::Observer
Get the event observer.

  
**Returns**: The event observer.
  
### ApplicationInfo
Get the application info.

  
**Returns**: The application info.
  
### LoggerDelegate
Get the logger delegate (if any) provided by the application.

  
**Returns**: Logger delegate to be used for logging
  
### SetLoggerDelegate
Override default logger.

Parameters:  
* **loggerDelegate**: Logging callback interface implemented by client applications


This should be called by client applications that use their own logger implementation
  
### HttpDelegate
Get the http delegate (if any) provided by the application.

  
**Returns**: Http delegate to be used for http operations
  
### SetHttpDelegate
Override default http stack with client's own.

Parameters:  
* **httpDelegate**: Http callback interface implemented by client application


  
### OptOutTelemetry
Opts out of all telemetry gathering.
  
### IsTelemetryOptedOut
Gets whether or not telemetry gathering should be disabled.

  
**Returns**: Whether or not telemetry gathering should be disabled
  
### SetMinimumLogLevel
Set the minimum log level that will trigger a logging event.

Parameters:  
* **logLevel**: minimum log level that will trigger a logging event. 



  
**Returns**: True
  
### LogLevel
Get the Minimum Log Level object.

  
**Returns**: Minimum log level that will trigger a logging event.