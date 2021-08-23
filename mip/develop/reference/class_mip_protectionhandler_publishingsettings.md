---
title: class ProtectionHandler::PublishingSettings 
description: Documents the protectionhandler::publishingsettings class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 08/23/2021
---

# class ProtectionHandler::PublishingSettings 
Settings used to create a [ProtectionHandler](undefined) to protect new content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public PublishingSettings(const std::shared_ptr\<ProtectionDescriptor\>& protectionDescriptor)  |  ProtectionHandler::Settings constructor for creating a new engine.
public std::shared_ptr\<ProtectionDescriptor\> GetProtectionDescriptor() const  | _Not yet documented._
public bool GetIsAuditedExtractionAllowed() const  |  Gets whether or not non-MIP-aware applications are allowed to open protected content.
public void SetIsAuditedExtractionAllowed(bool isAuditedExtractionAllowed)  |  Sets whether or not non-MIP-aware applications are allowed to open protected content.
public bool GetIsDeprecatedAlgorithmPreferred() const  |  Gets whether or not deprecated crypto algorithm (ECB) is preferred for backwards compatibility.
public void SetIsDeprecatedAlgorithmPreferred(bool isDeprecatedAlgorithmPreferred)  |  Sets whether or not deprecated crypto algorithm (ECB) is preferred for backwards compatibility.
public void SetDelegatedUserEmail(const std::string& delegatedUserEmail)  |  Sets the delegated user.
public const std::string& GetDelegatedUserEmail() const  |  Gets the delegated user.
public bool IsPublishingFormatJson() const  |  Gets whether or not the returned pl is in json format (xml format is more widely accepted and is the default).
public void SetPublishingFormatJson(bool isPublishingFormatJson)  |  whether or not the returned pl is in json format (xml format is more widely accepted and is the default).
public void SetPreLicenseUserEmail(const std::string& preLicenseUserEmail)  |  Sets pre-license user.
public const std::string& GetPreLicenseUserEmail() const  |  Gets the pre-license user.
public void SetPublishingLicenseForRepublish(const std::vector\<uint8_t\>& serializedPublishingLicense)  |  Sets the serialized publishing license for republishing.
public const std::vector\<uint8_t\>& GetPublishingLicenseForRepublish() const  |  Gets the serialized republishing license.
public std::string GetApplicationScenarioId() const  |  Gets the scenario Id provided by the application which is used to correlation with the server.
public void SetApplicationScenarioId(std::string applicationScenarioId)  |  Sets the scenario Id provided by the application.
  
## Members
  
### PublishingSettings function
ProtectionHandler::Settings constructor for creating a new engine.

Parameters:  
* **protectionDescriptor**: Protection details


  
### GetProtectionDescriptor function
_Not documented yet._

  
### GetIsAuditedExtractionAllowed function
Gets whether or not non-MIP-aware applications are allowed to open protected content.

  
**Returns**: If non-MIP-aware applications are allowed to open protected content
  
### SetIsAuditedExtractionAllowed function
Sets whether or not non-MIP-aware applications are allowed to open protected content.

Parameters:  
* **isAuditedExtractionAllowed**: If non-MIP-aware applications are allowed to open protected content


  
### GetIsDeprecatedAlgorithmPreferred function
Gets whether or not deprecated crypto algorithm (ECB) is preferred for backwards compatibility.

  
**Returns**: If deprectated crypto algorithm is preferred
  
### SetIsDeprecatedAlgorithmPreferred function
Sets whether or not deprecated crypto algorithm (ECB) is preferred for backwards compatibility.

Parameters:  
* **If**: deprectated crypto algorithm is preferred


  
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
whether or not the returned pl is in json format (xml format is more widely accepted and is the default).

Parameters:  
* **isPublishingFormatJson**: if json format is enabled.


  
### SetPreLicenseUserEmail function
Sets pre-license user.

Parameters:  
* **preLicenseUserEmail**: Pre-license user


If no pre-license user is specified, a pre-license will not be obtained
  
### GetPreLicenseUserEmail function
Gets the pre-license user.

  
**Returns**: Pre-license user
  
### SetPublishingLicenseForRepublish function
Sets the serialized publishing license for republishing.

Parameters:  
* **serializedPublishingLicense**: The serialized publishing license


This is used for republishing
  
### GetPublishingLicenseForRepublish function
Gets the serialized republishing license.

  
**Returns**: The serialized republishing license
  
### GetApplicationScenarioId function
Gets the scenario Id provided by the application which is used to correlation with the server.

  
**Returns**: Application scenario Id
  
### SetApplicationScenarioId function
Sets the scenario Id provided by the application.

Parameters:  
* **The**: application scenario Id

