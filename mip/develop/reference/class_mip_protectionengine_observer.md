---
title: class ProtectionEngine::Observer 
description: Documents the protectionengine::observer class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/13/2021
---

# class ProtectionEngine::Observer 
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
public virtual void OnRegisterContentForTrackingAndRevocationSuccess(const std::shared_ptr\<void\>& context)  |  Called when registration of content for tracking & revocation is successful.
public virtual void OnRegisterContentForTrackingAndRevocationFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when registration of content for tracking & revocation fails.
public virtual void OnRevokeContentSuccess(const std::shared_ptr\<void\>& context)  |  Called when revocation of is successful.
public virtual void OnRevokeContentFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when revocation of content is fails.
public virtual void OnCreateDelegatedLicensesSuccess(std::vector\<std::shared_ptr\<DelegationLicense\>\> delegatedLicenses, const std::shared_ptr\<void\>& context)  |  Called when create delegated license is successful.
public virtual void OnCreateDelegatedLicensesFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when create delegated license fails.
  
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
  
### OnRegisterContentForTrackingAndRevocationSuccess function
Called when registration of content for tracking & revocation is successful.

Parameters:  
* **context**: The same context that was passed to ProtectionEngine::RegisterContentForTrackingAndRevocationAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RegisterContentForTrackingAndRevocationAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationSuccess or ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationFailure
  
### OnRegisterContentForTrackingAndRevocationFailure function
Called when registration of content for tracking & revocation fails.

Parameters:  
* **error**: Error that occurred while registering content 


* **context**: The same context that was passed to ProtectionEngine::RegisterContentForTrackingAndRevocationAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RegisterContentForTrackingAndRevocationAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationSuccess or ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationFailure
  
### OnRevokeContentSuccess function
Called when revocation of is successful.

Parameters:  
* **context**: The same context that was passed to ProtectionEngine::RevokeContentAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RevokeContentAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnRevokeContentSuccess or ProtectionEngine::Observer::OnRevokeContentFailure
  
### OnRevokeContentFailure function
Called when revocation of content is fails.

Parameters:  
* **error**: Error that occurred while revoking content 


* **context**: The same context that was passed to ProtectionEngine::RevokeContentAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RevokeContentAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnRevokeContentSuccess or ProtectionEngine::Observer::OnRevokeContentFailure
  
### OnCreateDelegatedLicensesSuccess function
Called when create delegated license is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::CreateDelegationLicensesAsync](#classProtectionEngine_1aa0f481ab54c04977b9c1c009e03885ac)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::CreateDelegationLicensesAsync and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnCreateDelegatedLicensesSuccess](#classProtectionEngine_1_1Observer_1a0218cd29f63297d3178033b5225d9f6a) or [ProtectionEngine::Observer::OnCreateDelegatedLicensesFailure](#classProtectionEngine_1_1Observer_1a0a3ead878a44cdce11a3de078e8452dc)
  
### OnCreateDelegatedLicensesFailure function
Called when create delegated license fails.

Parameters:  
* **error**: Error that occurred 


* **context**: The same context that was passed to ProtectionEngine::CreateDelegationLicensesAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::CreateDelegationLicensesAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnCreateDelegatedLicensesSuccess or ProtectionEngine::Observer::OnCreateDelegatedLicensesFailure