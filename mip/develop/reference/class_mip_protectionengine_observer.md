---
title: class ProtectionEngine::Observer 
description: Documents the protectionengine::observer class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class ProtectionEngine::Observer 
Interface that receives notifications related to [ProtectionEngine](class_mip_protectionengine.md).
This interface must be implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual void OnGetTemplatesSuccess(const std::vector\&lt;std::shared_ptr\&lt;TemplateDescriptor\&gt;\&gt;& templateDescriptors, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when templates were retrieved successfully.
public virtual void OnGetTemplatesFailure(const std::exception_ptr& error, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when retrieving templates generated an error.
public virtual void OnGetRightsForLabelIdSuccess(const std::shared_ptr\&lt;std::vector\&lt;std::string\&gt;\&gt;& rights, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when rights were retrieved successfully.
public virtual void OnGetRightsForLabelIdFailure(const std::exception_ptr& error, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when retrieving rights for a label ID for the user.
public virtual void OnLoadUserCertSuccess(const std::shared_ptr\&lt;void\&gt;& context)  |  Called when user cert loaded successfully.
public virtual void OnLoadUserCertFailure(const std::exception_ptr& error, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when user cert loaded failed.
public virtual void OnRegisterContentForTrackingAndRevocationSuccess(const std::shared_ptr\&lt;void\&gt;& context)  |  Called when registration of content for tracking & revocation is successful.
public virtual void OnRegisterContentForTrackingAndRevocationFailure(const std::exception_ptr& error, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when registration of content for tracking & revocation fails.
public virtual void OnRevokeContentSuccess(const std::shared_ptr\&lt;void\&gt;& context)  |  Called when revocation of is successful.
public virtual void OnRevokeContentFailure(const std::exception_ptr& error, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when revocation of content is fails.
public virtual void OnCreateDelegatedLicensesSuccess(std::vector\&lt;std::shared_ptr\&lt;DelegationLicense\&gt;\&gt; delegatedLicenses, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when create delegated license is successful.
public virtual void OnCreateDelegatedLicensesFailure(const std::exception_ptr& error, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when create delegated license fails.
public virtual void OnGetTenantInformationAsyncSuccess(const std::shared_ptr\&lt;TenantInformation\&gt;& tenantInformation, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when GetTenantInformationAsync is successful.
public virtual void OnGetTenantInformationAsyncFailure(const std::exception_ptr& error, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when GetTenantInformationAsync fails.
public virtual void OnGetLicenseRightsDataSuccess(const std::shared_ptr\&lt;LicenseRightsData\&gt;& licenseRightsData, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when license rights data were retrieved successfully.
public virtual void OnGetLicenseRightsDataFailure(const std::exception_ptr& error, const std::shared_ptr\&lt;void\&gt;& context)  |  Called when retrieving license rights data fails.
  
## Members
  
### OnGetTemplatesSuccess function
Called when templates were retrieved successfully.

Parameters:  
* **templateDescriptors**: A reference to the list of templates descriptors 


* **context**: The same context that was passed to [ProtectionEngine::GetTemplatesAsync](#class_protection_engine_1a4e423dda80bd415dac5b1b998d095e53)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetTemplatesAsync and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTemplatesSuccess](#class_protection_engine_1_1_observer_1a6988e40ff9b8096c12a320e6e0b47de2) or [ProtectionEngine::Observer::OnGetTemplatesFailure](#class_protection_engine_1_1_observer_1a35babe68d548bc477159b1a70ee8bca2)
  
### OnGetTemplatesFailure function
Called when retrieving templates generated an error.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while retrieving templates 


* **context**: The same context that was passed to ProtectionEngine::GetTemplatesAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetTemplatesAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnGetTemplatesSuccess or ProtectionEngine::Observer::OnGetTemplatesFailure
  
### OnGetRightsForLabelIdSuccess function
Called when rights were retrieved successfully.

Parameters:  
* **rights**: A reference to the list of rights retrieved 


* **context**: The same context that was passed to [ProtectionEngine::GetRightsForLabelIdAsync](#class_protection_engine_1ab1462bfbece2ce4b357690f1856cc20a)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetRightsForLabelIdAsync and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](#class_protection_engine_1_1_observer_1acb203e845490619471b3ba75e8a03dde) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](#class_protection_engine_1_1_observer_1af2a1b49935ec8dc5511dac4203eefb7d)
  
### OnGetRightsForLabelIdFailure function
Called when retrieving rights for a label ID for the user.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while retrieving rights 


* **context**: The same context that was passed to ProtectionEngine::GetRightsForLabelIdAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetRightsForLabelIdAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess or ProtectionEngine::Observer::OnGetRightsForLabelIdFailure
  
### OnLoadUserCertSuccess function
Called when user cert loaded successfully.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::LoadUserCert](#class_protection_engine_1a7743b5b36e589407d94a4c00cacd5468)


An application can pass any type of context (for example, std::promise, std::function) to [ProtectionEngine::LoadUserCertAsync](#class_protection_engine_1a047594fc160d5243b6883d7e7f37b2bd) and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnLoadUserCertSuccess](#class_protection_engine_1_1_observer_1a4899e43dd995034a24f280570ebce8ef) or [ProtectionEngine::Observer::OnLoadUserCertFailure](#class_protection_engine_1_1_observer_1ae426429d4d4a458f910f76da4dfeeac8)
  
### OnLoadUserCertFailure function
Called when user cert loaded failed.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while retrieving rights 


* **context**: The same context that was passed to ProtectionEngine::LoadUserCert


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::LoadUserCertAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnLoadUserCertSuccess or ProtectionEngine::Observer::OnLoadUserCertFailure
  
### OnRegisterContentForTrackingAndRevocationSuccess function
Called when registration of content for tracking & revocation is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::RegisterContentForTrackingAndRevocationAsync](#class_protection_engine_1add428fe5c54b08eb69bbf9ecd133bba1)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RegisterContentForTrackingAndRevocationAsync and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationSuccess](#class_protection_engine_1_1_observer_1a5bf8bf514bfad7910d56fe6996234101) or [ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationFailure](#class_protection_engine_1_1_observer_1ad4957ccc92fc9d12090cd6802b242f0a)
  
### OnRegisterContentForTrackingAndRevocationFailure function
Called when registration of content for tracking & revocation fails.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while registering content 


* **context**: The same context that was passed to ProtectionEngine::RegisterContentForTrackingAndRevocationAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RegisterContentForTrackingAndRevocationAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationSuccess or ProtectionEngine::Observer::OnRegisterContentForTrackingAndRevocationFailure
  
### OnRevokeContentSuccess function
Called when revocation of is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::RevokeContentAsync](#class_protection_engine_1a3830c6093a75b2f5a1109b5bd58c3d80)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RevokeContentAsync and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnRevokeContentSuccess](#class_protection_engine_1_1_observer_1a06745f427ce554a4f92950214a2a5564) or [ProtectionEngine::Observer::OnRevokeContentFailure](#class_protection_engine_1_1_observer_1a8dd700564eb0e8b291c6fd60983e6337)
  
### OnRevokeContentFailure function
Called when revocation of content is fails.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while revoking content 


* **context**: The same context that was passed to ProtectionEngine::RevokeContentAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::RevokeContentAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnRevokeContentSuccess or ProtectionEngine::Observer::OnRevokeContentFailure
  
### OnCreateDelegatedLicensesSuccess function
Called when create delegated license is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::CreateDelegationLicensesAsync](#class_protection_engine_1a5147b32252069841530e4a634fd40743)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::CreateDelegationLicensesAsync and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnCreateDelegatedLicensesSuccess](#class_protection_engine_1_1_observer_1ab27b06764aa412a72048bdbd700fed56) or [ProtectionEngine::Observer::OnCreateDelegatedLicensesFailure](#class_protection_engine_1_1_observer_1a0a3ead878a44cdce11a3de078e8452dc)
  
### OnCreateDelegatedLicensesFailure function
Called when create delegated license fails.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred 


* **context**: The same context that was passed to ProtectionEngine::CreateDelegationLicensesAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::CreateDelegationLicensesAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnCreateDelegatedLicensesSuccess or ProtectionEngine::Observer::OnCreateDelegatedLicensesFailure
  
### OnGetTenantInformationAsyncSuccess function
Called when GetTenantInformationAsync is successful.

Parameters:  
* **context**: The same context that was passed to [ProtectionEngine::GetTenantInformationAsync](#class_protection_engine_1ad156fc241ab0a09f1e531ddcfb0e2c26)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetTenantInformationAsync and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetTenantInformationAsyncSuccess](#class_protection_engine_1_1_observer_1a237b7868667efa420bc7fa4236e4277d) or [ProtectionEngine::Observer::OnGetTenantInformationAsyncFailure](#class_protection_engine_1_1_observer_1a0fc0e64e42648f71492bfe9f0f2ce810)
  
### OnGetTenantInformationAsyncFailure function
Called when GetTenantInformationAsync fails.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred 


* **context**: The same context that was passed to ProtectionEngine::GetTenantInformationAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetTenantInformationAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnGetTenantInformationAsyncSuccess or ProtectionEngine::Observer::OnGetTenantInformationAsyncFailure
  
### OnGetLicenseRightsDataSuccess function
Called when license rights data were retrieved successfully.

Parameters:  
* **rights**: A reference to the license rights data retrieved 


* **context**: The same context that was passed to [ProtectionEngine::GetLicenseRightsDataAsync](#class_protection_engine_1a0860c37683c7a506b17da43b5727d3d9)


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetLicenseRightsDataAsync and that same context will be forwarded as-is to [ProtectionEngine::Observer::OnGetLicenseRightsDataSuccess](#class_protection_engine_1_1_observer_1a64034adcd4a0707a0a248158583f90cc) or [ProtectionEngine::Observer::OnGetLicenseRightsDataFailure](#class_protection_engine_1_1_observer_1ac66b46e8954572046ef13fc3af90b30b)
  
### OnGetLicenseRightsDataFailure function
Called when retrieving license rights data fails.

Parameters:  
* **error**: [Error](class_mip_error.md) that occurred while retrieving license rights data 


* **context**: The same context that was passed to ProtectionEngine::GetLicenseRightsDataAsync


An application can pass any type of context (for example, std::promise, std::function) to ProtectionEngine::GetLicenseRightsDataAsync and that same context will be forwarded as-is to ProtectionEngine::Observer::OnGetLicenseRightsDataSuccess or ProtectionEngine::Observer::OnGetLicenseRightsDataFailure