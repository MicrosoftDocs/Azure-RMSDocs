---
title: class mip::PolicyProfile 
description: Documents the mip::policyprofile class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/27/2019
---

# class mip::PolicyProfile 
[PolicyProfile](class_mip_policyprofile.md) class is the root class for using the Microsoft Information Protection operations. A typical application will only need one [PolicyProfile](class_mip_policyprofile.md) but it can create multiple profiles if needed.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Get the settings set on the profile.
public void ListEnginesAsync(const std::shared_ptr\<void\>& context)  |  Starts list engines operation.
public void UnloadEngineAsync(const std::string& id, const std::shared_ptr\<void\>& context)  |  Starts unloading the policy engine with the given ID.
public void AddEngineAsync(const PolicyEngine::Settings& settings, const std::shared_ptr\<void\>& context)  |  Starts adding a new policy engine to the profile.
public void DeleteEngineAsync(const std::string& id, const std::shared_ptr\<void\>& context)  |  Starts deleting the policy engine with the given ID. All data for the given profile will be deleted.
public static MIP_API void __CDECL mip::PolicyProfile::LoadAsync | Starts loading a profile based on the provided settings.
public static const MIP_API char* __CDECL mip::PolicyProfile::GetVersion | Get the library version


## Members
  
### GetSettings function
Get the settings set on the profile.

  
**Returns**: Settings set on the profile.
  
### ListEnginesAsync function
Starts list engines operation.

Parameters:  
* **context**: a parameter that will be passed into the observer functions. 


[PolicyProfile::Observer](class_mip_policyprofile_observer.md) will be called upon success or failure.
  
### UnloadEngineAsync function
Starts unloading the policy engine with the given ID.

Parameters:  
* **id**: the unique engine ID. 


* **context**: a parameter that will be forwarded opaquely to the observer functions. 


[PolicyProfile::Observer](class_mip_policyprofile_observer.md) will be called upon success or failure.
  
### AddEngineAsync function
Starts adding a new policy engine to the profile.

Parameters:  
* **settings**: the [mip::PolicyEngine::Settings](class_mip_policyengine_settings.md) object that specifies the engine's settings. 


* **context**: a parameter that will be fowarded opaquely to the observer functions. 


[PolicyProfile::Observer](class_mip_policyprofile_observer.md) will be called upon success or failure.
  
### DeleteEngineAsync function
Starts deleting the policy engine with the given ID. All data for the given profile will be deleted.

Parameters:  
* **id**: the unique engine ID. 


* **context**: a parameter that will be passed into the observer functions. 


[PolicyProfile::Observer](class_mip_policyprofile_observer.md) will be called upon success or failure.

### LoadAsync function
Starts loading a profile based on the provided settings.

Parameters:  
* **settings**: the profile settings used to load the profile object. </para>
* **context**: a context parameter that will be passed into the observer functions.

### GetVersion function
Get the library version

**Returns**: A version string.

