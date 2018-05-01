# class mip::FileProfile::Settings 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline Settings(const std::string& path, bool useInMemoryStorage, std::shared_ptr<AuthDelegate> authDelegate, std::shared_ptr<Observer> observer, const ApplicationInfo& applicationInfo)  |  Interface for configuring the profile.
public inline ~Settings()  |  
public inline const std::string& GetPath() const  |  
public inline bool GetUseInMemoryStorage() const  |  
public inline std::shared_ptr<AuthDelegate> GetAuthDelegate() const  |  
public inline std::shared_ptr<Observer> GetObserver() const  |  
public inline const ApplicationInfo GetApplicationInfo() const  |  
public inline bool GetSkipTelemetryInit() const  |  
public inline void SetSkipTelemetryInit()  |  
public inline void SetSessionId(const std::string& sessionId)  |  Sets the profile session id.
public inline const std::string& GetSessionId() const  |  Return the profile session id.
  
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