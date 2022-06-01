---
title: class ProtectionHandler::ConsumptionSettings 
description: Documents the protectionhandler::consumptionsettings class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class ProtectionHandler::ConsumptionSettings 
Settings used to create a ProtectionHandler to consume existing content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public ConsumptionSettings(const std::vector&lt;uint8_t&gt;& serializedPublishingLicense)  |  ProtectionHandler::ConsumptionSettings constructor for creating a new handler.
public ConsumptionSettings(const std::vector&lt;uint8_t&gt;& serializedPreLicense, const std::vector&lt;uint8_t&gt;& serializedPublishingLicense)  |  ProtectionHandler::ConsumptionSettings constructor for creating a new handler.
public ConsumptionSettings(const std::shared_ptr&lt;PublishingLicenseInfo&gt;& licenseInfo)  |  ProtectionHandler::ConsumptionSettings constructor for creating a new handler.
public std::shared_ptr&lt;PublishingLicenseInfo&gt; GetPublishingLicenseInfo() const  |  Get the publishing license associated with the protected content.
public bool GetIsOfflineOnly() const  |  Gets whether or not ProtectionHandler creation allows for online HTTP operations.
public void SetIsOfflineOnly(bool isOfflineOnly)  |  Sets whether or not ProtectionHandler creation allows for online HTTP operations.
public void SetDelegatedUserEmail(const std::string& delegatedUserEmail)  |  Sets the delegated user.
public void SetContentName(const std::string& contentName)  | _Not yet documented._
public const std::string& GetDelegatedUserEmail() const  |  Gets the delegated user.
public const std::string& GetContentName() const  | _Not yet documented._
  
## Members
  
### ConsumptionSettings function
ProtectionHandler::ConsumptionSettings constructor for creating a new handler.

Parameters:  
* **serializedPublishingLicense**: Serialized publishing license from protected content


  
### ConsumptionSettings function
ProtectionHandler::ConsumptionSettings constructor for creating a new handler.

Parameters:  
* **serializedPreLicense**: Serialized pre license from attached to the content. 


* **serializedPublishingLicense**: Serialized publishing license from protected content


  
### ConsumptionSettings function
ProtectionHandler::ConsumptionSettings constructor for creating a new handler.

Parameters:  
* **licenseInfo**: Publishing license info from protected content


Providing a PublishingLicenseInfo (as opposed to just a raw serialized publishing license) will remove the need for MIP SDK to parse the publishing license.
  
### GetPublishingLicenseInfo function
Get the publishing license associated with the protected content.

  
**Returns**: Publishing license information
  
### GetIsOfflineOnly function
Gets whether or not ProtectionHandler creation allows for online HTTP operations.

  
**Returns**: True if HTTP operations are disallowed, else false
If this is set to true, ProtectionHandler creation will only succeed if content has already been previously decrypted and its unexpired license is cached. A mip::NetworkError will be thrown if cached content is not found.
  
### SetIsOfflineOnly function
Sets whether or not ProtectionHandler creation allows for online HTTP operations.

Parameters:  
* **isOfflineOnly**: True if HTTP operations are disallowed, else false


If this is set to true, ProtectionHandler creation will only succeed if content has already been previously decrypted and its unexpired license is cached. A mip::NetworkError will be thrown if cached content is not found.
  
### SetDelegatedUserEmail function
Sets the delegated user.

Parameters:  
* **delegatedUserEmail**: the delegation email.


A delegated user is specified when the authenticating user/application is acting on behalf of another user
  
### SetContentName function
_Not documented yet._

  
### GetDelegatedUserEmail function
Gets the delegated user.

  
**Returns**: Delegated user
A delegated user is specified when the authenticating user/application is acting on behalf of another user
  
### GetContentName function
_Not documented yet._
_
