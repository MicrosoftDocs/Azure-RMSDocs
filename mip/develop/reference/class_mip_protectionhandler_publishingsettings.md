---
title: class mip::ProtectionHandler::PublishingSettings 
description: Documents the mip::protectionhandler class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/27/2019
---

# class mip::ProtectionHandler::PublishingSettings 
Settings used to create a [ProtectionHandler](class_mip_protectionhandler.md) to protect new content.
  
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