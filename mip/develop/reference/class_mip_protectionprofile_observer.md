---
title: class ProtectionProfile::Observer 
description: Documents the protectionprofile::observer class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class ProtectionProfile::Observer 
Interface that receives notifications related to [ProtectionProfile](class_mip_protectionprofile.md).
This interface must be implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnLoadSuccess(const std::shared_ptr&lt;ProtectionProfile&gt;& profile, const std::shared_ptr&lt;void&gt;& context)  |  Called when profile was loaded successfully.
public virtual void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr&lt;void&gt;& context)  |  Called when loading a profile caused an error.
public virtual void OnListEnginesSuccess(const std::vector&lt;std::string&gt;& engineIds, const std::shared_ptr&lt;void&gt;& context)  |  Called when list of engines was generated successfully.
public virtual void OnListEnginesFailure(const std::exception_ptr& error, const std::shared_ptr&lt;void&gt;& context)  |  Called when listing engines resulted in an error.
public virtual void OnAddEngineSuccess(const std::shared_ptr&lt;ProtectionEngine&gt;& engine, const std::shared_ptr&lt;void&gt;& context)  |  Called when a new engine was added successfully.
public virtual void OnAddEngineFailure(const std::exception_ptr& error, const std::shared_ptr&lt;void&gt;& context)  |  Called when adding a new engine resulted in an error.
public virtual void OnDeleteEngineSuccess(const std::shared_ptr&lt;void&gt;& context)  |  Called when an engine was deleted successfully.
public virtual void OnDeleteEngineFailure(const std::exception_ptr& error, const std::shared_ptr&lt;void&gt;& context)  |  Called when deleting an engine resulted in an error.
  
## Members
  
### OnLoadSuccess function
Called when profile was loaded successfully.

Parameters:  
* **profile**: A reference to the newly created [ProtectionProfile](class_mip_protectionprofile.md)


* **context**: The same context that was passed to [ProtectionProfile::LoadAsync](#class_protection_profile_1a966887bd349935ad246747f981dd6309)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionProfile::LoadAsync and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](#class_protection_profile_1_1_observer_1a96572cb783e546f44ed2a7b46ae070a9) or [ProtectionProfile::Observer::OnLoadFailure](#class_protection_profile_1_1_observer_1ae0a17f434b7e9cb2635e4b6b69581df6)
  
### OnLoadFailure function
Called when loading a profile caused an error.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while loading 


* **context**: The same context that was passed to ProtectionProfile::LoadAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionProfile::LoadAsync and that same context will be forwarded as-is to ProtectionProfile::Observer::OnLoadSuccess or ProtectionProfile::Observer::OnLoadFailure
  
### OnListEnginesSuccess function
Called when list of engines was generated successfully.

Parameters:  
* **engineIds**: a list of engine IDs the are available. 


* **context**: The same context that was passed to [ProtectionProfile::ListEnginesAsync](#class_protection_profile_1a914dedc3e5965ca885ed8ddd85a5151a)


  
### OnListEnginesFailure function
Called when listing engines resulted in an error.

Parameters:  
* **error**: the error that caused the list engines operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::ListEnginesAsync


  
### OnAddEngineSuccess function
Called when a new engine was added successfully.

Parameters:  
* **engine**: Newly created engine 


* **context**: The same context that was passed to [ProtectionProfile::AddEngineAsync](#class_protection_profile_1a0fe57749513fb7f95f2336b786c0c564)


  
### OnAddEngineFailure function
Called when adding a new engine resulted in an error.

Parameters:  
* **error**: the error that caused the add engine operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::AddEngineAsync


  
### OnDeleteEngineSuccess function
Called when an engine was deleted successfully.

Parameters:  
* **context**: The same context that was passed to [ProtectionProfile::DeleteEngineAsync](#class_protection_profile_1ae7bb1adb5d1e7590f2d793ef40705161)


  
### OnDeleteEngineFailure function
Called when deleting an engine resulted in an error.

Parameters:  
* **error**: the error that caused the delete engine operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::DeleteEngineAsync

gineAsync

