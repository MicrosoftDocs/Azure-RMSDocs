---
title: class mip::ProtectionHandler::Observer 
description: Documents the mip::protectionhandler class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::ProtectionHandler::Observer 
Interface that receives notifications related to [ProtectionHandler](class_mip_protectionhandler.md).
This interface must be implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnCreateProtectionHandlerSuccess(const std::shared_ptr\<ProtectionHandler\>& protectionHandler, const std::shared_ptr\<void\>& context)  |  Called when [ProtectionHandler](class_mip_protectionhandler.md) was created successfully.
public virtual void OnCreateProtectionHandlerFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when [ProtectionHandler](class_mip_protectionhandler.md) creation failed.
  
## Members
  
### OnCreateProtectionHandlerSuccess function
Called when [ProtectionHandler](class_mip_protectionhandler.md) was created successfully.

Parameters:  
* **protectionHandler**: The newly created [ProtectionHandler](class_mip_protectionhandler.md)


* **context**: The same context that was passed to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync-function) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync-function)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync-function) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync-function), and that same context will be forwarded as-is to ProtectionEngine::Observer::OnCreateProtectionHandlerSuccess or ProtectionEngine::Observer::OnCreateProtectionHandlerFailure
  
### OnCreateProtectionHandlerFailure function
Called when [ProtectionHandler](class_mip_protectionhandler.md) creation failed.

Parameters:  
* **error**: Failure that occurred during creation 


* **context**: The same context that was passed to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync-function) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync-function)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync](class_mip_protectionengine.md#createprotectionhandlerfromdescriptorasync-function) or [ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync](class_mip_protectionengine.md#createprotectionhandlerfrompublishinglicenseasync-function), and that same context will be forwarded as-is to ProtectionEngine::Observer::OnCreateProtectionHandlerSuccess or ProtectionEngine::Observer::OnCreateProtectionHandlerFailure