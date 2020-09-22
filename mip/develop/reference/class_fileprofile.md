---
title: class FileProfile 
description: Documents the fileprofile::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 09/21/2020
---

# class FileProfile 
[FileProfile](undefined) class is the root class for using the Microsoft Information Protection operations.
A typical application will only need one Profile.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Returns the profile settings.
public std::shared_ptr\<AsyncControl\> ListEnginesAsync(const std::shared_ptr\<void\>& context)  |  Starts list engines operation.
public std::shared_ptr\<AsyncControl\> UnloadEngineAsync(const std::string& id, const std::shared_ptr\<void\>& context)  |  Starts unloading the file engine with the given ID.
public std::shared_ptr\<AsyncControl\> AddEngineAsync(const FileEngine::Settings& settings, const std::shared_ptr\<void\>& context)  |  Starts adding a new file engine to the profile.
public std::shared_ptr\<AsyncControl\> DeleteEngineAsync(const std::string& id, const std::shared_ptr\<void\>& context)  |  Starts deleting the file engine with the given ID. All data for the given profile will be deleted.
public void AcquirePolicyAuthToken(Cloud cloud, const std::shared_ptr\<AuthDelegate\>& authDelegate) const  |  Trigger an authentication callback for policy.
  
## Members
  
### GetSettings function
Returns the profile settings.
  
### ListEnginesAsync function
Starts list engines operation.

  
**Returns**: Async control object.
[FileProfile::Observer](undefined) will be called upon success or failure.
  
### UnloadEngineAsync function
Starts unloading the file engine with the given ID.

  
**Returns**: Async control object.
[FileProfile::Observer](undefined) will be called upon success or failure.
  
### AddEngineAsync function
Starts adding a new file engine to the profile.

  
**Returns**: Async control object.
[FileProfile::Observer](undefined) will be called upon success or failure.
  
### DeleteEngineAsync function
Starts deleting the file engine with the given ID. All data for the given profile will be deleted.

  
**Returns**: Async control object.
[FileProfile::Observer](undefined) will be called upon success or failure.
  
### AcquirePolicyAuthToken function
Trigger an authentication callback for policy.

Parameters:  
* **cloud**: Azure cloud 


* **authDelegate**: Authentication callback that will be invoked


MIP will not cache or do anything else with the value returned by the auth delegate. This function is recommended for applications that aren't "logged in" until after MIP requests an auth token. It allows an application to fetch a token before MIP actually requires one.