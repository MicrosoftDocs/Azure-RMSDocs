---
title: class mip::ProtectionEngine::Observer 
description: Documents the mip::protectionengine class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 10/29/2019
---

# class mip::ProtectionEngine::Observer 
Interface that receives notifications related to [ProtectionEngine](undefined).
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


* **context**: The same context that was passed to [ProtectionEngine::GetTemplatesAsync](#classmip_1_1ProtectionEngine_1aa02e21ee00c5fd064b1b29d7f0ee7f86)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetTemplatesAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](#classmip_1_1ProtectionEngine_1_1Observer_1ad75ef985a96a600aa3f29f796e3afc7f) or [ProtectionEngine::Observer::OnGetTemplatesFailure](#classmip_1_1ProtectionEngine_1_1Observer_1ac51f22e559dbf2796f0375fae540a5e2)
  
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


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](#classmip_1_1ProtectionEngine_1a73c3d2652d0e3b1ed4f6edb38eee1022)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetRightsForLabelIdAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](undefined) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](undefined)
  
### OnGetRightsForLabelIdFailure function
Called when retrieving rights for a label ID for the user.

Parameters:  
* **error**: [Error](undefined) that occurred while retrieving rights 


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetRightsForLabelIdAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](undefined) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](undefined)