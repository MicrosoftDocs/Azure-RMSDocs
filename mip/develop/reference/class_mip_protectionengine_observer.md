---
title: class ProtectionEngine::Observer 
description: Documents the protectionengine::observer class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 11/15/2021
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


* **context**: The same context that was passed to [ProtectionEngine::GetTemplatesAsync](#classProtectionEngine_1af61106db3fba520d2170de80b0712a69)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetTemplatesAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](#classProtectionEngine_1_1Observer_1a6988e40ff9b8096c12a320e6e0b47de2) or [ProtectionEngine::Observer::OnGetTemplatesFailure
  
### OnGetTemplatesFailure function
Called when retrieving templates generated an error.

Parameters:  
* **error**: Error that occurred while retrieving templates 


* **context**: The same context that was passed to ProtectionEngine::GetTemplatesAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetTemplatesAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](undefined) or [ProtectionEngine::Observer::OnGetTemplatesFailure
  
### OnGetRightsForLabelIdSuccess function
Called when rights were retrieved successfully.

Parameters:  
* **rights**: A reference to the list of rights retrieved 


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](#classProtectionEngine_1ab1462bfbece2ce4b357690f1856cc20a)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetRightsForLabelIdAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](#classProtectionEngine_1_1Observer_1acb203e845490619471b3ba75e8a03dde) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure
  
### OnGetRightsForLabelIdFailure function
Called when retrieving rights for a label ID for the user.

Parameters:  
* **error**: Error that occurred while retrieving rights 


* **context**: The same context that was passed to ProtectionEngine::GetRightsForLabelIdAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetRightsForLabelIdAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](undefined) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure
  
### OnLoadUserCertSuccess function
Called when user cert loaded successfully.

Parameters:  
* **context**: The same context that was passed to ProtectionEngine::LoadUserCert


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::LoadUserCertAsync](#classProtectionEngine_1a047594fc160d5243b6883d7e7f37b2bd) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnLoadUserCertSuccess](undefined) or [ProtectionEngine::Observer::OnLoadUserCertFailure
  
### OnLoadUserCertFailure function
Called when user cert loaded failed.

Parameters:  
* **error**: Error that occurred while retrieving rights 


* **context**: The same context that was passed to ProtectionEngine::LoadUserCert


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::LoadUserCertAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnLoadUserCertSuccess](undefined) or [ProtectionEngine::Observer::OnLoadUserCertFailure
  
### OnRegisterContentForTrackingAndRevocationSuccess function
Called when registration of content for tracking & revocation is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](#classProtectionEngine_1add428fe5c54b08eb69bbf9ecd133bba1)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationSuccess](undefined) or [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationFailure
  
### OnRegisterContentForTrackingAndRevocationFailure function
Called when registration of content for tracking & revocation fails.

Parameters:  
* **error**: Error that occurred while registering content 


* **context**: The same context that was passed to ProtectionEngine::RegisterContentForTrackingAndRevocationAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationSuccess](undefined) or [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationFailure
  
### OnRevokeContentSuccess function
Called when revocation of is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::RevokeContentAsync](#classProtectionEngine_1a3830c6093a75b2f5a1109b5bd58c3d80)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RevokeContentAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRevokeContentSuccess](undefined) or [ProtectionEngine::Observer::OnRevokeContentFailure
  
### OnRevokeContentFailure function
Called when revocation of content is fails.

Parameters:  
* **error**: Error that occurred while revoking content 


* **context**: The same context that was passed to ProtectionEngine::RevokeContentAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RevokeContentAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRevokeContentSuccess](undefined) or [ProtectionEngine::Observer::OnRevokeContentFailure
  
### OnCreateDelegatedLicensesSuccess function
Called when create delegated license is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::CreateDelegationLicensesAsync](#classProtectionEngine_1a5147b32252069841530e4a634fd40743)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::CreateDelegationLicensesAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnCreateDelegatedLicensesSuccess](#classProtectionEngine_1_1Observer_1ab27b06764aa412a72048bdbd700fed56) or [ProtectionEngine::Observer::OnCreateDelegatedLicensesFailure
  
### OnCreateDelegatedLicensesFailure function
Called when create delegated license fails.

Parameters:  
* **error**: Error that occurred 


* **context**: The same context that was passed to ProtectionEngine::CreateDelegationLicensesAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::CreateDelegationLicensesAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnCreateDelegatedLicensesSuccess](undefined) or [ProtectionEngine::Observer::OnCreateDelegatedLicensesFailure