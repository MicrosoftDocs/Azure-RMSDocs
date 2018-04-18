# class mip::FileProfile::Observer 
[Observer](#classmip_1_1_file_profile_1_1_observer) interface for clients to get notifications for profile related events.
If an *Error event occurs, error object holds inside [mip::Error](#classmip_1_1_error) class. 
Client should not call the engine back on the thread that calls the observer.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline virtual  ~Observer | 
public inline virtual void OnLoadSuccessmip::FileProfile > & profile,const std::shared_ptr< void > & context) | Called when profile was loaded successfully.
public inline virtual void OnLoadFailure | Called when loading a profile caused an error.
public inline virtual void OnListEnginesSuccess | Called when list of engines was generated successfully.
public inline virtual void OnListEnginesError | Called when listing engines caused an error.
public inline virtual void OnUnloadEngineSuccess | Called when an engine was unloaded successfully.
public inline virtual void OnUnloadEngineError | Called when unloading an engine caused an error.
public inline virtual void OnAddEngineSuccessmip::FileEngine > & engine,const std::shared_ptr< void > & context) | Called when a new engine was added successfully.
public inline virtual void OnAddEngineError | Called when adding a new engine caused an error.
public inline virtual void OnDeleteEngineSuccess | Called when an engine was deleted successfully.
public inline virtual void OnDeleteEngineError | Called when deleting an engine caused an error.
public inline virtual void OnPolicyChanged | Called when the policy has changed for the engine with the given id.
protected inline  Observer | 
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