---
title: class mip::ProtectionEngine::Observer 
description: Documents the mip::protectionengine class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 02/14/2020
---

# class mip::ProtectionEngine::Observer 
Interface that receives notifications related to ProtectionEngine.
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
  
## Members
  
### OnGetTemplatesSuccess function
Called when templates were retrieved successfully.

Parameters:  
* **templateDescriptors**: A reference to the list of templates descriptors 


* **context**: The same context that was passed to ProtectionEngine::GetTemplatesAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetTemplatesAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnGetTemplatesSuccess or ProtectionEngine::Observer::OnGetTemplatesFailure
  
### OnGetTemplatesFailure function
Called when retrieving templates generated an error.

Parameters:  
* **error**: Error that occurred while retrieving templates 


* **context**: The same context that was passed to ProtectionEngine::GetTemplatesAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetTemplatesAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnGetTemplatesSuccess or ProtectionEngine::Observer::OnGetTemplatesFailure
  
### OnGetRightsForLabelIdSuccess function
Called when rights were retrieved successfully.

Parameters:  
* **rights**: A reference to the list of rights retrieved 


* **context**: The same context that was passed to ProtectionEngine::GetRightsForLabelIdAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetRightsForLabelIdAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess or ProtectionEngine::Observer::OnGetRightsForLabelIdFailure
  
### OnGetRightsForLabelIdFailure function
Called when retrieving rights for a label ID for the user.

Parameters:  
* **error**: Error that occurred while retrieving rights 


* **context**: The same context that was passed to ProtectionEngine::GetRightsForLabelIdAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetRightsForLabelIdAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess or ProtectionEngine::Observer::OnGetRightsForLabelIdFailure
  
### OnLoadUserCertSuccess function
Called when user cert loaded successfully.

Parameters:  
* **context**: The same context that was passed to ProtectionEngine::LoadUserCert


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::LoadUserCertAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnLoadUserCertSuccess or ProtectionEngine::Observer::OnLoadUserCertFailure
  
### OnLoadUserCertFailure function
Called when user cert loaded failed.

Parameters:  
* **error**: Error that occurred while retrieving rights 


* **context**: The same context that was passed to ProtectionEngine::LoadUserCert


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::LoadUserCertAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnLoadUserCertSuccess or ProtectionEngine::Observer::OnLoadUserCertFailure