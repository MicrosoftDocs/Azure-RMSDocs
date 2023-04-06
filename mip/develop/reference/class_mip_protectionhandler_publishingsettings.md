---
title: class ProtectionHandler::PublishingSettings 
description: Documents the protectionhandler::publishingsettings class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class ProtectionHandler::PublishingSettings 
Settings used to create a [ProtectionHandler](class_mip_protectionhandler.md) to protect new content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public PublishingSettings(const std::shared_ptr&lt;ProtectionDescriptor&gt;& protectionDescriptor)  |  [PublishingSettings](#class_protection_handler_1_1_publishing_settings) constructor for enforcing protection on content.
public PublishingSettings(const std::shared_ptr&lt;ProtectionDescriptor&gt;& protectionDescriptor, const std::vector&lt;uint8_t&gt;& serializedPublishingLicense)  |  PublishingSettings constructor for online republishing.
public PublishingSettings(const std::shared_ptr&lt;ProtectionDescriptor&gt;& protectionDescriptor, const std::shared_ptr&lt;ProtectionHandler&gt;& protectionHandler)  |  PublishingSettings constructor for offline republishing.
public std::shared_ptr&lt;ProtectionDescriptor&gt; GetProtectionDescriptor() const  | _Not yet documented._
public std::shared_ptr&lt;ProtectionHandler&gt; GetProtectionHandlerForRepublish() const  |  Gets protection handler for republishing scenario.
public bool GetIsAuditedExtractionAllowed() const  |  Gets whether or not non-MIP-aware applications are allowed to open protected content.
public void SetIsAuditedExtractionAllowed(bool isAuditedExtractionAllowed)  |  Sets whether or not non-MIP-aware applications are allowed to open protected content.
public bool GetIsDeprecatedAlgorithmPreferred() const  |  Gets whether or not deprecated crypto algorithm (ECB) is preferred for backwards compatibility.
public void SetIsDeprecatedAlgorithmPreferred(bool isDeprecatedAlgorithmPreferred)  |  Sets whether or not deprecated crypto algorithm (ECB) is preferred for backwards compatibility.
public void SetDelegatedUserEmail(const std::string& delegatedUserEmail)  |  Sets the delegated user.
public const std::string& GetDelegatedUserEmail() const  |  Gets the delegated user.
public bool IsPublishingFormatJson() const  |  Gets whether or not the returned pl is in json format (xml format is more widely accepted and is the default).
public void SetPublishingFormatJson(bool isPublishingFormatJson)  |  Sets whether or not the returned pl is in json format (xml format is more widely accepted and is the default).
public bool GetRegenerateContentKey() const  |  Gets whether or not the content key and ID should be regenerated during republishing.
public void SetRegenerateContentKey(bool regenerateContentKey)  |  Sets whether or not the content key and ID should be regenerated during republishing.
public void SetPreLicenseUserEmail(const std::string& preLicenseUserEmail)  |  Sets pre-license user.
public const std::string& GetPreLicenseUserEmail() const  |  Gets the pre-license user.
public const std::vector&lt;uint8_t&gt;& GetPublishingLicenseForRepublish() const  |  Gets the serialized republishing license.
public void SetRequestPreLicense(std::shared_ptr&lt;PublishingUseLicenseRequest&gt; publishingUseLicenseRequest)  |  Setting this will cause the publishing request to include a pre-license.
public std::shared_ptr&lt;PublishingUseLicenseRequest&gt; GetPreLicenseRequest() const  |  Gets the pre-license request.
public bool GetRepairLabelIdAllowed() const  |  Gets whether or not label id can be added to publishing license on republish.
public void SetRepairLabelIdAllowed(bool repairAllowed)  |  Sets whether or not label id can be added to publishing license on republish.
public std::string GetApplicationScenarioId() const  |  Gets the scenario Id provided by the application which is used to correlation with the server.
public void SetApplicationScenarioId(std::string applicationScenarioId)  |  Sets the scenario Id provided by the application.
public bool GetIsOfflineOnly() const  |  Gets whether or not [ProtectionEngine](class_mip_protectionengine.md) operation allows for online HTTP operations.
public virtual void SetIsOfflineOnly(bool isOfflineOnly)  |  Sets whether or not [ProtectionEngine](class_mip_protectionengine.md) operation allows for online HTTP operations.
public void SetCustomSettings(const std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt;& customSettings)  |  Set the custom settings, used for feature gating and testing.
public const std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt;& GetCustomSettings() const  |  Get the custom settings, used for feature gating and testing.
  
## Members
  
### PublishingSettings function
PublishingSettings constructor for enforcing protection on content.

Parameters:  
* **protectionDescriptor**: Protection details


  
### PublishingSettings function
PublishingSettings constructor for online republishing.

Parameters:  
* **protectionDescriptor**: New protection details 


* **serializedPublishingLicense**: Original protection license


  
### PublishingSettings function
PublishingSettings constructor for offline republishing.

Parameters:  
* **protectionDescriptor**: New protection details 


* **protectionHandler**: Original protection handler


  
### GetProtectionDescriptor function
_Not documented yet._

  
### GetProtectionHandlerForRepublish function
Gets protection handler for republishing scenario.
  
### GetIsAuditedExtractionAllowed function
Gets whether or not non-MIP-aware applications are allowed to open protected content.

  
**Returns**: If non-MIP-aware applications are allowed to open protected content
  
### SetIsAuditedExtractionAllowed function
Sets whether or not non-MIP-aware applications are allowed to open protected content.

Parameters:  
* **isAuditedExtractionAllowed**: If non-MIP-aware applications are allowed to open protected content


  
### GetIsDeprecatedAlgorithmPreferred function
Gets whether or not deprecated crypto algorithm (ECB) is preferred for backwards compatibility.

  
**Returns**: If deprecated crypto algorithm is preferred
  
### SetIsDeprecatedAlgorithmPreferred function
Sets whether or not deprecated crypto algorithm (ECB) is preferred for backwards compatibility.

Parameters:  
* **isDeprecatedAlgorithmPreferred**: if deprectated crypto algorithm is preferred


  
### SetDelegatedUserEmail function
Sets the delegated user.

Parameters:  
* **delegatedUserEmail**: the delegation email.


A delegated user is specified when the authenticating user/application is acting on behalf of another user
  
### GetDelegatedUserEmail function
Gets the delegated user.

  
**Returns**: Delegated user
A delegated user is specified when the authenticating user/application is acting on behalf of another user
  
### IsPublishingFormatJson function
Gets whether or not the returned pl is in json format (xml format is more widely accepted and is the default).

  
**Returns**: True if is set to json format output.
  
### SetPublishingFormatJson function
Sets whether or not the returned pl is in json format (xml format is more widely accepted and is the default).

Parameters:  
* **isPublishingFormatJson**: if json format is enabled.


  
### GetRegenerateContentKey function
Gets whether or not the content key and ID should be regenerated during republishing.

  
**Returns**: True if the content key and ID should be regenerated. False otherwise.
  
### SetRegenerateContentKey function
Sets whether or not the content key and ID should be regenerated during republishing.

Parameters:  
* **regenerateContentKey**: If the content key and ID should be regenerated.


  
### SetPreLicenseUserEmail function
Sets pre-license user.

Parameters:  
* **preLicenseUserEmail**: Pre-license user


If no pre-license user is specified, a pre-license will not be obtained
  
### GetPreLicenseUserEmail function
Gets the pre-license user.

  
**Returns**: Pre-license user
  
### GetPublishingLicenseForRepublish function
Gets the serialized republishing license.

  
**Returns**: The serialized republishing license
  
### SetRequestPreLicense function
Setting this will cause the publishing request to include a pre-license.

Parameters:  
* **publishingUseLicenseRequest**: The pre-license request


If no pre-license request is specified, a pre-license will not be obtained
  
### GetPreLicenseRequest function
Gets the pre-license request.

  
**Returns**: Pre-license request
  
### GetRepairLabelIdAllowed function
Gets whether or not label id can be added to publishing license on republish.

  
**Returns**: True if label info data in protection descriptor can be added to publishing license
This will only take effect if offline protection is used for republishing.
  
### SetRepairLabelIdAllowed function
Sets whether or not label id can be added to publishing license on republish.

Parameters:  
* **repairAllowed**: if label info data in protection descriptor can be added to publishing license


This will only take effect if offline protection is used for republishing. Should only be used to add a label to adhoc protection that is missing it.
  
### GetApplicationScenarioId function
Gets the scenario Id provided by the application which is used to correlation with the server.

  
**Returns**: Application scenario Id
  
### SetApplicationScenarioId function
Sets the scenario Id provided by the application.

Parameters:  
* **The**: application scenario Id


  
### GetIsOfflineOnly function
Gets whether or not [ProtectionEngine](class_mip_protectionengine.md) operation allows for online HTTP operations.

  
**Returns**: True if HTTP operations are disallowed, else false
If this returns true, operation will only succeed if necessary content has already been cached. A mip::NetworkError will be thrown if needed info is not found. Consumption - content has already been previously decrypted and its unexpired license is cached. Protection - unexpired templates have been cached and user cert is loaded Others - undefined
  
### SetIsOfflineOnly function
Sets whether or not [ProtectionEngine](class_mip_protectionengine.md) operation allows for online HTTP operations.

Parameters:  
* **isOfflineOnly**: True if HTTP operations are disallowed, else false


If this is set to true, operation will only succeed if necessary content has already been cached. A mip::NetworkError will be thrown if needed info is not found. Consumption - content has already been previously decrypted and its unexpired license is cached. Protection - unexpired templates have been cached and user cert is loaded Others - undefined
  
### SetCustomSettings function
Set the custom settings, used for feature gating and testing.

Parameters:  
* **customSettings**: List of name/value pairs.


  
### GetCustomSettings function
Get the custom settings, used for feature gating and testing.

  
**Returns**: List of name/value pairs.