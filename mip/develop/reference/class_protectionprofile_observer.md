---
title: class ProtectionProfile::Observer 
description: Documents the protectionprofile::observer class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/16/2020
---

# class ProtectionProfile::Observer 
Interface that receives notifications related to ProtectionProfile.
This interface must be implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnLoadSuccess(const std::shared_ptr\<ProtectionProfile\>& profile, const std::shared_ptr\<void\>& context)  |  Called when profile was loaded successfully.
public virtual void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when loading a profile caused an error.
public virtual void OnListEnginesSuccess(const std::vector\<std::string\>& engineIds, const std::shared_ptr\<void\>& context)  |  Called when list of engines was generated successfully.
public virtual void OnListEnginesFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when listing engines resulted in an error.
public virtual void OnAddEngineSuccess(const std::shared_ptr\<ProtectionEngine\>& engine, const std::shared_ptr\<void\>& context)  |  Called when a new engine was added successfully.
public virtual void OnAddEngineFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when adding a new engine resulted in an error.
public virtual void OnDeleteEngineSuccess(const std::shared_ptr\<void\>& context)  |  Called when an engine was deleted successfully.
public virtual void OnDeleteEngineFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when deleting an engine resulted in an error.
  
## Members
  
### OnLoadSuccess function
Called when profile was loaded successfully.

Parameters:  
* **profile**: A reference to the newly created ProtectionProfile


* **context**: The same context that was passed to [ProtectionProfile::LoadAsync](#classProtectionProfile_1a6dae6cea50e99c43e16ddf340afa45fc)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionProfile::LoadAsync and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](#classProtectionProfile_1_1Observer_1a96572cb783e546f44ed2a7b46ae070a9) or [ProtectionProfile::Observer::OnLoadFailure](#classProtectionProfile_1_1Observer_1ae0a17f434b7e9cb2635e4b6b69581df6)
  
### OnLoadFailure function
Called when loading a profile caused an error.

Parameters:  
* **error**: Error that occurred while loading 


* **context**: The same context that was passed to ProtectionProfile::LoadAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionProfile::LoadAsync and that same context will be forwarded as-is to ProtectionProfile::Observer::OnLoadSuccess or ProtectionProfile::Observer::OnLoadFailure
  
### OnListEnginesSuccess function
Called when list of engines was generated successfully.

Parameters:  
* **engineIds**: a list of engine IDs the are available. 


* **context**: The same context that was passed to [ProtectionProfile::ListEnginesAsync](#classProtectionProfile_1a7e3ae818247abdeeaccbc4c740b4a39c)


  
### OnListEnginesFailure function
Called when listing engines resulted in an error.

Parameters:  
* **error**: the error that caused the list engines operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::ListEnginesAsync


  
### OnAddEngineSuccess function
Called when a new engine was added successfully.

Parameters:  
* **engine**: Newly created engine 


* **context**: The same context that was passed to [ProtectionProfile::AddEngineAsync](#classProtectionProfile_1a0602bf501bced346bd4d9558cac3c391)


  
### OnAddEngineFailure function
Called when adding a new engine resulted in an error.

Parameters:  
* **error**: the error that caused the add engine operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::AddEngineAsync


  
### OnDeleteEngineSuccess function
Called when an engine was deleted successfully.

Parameters:  
* **context**: The same context that was passed to [ProtectionProfile::DeleteEngineAsync](#classProtectionProfile_1a4f3e1901a332b9c371605e2d8aebde7e)


  
### OnDeleteEngineFailure function
Called when deleting an engine resulted in an error.

Parameters:  
* **error**: the error that caused the delete engine operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::DeleteEngineAsync

