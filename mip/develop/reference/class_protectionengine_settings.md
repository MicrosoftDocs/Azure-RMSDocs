---
title: class ProtectionEngine::Settings 
description: Documents the protectionengine::settings class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/13/2021
---

# class ProtectionEngine::Settings 
Settings used by ProtectionEngine during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const Identity& identity, const std::shared_ptr\<AuthDelegate\>& authDelegate, const std::string& clientData, const std::string& locale)  |  ProtectionEngine::Settings constructor for creating a new engine.
public Settings(const std::string& engineId, const std::shared_ptr\<AuthDelegate\>& authDelegate, const std::string& clientData, const std::string& locale)  |  ProtectionEngine::Settings constructor for loading an existing engine.
public const std::string& GetEngineId() const  |  Gets the engine ID.
public void SetEngineId(const std::string& engineId)  |  Sets the engine ID.
public const Identity& GetIdentity() const  |  Gets the user Identity associated with the engine.
public void SetIdentity(const Identity& identity)  |  Sets the user Identity associated with the engine.
public const std::string& GetClientData() const  |  Gets custom data specified by client.
public void SetClientData(const std::string& clientData)  |  Sets custom data specified by client.
public const std::string& GetLocale() const  |  Gets the locale in which engine data will be written.
public void SetCustomSettings(const std::vector\<std::pair\<std::string, std::string\>\>& value)  |  Sets name/value pairs used for testing and experimentation.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  |  Gets name/value pairs used for testing and experimentation.
public void SetSessionId(const std::string& sessionId)  |  Sets the engine session ID, used for correlation of logging/telemetry.
public const std::string& GetSessionId() const  |  Gets the engine session ID.
public void SetCloud(Cloud cloud)  |  Optionally sets the target cloud.
public Cloud GetCloud() const  |  Gets the target cloud used by all service requests.
public void SetCloudEndpointBaseUrl(const std::string& cloudEndpointBaseUrl)  |  Sets the cloud endpoint base URL for custom cloud.
public const std::string& GetCloudEndpointBaseUrl() const  |  Gets the cloud base URL used by all service requests, if specified.
public void SetAuthDelegate(const std::shared_ptr\<AuthDelegate\>& authDelegate)  |  Set the Engine Auth Delegate.
public std::shared_ptr\<AuthDelegate\> GetAuthDelegate() const  |  Get the Engine Auth Delegate.
public const std::string& GetUnderlyingApplicationId() const  |  Gets the Underlying Application ID.
public void SetUnderlyingApplicationId(const std::string& underlyingApplicationId)  |  Sets the Underlying Application ID.
public bool GetAllowCloudServiceOnly() const  |  Gets whether or not only cloud service is allowed.
public void SetAllowCloudServiceOnly(bool allowCloudServiceOnly)  |  Sets whether or not only cloud service is allowed.
  
## Members
  
### Settings function
ProtectionEngine::Settings constructor for creating a new engine.

Parameters:  
* **identity**: Identity that will be associated with ProtectionEngine


* **authDelegate**: The authentication delegate used by the SDK to acquire authentication tokens, will override the PolicyProfile::Settings::authDelegate if both provided 


* **clientData**: customizable client data that can be stored with the engine when unloaded and can be retrieved from a loaded engine. 


* **locale**: Engine output will be provided in this locale.


  
### Settings function
ProtectionEngine::Settings constructor for loading an existing engine.

Parameters:  
* **engineId**: Unique identifier of engine that will be loaded 


* **authDelegate**: The authentication delegate used by the SDK to acquire authentication tokens, will override the PolicyProfile::Settings::authDelegate if both provided 


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
Gets the user Identity associated with the engine.

  
**Returns**: User Identity associated with the engine
  
### SetIdentity function
Sets the user Identity associated with the engine.

Parameters:  
* **identity**: User Identity associated with the engine


  
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
  
### SetCloud function
Optionally sets the target cloud.

Parameters:  
* **Cloud**: Cloud


If cloud is not specified, then it will be determined by DNS lookup of the engine's identity domain if possible, else fall back to global cloud.
  
### GetCloud function
Gets the target cloud used by all service requests.

  
**Returns**: Cloud
  
### SetCloudEndpointBaseUrl function
Sets the cloud endpoint base URL for custom cloud.

Parameters:  
* **cloudEndpointBaseUrl**: the base URL used by all service requests (for example, "https://api.aadrm.com")


This value will only be read and must be set for Cloud = Custom
  
### GetCloudEndpointBaseUrl function
Gets the cloud base URL used by all service requests, if specified.

  
**Returns**: Base URL
  
### SetAuthDelegate function
Set the Engine Auth Delegate.

Parameters:  
* **authDelegate**: the Auth delegate


  
### GetAuthDelegate function
Get the Engine Auth Delegate.

  
**Returns**: The Engine Auth Delegate.
  
### GetUnderlyingApplicationId function
Gets the Underlying Application ID.

  
**Returns**: Underlying Application ID
  
### SetUnderlyingApplicationId function
Sets the Underlying Application ID.

Parameters:  
* **UnderlyingApplicationId**: Underlying Application ID.


  
### GetAllowCloudServiceOnly function
Gets whether or not only cloud service is allowed.

  
**Returns**: A boolean value indicating whether or not only cloud service is allowed
  
### SetAllowCloudServiceOnly function
Sets whether or not only cloud service is allowed.

Parameters:  
* **allowCloudServiceOnly**: A boolean value indicating whether or not only cloud service is allowed

