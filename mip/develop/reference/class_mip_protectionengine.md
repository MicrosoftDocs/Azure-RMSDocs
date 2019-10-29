---
title: class mip::ProtectionEngine 
description: Documents the mip::protectionengine class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 10/29/2019
---

# class mip::ProtectionEngine 
Manages protection-related actions related to a specific identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Gets the engine settings.
public void GetTemplatesAsync(const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Get collection of templates available to a user.
public std::vector\<std::string\> GetTemplates(const std::shared_ptr\<void\>& context)  |  Get collection of templates available to a user.
public void GetRightsForLabelIdAsync(const std::string& documentId, const std::string& labelId, const std::string& ownerEmail, const std::string& delegatedUserEmail, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Get collection of rights available to a user for a label ID.
public std::vector\<std::string\> GetRightsForLabelId(const std::string& documentId, const std::string& labelId, const std::string& ownerEmail, const std::string& delegatedUserEmail, const std::shared_ptr\<void\>& context)  |  Get collection of rights available to a user for a labelId.
public void CreateProtectionHandlerForPublishingAsync(const ProtectionHandler::PublishingSettings& settings, const std::shared_ptr\<ProtectionHandler::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr\<ProtectionHandler\> CreateProtectionHandlerForPublishing(const ProtectionHandler::PublishingSettings& settings, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public void CreateProtectionHandlerForConsumptionAsync(const ProtectionHandler::ConsumptionSettings& settings, const std::shared_ptr\<ProtectionHandler::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr\<ProtectionHandler\> CreateProtectionHandlerForConsumption(const ProtectionHandler::ConsumptionSettings& settings, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
  
## Members
  
### GetSettings function
Gets the engine settings.

  
**Returns**: Engine settings
  
### GetTemplatesAsync function
Get collection of templates available to a user.

Parameters:  
* **observer**: A class implementing the [ProtectionEngine::Observer](#classmip_1_1ProtectionEngine_1_1Observer) interface 


* **context**: Client context that will be opaquely passed back to observers and optional [HttpDelegate](undefined)


  
### GetTemplates function
Get collection of templates available to a user.

Parameters:  
* **context**: Client context that will be opaquely passed to optional [HttpDelegate](undefined)



  
**Returns**: List of template IDs
  
### GetRightsForLabelIdAsync function
Get collection of rights available to a user for a label ID.

Parameters:  
* **documentId**: Document ID associated with the document metadata 


* **labelId**: [Label](undefined) ID associated with the document metadata with which the document created 


* **ownerEmail**: owner of the document 


* **A**: delegated user is specified when the authenticating user/application is acting on behalf of another user, empty if none 


* **observer**: A class implementing the [ProtectionEngine::Observer](undefined) interface 


* **context**: This same context will be forwarded to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](#classmip_1_1ProtectionEngine_1_1Observer_1ab70a702855d7018b60ab99127d31b610) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](#classmip_1_1ProtectionEngine_1_1Observer_1a16cab8682cca4c4d8d0fee65371ad404)


  
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


* **observer**: A class implementing the [ProtectionHandler::Observer](#classmip_1_1ProtectionHandler_1_1Observer) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](undefined)


  
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


  
### CreateProtectionHandlerForConsumption function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](undefined)



  
**Returns**: [ProtectionHandler](undefined)