---
title: class mip::PolicyProfile::Observer 
description: Documents the mip::policyprofile class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::PolicyProfile::Observer 
[Observer](class_mip_policyprofile_observer.md) interface for clients to get notifications for profile related events.
All errors inherit from [mip::Error](class_mip_error.md). 
Client should not call the engine back on the thread that calls the observer.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnLoadSuccess(const std::shared_ptr\<PolicyProfile\>& profile, const std::shared_ptr\<void\>& context)  |  Called when profile was loaded successfully.
public virtual void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when loading a profile caused an error.
public virtual void OnListEnginesSuccess(const std::vector\<std::string\>& engineIds, const std::shared_ptr\<void\>& context)  |  Called when list of engines was generated successfully.
public virtual void OnListEnginesFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when listing engines caused an error.
public virtual void OnUnloadEngineSuccess(const std::shared_ptr\<void\>& context)  |  Called when an engine was unloaded successfully.
public virtual void OnUnloadEngineFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when unloading an engine caused an error.
public virtual void OnAddEngineSuccess(const std::shared_ptr\<PolicyEngine\>& engine, const std::shared_ptr\<void\>& context)  |  Called when a new engine was added successfully.
public virtual void OnAddEngineStarting(bool requiresPolicyFetch)  |  Called prior to engine creation to describe whether or not the engine's policy data must be fetched from the server or whether it can be created from locally cached data.
public virtual void OnAddEngineFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when adding a new engine caused an error.
public virtual void OnDeleteEngineSuccess(const std::shared_ptr\<void\>& context)  |  Called when an engine was deleted successfully.
public virtual void OnDeleteEngineFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when deleting an engine caused an error.
public virtual void OnPolicyChanged(const std::string& engineId)  |  Called when the policy has changed for the engine with the given ID, Or when the loaded Custom Sensitivity Types have changed.
  
## Members
  
### OnLoadSuccess function
Called when profile was loaded successfully.

Parameters:  
* **profile**: the current profile used to start the operation. 


* **context**: the context passed to the LoadAsync operation.


  
### OnLoadFailure function
Called when loading a profile caused an error.

Parameters:  
* **error**: the error that caused the load operation to fail. 


* **context**: the context passed to the LoadAsync operation.


  
### OnListEnginesSuccess function
Called when list of engines was generated successfully.

Parameters:  
* **engineIds**: a list of engine IDs the are available. 


* **context**: the context passed to the ListEnginesAsync operation.


  
### OnListEnginesFailure function
Called when listing engines caused an error.

Parameters:  
* **error**: the error that caused the list engine operation to fail. 


* **context**: the context passed to the ListEnginesAsync operation.


  
### OnUnloadEngineSuccess function
Called when an engine was unloaded successfully.

Parameters:  
* **context**: the context passed to the UnloadEngineAsync operation.


  
### OnUnloadEngineFailure function
Called when unloading an engine caused an error.

Parameters:  
* **error**: the error that caused the unload engine operation to fail. 


* **context**: the context passed to the UnloadEngineAsync operation.


  
### OnAddEngineSuccess function
Called when a new engine was added successfully.

Parameters:  
* **engine**: the newly-added engine 


* **context**: the context passed to the AddEngineAsync operation


  
### OnAddEngineStarting function
Called prior to engine creation to describe whether or not the engine's policy data must be fetched from the server or whether it can be created from locally cached data.

Parameters:  
* **requiresPolicyFetch**: Describes whether engine data must be fetched via HTTP or if it will be loaded from cache


This optional callback may be used by an application to be informed whether or not an AddEngineAsync operation will require an HTTP operation (with its associated delay) to complete.
  
### OnAddEngineFailure function
Called when adding a new engine caused an error.

Parameters:  
* **error**: the error that caused the add engine operation to fail. 


* **context**: the context passed to the AddEngineAsync operation.


  
### OnDeleteEngineSuccess function
Called when an engine was deleted successfully.

Parameters:  
* **context**: the context passed to the DeleteEngineAsync operation.


  
### OnDeleteEngineFailure function
Called when deleting an engine caused an error.

Parameters:  
* **error**: the error that caused the delete engine operation to fail. 


* **context**: the context passed to the DeleteEngineAsync operation.


  
### OnPolicyChanged function
Called when the policy has changed for the engine with the given ID, Or when the loaded Custom Sensitivity Types have changed.

Parameters:  
* **engineId**: the engine 


To load the new policy it is necessary to call AddEngineAsync again with the engine ID given.