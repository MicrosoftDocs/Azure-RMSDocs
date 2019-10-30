---
title: class mip::ProtectionProfile::Observer 
description: Documents the mip::protectionprofile class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 10/29/2019
---

# class mip::ProtectionProfile::Observer 
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


* **context**: The same context that was passed to [ProtectionProfile::LoadAsync](#classmip_1_1ProtectionProfile_1a0be7c009567e3cf9277d0acea9c5bc02)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionProfile::LoadAsync and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](#classmip_1_1ProtectionProfile_1_1Observer_1a31e73965ffb0bd152b3954b013faa773) or [ProtectionProfile::Observer::OnLoadFailure](#classmip_1_1ProtectionProfile_1_1Observer_1acdad73bb6a2dcc93295e0e16e422f291)
  
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


* **context**: The same context that was passed to [ProtectionProfile::ListEnginesAsync](#classmip_1_1ProtectionProfile_1a78cfbb70867513e4b72678333d162689)


  
### OnListEnginesFailure function
Called when listing engines resulted in an error.

Parameters:  
* **error**: the error that caused the list engines operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::ListEnginesAsync


  
### OnAddEngineSuccess function
Called when a new engine was added successfully.

Parameters:  
* **engine**: Newly created engine 


* **context**: The same context that was passed to [ProtectionProfile::AddEngineAsync](#classmip_1_1ProtectionProfile_1a0ce30de031ae557e5afcbc0ed4a7d715)


  
### OnAddEngineFailure function
Called when adding a new engine resulted in an error.

Parameters:  
* **error**: the error that caused the add engine operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::AddEngineAsync


  
### OnDeleteEngineSuccess function
Called when an engine was deleted successfully.

Parameters:  
* **context**: The same context that was passed to [ProtectionProfile::DeleteEngineAsync](#classmip_1_1ProtectionProfile_1ab0fe2bd6ef9c71b96105c7ee82fd4cd6)


  
### OnDeleteEngineFailure function
Called when deleting an engine resulted in an error.

Parameters:  
* **error**: the error that caused the delete engine operation to fail. 


* **context**: The same context that was passed to ProtectionProfile::DeleteEngineAsync

