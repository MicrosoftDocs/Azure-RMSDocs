---
title: class mip::ProtectionEngine 
description: Documents the mip::protectionengine class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/23/2019
---

# class mip::ProtectionEngine 
Manages protection-related actions related to a specific identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Gets the engine settings.
public void GetTemplatesAsync(const std::shared_ptr<ProtectionEngine::Observer>& observer, const std::shared_ptr<void>& context)  |  Get collection of templates available to a user.
public std::vector<std::string> GetTemplates(const std::shared_ptr<void>& context)  |  Get collection of templates available to a user.
public void GetRightsForLabelIdAsync(const std::string& documentId, const std::string& labelId, const std::string& ownerEmail, const std::shared_ptr<ProtectionEngine::Observer>& observer, const std::shared_ptr<void>& context)  |  Get collection of rights available to a user for a label ID.
public std::vector<std::string> GetRightsForLabelId(const std::string& documentId, const std::string& labelId, const std::string& ownerEmail, const std::shared_ptr<void>& context)  |  Get collection of rights available to a user for a labelId.
public void CreateProtectionHandlerFromDescriptorAsync(const std::shared_ptr<ProtectionDescriptor>& descriptor, const ProtectionHandlerCreationOptions& options, const std::shared_ptr<ProtectionHandler::Observer>& observer, const std::shared_ptr<void>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public std::shared_ptr<ProtectionHandler> CreateProtectionHandlerFromDescriptor(const std::shared_ptr<ProtectionDescriptor>& descriptor, const ProtectionHandlerCreationOptions& options, const std::shared_ptr<void>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public void CreateProtectionHandlerFromPublishingLicenseAsync(const std::vector<uint8_t>& serializedPublishingLicense, const ProtectionHandlerCreationOptions& options, const std::shared_ptr<ProtectionHandler::Observer>& observer, const std::shared_ptr<void>& context)  |  Creates a protection handler from a serialized publishing license.
public std::shared_ptr<ProtectionHandler> CreateProtectionHandlerFromPublishingLicense(const std::vector<uint8_t>& serializedPublishingLicense, const ProtectionHandlerCreationOptions& options, const std::shared_ptr<void>& context)  |  Creates a protection handler from a serialized publishing license.
public void CreateProtectionHandlerFromProtectionInfoAsync(const std::vector<uint8_t>& serializedPublishingLicense, const std::vector<uint8_t>& serializedProtectionInfo, const std::shared_ptr<ProtectionHandler::Observer>& observer, const std::shared_ptr<void>& context)  |  Creates a protection handler from a serialized publishing license and a serialized protection info.
public std::shared_ptr<ProtectionHandler> CreateProtectionHandlerFromProtectionInfo(const std::vector<uint8_t>& serializedPublishingLicense, const std::vector<uint8_t>& serializedProtectionInfo, const std::shared_ptr<void>& context)  |  Creates a protection handler from a serialized publishing license and a serialized protection info.
public void CreateProtectionHandlerFromPublishingLicenseContextAsync(const PublishingLicenseContext& publishingLicenseContext, const ProtectionHandlerCreationOptions& options, const std::shared_ptr<ProtectionHandler::Observer>& observer, const std::shared_ptr<void>& context)  |  Creates a protection handler from a publishing license context.
public std::shared_ptr<ProtectionHandler> CreateProtectionHandlerFromPublishingLicenseContext(const PublishingLicenseContext& publishingLicenseContext, const ProtectionHandlerCreationOptions& options, const std::shared_ptr<void>& context)  |  Creates a protection handler from a publishing license context.
  
## Members
  
### Settings
Gets the engine settings.

  
**Returns**: Engine settings
  
### GetTemplatesAsync
Get collection of templates available to a user.

Parameters:  
* **observer**: A class implementing the [ProtectionEngine::Observer](class_mip_protectionengine_observer.md) interface 


* **context**: Client context that will be opaquely passed back to observers and optional [HttpDelegate](class_mip_httpdelegate.md)


  
### GetTemplates
Get collection of templates available to a user.

Parameters:  
* **context**: Client context that will be opaquely passed to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: List of template IDs
  
### GetRightsForLabelIdAsync
Get collection of rights available to a user for a label ID.

Parameters:  
* **documentId**: Document ID associated with the document metadata 


* **labelId**: [Label](class_mip_label.md) ID associated with the document metadata with which the document created 


* **ownerEmail**: owner of the document 


* **observer**: A class implementing the [ProtectionEngine::Observer](class_mip_protectionengine_observer.md) interface 


* **context**: This same context will be forwarded to [ProtectionEngine::Observer::OnGetRightsForLabelIdSuccess](class_mip_protectionengine_observer.md#ongetrightsforlabelidsuccess) or [ProtectionEngine::Observer::OnGetRightsForLabelIdFailure](class_mip_protectionengine_observer.md#ongetrightsforlabelidfailure)


  
### GetRightsForLabelId
Get collection of rights available to a user for a labelId.

Parameters:  
* **documentId**: Document ID associated with the document metadata 


* **labelId**: [Label](class_mip_label.md) ID associated with the document metadata with which the document created 


* **ownerEmail**: Owner of the document 


* **context**: This same context will be forwarded to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: List of rights
  
### CreateProtectionHandlerFromDescriptorAsync
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **descriptor**: A [ProtectionDescriptor](class_mip_protectiondescriptor.md) describing the protection configuration 


* **options**: Creation options 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely passed back to observers and optional [HttpDelegate](class_mip_httpdelegate.md)


  
### ProtectionHandler
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **descriptor**: A [ProtectionDescriptor](class_mip_protectiondescriptor.md) describing the protection configuration 


* **options**: Creation options 


* **context**: Client context that will be opaquely passed back to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: [ProtectionHandler](class_mip_protectionhandler.md)
  
### CreateProtectionHandlerFromPublishingLicenseAsync
Creates a protection handler from a serialized publishing license.

Parameters:  
* **serializedPublishingLicense**: A serialized publishing license 


* **options**: Creation options 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely passed back to observers and optional [HttpDelegate](class_mip_httpdelegate.md)


  
### ProtectionHandler
Creates a protection handler from a serialized publishing license.

Parameters:  
* **serializedPublishingLicense**: A serialized publishing license 


* **options**: Creation options 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely passed back to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: [ProtectionHandler](class_mip_protectionhandler.md)
  
### CreateProtectionHandlerFromProtectionInfoAsync
Creates a protection handler from a serialized publishing license and a serialized protection info.

Parameters:  
* **serializedPublishingLicense**: A serialized publishing license 


* **serializedProtectionInfo**: A serialized protection info 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely passed back to observers


  
### ProtectionHandler
Creates a protection handler from a serialized publishing license and a serialized protection info.

Parameters:  
* **serializedPublishingLicense**: A serialized publishing license 


* **serializedProtectionInfo**: A serialized protection info 


* **context**: Client context that will be opaquely passed back to observers



  
**Returns**: [ProtectionHandler](class_mip_protectionhandler.md)
  
### CreateProtectionHandlerFromPublishingLicenseContextAsync
Creates a protection handler from a publishing license context.

Parameters:  
* **publishingLicenseContext**: A pre-processed form of the serialized publishing license 


* **options**: Creation options 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely passed back to observers and optional [HttpDelegate](class_mip_httpdelegate.md)


  
### ProtectionHandler
Creates a protection handler from a publishing license context.

Parameters:  
* **publishingLicenseContext**: A pre-processed form of the serialized publishing license 


* **options**: Creation options 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: Client context that will be opaquely passed back to optional [HttpDelegate](class_mip_httpdelegate.md)



  
**Returns**: [ProtectionHandler](class_mip_protectionhandler.md)