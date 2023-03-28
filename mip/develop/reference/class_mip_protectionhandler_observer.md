---
title: class ProtectionHandler::Observer 
description: Documents the protectionhandler::observer class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class ProtectionHandler::Observer 
Interface that receives notifications related to ProtectionHandler.
This interface must be implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnCreateProtectionHandlerSuccess(const std::shared_ptr&lt;ProtectionHandler&gt;& protectionHandler, const std::shared_ptr&lt;void&gt;& context)  |  Called when ProtectionHandler was created successfully.
public virtual void OnCreateProtectionHandlerFailure(const std::exception_ptr& error, const std::shared_ptr&lt;void&gt;& context)  |  Called when ProtectionHandler creation failed.
  
## Members
  
### OnCreateProtectionHandlerSuccess function
Called when ProtectionHandler was created successfully.

Parameters:  
* **protectionHandler**: The newly created ProtectionHandler


* **context**: The same context that was passed to ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync or ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync or ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync, and that same context will be forwarded as-is to ProtectionEngine::Observer::OnCreateProtectionHandlerSuccess or ProtectionEngine::Observer::OnCreateProtectionHandlerFailure
  
### OnCreateProtectionHandlerFailure function
Called when ProtectionHandler creation failed.

Parameters:  
* **error**: Failure that occurred during creation 


* **context**: The same context that was passed to ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync or ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync or ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync, and that same context will be forwarded as-is to ProtectionEngine::Observer::OnCreateProtectionHandlerSuccess or ProtectionEngine::Observer::OnCreateProtectionHandlerFailure.
