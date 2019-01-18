---
title: class mip::ProtectionEngine::Settings 
description: Documents the mip::protectionengine class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/18/2019
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
public const Identity& GetIdentity() const  |  Gets the user [Identity](undefined) associated with the engine.
public void SetIdentity(const Identity& identity)  |  Sets the user [Identity](undefined) associated with the engine.
public const std::string& GetClientData() const  |  Gets custom data specified by client.
public void SetClientData(const std::string& clientData)  |  Sets custom data specified by client.
public const std::string& GetLocale() const  |  Gets the locale in which engine data will be written.
public void SetCustomSettings(const std::vector<std::pair<std::string, std::string>>& value)  |  Sets name/value pairs used for testing and experimentation.
public const std::vector<std::pair<std::string, std::string>>& GetCustomSettings() const  |  Gets name/value pairs used for testing and experimentation.
public void SetSessionId(const std::string& sessionId)  |  Sets the engine session ID, used for correlation of logging/telemetry.
public const std::string& GetSessionId() const  |  Gets the engine session ID.
public void SetCloudEndpointBaseUrl(const std::string& cloudEndpointBaseUrl)  |  Optionally sets the cloud endpoint base URL.
public const std::string& GetCloudEndpointBaseUrl() const  |  Gets the cloud base URL used by all service requests, if specified.
  
## Members
  
### Settings
[ProtectionEngine::Settings](class_mip_protectionengine_settings.md) constructor for creating a new engine.

Parameters:  
* **identity**: [Identity](undefined) that will be associated with [ProtectionEngine](class_mip_protectionengine.md)


* **clientData**: customizable client data that can be stored with the engine when unloaded and can be retrieved from a loaded engine. 


* **locale**: Engine output will be provided in this locale.


  
### Settings
[ProtectionEngine::Settings](class_mip_protectionengine_settings.md) constructor for loading an existing engine.

Parameters:  
* **engineId**: Unique identifier of engine that will be loaded 


* **clientData**: customizable client data that can be stored with the engine when unloaded and can be retrieved from a loaded engine. 


* **locale**: Engine output will be provided in this locale.


  
### GetEngineId
Gets the engine ID.

  
**Returns**: Engine ID
  
### SetEngineId
Sets the engine ID.

Parameters:  
* **engineId**: engine ID.


  
### Identity
Gets the user [Identity](undefined) associated with the engine.

  
**Returns**: User [Identity](undefined) associated with the engine
  
### SetIdentity
Sets the user [Identity](undefined) associated with the engine.

Parameters:  
* **identity**: User [Identity](undefined) associated with the engine


  
### GetClientData
Gets custom data specified by client.

  
**Returns**: Custom data specified by client
  
### SetClientData
Sets custom data specified by client.

Parameters:  
* **Custom**: data specified by client


  
### GetLocale
Gets the locale in which engine data will be written.

  
**Returns**: Locale in which engine data will be written
  
### SetCustomSettings
Sets name/value pairs used for testing and experimentation.

Parameters:  
* **customSettings**: Name/value pairs used for testing and experimentation


  
### GetCustomSettings
Gets name/value pairs used for testing and experimentation.

  
**Returns**: Name/value pairs used for testing and experimentation
  
### SetSessionId
Sets the engine session ID, used for correlation of logging/telemetry.

Parameters:  
* **sessionId**: Engine session ID, used for correlation of logging/telemetry


  
### GetSessionId
Gets the engine session ID.

  
**Returns**: Engine session ID
  
### SetCloudEndpointBaseUrl
Optionally sets the cloud endpoint base URL.

Parameters:  
* **cloudEndpointBaseUrl**: the base URL used by all service requests (for example, "https://api.aadrm.com")


If base URL is not specified, it will be determined via DNS lookup of the engine identity's domain.
  
### GetCloudEndpointBaseUrl
Gets the cloud base URL used by all service requests, if specified.

  
**Returns**: Base URL