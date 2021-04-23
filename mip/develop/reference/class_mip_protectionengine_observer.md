---
title: class ProtectionEngine::Observer 
description: Documents the protectionengine::observer class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/23/2021
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
public virtual void OnCreateDelegatedLicensesSuccess(std::vector\<std::shared_ptr\<DelegationLicense\>\> delegatedLicenses, const std::shared_ptr\<void\>& context)  |  Called when create delegated license is successful.
public virtual void OnCreateDelegatedLicensesFailure(const std::exception_ptr& error, const std::shared_ptr\<void\>& context)  |  Called when create delegated license fails.
  
## Members
  
### OnGetTemplatesSuccess function
Called when templates were retrieved successfully.

Parameters:  
* **templateDescriptors**: A reference to the list of templates descriptors 


* **context**: The same context that was passed to [ProtectionEngine::GetTemplatesAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetTemplatesAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](undefined) or [ProtectionEngine::Observer::OnGetTemplatesFailure](undefined)
  
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


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](#classProtectionEngine_1a31f9bae98785d9f6ebc9630bed0b3ae3)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetRightsForLabelIdAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](undefined) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](undefined)
  
### OnGetRightsForLabelIdFailure function
Called when retrieving rights for a label ID for the user.

Parameters:  
* **error**: [Error](undefined) that occurred while retrieving rights 


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::GetRightsForLabelIdAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](undefined) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](undefined)
  
### OnLoadUserCertSuccess function
Called when user cert loaded successfully.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::LoadUserCert](#classProtectionEngine_1a7743b5b36e589407d94a4c00cacd5468)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::LoadUserCertAsync](#classProtectionEngine_1af5ef88c9c71434ef7e187efac1bbd164) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnLoadUserCertSuccess](undefined) or [ProtectionEngine::Observer::OnLoadUserCertFailure](undefined)
  
### OnLoadUserCertFailure function
Called when user cert loaded failed.

Parameters:  
* **error**: [Error](undefined) that occurred while retrieving rights 


* **context**: The same context that was passed to [ProtectionEngine::LoadUserCert](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::LoadUserCertAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnLoadUserCertSuccess](undefined) or [ProtectionEngine::Observer::OnLoadUserCertFailure](undefined)
  
### OnRegisterContentForTrackingAndRevocationSuccess function
Called when registration of content for tracking & revocation is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](#classProtectionEngine_1a31bd81a1fe322956829d2c7b66edf92e)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationSuccess](undefined) or [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationFailure](undefined)
  
### OnRegisterContentForTrackingAndRevocationFailure function
Called when registration of content for tracking & revocation fails.

Parameters:  
* **error**: [Error](undefined) that occurred while registering content 


* **context**: The same context that was passed to [ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationSuccess](undefined) or [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationFailure](undefined)
  
### OnRevokeContentSuccess function
Called when revocation of is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::RevokeContentAsync](#classProtectionEngine_1a8bd26d1cdfef48738940433c5dccb983)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::RevokeContentAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRevokeContentSuccess](undefined) or [ProtectionEngine::Observer::OnRevokeContentFailure](undefined)
  
### OnRevokeContentFailure function
Called when revocation of content is fails.

Parameters:  
* **error**: [Error](undefined) that occurred while revoking content 


* **context**: The same context that was passed to [ProtectionEngine::RevokeContentAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::RevokeContentAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRevokeContentSuccess](undefined) or [ProtectionEngine::Observer::OnRevokeContentFailure](undefined)
  
### OnCreateDelegatedLicensesSuccess function
Called when create delegated license is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::CreateDelegationLicensesAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::CreateDelegationLicensesAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnCreateDelegatedLicensesSuccess](undefined) or [ProtectionEngine::Observer::OnCreateDelegatedLicensesFailure](undefined)
  
### OnCreateDelegatedLicensesFailure function
Called when create delegated license fails.

Parameters:  
* **error**: [Error](undefined) that occurred 


* **context**: The same context that was passed to [ProtectionEngine::CreateDelegationLicensesAsync](undefined)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::CreateDelegationLicensesAsync](undefined) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnCreateDelegatedLicensesSuccess](undefined) or [ProtectionEngine::Observer::OnCreateDelegatedLicensesFailure](undefined)