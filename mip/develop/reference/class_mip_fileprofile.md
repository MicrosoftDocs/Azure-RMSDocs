---
title: class mip::FileProfile 
description: Documents the mip::fileprofile class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/31/2020
---

# class mip::FileProfile 
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