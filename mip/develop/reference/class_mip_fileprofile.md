---
title: class mip::FileProfile 
description: Documents the mip::fileprofile class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/25/2019
---

# class mip::FileProfile 
[FileProfile](class_mip_fileprofile.md) class is the root class for using the Microsoft Information Protection operations.
A typical application will only need one Profile.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Returns the profile settings.
public void ListEnginesAsync(const std::shared_ptr\<void\>& context)  |  Starts list engines operation.
public void UnloadEngineAsync(const std::string& id, const std::shared_ptr\<void\>& context)  |  Starts unloading the file engine with the given ID.
public void AddEngineAsync(const FileEngine::Settings& settings, const std::shared_ptr\<void\>& context)  |  Starts adding a new file engine to the profile.
public void DeleteEngineAsync(const std::string& id, const std::shared_ptr\<void\>& context)  |  Starts deleting the file engine with the given ID. All data for the given profile will be deleted.
  
## Members
  
### GetSettings function
Returns the profile settings.
  
### ListEnginesAsync function
Starts list engines operation.
[FileProfile::Observer](class_mip_fileprofile_observer.md) will be called upon success or failure.
  
### UnloadEngineAsync function
Starts unloading the file engine with the given ID.
[FileProfile::Observer](class_mip_fileprofile_observer.md) will be called upon success or failure.
  
### AddEngineAsync function
Starts adding a new file engine to the profile.
[FileProfile::Observer](class_mip_fileprofile_observer.md) will be called upon success or failure.
  
### DeleteEngineAsync function
Starts deleting the file engine with the given ID. All data for the given profile will be deleted.
[FileProfile::Observer](class_mip_fileprofile_observer.md) will be called upon success or failure.