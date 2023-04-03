---
title: class ProtectionProfile 
description: Documents the protectionprofile::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class ProtectionProfile 
[ProtectionProfile](class_mip_protectionprofile.md) is the root class for performing protection operations.
An application needs to create a [ProtectionProfile](class_mip_protectionprofile.md) before performing any protection operations
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Gets settings used by [ProtectionProfile](class_mip_protectionprofile.md) during its initialization and throughout its lifetime.
public std::shared_ptr\&lt;AsyncControl\&gt; ListEnginesAsync(const std::shared_ptr\&lt;void\&gt;& context)  |  Starts list engines operation.
public std::vector\&lt;std::string\&gt; ListEngines()  |  List engines.
public std::shared_ptr\&lt;AsyncControl\&gt; AddEngineAsync(const ProtectionEngine::Settings& settings, const std::shared_ptr\&lt;void\&gt;& context)  |  Starts adding a new protection engine to the profile.
public std::shared_ptr\&lt;ProtectionEngine\&gt; AddEngine(const ProtectionEngine::Settings& settings)  |  Add a new protection engine to the profile.
public std::shared_ptr\&lt;AsyncControl\&gt; DeleteEngineAsync(const std::string& engineId, const std::shared_ptr\&lt;void\&gt;& context)  |  Starts deleting the protection engine with the given ID. All data for the given engine will be deleted.
public void DeleteEngine(const std::string& engineId)  |  Delete the protection engine with the given ID. All data for the given engine will be deleted.
  
## Members
  
### GetSettings function
Gets settings used by [ProtectionProfile](class_mip_protectionprofile.md) during its initialization and throughout its lifetime.

  
**Returns**: Settings used by [ProtectionProfile](class_mip_protectionprofile.md) during its initialization and throughout its lifetime
  
### ListEnginesAsync function
Starts list engines operation.

Parameters:  
* **context**: Client context that will be opaquely passed back to observers



  
**Returns**: Async control object.
[ProtectionProfile::Observer](#class_protection_profile_1_1_observer) will be called upon success or failure.
  
### ListEngines function
List engines.

  
**Returns**: Cached engine IDs
  
### AddEngineAsync function
Starts adding a new protection engine to the profile.

Parameters:  
* **settings**: the mip::ProtectionEngine::Settings object that specifies the engine's settings. 


* **context**: Client context that will be opaquely passed back to observers



  
**Returns**: Async control object.
[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) will be called upon success or failure.
  
### AddEngine function
Add a new protection engine to the profile.

Parameters:  
* **settings**: the mip::ProtectionEngine::Settings object that specifies the engine's settings.



  
**Returns**: Newly created [ProtectionEngine](class_mip_protectionengine.md)
  
### DeleteEngineAsync function
Starts deleting the protection engine with the given ID. All data for the given engine will be deleted.

Parameters:  
* **id**: the unique engine ID. 


* **context**: Client context that will be opaquely passed back to observers



  
**Returns**: Async control object.
[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) will be called upon success or failure.
  
### DeleteEngine function
Delete the protection engine with the given ID. All data for the given engine will be deleted.

Parameters:  
* **id**: the unique engine ID.

