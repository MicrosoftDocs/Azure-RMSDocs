# class mip::Profile 
[Profile](class_mip_profile.md) class is the root class for using the Microsoft Information Protection operations. A typical application will only need one [Profile](class_mip_profile.md) but it can create multiple profiles if needed.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const Settings& GetSettings() const  |  Get the settings set on the profile.
public void ListEnginesAsync(const std::shared_ptr<void>& context)  |  Starts list engines operation.
public void UnloadEngineAsync(const std::string& id, const std::shared_ptr<void>& context)  |  Starts unloading the policy engine with the given id.
public void AddEngineAsync(const PolicyEngine::Settings& settings, const std::shared_ptr<void>& context)  |  Starts adding a new policy engine to the profile.
public void DeleteEngineAsync(const std::string& id, const std::shared_ptr<void>& context)  |  Starts deleting the policy engine with the given id. All data for the given profile will be completely deleted.
  
## Members
  
### Settings
Get the settings set on the profile.

  
**Returns**: Settings set on the profile.
  
### ListEnginesAsync
Starts list engines operation.

Parameters:  
* **context**: a parameter that will be passed into the observer functions. 


[Profile::Observer](class_mip_profile_observer.md) will be called upon success or failure.
  
### UnloadEngineAsync
Starts unloading the policy engine with the given id.

Parameters:  
* **id**: the unique engine id. 


* **context**: a parameter that will be passed into the observer functions. 


[Profile::Observer](class_mip_profile_observer.md) will be called upon success or failure.
  
### AddEngineAsync
Starts adding a new policy engine to the profile.

Parameters:  
* **settings**: the [mip::PolicyEngine::Settings](class_mip_policyengine_settings.md) object that specifies the engines parameters. 


* **context**: a parameter that will be passed into the observer functions. 


[Profile::Observer](class_mip_profile_observer.md) will be called upon success or failure.
  
### DeleteEngineAsync
Starts deleting the policy engine with the given id. All data for the given profile will be completely deleted.

Parameters:  
* **id**: the unique engine id. 


* **context**: a parameter that will be passed into the observer functions. 


[Profile::Observer](class_mip_profile_observer.md) will be called upon success or failure.