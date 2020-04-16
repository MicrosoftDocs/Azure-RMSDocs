---
title: class ProtectionEngine::Observer 
description: Documents the protectionengine::observer class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/16/2020
---

# class ProtectionEngine::Observer 
Interface that receives notifications related to [ProtectionEngine](undefined).
This interface must be implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnGetTemplatesSuccess(const std::vector\<std::shared_ptr\<TemplateDescriptor\>\>& templateDescriptors, const std::shared_ptr\<void\>& context)  |  Called when templates were retrieved successfully.
public virtual void OnGetTemplatesFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when retrieving templates generated an error.
public virtual void OnGetRightsForLabelIdSuccess(const std::shared_ptr\<std::vector\<std::string\>\>& rights, const std::shared_ptr\<void\>& context)  |  Called when rights were retrieved successfully.
public virtual void OnGetRightsForLabelIdFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when retrieving rights for a label ID for the user.
public virtual void OnLoadUserCertSuccess(const std::shared_ptr\<void\>& context)  |  Called when user cert loaded successfully.
public virtual void OnLoadUserCertFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when user cert loaded failed.
public virtual void OnRegisterContentForTrackingAndRevocationSuccess(const std::shared_ptr\<void\>& context)  |  Called when registration of content for tracking & revocation is successful.
public virtual void OnRegisterContentForTrackingAndRevocationFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when registration of content for tracking & revocation fails.
public virtual void OnRevokeContentSuccess(const std::shared_ptr\<void\>& context)  |  Called when revocation of is successful.
public virtual void OnRevokeContentFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when revocation of content is fails.
  
## Members
  
### OnGetTemplatesSuccess function
Called when templates were retrieved successfully.

Parameters:  
* **templateDescriptors**: A reference to the list of templates descriptors 


* **context**: The same context that was passed to [ProtectionEngine::GetTemplatesAsync](#classProtectionEngine_1aabcf6fba3622c627cfe14b2746edfe48)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetTemplatesAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](#classProtectionEngine_1_1Observer_1a41e98e4f987e8b054d6400de5b022f9d) or [ProtectionEngine::Observer::OnGetTemplatesFailure](#classProtectionEngine_1_1Observer_1a35babe68d548bc477159b1a70ee8bca2)
  
### OnGetTemplatesFailure function
Called when retrieving templates generated an error.

Parameters:  
* **error**: [Error](undefined) that occurred while retrieving templates 


* **context**: The same context that was passed to [ProtectionEngine::GetTemplatesAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetTemplatesAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](undefined) or [ProtectionEngine::Observer::OnGetTemplatesFailure](undefined)
  
### OnGetRightsForLabelIdSuccess function
Called when rights were retrieved successfully.

Parameters:  
* **rights**: A reference to the list of rights retrieved 


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](#classProtectionEngine_1ad9a150771b1038b1c49e41369ed46674)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetRightsForLabelIdAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](#classProtectionEngine_1_1Observer_1abaef708f16eea99ff87887cc3ea5ba8d) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](#classProtectionEngine_1_1Observer_1af2a1b49935ec8dc5511dac4203eefb7d)
  
### OnGetRightsForLabelIdFailure function
Called when retrieving rights for a label ID for the user.

Parameters:  
* **error**: [Error](undefined) that occurred while retrieving rights 


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetRightsForLabelIdAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](undefined) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](undefined)
  
### OnLoadUserCertSuccess function
Called when user cert loaded successfully.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::LoadUserCert](#classProtectionEngine_1a44d666964f9945ef35acd782ecbad311)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::LoadUserCertAsync](#classProtectionEngine_1a89e19046167aec638735a393b0a6b28b) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnLoadUserCertSuccess](#classProtectionEngine_1_1Observer_1a4899e43dd995034a24f280570ebce8ef) or [ProtectionEngine::Observer::OnLoadUserCertFailure](#classProtectionEngine_1_1Observer_1ae426429d4d4a458f910f76da4dfeeac8)
  
### OnLoadUserCertFailure function
Called when user cert loaded failed.

Parameters:  
* **error**: [Error](undefined) that occurred while retrieving rights 


* **context**: The same context that was passed to [ProtectionEngine::LoadUserCert](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::LoadUserCertAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnLoadUserCertSuccess](undefined) or [ProtectionEngine::Observer::OnLoadUserCertFailure](undefined)
  
### OnRegisterContentForTrackingAndRevocationSuccess function
Called when registration of content for tracking & revocation is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](#classProtectionEngine_1a0d8ffa1653a4054cc9a08b3c146a18b4)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationSuccess](#classProtectionEngine_1_1Observer_1a5bf8bf514bfad7910d56fe6996234101) or [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationFailure](#classProtectionEngine_1_1Observer_1ad4957ccc92fc9d12090cd6802b242f0a)
  
### OnRegisterContentForTrackingAndRevocationFailure function
Called when registration of content for tracking & revocation fails.

Parameters:  
* **error**: [Error](undefined) that occurred while registering content 


* **context**: The same context that was passed to [ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationSuccess](undefined) or [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationFailure](undefined)
  
### OnRevokeContentSuccess function
Called when revocation of is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::RevokeContentAsync](#classProtectionEngine_1ad6ba26593e7b7bad9ec304f3bda0310e)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::RevokeContentAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRevokeContentSuccess](#classProtectionEngine_1_1Observer_1a06745f427ce554a4f92950214a2a5564) or [ProtectionEngine::Observer::OnRevokeContentFailure](#classProtectionEngine_1_1Observer_1a8dd700564eb0e8b291c6fd60983e6337)
  
### OnRevokeContentFailure function
Called when revocation of content is fails.

Parameters:  
* **error**: [Error](undefined) that occurred while revoking content 


* **context**: The same context that was passed to [ProtectionEngine::RevokeContentAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::RevokeContentAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRevokeContentSuccess](undefined) or [ProtectionEngine::Observer::OnRevokeContentFailure](undefined)