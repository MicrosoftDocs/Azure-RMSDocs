---
title: class ProtectionProfile 
description: Documents the protectionprofile::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 04/23/2021
---

# class ProtectionProfile 
ProtectionProfile is the root class for performing protection operations.
An application needs to create a ProtectionProfile before performing any protection operations
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public static std::shared_ptr<AsyncControl> __CDECL LoadAsync(const Settings& settings, const std::shared_ptr<void>& context) | Starts loading a profile based on the provided settings.
public static std::shared_ptr<ProtectionProfile> __CDECL Load(const Settings& settings) | Loading a profile based on the provided settings.
public static const char* __CDECL GetVersion() | Gets library version
public const Settings& GetSettings() const  |  Gets settings used by ProtectionProfile during its initialization and throughout its lifetime.
public std::shared_ptr\<AsyncControl\> ListEnginesAsync(const std::shared_ptr\<void\>& context)  |  Starts list engines operation.
public std::vector\<std::string\> ListEngines()  |  List engines.
public std::shared_ptr\<AsyncControl\> AddEngineAsync(const ProtectionEngine::Settings& settings, const std::shared_ptr\<void\>& context)  |  Starts adding a new protection engine to the profile.
public std::shared_ptr\<ProtectionEngine\> AddEngine(const ProtectionEngine::Settings& settings)  |  Add a new protection engine to the profile.
public std::shared_ptr\<AsyncControl\> DeleteEngineAsync(const std::string& engineId, const std::shared_ptr\<void\>& context)  |  Starts deleting the protection engine with the given ID. All data for the given engine will be deleted.
public void DeleteEngine(const std::string& engineId)  |  Delete the protection engine with the given ID. All data for the given engine will be deleted.
  
## Members

### LoadAsync function

Starts loading a profile based on the provided settings.

Parameters:

* **settings** Settings used by ProtectionProfile during its initialization and throughout its lifetime
* **context** This same context will be forwarded to ProtectionProfile::Observer::OnLoadSuccess or ProtectionProfile::Observer::OnLoadFailure as-is.

**Returns** Async control object.


### Load function

Loading a profile based on the provided settings.

Parameters:

* **settings** Settings used by ProtectionProfile during its initialization and throughout its lifetime

**Returns** Newly created profile


### GetVersion function

Gets library version

**Returns** Library version

  
### GetSettings function
Gets settings used by ProtectionProfile during its initialization and throughout its lifetime.

  
**Returns**: Settings used by ProtectionProfile during its initialization and throughout its lifetime
  
### ListEnginesAsync function
Starts list engines operation.

Parameters:  
* **context**: Client context that will be opaquely passed back to observers



  
**Returns**: Async control object.
ProtectionProfile::Observer will be called upon success or failure.
  
### ListEngines function
List engines.

  
**Returns**: Cached engine IDs
  
### AddEngineAsync function
Starts adding a new protection engine to the profile.

Parameters:  
* **settings**: the mip::ProtectionEngine::Settings object that specifies the engine's settings. 


* **context**: Client context that will be opaquely passed back to observers



  
**Returns**: Async control object.
ProtectionProfile::Observer will be called upon success or failure.
  
### AddEngine function
Add a new protection engine to the profile.

Parameters:  
* **settings**: the mip::ProtectionEngine::Settings object that specifies the engine's settings.



  
**Returns**: Newly created ProtectionEngine
  
### DeleteEngineAsync function
Starts deleting the protection engine with the given ID. All data for the given engine will be deleted.

Parameters:  
* **id**: the unique engine ID. 


* **context**: Client context that will be opaquely passed back to observers



  
**Returns**: Async control object.
ProtectionProfile::Observer will be called upon success or failure.
  
### DeleteEngine function
Delete the protection engine with the given ID. All data for the given engine will be deleted.

Parameters:  
* **id**: the unique engine ID.

