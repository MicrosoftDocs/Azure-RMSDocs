# class mip::ProtectionProfile::Observer 
Interface that receives notifications related to [ProtectionProfile](class_mip_protectionprofile.md).
This interface must by implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnLoadSuccess(const std::shared_ptr<ProtectionProfile>& profile, const std::shared_ptr<void>& context)  |  Called when profile was loaded successfully.
public virtual void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when loading a profile caused an error.
  
## Members
  
### OnLoadSuccess
Called when profile was loaded successfully.

Parameters:  
* **profile**: A reference to the newly-created [ProtectionProfile](class_mip_protectionprofile.md)


* **context**: The same context that was passed to [ProtectionProfile::LoadAsync](class_mip_protectionprofile.md#loadasync)


An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionProfile::LoadAsync](class_mip_protectionprofile.md#loadasync) and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](class_mip_protectionprofile_observer.md#onloadsuccess) or [ProtectionProfile::Observer::OnLoadFailure](class_mip_protectionprofile_observer.md#onloadfailure)
  
### OnLoadFailure
Called when loading a profile caused an error.

Parameters:  
* **error**: [Error](class_mip_error.md) that occured while loading 


* **context**: The same context that was passed to [ProtectionProfile::LoadAsync](class_mip_protectionprofile.md#loadasync)


An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionProfile::LoadAsync](class_mip_protectionprofile.md#loadasync) and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](class_mip_protectionprofile_observer.md#onloadsuccess) or [ProtectionProfile::Observer::OnLoadFailure](class_mip_protectionprofile_observer.md#onloadfailure)