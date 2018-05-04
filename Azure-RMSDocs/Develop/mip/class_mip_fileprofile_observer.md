# class mip::FileProfile::Observer 
[Observer](#classmip_1_1_file_profile_1_1_observer) interface for clients to get notifications for profile related events.
If an *Error event occurs, error object holds inside [mip::Error](#classmip_1_1_error) class. 
Client should not call the engine back on the thread that calls the observer.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline virtual ~Observer()  |  
public inline virtual void OnLoadSuccess(const std::shared_ptr<mip::FileProfile>& profile, const std::shared_ptr<void>& context)  |  Called when profile was loaded successfully.
public inline virtual void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when loading a profile caused an error.
public inline virtual void OnListEnginesSuccess(const std::vector<std::string>& engineIds, const std::shared_ptr<void>& context)  |  Called when list of engines was generated successfully.
public inline virtual void OnListEnginesError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when listing engines caused an error.
public inline virtual void OnUnloadEngineSuccess(const std::shared_ptr<void>& context)  |  Called when an engine was unloaded successfully.
public inline virtual void OnUnloadEngineError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when unloading an engine caused an error.
public inline virtual void OnAddEngineSuccess(const std::shared_ptr<mip::FileEngine>& engine, const std::shared_ptr<void>& context)  |  Called when a new engine was added successfully.
public inline virtual void OnAddEngineError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when adding a new engine caused an error.
public inline virtual void OnDeleteEngineSuccess(const std::shared_ptr<void>& context)  |  Called when an engine was deleted successfully.
public inline virtual void OnDeleteEngineError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when deleting an engine caused an error.
public inline virtual void OnPolicyChanged(const std::string& engineId)  |  Called when the policy has changed for the engine with the given id.
protected inline Observer()  |  
  
## Members
  
### ~Observer
  
### OnLoadSuccess
Called when profile was loaded successfully.
  
### OnLoadFailure
Called when loading a profile caused an error.
  
### OnListEnginesSuccess
Called when list of engines was generated successfully.
  
### OnListEnginesError
Called when listing engines caused an error.
  
### OnUnloadEngineSuccess
Called when an engine was unloaded successfully.
  
### OnUnloadEngineError
Called when unloading an engine caused an error.
  
### OnAddEngineSuccess
Called when a new engine was added successfully.
  
### OnAddEngineError
Called when adding a new engine caused an error.
  
### OnDeleteEngineSuccess
Called when an engine was deleted successfully.
  
### OnDeleteEngineError
Called when deleting an engine caused an error.
  
### OnPolicyChanged
Called when the policy has changed for the engine with the given id.
  
### Observer