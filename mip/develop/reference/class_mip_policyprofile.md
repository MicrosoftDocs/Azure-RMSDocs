---
title: class PolicyProfile 
description: Documents the policyprofile::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class PolicyProfile 

PolicyProfile class is the root class for using the Microsoft Purview Information Protection operations. A typical application will only need one PolicyProfile but it can create multiple profiles if needed.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Get the settings set on the profile.
public std::shared_ptr&lt;AsyncControl&gt; ListEnginesAsync(const std::shared_ptr&lt;void&gt;& context)  |  Starts list engines operation.
public std::vector&lt;std::string&gt; ListEngines()  |  List of engines.
public std::shared_ptr&lt;AsyncControl&gt; UnloadEngineAsync(const std::string& id, const std::shared_ptr&lt;void&gt;& context)  |  Starts unloading the policy engine with the given ID.
public void UnloadEngine(const std::string& id)  |  Starts unloading the policy engine with the given ID.
public std::shared_ptr&lt;AsyncControl&gt; AddEngineAsync(const PolicyEngine::Settings& settings, const std::shared_ptr&lt;void&gt;& context)  |  Starts adding a new policy engine to the profile.
public std::shared_ptr&lt;PolicyEngine&gt; AddEngine(const PolicyEngine::Settings& settings, const std::shared_ptr&lt;void&gt;& context)  |  Add a new policy engine to the profile.
public std::shared_ptr&lt;AsyncControl&gt; DeleteEngineAsync(const std::string& id, const std::shared_ptr&lt;void&gt;& context)  |  Starts deleting the policy engine with the given ID. All data for the given profile will be deleted.
public void DeleteEngine(const std::string& engineId)  |  Delete the policy engine with the given ID. All data for the given engine will be deleted.
public void AcquireAuthToken(Cloud cloud, const std::shared_ptr&lt;AuthDelegate&gt;& authDelegate) const  |  Trigger an authentication callback.
  
## Members
  
### GetSettings function
Get the settings set on the profile.

  
**Returns**: Settings set on the profile.
  
### ListEnginesAsync function
Starts list engines operation.

Parameters:  
* **context**: a parameter that will be passed into the observer functions. 


PolicyProfile::Observer will be called upon success or failure.
  
### ListEngines function
List of engines.

  
**Returns**: Cached engine IDs
  
### UnloadEngineAsync function
Starts unloading the policy engine with the given ID.

Parameters:  
* **id**: the unique engine ID. 


* **context**: a parameter that will be forwarded opaquely to the observer functions. 


PolicyProfile::Observer will be called upon success or failure.
  
### UnloadEngine function
Starts unloading the policy engine with the given ID.

Parameters:  
* **id**: the unique engine ID.


  
### AddEngineAsync function
Starts adding a new policy engine to the profile.

Parameters:  
* **settings**: the mip::PolicyEngine::Settings object that specifies the engine's settings. 


* **context**: a parameter that will be forwarded opaquely to the observer functions and optional HttpDelegate. 


PolicyProfile::Observer will be called upon success or failure.
  
### AddEngine function
Add a new policy engine to the profile.

Parameters:  
* **settings**: the mip::PolicyEngine::Settings object that specifies the engine's settings. 


* **context**: a parameter that will be forwarded opaquely to the optional HttpDelegate



  
**Returns**: Newly created PolicyEngine
  
### DeleteEngineAsync function
Starts deleting the policy engine with the given ID. All data for the given profile will be deleted.

Parameters:  
* **id**: the unique engine ID. 


* **context**: a parameter that will be passed into the observer functions. 


PolicyProfile::Observer will be called upon success or failure.
  
### DeleteEngine function
Delete the policy engine with the given ID. All data for the given engine will be deleted.

Parameters:  
* **id**: the unique engine ID.


  
### AcquireAuthToken function
Trigger an authentication callback.

Parameters:  
* **cloud**: Azure cloud 


* **authDelegate**: Authentication callback that will be invoked


MIP will not cache or do anything else with the value returned by the auth delegate. This function is recommended for applications that aren't "logged in" until after MIP requests an auth token. It allows an application to fetch a token before MIP actually requires one.
