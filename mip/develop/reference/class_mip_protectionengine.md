---
title: class ProtectionEngine 
description: Documents the protectionengine::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/13/2021
---

# class ProtectionEngine 
Manages protection-related actions related to a specific identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Gets the engine settings.
public std::shared_ptr\<AsyncControl\> GetTemplatesAsync(const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Get collection of templates available to a user.
public std::vector\<std::shared_ptr\<TemplateDescriptor\>\> GetTemplates(const std::shared_ptr\<void\>& context)  |  Get collection of templates available to a user.
public bool IsFeatureSupported(FeatureId featureId)  |  Check is feature supported.
public std::shared_ptr\<AsyncControl\> GetRightsForLabelIdAsync(const std::string& documentId, const std::string& labelId, const std::string& ownerEmail, const std::string& delegatedUserEmail, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Get collection of rights available to a user for a label ID.
public std::vector\<std::string\> GetRightsForLabelId(const std::string& documentId, const std::string& labelId, const std::string& ownerEmail, const std::string& delegatedUserEmail, const std::shared_ptr\<void\>& context)  |  Get collection of rights available to a user for a labelId.
public std::shared_ptr\<AsyncControl\> CreateProtectionHandlerForPublishingAsync(const ProtectionHandler::PublishingSettings& settings, const std::shared_ptr\<ProtectionHandler::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr\<ProtectionHandler\> CreateProtectionHandlerForPublishing(const ProtectionHandler::PublishingSettings& settings, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr\<AsyncControl\> CreateProtectionHandlerForConsumptionAsync(const ProtectionHandler::ConsumptionSettings& settings, const std::shared_ptr\<ProtectionHandler::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr\<ProtectionHandler\> CreateProtectionHandlerForConsumption(const ProtectionHandler::ConsumptionSettings& settings, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public bool LoadUserCert(const std::shared_ptr\<void\>& context)  |  pre-emptively load user licensor certificate, useful when background loading else using prelicense might incurr an additional network call.
public std::shared_ptr\<AsyncControl\> LoadUserCertAsync(const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  pre-emptively load user licensor certificate, useful when background loading else using prelicense might incurr an additional network call.
public void RegisterContentForTrackingAndRevocation(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::string& contentName, bool isOwnerNotificationEnabled, const std::shared_ptr\<void\>& context)  |  Register publishing license (PL) for document tracking & revocation.
public std::shared_ptr\<AsyncControl\> RegisterContentForTrackingAndRevocationAsync(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::string& contentName, bool isOwnerNotificationEnabled, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Register publishing license (PL) for document tracking & revocation.
public void RevokeContent(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::shared_ptr\<void\>& context)  |  Perform revocation for content.
public std::shared_ptr\<AsyncControl\> RevokeContentAsync(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Perform revocation for content.
public std::vector\<std::shared_ptr\<DelegationLicense\>\> CreateDelegationLicenses(const DelegationLicenseSettings& settings, const std::shared_ptr\<void\>& context)  |  Creates a delegated license.
public std::shared_ptr\<AsyncControl\> CreateDelegationLicensesAsync(const DelegationLicenseSettings& settings, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Creates a delegated license.
  
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