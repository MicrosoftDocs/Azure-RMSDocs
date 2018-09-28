# class mip::ProtectionProfile::Observer 
Interface that receives notifications related to [ProtectionProfile](class_mip_protectionprofile.md).
This interface must be implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnLoadSuccess(const std::shared_ptr<ProtectionProfile>& profile, const std::shared_ptr<void>& context)  |  Called when profile was loaded successfully.
public virtual void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when loading a profile caused an error.
public virtual void OnListEnginesSuccess(const std::vector<std::string>& engineIds, const std::shared_ptr<void>& context)  |  Called when list of engines was generated successfully.
public virtual void OnListEnginesFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when listing engines resulted in an error.
public virtual void OnAddEngineSuccess(const std::shared_ptr<ProtectionEngine>& engine, const std::shared_ptr<void>& context)  |  Called when a new engine was added successfully.
public virtual void OnAddEngineFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when adding a new engine resulted in an error.
public virtual void OnDeleteEngineSuccess(const std::shared_ptr<void>& context)  |  Called when an engine was deleted successfully.
public virtual void OnDeleteEngineFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when deleting an engine resulted in an error.
  
## Members
  
### OnLoadSuccess
Called when profile was loaded successfully.

Parameters:  
* **profile**: A reference to the newly created [ProtectionProfile](class_mip_protectionprofile.md)


* **context**: The same context that was passed to [ProtectionProfile::LoadAsync](class_mip_protectionprofile.md#addengineasync)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionProfile::LoadAsync](class_mip_protectionprofile.md#addengineasync) and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](class_mip_protectionprofile_observer.md#onloadsuccess) or [ProtectionProfile::Observer::OnLoadFailure](class_mip_protectionprofile_observer.md#onloadfailure)
  
### OnLoadFailure
Called when loading a profile caused an error.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while loading 


* **context**: The same context that was passed to [ProtectionProfile::LoadAsync](class_mip_protectionprofile.md#addengineasync)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionProfile::LoadAsync](class_mip_protectionprofile.md#addengineasync) and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](class_mip_protectionprofile_observer.md#onloadsuccess) or [ProtectionProfile::Observer::OnLoadFailure](class_mip_protectionprofile_observer.md#onloadfailure)
  
### OnListEnginesSuccess
Called when list of engines was generated successfully.

Parameters:  
* **engineIds**: a list of engine IDs the are available. 


* **context**: The same context that was passed to [ProtectionProfile::ListEnginesAsync](class_mip_protectionprofile.md#listenginesasync)


  
### OnListEnginesFailure
Called when listing engines resulted in an error.

Parameters:  
* **error**: the error that caused the list engines operation to fail. 


* **context**: The same context that was passed to [ProtectionProfile::ListEnginesAsync](class_mip_protectionprofile.md#listenginesasync)


  
### OnAddEngineSuccess
Called when a new engine was added successfully.

Parameters:  
* **engine**: Newly created engine 


* **context**: The same context that was passed to [ProtectionProfile::AddEngineAsync](class_mip_protectionprofile.md#addengineasync)


  
### OnAddEngineFailure
Called when adding a new engine resulted in an error.

Parameters:  
* **error**: the error that caused the add engine operation to fail. 


* **context**: The same context that was passed to [ProtectionProfile::AddEngineAsync](class_mip_protectionprofile.md#addengineasync)


  
### OnDeleteEngineSuccess
Called when an engine was deleted successfully.

Parameters:  
* **context**: The same context that was passed to [ProtectionProfile::DeleteEngineAsync](class_mip_protectionprofile.md#deleteengineasync)


  
### OnDeleteEngineFailure
Called when deleting an engine resulted in an error.

Parameters:  
* **error**: the error that caused the delete engine operation to fail. 


* **context**: The same context that was passed to [ProtectionProfile::DeleteEngineAsync](class_mip_protectionprofile.md#deleteengineasync)

