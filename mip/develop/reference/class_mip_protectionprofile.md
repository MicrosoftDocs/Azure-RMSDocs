---
title: class ProtectionProfile 
description: Documents the protectionprofile::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 08/23/2021
---

# class ProtectionProfile 
[ProtectionProfile](undefined) is the root class for performing protection operations.
An application needs to create a [ProtectionProfile](undefined) before performing any protection operations
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Gets settings used by [ProtectionProfile](undefined) during its initialization and throughout its lifetime.
public std::shared_ptr\<AsyncControl\> ListEnginesAsync(const std::shared_ptr\<void\>& context)  |  Starts list engines operation.
public std::vector\<std::string\> ListEngines()  |  List engines.
public std::shared_ptr\<AsyncControl\> AddEngineAsync(const ProtectionEngine::Settings& settings, const std::shared_ptr\<void\>& context)  |  Starts adding a new protection engine to the profile.
public std::shared_ptr\<ProtectionEngine\> AddEngine(const ProtectionEngine::Settings& settings)  |  Add a new protection engine to the profile.
public std::shared_ptr\<AsyncControl\> DeleteEngineAsync(const std::string& engineId, const std::shared_ptr\<void\>& context)  |  Starts deleting the protection engine with the given ID. All data for the given engine will be deleted.
public void DeleteEngine(const std::string& engineId)  |  Delete the protection engine with the given ID. All data for the given engine will be deleted.
  
## Members
  
### GetSettings function
Gets settings used by [ProtectionProfile](undefined) during its initialization and throughout its lifetime.

  
**Returns**: [Settings](undefined) used by [ProtectionProfile](undefined) during its initialization and throughout its lifetime
  
### ListEnginesAsync function
Starts list engines operation.

Parameters:  
* **context**: Client context that will be opaquely passed back to observers



  
**Returns**: Async control object.
[ProtectionProfile::Observer](undefined) will be called upon success or failure.
  
### ListEngines function
List engines.

  
**Returns**: Cached engine IDs
  
### AddEngineAsync function
Starts adding a new protection engine to the profile.

Parameters:  
* **settings**: the mip::ProtectionEngine::Settings object that specifies the engine's settings. 


* **context**: Client context that will be opaquely passed back to observers



  
**Returns**: Async control object.
[ProtectionProfile::Observer](undefined) will be called upon success or failure.
  
### AddEngine function
Add a new protection engine to the profile.

Parameters:  
* **settings**: the mip::ProtectionEngine::Settings object that specifies the engine's settings.



  
**Returns**: Newly created [ProtectionEngine](undefined)
  
### DeleteEngineAsync function
Starts deleting the protection engine with the given ID. All data for the given engine will be deleted.

Parameters:  
* **id**: the unique engine ID. 


* **context**: Client context that will be opaquely passed back to observers



  
**Returns**: Async control object.
[ProtectionProfile::Observer](undefined) will be called upon success or failure.
  
### DeleteEngine function
Delete the protection engine with the given ID. All data for the given engine will be deleted.

Parameters:  
* **id**: the unique engine ID.

