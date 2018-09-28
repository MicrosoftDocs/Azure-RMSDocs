---
title: class mip PolicyProfile 
description: Reference for class mip PolicyProfile 
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 09/27/2018
ms.author: bryanla
---
# class mip::PolicyProfile 
[PolicyProfile](class_mip_policyprofile.md) class is the root class for using the Microsoft Information Protection operations. A typical application will only need one [PolicyProfile](class_mip_policyprofile.md) but it can create multiple profiles if needed.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const Settings& GetSettings() const  |  Get the settings set on the profile.
public void ListEnginesAsync(const std::shared_ptr<void>& context)  |  Starts list engines operation.
public void UnloadEngineAsync(const std::string& id, const std::shared_ptr<void>& context)  |  Starts unloading the policy engine with the given ID.
public void AddEngineAsync(const PolicyEngine::Settings& settings, const std::shared_ptr<void>& context)  |  Starts adding a new policy engine to the profile.
public void DeleteEngineAsync(const std::string& id, const std::shared_ptr<void>& context)  |  Starts deleting the policy engine with the given ID. All data for the given profile will be deleted.
  
## Members
  
### Settings
Get the settings set on the profile.

  
**Returns**: Settings set on the profile.
  
### ListEnginesAsync
Starts list engines operation.

Parameters:  
* **context**: a parameter that will be passed into the observer functions. 


[PolicyProfile::Observer](class_mip_policyprofile_observer.md) will be called upon success or failure.
  
### UnloadEngineAsync
Starts unloading the policy engine with the given ID.

Parameters:  
* **id**: the unique engine ID. 


* **context**: a parameter that will be forwarded opaquely to the observer functions. 


[PolicyProfile::Observer](class_mip_policyprofile_observer.md) will be called upon success or failure.
  
### AddEngineAsync
Starts adding a new policy engine to the profile.

Parameters:  
* **settings**: the [mip::PolicyEngine::Settings](class_mip_policyengine_settings.md) object that specifies the engine's settings. 


* **context**: a parameter that will be fowarded opaquely to the observer functions. 


[PolicyProfile::Observer](class_mip_policyprofile_observer.md) will be called upon success or failure.
  
### DeleteEngineAsync
Starts deleting the policy engine with the given ID. All data for the given profile will be deleted.

Parameters:  
* **id**: the unique engine ID. 


* **context**: a parameter that will be passed into the observer functions. 


[PolicyProfile::Observer](class_mip_policyprofile_observer.md) will be called upon success or failure.