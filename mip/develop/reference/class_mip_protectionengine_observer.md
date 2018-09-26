# class mip::ProtectionEngine::Observer 
Interface that receives notifications related to [ProtectionEngine](class_mip_protectionengine.md).
This interface must by implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnGetTemplatesSuccess(const std::shared_ptr<std::vector<std::string>>& templateIds, const std::shared_ptr<void>& context)  |  Called when templates were retrieved successfully.
public virtual void OnGetTemplatesFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when retrieving templates generated an error.
public virtual void OnGetRightsForLabelIdSuccess(const std::shared_ptr<std::vector<std::string>>& rights, const std::shared_ptr<void>& context)  |  Called when rights were retrieved successfully.
public virtual void OnGetRightsForLabelIdFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when retrieving rights for a labelId for the user.
public virtual void OnGetGrantingLabelIdsSuccess(const std::shared_ptr<std::vector<std::string>>& lableIds, const std::shared_ptr<void>& context)  |  Called when labelIds were retrieved successfully.
public virtual void OnGetGrantingLabelIdsFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when retrieving labelIds for the user.
  
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
  
### OnGetRightsForLabelIdSuccess
Called when rights were retrieved successfully.

Parameters:  
* **rights**: A reference to the list of rights retrieved 


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](class_mip_protectionengine.md#getrightsforlabelidasync)


An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionEngine::GetRightsForLabelIdAsync](class_mip_protectionengine.md#getrightsforlabelidasync) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](class_mip_protectionengine_observer.md#ongetrightsforlabelidsuccess) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](class_mip_protectionengine_observer.md#ongetrightsforlabelidfailure)
  
### OnGetRightsForLabelIdFailure
Called when retrieving rights for a labelId for the user.

Parameters:  
* **error**: [Error](class_mip_error.md) that occured while retrieving rights 


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](class_mip_protectionengine.md#getrightsforlabelidasync)


An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionEngine::GetRightsForLabelIdAsync](class_mip_protectionengine.md#getrightsforlabelidasync) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](class_mip_protectionengine_observer.md#ongetrightsforlabelidsuccess) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](class_mip_protectionengine_observer.md#ongetrightsforlabelidfailure)
  
### OnGetGrantingLabelIdsSuccess
Called when labelIds were retrieved successfully.

Parameters:  
* **lableIds**: A reference to the list of lableIds retrieved 


* **context**: The same context that was passed to [ProtectionEngine::GetGrantingLabelIdsAsync](class_mip_protectionengine.md#getgrantinglabelidsasync)


An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionEngine::GetGrantingLabelIdsAsync](class_mip_protectionengine.md#getgrantinglabelidsasync) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetGrantingLabelIdsSuccess](class_mip_protectionengine_observer.md#ongetgrantinglabelidssuccess) or [ProtectionEngine::Observer::OnGetGrantingLabelIdsFailure](class_mip_protectionengine_observer.md#ongetgrantinglabelidsfailure)
  
### OnGetGrantingLabelIdsFailure
Called when retrieving labelIds for the user.

Parameters:  
* **error**: [Error](class_mip_error.md) that occured while retrieving labelIds 


* **context**: The same context that was passed to [ProtectionEngine::GetGrantingLabelIdsAsync](class_mip_protectionengine.md#getgrantinglabelidsasync)


An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionEngine::GetGrantingLabelIdsAsync](class_mip_protectionengine.md#getgrantinglabelidsasync) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetGrantingLabelIdsSuccess](class_mip_protectionengine_observer.md#ongetgrantinglabelidssuccess) or [ProtectionEngine::Observer::OnGetGrantingLabelIdsFailure](class_mip_protectionengine_observer.md#ongetgrantinglabelidsfailure)