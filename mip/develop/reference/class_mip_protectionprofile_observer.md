---
title: class ProtectionProfile::Observer 
description: Documents the protectionprofile::observer class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 11/15/2021
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


* **context**: The same context that was passed to [ProtectionProfile::LoadAsync](#classProtectionProfile_1a966887bd349935ad246747f981dd6309)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionProfile::LoadAsync](undefined) and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](undefined) or [ProtectionProfile::Observer::OnLoadFailure
  
### OnLoadFailure function
Called when loading a profile caused an error.

Parameters:  
* **error**: Error that occurred while loading 


* **context**: The same context that was passed to ProtectionProfile::LoadAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionProfile::LoadAsync](undefined) and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](undefined) or [ProtectionProfile::Observer::OnLoadFailure
  
### OnListEnginesSuccess function
Called when list of engines was generated successfully.

Parameters:  
* **engineIds**: a list of engine IDs the are available. 


* **context**: The same context that was passed to [ProtectionProfile::ListEnginesAsync](#classProtectionProfile_1a914dedc3e5965ca885ed8ddd85a5151a)


  
### OnListEnginesFailure function
Called when listing engines resulted in an error.

Parameters:  
* **error**: the error that caused the list engines operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::ListEnginesAsync


  
### OnAddEngineSuccess function
Called when a new engine was added successfully.

Parameters:  
* **engine**: Newly created engine 


* **context**: The same context that was passed to [ProtectionProfile::AddEngineAsync](#classProtectionProfile_1a0fe57749513fb7f95f2336b786c0c564)


  
### OnAddEngineFailure function
Called when adding a new engine resulted in an error.

Parameters:  
* **error**: the error that caused the add engine operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::AddEngineAsync


  
### OnDeleteEngineSuccess function
Called when an engine was deleted successfully.

Parameters:  
* **context**: The same context that was passed to [ProtectionProfile::DeleteEngineAsync](#classProtectionProfile_1ae7bb1adb5d1e7590f2d793ef40705161)


  
### OnDeleteEngineFailure function
Called when deleting an engine resulted in an error.

Parameters:  
* **error**: the error that caused the delete engine operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::DeleteEngineAsync

