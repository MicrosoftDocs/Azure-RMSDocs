---
title: class ProtectionHandler::ConsumptionSettings 
description: Documents the protectionhandler::consumptionsettings class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class ProtectionHandler::ConsumptionSettings 
Settings used to create a [ProtectionHandler](class_mip_protectionhandler.md) to consume existing content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public ConsumptionSettings(const std::vector&lt;uint8_t&gt;& serializedPublishingLicense)  |  ProtectionHandler::ConsumptionSettings constructor for creating a new handler.
public ConsumptionSettings(const std::vector&lt;uint8_t&gt;& serializedPreLicense, const std::vector&lt;uint8_t&gt;& serializedPublishingLicense)  |  [ProtectionHandler::ConsumptionSettings](class_mip_protectionhandler_consumptionsettings.md) constructor for creating a new handler.
public ConsumptionSettings(const std::shared_ptr&lt;PublishingLicenseInfo&gt;& licenseInfo)  |  [ProtectionHandler::ConsumptionSettings](class_mip_protectionhandler_consumptionsettings.md) constructor for creating a new handler.
public std::shared_ptr&lt;PublishingLicenseInfo&gt; GetPublishingLicenseInfo() const  |  Get the publishing license associated with the protected content.
public void SetDelegatedUserEmail(const std::string& delegatedUserEmail)  |  Sets the delegated user.
public const std::string& GetDelegatedUserEmail() const  |  Gets the delegated user.
public void SetContentName(const std::string& contentName)  |  Defines the content name to register with document tracking.
public const std::string& GetContentName() const  |  Gets the content name to register with document tracking.
  
## Members
  
### ConsumptionSettings function
[ProtectionHandler::ConsumptionSettings](class_mip_protectionhandler_consumptionsettings.md) constructor for creating a new handler.

Parameters:  
* **serializedPublishingLicense**: Serialized publishing license from protected content


  
### ConsumptionSettings function
[ProtectionHandler::ConsumptionSettings](class_mip_protectionhandler_consumptionsettings.md) constructor for creating a new handler.

Parameters:  
* **serializedPreLicense**: Serialized pre license from attached to the content. 


* **serializedPublishingLicense**: Serialized publishing license from protected content


  
### ConsumptionSettings function
[ProtectionHandler::ConsumptionSettings](class_mip_protectionhandler_consumptionsettings.md) constructor for creating a new handler.

Parameters:  
* **licenseInfo**: Publishing license info from protected content


Providing a [PublishingLicenseInfo](class_mip_publishinglicenseinfo.md) (as opposed to just a raw serialized publishing license) will remove the need for MIP SDK to parse the publishing license.
  
### GetPublishingLicenseInfo function
Get the publishing license associated with the protected content.

  
**Returns**: Publishing license information
  
### SetDelegatedUserEmail function
Sets the delegated user.

Parameters:  
* **delegatedUserEmail**: the delegation email.


A delegated user is specified when the authenticating user/application is acting on behalf of another user
  
### GetDelegatedUserEmail function
Gets the delegated user.

  
**Returns**: Delegated user
A delegated user is specified when the authenticating user/application is acting on behalf of another user
  
### SetContentName function
Defines the content name to register with document tracking.

Parameters:  
* **contentName**: The identifier to register content under.


: If the content has already been registered, its name will not be changed.
  
### GetContentName function
Gets the content name to register with document tracking.

  
**Returns**: The content name.