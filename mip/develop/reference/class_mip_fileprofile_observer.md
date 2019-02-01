---
title: class mip::FileProfile::Observer 
description: Documents the mip::fileprofile class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/28/2019
---

# class mip::FileProfile::Observer 
[Observer](class_mip_fileprofile_observer.md) interface for clients to get notifications for profile related events.
All errors inherit from [mip::Error](class_mip_error.md). 
Client should not call the engine back on the thread that calls the observer.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual ~Observer()  | _Not yet documented._
public virtual void OnLoadSuccess(const std::shared_ptr\<mip::FileProfile\>& profile, const std::shared_ptr\<void\>& context)  |  Called when profile was loaded successfully.
public virtual void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when loading a profile caused an error.
public virtual void OnListEnginesSuccess(const std::vector\<std::string\>& engineIds, const std::shared_ptr\<void\>& context)  |  Called when list of engines was generated successfully.
public virtual void OnListEnginesFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when listing engines caused an error.
public virtual void OnUnloadEngineSuccess(const std::shared_ptr\<void\>& context)  |  Called when an engine was unloaded successfully.
public virtual void OnUnloadEngineFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when unloading an engine caused an error.
public virtual void OnAddEngineSuccess(const std::shared_ptr\<mip::FileEngine\>& engine, const std::shared_ptr\<void\>& context)  |  Called when a new engine was added successfully.
public virtual void OnAddEngineFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when adding a new engine caused an error.
public virtual void OnDeleteEngineSuccess(const std::shared_ptr\<void\>& context)  |  Called when an engine was deleted successfully.
public virtual void OnDeleteEngineFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when deleting an engine caused an error.
public virtual void OnPolicyChanged(const std::string& engineId)  |  Called when the policy has changed for the engine with the given ID.
public virtual void OnAddPolicyEngineStarting(bool requiresPolicyFetch)  |  Called prior to engine creation to describe whether or not the policy engine's policy data must be fetched from the server or whether it can be created from locally cached data.
protected Observer()  | _Not yet documented._
  
## Members
  
### ~Observer function
_Not documented yet._

  
### OnLoadSuccess function
Called when profile was loaded successfully.
  
### OnLoadFailure function
Called when loading a profile caused an error.
  
### OnListEnginesSuccess function
Called when list of engines was generated successfully.
  
### OnListEnginesFailure function
Called when listing engines caused an error.
  
### OnUnloadEngineSuccess function
Called when an engine was unloaded successfully.
  
### OnUnloadEngineFailure function
Called when unloading an engine caused an error.
  
### OnAddEngineSuccess function
Called when a new engine was added successfully.
  
### OnAddEngineFailure function
Called when adding a new engine caused an error.
  
### OnDeleteEngineSuccess function
Called when an engine was deleted successfully.
  
### OnDeleteEngineFailure function
Called when deleting an engine caused an error.
  
### OnPolicyChanged function
Called when the policy has changed for the engine with the given ID.
  
### OnAddPolicyEngineStarting function
Called prior to engine creation to describe whether or not the policy engine's policy data must be fetched from the server or whether it can be created from locally cached data.

Parameters:  
* **requiresPolicyFetch**: Describes whether engine data must be fetched via HTTP or if it will be loaded from cache


This optional callback may be used by an application to be informed whether or not an AddEngineAsync operation will require an HTTP operation (with its associated delay) to complete.
  
### Observer function
_Not documented yet._
