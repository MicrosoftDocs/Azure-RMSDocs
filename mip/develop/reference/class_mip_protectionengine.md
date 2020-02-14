---
title: class mip::ProtectionEngine 
description: Documents the mip::protectionengine class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 02/14/2020
---

# class mip::ProtectionEngine 
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
  
## Members
  
### GetSettings function
Gets the engine settings.

  
**Returns**: Engine settings
  
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
  
### CreateProtectionHandlerForPublishing function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](undefined)



  
**Returns**: [ProtectionHandler](undefined)
  
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