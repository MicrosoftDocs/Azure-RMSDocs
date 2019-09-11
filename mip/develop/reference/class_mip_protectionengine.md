---
title: class mip::ProtectionEngine 
description: Documents the mip::protectionengine class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/27/2019
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
public void CreateProtectionHandlerFromDescriptorAsync(const std::shared_ptr\<ProtectionDescriptor\>& descriptor, const ProtectionHandlerCreationOptions& options, const std::shared_ptr\<ProtectionHandler::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr\<ProtectionHandler\> CreateProtectionHandlerFromDescriptor(const std::shared_ptr\<ProtectionDescriptor\>& descriptor, const ProtectionHandlerCreationOptions& options, const std::shared_ptr\<void\>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public void CreateProtectionHandlerFromPublishingLicenseAsync(const std::vector\<uint8_t\>& serializedPublishingLicense, const ProtectionHandlerCreationOptions& options, const std::shared_ptr\<ProtectionHandler::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Creates a protection handler from a serialized publishing license.
public std::shared_ptr\<ProtectionHandler\> CreateProtectionHandlerFromPublishingLicense(const std::vector\<uint8_t\>& serializedPublishingLicense, const ProtectionHandlerCreationOptions& options, const std::shared_ptr\<void\>& context)  |  Creates a protection handler from a serialized publishing license.
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
* **observer**: A class implementing the [ProtectionEngine::Observer](class_mip_protectionengine_observer.md) interface 


* **context**: Client context that will be opaquely passed back to observers and optional [HttpDelegate](class_mip_httpdelegate.md)


  
### GetTemplates function
Get collection of templates available to a user.

Parameters:  
* **context**: Client context that will be opaquely passed to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: List of template IDs
  
### GetRightsForLabelIdAsync function
Get collection of rights available to a user for a label ID.

Parameters:  
* **documentId**: Document ID associated with the document metadata 


* **labelId**: [Label](class_mip_label.md) ID associated with the document metadata with which the document created 


* **ownerEmail**: owner of the document 


* **A**: delegated user is specified when the authenticating user/application is acting on behalf of another user, empty if none 


* **observer**: A class implementing the [ProtectionEngine::Observer](class_mip_protectionengine_observer.md) interface 


* **context**: This same context will be forwarded to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](class_mip_protectionengine_observer.md#ongetrightsforlabelidsuccess-function) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](class_mip_protectionengine_observer.md#ongetrightsforlabelidfailure-function)


  
### GetRightsForLabelId function
Get collection of rights available to a user for a labelId.

Parameters:  
* **documentId**: Document ID associated with the document metadata 


* **labelId**: [Label](class_mip_label.md) ID associated with the document metadata with which the document created 


* **ownerEmail**: Owner of the document 


* **A**: delegated user is specified when the authenticating user/application is acting on behalf of another user, empty if none 


* **context**: This same context will be forwarded to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: List of rights
  
### CreateProtectionHandlerFromDescriptorAsync function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **descriptor**: A [ProtectionDescriptor](class_mip_protectiondescriptor.md) describing the protection configuration 


* **options**: Creation options 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely passed back to observers and optional [HttpDelegate](class_mip_httpdelegate.md)


> Deprecated: This method will soon be deprecated in favor of CreateProtectionHandlerForPublishingAsync
  
### CreateProtectionHandlerFromDescriptor function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **descriptor**: A [ProtectionDescriptor](class_mip_protectiondescriptor.md) describing the protection configuration 


* **options**: Creation options 


* **context**: Client context that will be opaquely passed back to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: [ProtectionHandler](class_mip_protectionhandler.md)
> Deprecated: This method will soon be deprecated in favor of CreateProtectionHandlerForPublishingAsync
  
### CreateProtectionHandlerFromPublishingLicenseAsync function
Creates a protection handler from a serialized publishing license.

Parameters:  
* **serializedPublishingLicense**: A serialized publishing license 


* **options**: Creation options 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely passed back to observers and optional [HttpDelegate](class_mip_httpdelegate.md)


> Deprecated: This method will soon be deprecated in favor of CreateProtectionHandlerForConsumptionAsync
  
### CreateProtectionHandlerFromPublishingLicense function
Creates a protection handler from a serialized publishing license.

Parameters:  
* **serializedPublishingLicense**: A serialized publishing license 


* **options**: Creation options 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely passed back to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: [ProtectionHandler](class_mip_protectionhandler.md)
> Deprecated: This method will soon be deprecated in favor of CreateProtectionHandlerForConsumption
  
### CreateProtectionHandlerForPublishingAsync function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](class_mip_httpdelegate.md)


  
### CreateProtectionHandlerForPublishing function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: [ProtectionHandler](class_mip_protectionhandler.md)
  
### CreateProtectionHandlerForConsumptionAsync function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely forwarded to observers and optional [HttpDelegate](class_mip_httpdelegate.md)


  
### CreateProtectionHandlerForConsumption function
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **settings**: Protection settings 


* **context**: Client context that will be opaquely forwarded to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: [ProtectionHandler](class_mip_protectionhandler.md)