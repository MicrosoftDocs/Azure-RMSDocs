# class mip::Profile::Observer 
[Observer](class_mip_profile_observer.md) interface for clients to get notifications for profile related events.
If an *Error event occurs, error object holds inside [mip::Error](class_mip_error.md) class. 
Client should not call the engine back on the thread that calls the observer.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnLoadSuccess(const std::shared_ptr<Profile>& profile, const std::shared_ptr<void>& context)  |  Called when profile was loaded successfully.
public virtual void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when loading a profile caused an error.
public virtual void OnListEnginesSuccess(const std::vector<std::string>& engineIds, const std::shared_ptr<void>& context)  |  Called when list of engines was generated successfully.
public virtual void OnListEnginesError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when listing engines caused an error.
public virtual void OnUnloadEngineSuccess(const std::shared_ptr<void>& context)  |  Called when an engine was unloaded successfully.
public virtual void OnUnloadEngineError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when unloading an engine caused an error.
public virtual void OnAddEngineSuccess(const std::shared_ptr<PolicyEngine>& engine, const std::shared_ptr<void>& context)  |  Called when a new engine was added successfully.
public virtual void OnAddEngineError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when adding a new engine caused an error.
public virtual void OnDeleteEngineSuccess(const std::shared_ptr<void>& context)  |  Called when an engine was deleted successfully.
public virtual void OnDeleteEngineError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when deleting an engine caused an error.
 public virtual void OnPolicyChanged(const std::string& engineId)  |  Called when the policy has changed for the engine with the given id.
  
## Members
  
### OnLoadSuccess
Called when profile was loaded successfully.

Parameters:  
* **profile**: the current profile used to start the operation. 


* **context**: the context passed to the operation.


  
### OnLoadFailure
Called when loading a profile caused an error.

Parameters:  
* **error**: the error that cause the load operation to fail. 


* **context**: the context passed to the operation.


  
### OnListEnginesSuccess
Called when list of engines was generated successfully.

Parameters:  
* **engineIds**: a list of engine ids the are available. 


* **context**: the context passed to the operation.


  
### OnListEnginesError
Called when listing engines caused an error.

Parameters:  
* **error**: the error that cause the list engine operation to fail. 


* **context**: the context passed to the operation.


  
### OnUnloadEngineSuccess
Called when an engine was unloaded successfully.

Parameters:  
* **context**: the context passed to the operation.


  
### OnUnloadEngineError
Called when unloading an engine caused an error.

Parameters:  
* **error**: the error that cause the unload engine operation to fail. 


* **context**: the context passed to the operation.


  
### OnAddEngineSuccess
Called when a new engine was added successfully.
  
### OnAddEngineError
Called when adding a new engine caused an error.

Parameters:  
* **error**: the error that cause the add engine operation to fail. 


* **context**: the context passed to the operation.


  
### OnDeleteEngineSuccess
Called when an engine was deleted successfully.

Parameters:  
* **context**: the context passed to the operation.


  
### OnDeleteEngineError
Called when deleting an engine caused an error.

Parameters:  
* **error**: the error that cause the delete engine operation to fail. 


* **context**: the context passed to the operation.


  
### OnPolicyChanged
Called when the policy has changed for the engine with the given id.

Parameters:  
* **engineId**: the engine 


To load the new policy it is necessary to call AddEngineAsync again with the engine Id given.