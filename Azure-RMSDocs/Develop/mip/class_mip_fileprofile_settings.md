# class mip::FileProfile::Settings 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::string& path, bool useInMemoryStorage, std::shared_ptr<AuthDelegate> authDelegate, std::shared_ptr<Observer> observer, const ApplicationInfo& applicationInfo)  |  Interface for configuring the profile.
 public ~Settings()  | _Not yet documented._
 public const std::string& GetPath() const  | _Not yet documented._
 public bool GetUseInMemoryStorage() const  | _Not yet documented._
public std::shared_ptr<AuthDelegate> GetAuthDelegate() const  | _Not yet documented._
public std::shared_ptr<Observer> GetObserver() const  | _Not yet documented._
 public const ApplicationInfo GetApplicationInfo() const  | _Not yet documented._
 public bool GetSkipTelemetryInit() const  | _Not yet documented._
 public void SetSkipTelemetryInit()  | _Not yet documented._
 public void SetSessionId(const std::string& sessionId)  |  Sets the profile session id.
 public const std::string& GetSessionId() const  |  Return the profile session id.
  
## Members
  
### Settings
Interface for configuring the profile.

Parameters:  
* **observer**: A class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. Can be nullptr.


  
### ~Settings
_Not documented yet._

  
### GetPath
_Not documented yet._

  
### GetUseInMemoryStorage
_Not documented yet._

  
### GetAuthDelegate
_Not documented yet._

  
### Observer
_Not documented yet._

  
### ApplicationInfo
_Not documented yet._

  
### GetSkipTelemetryInit
_Not documented yet._

  
### SetSkipTelemetryInit
_Not documented yet._

  
### SetSessionId
Sets the profile session id.
  
### GetSessionId
Return the profile session id.