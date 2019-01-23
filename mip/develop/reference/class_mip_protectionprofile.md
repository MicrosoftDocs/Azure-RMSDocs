---
title: class mip::ProtectionProfile 
description: Documents the mip::protectionprofile class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/22/2019
---

# class mip::ProtectionProfile 
[ProtectionProfile](class_mip_protectionprofile.md) is the root class for performing protection operations.
An application needs to create a [ProtectionProfile](class_mip_protectionprofile.md) before performing any protection operations
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Gets settings used by [ProtectionProfile](class_mip_protectionprofile.md) during its initialization and throughout its lifetime.
public void ListEnginesAsync(const std::shared_ptr<void>& context)  |  Starts list engines operation.
public std::vector<std::string> ListEngines()  |  List engines.
public void AddEngineAsync(const ProtectionEngine::Settings& settings, const std::shared_ptr<void>& context)  |  Starts adding a new protection engine to the profile.
public std::shared_ptr<ProtectionEngine> AddEngine(const ProtectionEngine::Settings& settings)  |  Add a new protection engine to the profile.
public void DeleteEngineAsync(const std::string& engineId, const std::shared_ptr<void>& context)  |  Starts deleting the protection engine with the given ID. All data for the given engine will be deleted.
public void DeleteEngine(const std::string& engineId)  |  Delete the protection engine with the given ID. All data for the given engine will be deleted.
  
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

  
**Returns**: Cached engine IDs
  
### AddEngineAsync
Starts adding a new protection engine to the profile.

Parameters:  
* **settings**: the [mip::ProtectionEngine::Settings](class_mip_protectionengine_settings.md) object that specifies the engine's settings. 


* **context**: Client context that will be opaquely passed back to observers


[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) will be called upon success or failure.
  
### ProtectionEngine
Add a new protection engine to the profile.

Parameters:  
* **settings**: the [mip::ProtectionEngine::Settings](class_mip_protectionengine_settings.md) object that specifies the engine's settings.



  
**Returns**: Newly created [ProtectionEngine](class_mip_protectionengine.md)
  
### DeleteEngineAsync
Starts deleting the protection engine with the given ID. All data for the given engine will be deleted.

Parameters:  
* **id**: the unique engine ID. 


* **context**: Client context that will be opaquely passed back to observers


[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) will be called upon success or failure.
  
### DeleteEngine
Delete the protection engine with the given ID. All data for the given engine will be deleted.

Parameters:  
* **id**: the unique engine ID.

