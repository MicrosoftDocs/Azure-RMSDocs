---
title: class mip::ProtectionEngine::Observer 
description: Documents the mip::protectionengine class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 07/02/2019
---

# class mip::ProtectionEngine::Observer 
Interface that receives notifications related to [ProtectionEngine](class_mip_protectionengine.md).
This interface must be implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnGetTemplatesSuccess(const std::shared_ptr\<std::vector\<std::string\>\>& templateIds, const std::shared_ptr\<void\>& context)  |  Called when templates were retrieved successfully.
public virtual void OnGetTemplatesFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when retrieving templates generated an error.
public virtual void OnGetRightsForLabelIdSuccess(const std::shared_ptr\<std::vector\<std::string\>\>& rights, const std::shared_ptr\<void\>& context)  |  Called when rights were retrieved successfully.
public virtual void OnGetRightsForLabelIdFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when retrieving rights for a label ID for the user.
  
## Members
  
### OnGetTemplatesSuccess function
Called when templates were retrieved successfully.

Parameters:  
* **templateIds**: A reference to the list of templates retrieved 


* **context**: The same context that was passed to [ProtectionEngine::GetTemplatesAsync](class_mip_protectionengine.md#gettemplatesasync-function)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetTemplatesAsync](class_mip_protectionengine.md#gettemplatesasync-function) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](class_mip_protectionengine_observer.md#ongettemplatessuccess-function) or [ProtectionEngine::Observer::OnGetTemplatesFailure](class_mip_protectionengine_observer.md#ongettemplatesfailure-function)
  
### OnGetTemplatesFailure function
Called when retrieving templates generated an error.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while retrieving templates 


* **context**: The same context that was passed to [ProtectionEngine::GetTemplatesAsync](class_mip_protectionengine.md#gettemplatesasync-function)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetTemplatesAsync](class_mip_protectionengine.md#gettemplatesasync-function) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](class_mip_protectionengine_observer.md#ongettemplatessuccess-function) or [ProtectionEngine::Observer::OnGetTemplatesFailure](class_mip_protectionengine_observer.md#ongettemplatesfailure-function)
  
### OnGetRightsForLabelIdSuccess function
Called when rights were retrieved successfully.

Parameters:  
* **rights**: A reference to the list of rights retrieved 


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](class_mip_protectionengine.md#getrightsforlabelidasync-function)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetRightsForLabelIdAsync](class_mip_protectionengine.md#getrightsforlabelidasync-function) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](class_mip_protectionengine_observer.md#ongetrightsforlabelidsuccess-function) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](class_mip_protectionengine_observer.md#ongetrightsforlabelidfailure-function)
  
### OnGetRightsForLabelIdFailure function
Called when retrieving rights for a label ID for the user.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while retrieving rights 


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](class_mip_protectionengine.md#getrightsforlabelidasync-function)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetRightsForLabelIdAsync](class_mip_protectionengine.md#getrightsforlabelidasync-function) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](class_mip_protectionengine_observer.md#ongetrightsforlabelidsuccess-function) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](class_mip_protectionengine_observer.md#ongetrightsforlabelidfailure-function)