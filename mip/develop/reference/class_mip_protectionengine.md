# class mip::ProtectionEngine 
Performs protection-related actions related to a specific identity.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const Settings& GetSettings() const  |  Gets the engine settings.
public void GetTemplatesAsync(const std::shared_ptr<ProtectionEngine::Observer>& observer, const std::shared_ptr<void>& context)  |  Get collection of templates available to a user.
public void CreateProtectionHandlerFromDescriptorAsync(const std::shared_ptr<ProtectionDescriptor>& descriptor, const ProtectionHandlerCreationOptions& options, const std::shared_ptr<ProtectionHandler::Observer>& observer, const std::shared_ptr<void>& context)  |  Creates a protection handler where rights/roles are assigned to specific users.
public void CreateProtectionHandlerFromPublishingLicenseAsync(const std::vector<uint8_t>& serializedPublishingLicense, const ProtectionHandlerCreationOptions& options, const std::shared_ptr<ProtectionHandler::Observer>& observer, const std::shared_ptr<void>& context)  |  Creates a protection handler from its serialized form.
  
## Members
  
### Settings
Gets the engine settings.

  
**Returns**: Engine settings
  
### GetTemplatesAsync
Get collection of templates available to a user.

Parameters:  
* **observer**: A class implementing the [ProtectionEngine::Observer](class_mip_protectionengine_observer.md) interface 


* **context**: This same context will be forwarded to [ProtectionEngine::Observer::OnGetTemplatesSuccess](class_mip_protectionengine_observer.md#ongettemplatessuccess) or [ProtectionEngine::Observer::OnGetTemplatesFailure](class_mip_protectionengine_observer.md#ongettemplatesfailure)


  
### CreateProtectionHandlerFromDescriptorAsync
Creates a protection handler where rights/roles are assigned to specific users.

Parameters:  
* **descriptor**: A [ProtectionDescriptor](class_mip_protectiondescriptor.md) describing the protection configuration 


* **options**: Creation options 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: This same context will be forwarded to [ProtectionHandler::Observer::OnCreateProtectionHandlerSuccess](class_mip_protectionhandler_observer.md#oncreateprotectionhandlersuccess) or ProtectionHandler::Observer::OnCreateProtectionHandlerFailure


  
### CreateProtectionHandlerFromPublishingLicenseAsync
Creates a protection handler from its serialized form.

Parameters:  
* **serializedPublishingLicense**: A serialized publishing license 


* **options**: Creation options 


* **observer**: A class implementing the [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) interface 


* **context**: This same context will be forwarded to [ProtectionHandler::Observer::OnCreateProtectionHandlerSuccess](class_mip_protectionhandler_observer.md#oncreateprotectionhandlersuccess) or ProtectionHandler::Observer::OnCreateProtectionHandlerFailure

