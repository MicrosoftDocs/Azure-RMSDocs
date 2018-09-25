# class mip::ProtectionProfile 
[ProtectionProfile](class_mip_protectionprofile.md) is the root class for performing protection operations.
An application need to create a [ProtectionProfile](class_mip_protectionprofile.md) prior to performing any protection operations
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const Settings& GetSettings() const  |  Gets settings used by [ProtectionProfile](class_mip_protectionprofile.md) during its initialization and throughout its lifetime.
public void ListEnginesAsync(const std::shared_ptr<void>& context)  |  Starts list engines operation.
public std::vector<std::string> ListEngines()  |  List engines.
public void AddEngineAsync(const ProtectionEngine::Settings& settings, const std::shared_ptr<void>& context)  |  Starts adding a new protection engine to the profile.
public std::shared_ptr<ProtectionEngine> AddEngine(const ProtectionEngine::Settings& settings)  |  Add a new protection engine to the profile.
public void DeleteEngineAsync(const std::string& engineId, const std::shared_ptr<void>& context)  |  Starts deleting the protection engine with the given id. All data for the given engine will be completely deleted.
 public void DeleteEngine(const std::string& engineId)  |  Delete the protection engine with the given id. All data for the given engine will be completely deleted.
  
## Members
  
### Settings
Gets settings used by [ProtectionProfile](class_mip_protectionprofile.md) during its initialization and throughout its lifetime.

  
**Returns**: [Settings](class_mip_protectionprofile_settings.md) used by [ProtectionProfile](class_mip_protectionprofile.md) during its initialization and throughout its lifetime
  
### ListEnginesAsync
Starts list engines operation.

Parameters:  
* **context**: Client context that will be opaquely passed back to observers


[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) will be called upon success or failure.
  
### ListEngines
List engines.

  
**Returns**: Cached engine ids
  
### AddEngineAsync
Starts adding a new protection engine to the profile.

Parameters:  
* **settings**: the [mip::ProtectionEngine::Settings](class_mip_protectionengine_settings.md) object that specifies the engine's parameters. 


* **context**: Client context that will be opaquely passed back to observers


[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) will be called upon success or failure.
  
### ProtectionEngine
Add a new protection engine to the profile.

Parameters:  
* **settings**: the [mip::ProtectionEngine::Settings](class_mip_protectionengine_settings.md) object that specifies the engine's parameters.



  
**Returns**: Newly-created [ProtectionEngine](class_mip_protectionengine.md)
  
### DeleteEngineAsync
Starts deleting the protection engine with the given id. All data for the given engine will be completely deleted.

Parameters:  
* **id**: the unique engine id. 


* **context**: Client context that will be opaquely passed back to observers


[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) will be called upon success or failure.
  
### DeleteEngine
Delete the protection engine with the given id. All data for the given engine will be completely deleted.

Parameters:  
* **id**: the unique engine id.

