# class mip::ProtectionHandler::Observer 
Interface that receives notifications related to [ProtectionHandler](class_mip_protectionhandler.md).
This interface must by implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnCreateProtectionHandlerSuccess(const std::shared_ptr<ProtectionHandler>& protectionHandler, const std::shared_ptr<void>& context)  |  Called when [ProtectionHandler](class_mip_protectionhandler.md) was created successfully.
public virtual void OnCreateProtectionHandlerError(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when [ProtectionHandler](class_mip_protectionhandler.md) creation failed.
  
## Members
  
### OnCreateProtectionHandlerSuccess
Called when [ProtectionHandler](class_mip_protectionhandler.md) was created successfully.

Parameters:  
* **protectionHandler**: The newly-created [ProtectionHandler](class_mip_protectionhandler.md)


* **context**: The same context that was passed to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync)


An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync), and that same context will be forwarded as-is to ProtectionEngine::Observer::OnCreateProtectionHandlerSuccess or ProtectionEngine::Observer::OnCreateProtectionHandlerFailure
  
### OnCreateProtectionHandlerError
Called when [ProtectionHandler](class_mip_protectionhandler.md) creation failed.

Parameters:  
* **error**: [Error](class_mip_error.md) that occured during creation 


* **context**: The same context that was passed to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync)


An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync), and that same context will be forwarded as-is to ProtectionEngine::Observer::OnCreateProtectionHandlerSuccess or ProtectionEngine::Observer::OnCreateProtectionHandlerFailure