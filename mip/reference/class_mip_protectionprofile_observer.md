# class mip::ProtectionProfile::Observer 
Interface that receives notifications related to [ProtectionProfile](class_mip_protectionprofile.md).
This interface must by implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnLoadSuccess(const std::shared_ptr<ProtectionProfile>& profile, const std::shared_ptr<void>& context)  |  Called when profile was loaded successfully.
public virtual void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when loading a profile caused an error.
public virtual void OnListEnginesSuccess(const std::vector<std::string>& engineIds, const std::shared_ptr<void>& context)  |  Called when list of engines was generated successfully.
public virtual void OnListEnginesError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when listing engines resulted in an error.
public virtual void OnAddEngineSuccess(const std::shared_ptr<ProtectionEngine>& engine, const std::shared_ptr<void>& context)  |  Called when a new engine was added successfully.
public virtual void OnAddEngineError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when adding a new engine resulted in an error.
public virtual void OnDeleteEngineSuccess(const std::shared_ptr<void>& context)  |  Called when an engine was deleted successfully.
public virtual void OnDeleteEngineError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when deleting an engine resulted in an error.
  
## Members
  
### OnLoadSuccess
Called when profile was loaded successfully.

Parameters:  
* **profile**: A reference to the newly-created [ProtectionProfile](class_mip_protectionprofile.md)


* **context**: The same context that was passed to ProtectionProfile::LoadAsync


An application can pass any type of context (e.g. std::promise, std::function, etc.) to ProtectionProfile::LoadAsync and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](class_mip_protectionprofile_observer.md#onloadsuccess) or [ProtectionProfile::Observer::OnLoadFailure](class_mip_protectionprofile_observer.md#onloadfailure)
  
### OnLoadFailure
Called when loading a profile caused an error.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while loading 


* **context**: The same context that was passed to ProtectionProfile::LoadAsync


An application can pass any type of context (e.g. std::promise, std::function, etc.) to ProtectionProfile::LoadAsync and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](class_mip_protectionprofile_observer.md#onloadsuccess) or [ProtectionProfile::Observer::OnLoadFailure](class_mip_protectionprofile_observer.md#onloadfailure)
  
### OnListEnginesSuccess
Called when list of engines was generated successfully.

Parameters:  
* **engineIds**: a list of engine ids the are available. 


* **context**: the context passed to the operation.


  
### OnListEnginesError
Called when listing engines resulted in an error.

Parameters:  
* **error**: the error that cause the list engines operation to fail. 


* **context**: the context passed to the operation.


  
### OnAddEngineSuccess
Called when a new engine was added successfully.
  
### OnAddEngineError
Called when adding a new engine resulted in an error.

Parameters:  
* **error**: the error that cause the add engine operation to fail. 


* **context**: the context passed to the operation.


  
### OnDeleteEngineSuccess
Called when an engine was deleted successfully.

Parameters:  
* **context**: the context passed to the operation.


  
### OnDeleteEngineError
Called when deleting an engine resulted in an error.

Parameters:  
* **error**: the error that cause the delete engine operation to fail. 


* **context**: the context passed to the operation.

