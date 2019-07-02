---
title: class mip::MetadataAction 
description: Documents the mip::metadataaction class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 07/02/2019
---

# class mip::MetadataAction 
An [Action](class_mip_action.md) that adds metadata information to the content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<std::string\>& GetMetadataToRemove() const  |  Get the list of names of metadata that should be removed from content.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetMetadataToAdd() const  |  Get the metadata name/value pairs that should be added to the content.
public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).
  
## Members
  
### GetMetadataToRemove function
Get the list of names of metadata that should be removed from content.

  
**Returns**: A vector of strings to remove. 
Removing metadata should be done before adding metadata.
  
### GetMetadataToAdd function
Get the metadata name/value pairs that should be added to the content.

  
**Returns**: Const std::vector<std::pair<std::string, std::string>>& 
Removing metadata should be done before adding metadata.
  
### GetType function
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.