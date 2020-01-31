---
title: class mip::ProtectionProfile::Observer 
description: Documents the mip::protectionprofile class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/31/2020
---

# class mip::ProtectionProfile::Observer 
Interface that receives notifications related to [ProtectionProfile](undefined).
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
* **profile**: A reference to the newly created [ProtectionProfile](undefined)


* **context**: The same context that was passed to [ProtectionProfile::LoadAsync](#classmip_1_1ProtectionProfile_1a509ec2d1f84c1758c1ddb6c34dd377aa)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionProfile::LoadAsync](undefined) and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](undefined) or [ProtectionProfile::Observer::OnLoadFailure](undefined)
  
### OnLoadFailure function
Called when loading a profile caused an error.

Parameters:  
* **error**: [Error](undefined) that occurred while loading 


* **context**: The same context that was passed to [ProtectionProfile::LoadAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionProfile::LoadAsync](undefined) and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](undefined) or [ProtectionProfile::Observer::OnLoadFailure](undefined)
  
### OnListEnginesSuccess function
Called when list of engines was generated successfully.

Parameters:  
* **engineIds**: a list of engine IDs the are available. 


* **context**: The same context that was passed to [ProtectionProfile::ListEnginesAsync](#classmip_1_1ProtectionProfile_1ada99a40b1b2d64e5f5c731904643e027)


  
### OnListEnginesFailure function
Called when listing engines resulted in an error.

Parameters:  
* **error**: the error that caused the list engines operation to fail. 


* **context**: The same context that was passed to [ProtectionProfile::ListEnginesAsync](undefined)


  
### OnAddEngineSuccess function
Called when a new engine was added successfully.

Parameters:  
* **engine**: Newly created engine 


* **context**: The same context that was passed to [ProtectionProfile::AddEngineAsync](#classmip_1_1ProtectionProfile_1a115257c033cbe118aa174e5b041ea09a)


  
### OnAddEngineFailure function
Called when adding a new engine resulted in an error.

Parameters:  
* **error**: the error that caused the add engine operation to fail. 


* **context**: The same context that was passed to [ProtectionProfile::AddEngineAsync](undefined)


  
### OnDeleteEngineSuccess function
Called when an engine was deleted successfully.

Parameters:  
* **context**: The same context that was passed to [ProtectionProfile::DeleteEngineAsync](#classmip_1_1ProtectionProfile_1aca7662e0960ad3d54e2368eda0fbe59a)


  
### OnDeleteEngineFailure function
Called when deleting an engine resulted in an error.

Parameters:  
* **error**: the error that caused the delete engine operation to fail. 


* **context**: The same context that was passed to [ProtectionProfile::DeleteEngineAsync](undefined)

