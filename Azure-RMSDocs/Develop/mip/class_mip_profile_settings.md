# class mip::Profile::Settings 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const std::string& path, bool useInMemoryStorage, const std::shared_ptr<AuthDelegate>& authDelegate, const std::shared_ptr<Profile::Observer>& observer, const ApplicationInfo& applicationInfo)  |  Interface for configuring the profile.
 public const std::string& GetPath() const  |  Get the path to the stored state.
 public bool GetUseInMemoryStorage() const  |  Get the Use In Memory Storage flag.
public const std::shared_ptr<AuthDelegate>& GetAuthDelegate() const  |  Get the Auth Delegate.
public const std::shared_ptr<Profile::Observer>& GetObserver() const  |  Get the event observer.
 public const ApplicationInfo GetApplicationInfo() const  |  Get the application info.
  
## Members
  
### Settings
Interface for configuring the profile.

Parameters:  
* **path**: The path to a directory in which the sdk will store the profile state. 


* **useInMemoryStorage**: A flag indicating whether or not state should be stored on disk. 


* **authDelegate**: The authentication delegate used by the SDK to acquire authenitication tokens. 


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