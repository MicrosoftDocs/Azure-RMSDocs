---
title: class ProtectionEngine 
description: Documents the protectionengine::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class ProtectionEngine 
Manages protection-related actions related to a specific identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Gets the engine settings.
public std::shared_ptr&lt;AsyncControl&gt; GetTemplatesAsync(const std::shared_ptr&lt;ProtectionEngine::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context)  |  Get collection of templates available to a user.
public std::vector&lt;std::shared_ptr&lt;TemplateDescriptor&gt;&gt; GetTemplates(const std::shared_ptr&lt;void&gt;& context, const std::shared_ptr&lt;const GetTemplatesSettings&gt;& templateSettings)  |  Get collection of templates available to a user.
public std::shared_ptr&lt;AsyncControl&gt; GetTemplatesAsync(const std::shared_ptr&lt;ProtectionEngine::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context, const std::shared_ptr&lt;const GetTemplatesSettings&gt;& templateSettings)  |  Get collection of templates available to a user.
public std::vector&lt;std::shared_ptr&lt;TemplateDescriptor&gt;&gt; GetTemplates(const std::shared_ptr&lt;void&gt;& context)  |  Get collection of templates available to a user.
public bool IsFeatureSupported(FeatureId featureId)  |  Check is feature supported.
public std::shared_ptr&lt;AsyncControl&gt; GetRightsForLabelIdAsync(const std::string& documentId, const std::string& labelId, const std::string& ownerEmail, const std::string& delegatedUserEmail, const std::shared_ptr&lt;ProtectionEngine::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context, const ProtectionCommonSettings& settings)  |  Get collection of rights available to a user for a label ID.
public std::vector&lt;std::string&gt; GetRightsForLabelId(const std::string& documentId, const std::string& labelId, const std::string& ownerEmail, const std::string& delegatedUserEmail, const std::shared_ptr&lt;void&gt;& context, const ProtectionCommonSettings& settings)  |  Get collection of rights available to a user for a labelId.
public std::shared_ptr&lt;AsyncControl&gt; CreateProtectionHandlerForPublishingAsync(const ProtectionHandler::PublishingSettings& settings, const std::shared_ptr&lt;ProtectionHandler::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr&lt;ProtectionHandler&gt; CreateProtectionHandlerForPublishing(const ProtectionHandler::PublishingSettings& settings, const std::shared_ptr&lt;void&gt;& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr&lt;AsyncControl&gt; CreateProtectionHandlerForConsumptionAsync(const ProtectionHandler::ConsumptionSettings& settings, const std::shared_ptr&lt;ProtectionHandler::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr&lt;ProtectionHandler&gt; CreateProtectionHandlerForConsumption(const ProtectionHandler::ConsumptionSettings& settings, const std::shared_ptr&lt;void&gt;& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public bool LoadUserCert(const std::shared_ptr&lt;void&gt;& context, const ProtectionCommonSettings& settings)  |  pre-emptively load user licensor certificate, useful when background loading else using prelicense might incurr an additional network call.
public std::shared_ptr&lt;AsyncControl&gt; LoadUserCertAsync(const std::shared_ptr&lt;ProtectionEngine::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context, const ProtectionCommonSettings& settings)  |  pre-emptively load user licensor certificate, useful when background loading else using prelicense might incurr an additional network call.
public void RegisterContentForTrackingAndRevocation(const std::vector&lt;uint8_t&gt;& serializedPublishingLicense, const std::string& contentName, bool isOwnerNotificationEnabled, const std::shared_ptr&lt;void&gt;& context, const ProtectionCommonSettings& settings)  |  Register publishing license (PL) for document tracking & revocation.
public std::shared_ptr&lt;AsyncControl&gt; RegisterContentForTrackingAndRevocationAsync(const std::vector&lt;uint8_t&gt;& serializedPublishingLicense, const std::string& contentName, bool isOwnerNotificationEnabled, const std::shared_ptr&lt;ProtectionEngine::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context, const ProtectionCommonSettings& settings)  |  Register publishing license (PL) for document tracking & revocation.
public void RevokeContent(const std::vector&lt;uint8_t&gt;& serializedPublishingLicense, const std::shared_ptr&lt;void&gt;& context, const ProtectionCommonSettings& settings)  |  Perform revocation for content.
public std::shared_ptr&lt;AsyncControl&gt; RevokeContentAsync(const std::vector&lt;uint8_t&gt;& serializedPublishingLicense, const std::shared_ptr&lt;ProtectionEngine::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context, const ProtectionCommonSettings& settings)  |  Perform revocation for content.
public std::vector&lt;std::shared_ptr&lt;DelegationLicense&gt;&gt; CreateDelegationLicenses(const DelegationLicenseSettings& settings, const std::shared_ptr&lt;void&gt;& context)  |  Creates a delegated license.
public std::shared_ptr&lt;AsyncControl&gt; CreateDelegationLicensesAsync(const DelegationLicenseSettings& settings, const std::shared_ptr&lt;ProtectionEngine::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context)  |  Creates a delegated license.
public std::shared_ptr&lt;TenantInformation&gt; GetTenantInformation(const ProtectionCommonSettings& settings, const std::shared_ptr&lt;void&gt;& context)  |  Loads user licensor certificate and returns information about the tenant.
public std::shared_ptr&lt;AsyncControl&gt; GetTenantInformationAsync(const ProtectionCommonSettings& settings, const std::shared_ptr&lt;ProtectionEngine::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context)  |  Loads user licensor certificate and returns information about the tenant.
  
## Members
  
### GetSettings function
Gets the engine settings.

  
**Returns**: Engine settings
  
### GetTemplatesAsync function
Get collection of templates available to a user.

Parameters:  
* **observer**: A class implementing the ProtectionEngine::Observer interface 


* **context**: Client context that will be opaquely passed back to observers and optional HttpDelegate



  
**Returns**: Async control object.
  
### GetTemplates function
Get collection of templates available to a user.

Parameters:  
* **context**: Client context that will be opaquely passed to optional HttpDelegate


* **templateSettings**: Settings to use when obtaining templates



  
**Returns**: List of template IDs
  
### GetTemplatesAsync function
Get collection of templates available to a user.

Parameters:  
* **observer**: A class implementing the ProtectionEngine::Observer interface 


* **context**: Client context that will be opaquely passed back to observers and optional HttpDelegate


* **templateSettings**: Settings to use when obtaining templates 



  
**Returns**: Async control object.
  
### GetTemplates function
Get collection of templates available to a user.

Parameters:  
* **context**: Client context that will be opaquely passed to optional HttpDelegate



  
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


* **labelId**: Label ID associated with the document metadata with which the document created 


* **ownerEmail**: owner of the document 


* **A**: delegated user is specified when the authenticating user/application is acting on behalf of another user, empty if none 


* **observer**: A class implementing the ProtectionEngine::Observer interface 


* **context**: This same context will be forwarded to ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess or ProtectionEngine::Observer::OnGetRightsForLabelIdFailure



  
**Returns**: Async control object.
  
### GetRightsForLabelId function
Get collection of rights available to a user for a labelId.

Parameters:  
* **documentId**: Document ID associated with the document metadata 


* **labelId**: Label ID associated with the document metadata with which the document created 


* **ownerEmail**: Owner of the document 


* **A**: delegated user is specified when the authenticating user/application is acting on behalf of another user, empty if none 


* **context**: This same context will be forwarded to optional HttpDelegate



  
**Returns**: List of rights
  
### CreateProtectionHandlerForPublishingAsync function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **observer**: A class implementing the ProtectionHandler::Observer interface 


* **context**: Client context that will be opaquely forwarded to observers and optional HttpDelegate



  
**Returns**: Async control object.
  
### CreateProtectionHandlerForPublishing function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **context**: Client context that will be opaquely forwarded to optional HttpDelegate



  
**Returns**: ProtectionHandler
  
### CreateProtectionHandlerForConsumptionAsync function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **observer**: A class implementing the ProtectionHandler::Observer interface 


* **context**: Client context that will be opaquely forwarded to observers and optional HttpDelegate



  
**Returns**: Async control object.
  
### CreateProtectionHandlerForConsumption function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **context**: Client context that will be opaquely forwarded to optional HttpDelegate



  
**Returns**: ProtectionHandler
  
### LoadUserCert function
pre-emptively load user licensor certificate, useful when background loading else using prelicense might incurr an additional network call.

Parameters:  
* **context**: Client context that will be opaquely forwarded to optional HttpDelegate



  
**Returns**: True if loaded successfully else false.
  
### LoadUserCertAsync function
pre-emptively load user licensor certificate, useful when background loading else using prelicense might incurr an additional network call.

Parameters:  
* **observer**: A class implementing the ProtectionHandler::Observer interface 


* **context**: Client context that will be opaquely forwarded to observers and optional HttpDelegate



  
**Returns**: Async control object.
  
### RegisterContentForTrackingAndRevocation function
Register publishing license (PL) for document tracking & revocation.

Parameters:  
* **contentName**: The name to associated with the content specified by the serializedPublishingLicense. If the serializedPublishingLicense specifies a content name, that value will take precedence. 


* **isOwnerNotificationEnabled**: Set to true to notify the owner via email whenever the document is decrypted, or false to not send the notification. 


* **context**: Client context that will be opaquely forwarded to optional HttpDelegate


  
### RegisterContentForTrackingAndRevocationAsync function
Register publishing license (PL) for document tracking & revocation.

Parameters:  
* **serializedPublishingLicense**: Serialized publishing license from protected content 


* **contentName**: The name to associated with the content specified by the serializedPublishingLicense. If the serializedPublishingLicense specifies a content name, that value will take precedence 


* **isOwnerNotificationEnabled**: Set to true to notify the owner via email whenever the document is decrypted, or false to not send the notification. 


* **observer**: A class implementing the ProtectionHandler::Observer interface 


* **context**: Client context that will be opaquely forwarded to observers and optional HttpDelegate



  
**Returns**: Async control object.
  
### RevokeContent function
Perform revocation for content.

Parameters:  
* **serializedPublishingLicense**: Serialized publishing license from protected content 


* **context**: Client context that will be opaquely forwarded to optional HttpDelegate


  
### RevokeContentAsync function
Perform revocation for content.

Parameters:  
* **serializedPublishingLicense**: Serialized publishing license from protected content 


* **observer**: A class implementing the ProtectionHandler::Observer interface 


* **context**: Client context that will be opaquely forwarded to observers and optional HttpDelegate



  
**Returns**: Async control object.
  
### CreateDelegationLicenses function
Creates a delegated license.

Parameters:  
* **settings**: The delegation settings 


* **context**: Client context that will be opaquely forwarded to observers and optional HttpDelegate



  
**Returns**: A vector of the delegation licenses
Use this method to create licenses for a list of users
  
### CreateDelegationLicensesAsync function
Creates a delegated license.

Parameters:  
* **settings**: The delegation settings 


* **observer**: A class implementing the ProtectionHandler::Observer interface 


* **context**: Client context that will be opaquely forwarded to observers and optional HttpDelegate



  
**Returns**: Async control object.
Use this method to create licenses for a list of users. Receive the DelegationLicense vector in callback OnCreateDelegatedLicensesSuccess Failures are sent in OnCreateDelegatedLicensesFailure
  
### GetTenantInformation function
Loads user licensor certificate and returns information about the tenant.

Parameters:  
* **settings**: The common settings 


* **context**: Client context that will be opaquely forwarded to optional HttpDelegate



  
**Returns**: [TenantInformation](#classTenantInformation)
  
### GetTenantInformationAsync function
Loads user licensor certificate and returns information about the tenant.

Parameters:  
* **settings**: The common settings 


* **observer**: A class implementing the ProtectionHandler::Observer interface 


* **context**: Client context that will be opaquely forwarded to observers and optional HttpDelegate



  
**Returns**: Async control object.
- ProtectionEngine::Observer::OnGetTenantInformationAsyncSuccess will be called on success ProtectionEngine::Observer::OnGetTenantInformationAsyncFailure will be called on failure.
- 