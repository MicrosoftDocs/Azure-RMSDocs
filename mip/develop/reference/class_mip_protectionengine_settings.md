---
title: class mip::ProtectionEngine::Settings 
description: Documents the mip::protectionengine class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/28/2019
---

# class mip::ProtectionEngine::Settings 
[Settings](class_mip_protectionengine_settings.md) used by [ProtectionEngine](class_mip_protectionengine.md) during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const Identity& identity, const std::string& clientData, const std::string& locale)  |  [ProtectionEngine::Settings](class_mip_protectionengine_settings.md) constructor for creating a new engine.
public Settings(const std::string& engineId, const std::string& clientData, const std::string& locale)  |  [ProtectionEngine::Settings](class_mip_protectionengine_settings.md) constructor for loading an existing engine.
public const std::string& GetEngineId() const  |  Gets the engine ID.
public void SetEngineId(const std::string& engineId)  |  Sets the engine ID.
public const Identity& GetIdentity() const  |  Gets the user [Identity](class_mip_identity.md) associated with the engine.
public void SetIdentity(const Identity& identity)  |  Sets the user [Identity](class_mip_identity.md) associated with the engine.
public const std::string& GetClientData() const  |  Gets custom data specified by client.
public void SetClientData(const std::string& clientData)  |  Sets custom data specified by client.
public const std::string& GetLocale() const  |  Gets the locale in which engine data will be written.
public void SetCustomSettings(const std::vector\<std::pair\<std::string, std::string\>\>& value)  |  Sets name/value pairs used for testing and experimentation.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  |  Gets name/value pairs used for testing and experimentation.
public void SetSessionId(const std::string& sessionId)  |  Sets the engine session ID, used for correlation of logging/telemetry.
public const std::string& GetSessionId() const  |  Gets the engine session ID.
public void SetCloudEndpointBaseUrl(const std::string& cloudEndpointBaseUrl)  |  Optionally sets the cloud endpoint base URL.
public const std::string& GetCloudEndpointBaseUrl() const  |  Gets the cloud base URL used by all service requests, if specified.
  
## Members
  
### Settings function
[ProtectionEngine::Settings](class_mip_protectionengine_settings.md) constructor for creating a new engine.

Parameters:  
* **identity**: [Identity](class_mip_identity.md) that will be associated with [ProtectionEngine](class_mip_protectionengine.md)


* **clientData**: customizable client data that can be stored with the engine when unloaded and can be retrieved from a loaded engine. 


* **locale**: Engine output will be provided in this locale.


  
### Settings function
[ProtectionEngine::Settings](class_mip_protectionengine_settings.md) constructor for loading an existing engine.

Parameters:  
* **engineId**: Unique identifier of engine that will be loaded 


* **clientData**: customizable client data that can be stored with the engine when unloaded and can be retrieved from a loaded engine. 


* **locale**: Engine output will be provided in this locale.


  
### GetEngineId function
Gets the engine ID.

  
**Returns**: Engine ID
  
### SetEngineId function
Sets the engine ID.

Parameters:  
* **engineId**: engine ID.


  
### GetIdentity function
Gets the user [Identity](class_mip_identity.md) associated with the engine.

  
**Returns**: User [Identity](class_mip_identity.md) associated with the engine
  
### SetIdentity function
Sets the user [Identity](class_mip_identity.md) associated with the engine.

Parameters:  
* **identity**: User [Identity](class_mip_identity.md) associated with the engine


  
### GetClientData function
Gets custom data specified by client.

  
**Returns**: Custom data specified by client
  
### SetClientData function
Sets custom data specified by client.

Parameters:  
* **Custom**: data specified by client


  
### GetLocale function
Gets the locale in which engine data will be written.

  
**Returns**: Locale in which engine data will be written
  
### SetCustomSettings function
Sets name/value pairs used for testing and experimentation.

Parameters:  
* **customSettings**: Name/value pairs used for testing and experimentation


  
### GetCustomSettings function
Gets name/value pairs used for testing and experimentation.

  
**Returns**: Name/value pairs used for testing and experimentation
  
### SetSessionId function
Sets the engine session ID, used for correlation of logging/telemetry.

Parameters:  
* **sessionId**: Engine session ID, used for correlation of logging/telemetry


  
### GetSessionId function
Gets the engine session ID.

  
**Returns**: Engine session ID
  
### SetCloudEndpointBaseUrl function
Optionally sets the cloud endpoint base URL.

Parameters:  
* **cloudEndpointBaseUrl**: the base URL used by all service requests (for example, "https://api.aadrm.com")


If base URL is not specified, it will be determined via DNS lookup of the engine identity's domain.
  
### GetCloudEndpointBaseUrl function
Gets the cloud base URL used by all service requests, if specified.

  
**Returns**: Base URL