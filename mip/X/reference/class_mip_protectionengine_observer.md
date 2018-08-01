# class mip::ProtectionEngine::Observer 
Interface that receives notifications related to [ProtectionEngine](class_mip_protectionengine.md).
This interface must by implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnGetTemplatesSuccess(const std::shared_ptr<std::vector<std::string>>& templateIds, const std::shared_ptr<void>& context)  |  Called when templates were retrieved successfully.
public virtual void OnGetTemplatesFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when retrieving templates generated an error.
  
## Members
  
### OnGetTemplatesSuccess
Called when templates were retrieved successfully.

Parameters:  
* **templateIds**: A reference to the list of templates retrieved 


* **context**: The same context that was passed to [ProtectionEngine::GetTemplatesAsync](class_mip_protectionengine.md#gettemplatesasync)


An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionEngine::GetTemplatesAsync](class_mip_protectionengine.md#gettemplatesasync) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](class_mip_protectionengine_observer.md#ongettemplatessuccess) or [ProtectionEngine::Observer::OnGetTemplatesFailure](class_mip_protectionengine_observer.md#ongettemplatesfailure)
  
### OnGetTemplatesFailure
Called when retrieving templates generated an error.

Parameters:  
* **error**: [Error](class_mip_error.md) that occured while retrieving templates 


* **context**: The same context that was passed to [ProtectionEngine::GetTemplatesAsync](class_mip_protectionengine.md#gettemplatesasync)


An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionEngine::GetTemplatesAsync](class_mip_protectionengine.md#gettemplatesasync) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](class_mip_protectionengine_observer.md#ongettemplatessuccess) or [ProtectionEngine::Observer::OnGetTemplatesFailure](class_mip_protectionengine_observer.md#ongettemplatesfailure)