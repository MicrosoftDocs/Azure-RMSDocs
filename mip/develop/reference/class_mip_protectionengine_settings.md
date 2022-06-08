---
title: class ProtectionEngine::Settings 
description: Documents the protectionengine::settings class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class ProtectionEngine::Settings 
Settings used by ProtectionEngine during its creation and throughout its lifetime.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Settings(const Identity& identity, const std::shared_ptr&lt;AuthDelegate&gt;& authDelegate, const std::string& clientData, const std::string& locale)  |  ProtectionEngine::Settings constructor for creating a new engine.
public Settings(const std::string& engineId, const std::shared_ptr&lt;AuthDelegate&gt;& authDelegate, const std::string& clientData, const std::string& locale)  |  ProtectionEngine::Settings constructor for loading an existing engine.
public const std::string& GetEngineId() const  |  Gets the engine ID.
public void SetEngineId(const std::string& engineId)  |  Sets the engine ID.
public const Identity& GetIdentity() const  |  Gets the user Identity associated with the engine.
public void SetIdentity(const Identity& identity)  |  Sets the user Identity associated with the engine.
public const std::string& GetClientData() const  |  Gets custom data specified by client.
public void SetClientData(const std::string& clientData)  |  Sets custom data specified by client.
public const std::string& GetLocale() const  |  Gets the locale in which engine data will be written.
public void SetCustomSettings(const std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt;& value)  |  Sets name/value pairs used for testing and experimentation.
public const std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt;& GetCustomSettings() const  |  Gets name/value pairs used for testing and experimentation.
public void SetSessionId(const std::string& sessionId)  |  Sets the engine session ID, used for correlation of logging/telemetry.
public const std::string& GetSessionId() const  |  Gets the engine session ID.
public void SetCloud(Cloud cloud)  |  Optionally sets the target cloud.
public Cloud GetCloud() const  |  Gets the target cloud used by all service requests.
public void SetDataBoundary(DataBoundary dataBoundary)  |  Optionally sets the target diagnostic region.
public DataBoundary GetDataBoundary() const  |  Gets the data boundary region.
public void SetCloudEndpointBaseUrl(const std::string& cloudEndpointBaseUrl)  |  Sets the cloud endpoint base URL for custom cloud.
public const std::string& GetCloudEndpointBaseUrl() const  |  Gets the cloud base URL used by all service requests, if specified.
public void SetAuthDelegate(const std::shared_ptr&lt;AuthDelegate&gt;& authDelegate)  |  Set the Engine Auth Delegate.
public std::shared_ptr&lt;AuthDelegate&gt; GetAuthDelegate() const  |  Get the Engine Auth Delegate.
public const std::string& GetUnderlyingApplicationId() const  |  Gets the Underlying Application ID.
public void SetUnderlyingApplicationId(const std::string& underlyingApplicationId)  |  Sets the Underlying Application ID.
public bool GetAllowCloudServiceOnly() const  |  Gets whether or not only cloud service is allowed.
public void SetAllowCloudServiceOnly(bool allowCloudServiceOnly)  |  Sets whether or not only cloud service is allowed.
public std::chrono::hours GetTemplateRefreshInterval() const  |  Gets the refresh rate of the protection templates.
public int GetTemplateBatchSize() const  |  Gets the number of templates to be requested in each batch during GetTemplates.
public void SetTemplateRefreshArgs(std::chrono::hours templateRefreshRateHours, int templateBatchSize)  |  Sets a custom refresh rate for templates.
public const std::shared_ptr&lt;void&gt;& GetLoggerContext() const  |  Get logger context that will be opaquely passed to the logger delegate for logs associated with the created engine.
public void SetLoggerContext(const std::shared_ptr&lt;void&gt;& loggerContext)  |  Sets the logger context that will be opaquely passed to the logger delegate for logs associated with the created engine.
  
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
  
### SetDataBoundary function
Optionally sets the target diagnostic region.

Parameters:  
* **dataBoundary**: Data boundary region


If dataBoundary is not specified, then it will default to global diagnostic region.
  
### GetDataBoundary function
Gets the data boundary region.

  
**Returns**: DataBoundary
  
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


  
### GetTemplateRefreshInterval function
Gets the refresh rate of the protection templates.

  
**Returns**: The refresh rate of protection templates as chrono::hours
A refresh rate of 0 hours means that templates will always be fetched from the service and never cached
  
### GetTemplateBatchSize function
Gets the number of templates to be requested in each batch during GetTemplates.

  
**Returns**: The number of full template data requests per batch if offline publishing is enabled
  
### SetTemplateRefreshArgs function
Sets a custom refresh rate for templates.
Engines will not refresh automatically on that interval, only on engine call to GetTemplates or GetTemplatesAsync

Parameters:  
* **templateRefreshRateHours**: How often to allow use of cached templates for protection. will always refresh by default. If hours are less than 0 will throw exception. 


* **templateBatchSize**: If offline protection is enabled, how many template data responses are carried in a single request during fetching. Between 1 and 25.


Will only refresh templates if outside of interval during an API that uses them. Will not automatically refresh in background.
  
### GetLoggerContext function
Get logger context that will be opaquely passed to the logger delegate for logs associated with the created engine.

  
**Returns**: The logger context
  
### SetLoggerContext function
Sets the logger context that will be opaquely passed to the logger delegate for logs associated with the created engine.

Parameters:  
* **loggerContext**: The logger context
