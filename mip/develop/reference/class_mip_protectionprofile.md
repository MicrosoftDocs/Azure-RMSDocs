# class mip::ProtectionProfile 
[ProtectionProfile](class_mip_protectionprofile.md) is the root class for performing protection operations.
An application need to create a [ProtectionProfile](class_mip_protectionprofile.md) prior to performing any protection operations
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const Settings& GetSettings() const  |  Gets settings used by [ProtectionProfile](class_mip_protectionprofile.md) during its initialization and throughout its lifetime.
public void ListEnginesAsync(const std::shared_ptr<void>& context)  |  Starts list engines operation.
public void AddEngineAsync(const ProtectionEngine::Settings& settings, const std::shared_ptr<void>& context)  |  Starts adding a new protection engine to the profile.
public void DeleteEngineAsync(const std::string& engineId, const std::shared_ptr<void>& context)  |  Starts deleting the protection engine with the given id. All data for the given engine will be completely deleted.
  
## Members
  
### Settings
Gets settings used by [ProtectionProfile](class_mip_protectionprofile.md) during its initialization and throughout its lifetime.

  
**Returns**: [Settings](class_mip_protectionprofile_settings.md) used by [ProtectionProfile](class_mip_protectionprofile.md) during its initialization and throughout its lifetime
  
### ListEnginesAsync
Starts list engines operation.

Parameters:  
* **context**: a parameter that will be passed into the observer functions. 


[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) will be called upon success or failure.
  
### AddEngineAsync
Starts adding a new protection engine to the profile.

Parameters:  
* **settings**: the [mip::ProtectionEngine::Settings](class_mip_protectionengine_settings.md) object that specifies the engine's parameters. 


* **context**: a parameter that will be passed into the observer functions. 


[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) will be called upon success or failure.
  
### DeleteEngineAsync
Starts deleting the protection engine with the given id. All data for the given engine will be completely deleted.

Parameters:  
* **id**: the unique engine id. 


* **context**: a parameter that will be passed into the observer functions. 


[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) will be called upon success or failure.