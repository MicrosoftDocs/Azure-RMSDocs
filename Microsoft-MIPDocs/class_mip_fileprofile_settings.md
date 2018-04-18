# class mip::FileProfile::Settings 
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline  SettingsObserver > observer,const ApplicationInfo & applicationInfo) | Interface for configuring the profile.
public inline  ~Settings | 
public inline const std::string & GetPath | 
public inline bool GetUseInMemoryStorage | 
public inline std::shared_ptr< AuthDelegate > GetAuthDelegate | 
public inline std::shared_ptr< Observer > GetObserver | 
public inline const ApplicationInfo GetApplicationInfo | 
public inline bool GetSkipTelemetryInit | 
public inline void SetSkipTelemetryInit | 
public inline void SetSessionId | Sets the profile session id.
public inline const std::string & GetSessionId | Return the profile session id.
## Members
### Settings
Interface for configuring the profile.
#### Parameters
* observer A class implementing the [FileHandler::Observer](#classmip_1_1_file_handler_1_1_observer) interface. Can be nullptr.
### ~Settings
### GetPath
### GetUseInMemoryStorage
### GetAuthDelegate
### Observer
### ApplicationInfo
### GetSkipTelemetryInit
### SetSkipTelemetryInit
### SetSessionId
Sets the profile session id.
### GetSessionId
Return the profile session id.