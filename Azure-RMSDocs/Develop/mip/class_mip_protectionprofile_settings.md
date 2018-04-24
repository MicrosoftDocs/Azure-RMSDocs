# class mip::ProtectionProfile::Settings 
[Settings](#classmip_1_1_protection_profile_1_1_settings) used by [ProtectionProfile](#classmip_1_1_protection_profile) during its creation and throughout its lifetime.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline  SettingsProtectionProfile::Observer > & observer,const ApplicationInfo & applicationInfo)
public inline const std::string & GetPath | Gets the path under which logging, telemetry, and other protection collateral is stored.
public inline const std::shared_ptr< ProtectionProfile::Observer > & GetObserver
public inline const ApplicationInfo & GetApplicationInfo | Gets info regarding application which is consuming the protection SDK.
public inline bool GetSkipTelemetryInit | Gets whether or not telemetry initialization should be skipped.
public inline void SetSkipTelemetryInit | Disables telemetry initialization.
public inline void SetSessionId | Sets the session id.
public inline const std::string & GetSessionId | Gets the session id.
## Members
### Settings
[ProtectionProfile::Settings](#classmip_1_1_protection_profile_1_1_settings) constructor.
#### Parameters
* path File path under which logging, telemetry, and other protection collateral is stored 
* observer [Observer](#classmip_1_1_protection_profile_1_1_observer) instance which will receive notifications of events related to [ProtectionProfile](#classmip_1_1_protection_profile)
* applicationInfo Info regarding application which is consuming the protection SDK
### GetPath
Gets the path under which logging, telemetry, and other protection collateral is stored.
#### Returns
Path under which logging, telemetry, and other protection collateral is stored
### ProtectionProfile::Observer
Gets the observer which receieves notifications of events related to [ProtectionProfile](#classmip_1_1_protection_profile).
#### Returns
[Observer](#classmip_1_1_protection_profile_1_1_observer) which receieves notifications of events related to [ProtectionProfile](#classmip_1_1_protection_profile)
### ApplicationInfo
Gets info regarding application which is consuming the protection SDK.
#### Returns
Info regarding application which is consuming the protection SDK
### GetSkipTelemetryInit
Gets whether or not telemetry initialization should be skipped.
#### Returns
Whether or not telemetry initialization should be skipped
### SetSkipTelemetryInit
Disables telemetry initialization.
This should not normally be called by client applications, rather it is used by File SDK (which already initializes telemetry) to prevent duplicate initialization
### SetSessionId
Sets the session id.
#### Parameters
* sessionId Session id which will be used to correlate logs/telemetry
### GetSessionId
Gets the session id.
#### Returns
Session id which will be used to correlate logs/telemetry