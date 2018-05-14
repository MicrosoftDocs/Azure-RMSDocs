# class mip::ProtectionProfile::Settings 
[Settings](class_mip_protectionprofile_settings.md) used by [ProtectionProfile](class_mip_protectionprofile.md) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::string& path, const std::shared_ptr<ProtectionProfile::Observer>& observer, const ApplicationInfo& applicationInfo)  |  [ProtectionProfile::Settings](class_mip_protectionprofile_settings.md) constructor.
 public const std::string& GetPath() const  |  Gets the path under which logging, telemetry, and other protection collateral is stored.
public const std::shared_ptr<ProtectionProfile::Observer>& GetObserver() const  |  Gets the observer which receieves notifications of events related to [ProtectionProfile](class_mip_protectionprofile.md).
 public const ApplicationInfo& GetApplicationInfo() const  |  Gets info regarding application which is consuming the protection SDK.
 public bool GetSkipTelemetryInit() const  |  Gets whether or not telemetry initialization should be skipped.
 public void SetSkipTelemetryInit()  |  Disables telemetry initialization.
 public void SetSessionId(const std::string& sessionId)  |  Sets the session id.
 public const std::string& GetSessionId() const  |  Gets the session id.
  
## Members
  
### Settings
[ProtectionProfile::Settings](class_mip_protectionprofile_settings.md) constructor.

Parameters:  
* **path**: File path under which logging, telemetry, and other protection collateral is stored 


* **observer**: [Observer](class_mip_protectionprofile_observer.md) instance which will receive notifications of events related to [ProtectionProfile](class_mip_protectionprofile.md)


* **applicationInfo**: Info regarding application which is consuming the protection SDK


  
### GetPath
Gets the path under which logging, telemetry, and other protection collateral is stored.

  
**Returns**: Path under which logging, telemetry, and other protection collateral is stored
  
### ProtectionProfile::Observer
Gets the observer which receieves notifications of events related to [ProtectionProfile](class_mip_protectionprofile.md).

  
**Returns**: [Observer](class_mip_protectionprofile_observer.md) which receieves notifications of events related to [ProtectionProfile](class_mip_protectionprofile.md)
  
### ApplicationInfo
Gets info regarding application which is consuming the protection SDK.

  
**Returns**: Info regarding application which is consuming the protection SDK
  
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