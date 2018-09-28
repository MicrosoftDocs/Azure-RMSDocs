---
title: class mip ProtectionHandler Observer 
description: Reference for class mip ProtectionHandler Observer 
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 09/27/2018
ms.author: bryanla
---
# class mip::ProtectionHandler::Observer 
Interface that receives notifications related to [ProtectionHandler](class_mip_protectionhandler.md).
This interface must be implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnCreateProtectionHandlerSuccess(const std::shared_ptr<ProtectionHandler>& protectionHandler, const std::shared_ptr<void>& context)  |  Called when [ProtectionHandler](class_mip_protectionhandler.md) was created successfully.
public virtual void OnCreateProtectionHandlerFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when [ProtectionHandler](class_mip_protectionhandler.md) creation failed.
  
## Members
  
### OnCreateProtectionHandlerSuccess
Called when [ProtectionHandler](class_mip_protectionhandler.md) was created successfully.

Parameters:  
* **protectionHandler**: The newly created [ProtectionHandler](class_mip_protectionhandler.md)


* **context**: The same context that was passed to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync), and that same context will be forwarded as-is to ProtectionEngine::Observer::OnCreateProtectionHandlerSuccess or ProtectionEngine::Observer::OnCreateProtectionHandlerFailure
  
### OnCreateProtectionHandlerFailure
Called when [ProtectionHandler](class_mip_protectionhandler.md) creation failed.

Parameters:  
* **error**: Failure that occurred during creation 


* **context**: The same context that was passed to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync), and that same context will be forwarded as-is to ProtectionEngine::Observer::OnCreateProtectionHandlerSuccess or ProtectionEngine::Observer::OnCreateProtectionHandlerFailure