---
title: class ProtectionEngine 
description: Documents the protectionengine::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class ProtectionEngine 
Manages protection-related actions related to a specific identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Gets the engine settings.
public std::shared_ptr\<AsyncControl\> GetTemplatesAsync(const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context, const std::shared_ptr\<const GetTemplatesSettings\>& templateSettings)  |  Get collection of templates available to a user.
public std::shared_ptr\<AsyncControl\> GetTemplatesAsync(const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Get collection of templates available to a user.
public std::vector\<std::shared_ptr\<TemplateDescriptor\>\> GetTemplates(const std::shared_ptr\<void\>& context, const std::shared_ptr\<const GetTemplatesSettings\>& templateSettings)  |  Get collection of templates available to a user.
public std::vector\<std::shared_ptr\<TemplateDescriptor\>\> GetTemplates(const std::shared_ptr\<void\>& context)  |  Get collection of templates available to a user.
public bool IsFeatureSupported(FeatureId featureId)  |  Check is feature supported.
public std::shared_ptr\<AsyncControl\> GetRightsForLabelIdAsync(const std::string& documentId, const std::string& labelId, const std::string& ownerEmail, const std::string& delegatedUserEmail, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context, const ProtectionCommonSettings& settings)  |  Get collection of rights available to a user for a label ID.
public std::vector\<std::string\> GetRightsForLabelId(const std::string& documentId, const std::string& labelId, const std::string& ownerEmail, const std::string& delegatedUserEmail, const std::shared_ptr\<void\>& context, const ProtectionCommonSettings& settings)  |  Get collection of rights available to a user for a labelId.
public std::shared_ptr\<AsyncControl\> CreateProtectionHandlerForPublishingAsync(const ProtectionHandler::PublishingSettings& settings, const std::shared_ptr\<ProtectionHandler::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr\<ProtectionHandler\> CreateProtectionHandlerForPublishing(const ProtectionHandler::PublishingSettings& settings, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr\<AsyncControl\> CreateProtectionHandlerForConsumptionAsync(const ProtectionHandler::ConsumptionSettings& settings, const std::shared_ptr\<ProtectionHandler::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr\<ProtectionHandler\> CreateProtectionHandlerForConsumption(const ProtectionHandler::ConsumptionSettings& settings, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public bool LoadUserCert(const std::shared_ptr\<void\>& context, const ProtectionCommonSettings& settings)  |  pre-emptively load user licensor certificate, useful when background loading else using prelicense might incurr an additional network call.
public std::shared_ptr\<AsyncControl\> LoadUserCertAsync(const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context, const ProtectionCommonSettings& settings)  |  pre-emptively load user licensor certificate, useful when background loading else using prelicense might incurr an additional network call.
public void RegisterContentForTrackingAndRevocation(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::string& contentName, bool isOwnerNotificationEnabled, const std::shared_ptr\<void\>& context, const ProtectionCommonSettings& settings)  |  Register publishing license (PL) for document tracking & revocation.
public std::shared_ptr\<AsyncControl\> RegisterContentForTrackingAndRevocationAsync(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::string& contentName, bool isOwnerNotificationEnabled, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context, const ProtectionCommonSettings& settings)  |  Register publishing license (PL) for document tracking & revocation.
public void RevokeContent(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::shared_ptr\<void\>& context, const ProtectionCommonSettings& settings)  |  Perform revocation for content.
public std::shared_ptr\<AsyncControl\> RevokeContentAsync(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context, const ProtectionCommonSettings& settings)  |  Perform revocation for content.
public std::vector\<std::shared_ptr\<DelegationLicense\>\> CreateDelegationLicenses(const DelegationLicenseSettings& settings, const std::shared_ptr\<void\>& context)  |  Creates a delegated license.
public std::shared_ptr\<AsyncControl\> CreateDelegationLicensesAsync(const DelegationLicenseSettings& settings, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Creates a delegated license.
public std::shared_ptr\<TenantInformation\> GetTenantInformation(const ProtectionCommonSettings& settings, const std::shared_ptr\<void\>& context)  |  Loads user licensor certificate and returns information about the tenant.
public std::shared_ptr\<AsyncControl\> GetTenantInformationAsync(const ProtectionCommonSettings& settings, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Loads user licensor certificate and returns information about the tenant.
public std::shared_ptr\<LicenseRightsData\> GetLicenseRightsData(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::shared_ptr\<void\>& context, const ProtectionCommonSettings& settings)  |  Get license rights data.
public std::shared_ptr\<AsyncControl\> GetLicenseRightsDataAsync(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context, const ProtectionCommonSettings& settings)  |  Get license rights data.
  
## Members
  
### GetSettings function
Gets the engine settings.

  
**Returns**: Engine settings
  
### GetTemplatesAsync function
Get collection of templates available to a user.

Parameters:  
* **observer**: A class implementing the [ProtectionEngine::Observer](#class_protection_engine_1_1_observer) interface 


* **context**: Client context that will be opaquely passed back to observers and optional [HttpDelegate](undefined)


* **templateSettings**: [Settings](undefined) to use when obtaining templates



  
**Returns**: Async control object.
  
### GetTemplatesAsync function
Get collection of templates available to a user.

Parameters:  
* **observer**: A class implementing the [ProtectionEngine::Observer](undefined) interface 


* **context**: Client context that will be opaquely passed back to observers and optional [HttpDelegate](undefined)



  
**Returns**: Async control object.
  
### GetTemplates function
Get collection of templates available to a user.

Parameters:  
* **context**: Client context that will be opaquely passed to optional [HttpDelegate](undefined)


* **templateSettings**: [Settings](undefined) to use when obtaining templates



  
**Returns**: List of template IDs
  
### GetTemplates function
Get collection of templates available to a user.

Parameters:  
* **context**: Client context that will be opaquely passed to optional [HttpDelegate](undefined)



  
**Returns**: List of template IDs
  
### IsFeatureSupported function
Check is feature supported.

Parameters:  
* **featureId**: id of feature to check



  
**Returns**: Boolean result
  
### GetRightsForLabelIdAsync function
Get collection of rights available to a user for a label ID.

Parameters:  
* **documentId**: Document ID associated with the document metadata 


* **labelId**: [Label](undefined) ID associated with the document metadata with which the document created 


* **ownerEmail**: owner of the document 


* **A**: delegated user is specified when the authenticating user/application is acting on behalf of another user, empty if none 


* **observer**: A class implementing the [ProtectionEngine::Observer](undefined) interface 


* **context**: This same context will be forwarded to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](undefined) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](undefined)



  
**Returns**: Async control object.
  
### GetRightsForLabelId function
Get collection of rights available to a user for a labelId.

Parameters:  
* **documentId**: Document ID associated with the document metadata 


* **labelId**: [Label](undefined) ID associated with the document metadata with which the document created 


* **ownerEmail**: Owner of the document 


* **A**: delegated user is specified when the authenticating user/application is acting on behalf of another user, empty if none 


* **context**: This same context will be forwarded to optional [HttpDelegate](undefined)



  
**Returns**: List of rights
  
### CreateProtectionHandlerForPublishingAsync function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **observer**: A class implementing the [ProtectionHandler::Observer](undefined) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](undefined)



  
**Returns**: Async control object.
If settings are offline only, engine needs to have previously called GetTemplatesAsync and LoadUserCertAsync
  
### CreateProtectionHandlerForPublishing function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](undefined)



  
**Returns**: [ProtectionHandler](undefined)
If settings are offline only, engine needs to have previously called GetTemplates and LoadUserCert
  
### CreateProtectionHandlerForConsumptionAsync function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **observer**: A class implementing the [ProtectionHandler::Observer](undefined) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](undefined)



  
**Returns**: Async control object.
  
### CreateProtectionHandlerForConsumption function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](undefined)



  
**Returns**: [ProtectionHandler](undefined)
  
### LoadUserCert function
pre-emptively load user licensor certificate, useful when background loading else using prelicense might incurr an additional network call.

Parameters:  
* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](undefined)



  
**Returns**: True if loaded successfully else false.
  
### LoadUserCertAsync function
pre-emptively load user licensor certificate, useful when background loading else using prelicense might incurr an additional network call.

Parameters:  
* **observer**: A class implementing the [ProtectionHandler::Observer](undefined) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](undefined)



  
**Returns**: Async control object.
  
### RegisterContentForTrackingAndRevocation function
Register publishing license (PL) for document tracking & revocation.

Parameters:  
* **contentName**: The name to associated with the content specified by the serializedPublishingLicense. If the serializedPublishingLicense specifies a content name, that value will take precedence. 


* **isOwnerNotificationEnabled**: Set to true to notify the owner via email whenever the document is decrypted, or false to not send the notification. 


* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](undefined)


  
### RegisterContentForTrackingAndRevocationAsync function
Register publishing license (PL) for document tracking & revocation.

Parameters:  
* **serializedPublishingLicense**: Serialized publishing license from protected content 


* **contentName**: The name to associated with the content specified by the serializedPublishingLicense. If the serializedPublishingLicense specifies a content name, that value will take precedence 


* **isOwnerNotificationEnabled**: Set to true to notify the owner via email whenever the document is decrypted, or false to not send the notification. 


* **observer**: A class implementing the [ProtectionHandler::Observer](undefined) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](undefined)



  
**Returns**: Async control object.
  
### RevokeContent function
Perform revocation for content.

Parameters:  
* **serializedPublishingLicense**: Serialized publishing license from protected content 


* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](undefined)


  
### RevokeContentAsync function
Perform revocation for content.

Parameters:  
* **serializedPublishingLicense**: Serialized publishing license from protected content 


* **observer**: A class implementing the [ProtectionHandler::Observer](undefined) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](undefined)



  
**Returns**: Async control object.
  
### CreateDelegationLicenses function
Creates a delegated license.

Parameters:  
* **settings**: The delegation settings 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](undefined)



  
**Returns**: A vector of the delegation licenses
Use this method to create licenses for a list of users
  
### CreateDelegationLicensesAsync function
Creates a delegated license.

Parameters:  
* **settings**: The delegation settings 


* **observer**: A class implementing the [ProtectionHandler::Observer](undefined) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](undefined)



  
**Returns**: Async control object.
Use this method to create licenses for a list of users. Receive the [DelegationLicense](#class_delegation_license) vector in callback OnCreateDelegatedLicensesSuccess Failures are sent in OnCreateDelegatedLicensesFailure
  
### GetTenantInformation function
Loads user licensor certificate and returns information about the tenant.

Parameters:  
* **settings**: The common settings 


* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](undefined)



  
**Returns**: [TenantInformation](#class_tenant_information)
  
### GetTenantInformationAsync function
Loads user licensor certificate and returns information about the tenant.

Parameters:  
* **settings**: The common settings 


* **observer**: A class implementing the [ProtectionHandler::Observer](undefined) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](undefined)



  
**Returns**: Async control object.
- [ProtectionEngine::Observer::OnGetTenantInformationAsyncSuccess](undefined) will be called on success [ProtectionEngine::Observer::OnGetTenantInformationAsyncFailure](undefined) will be called on failure
  
### GetLicenseRightsData function
Get license rights data.

Parameters:  
* **serializedPublishingLicense**: Serialized publishing license from protected content 


* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](undefined)


* **settings**: The common settings



  
**Returns**: The license rights data
  
### GetLicenseRightsDataAsync function
Get license rights data.

Parameters:  
* **serializedPublishingLicense**: Serialized publishing license from protected content 


* **observer**: A class implementing the [ProtectionHandler::Observer](undefined) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](undefined)


* **settings**: The common settings



  
**Returns**: Async control object.