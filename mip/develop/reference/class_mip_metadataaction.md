---
title: class mip::MetadataAction 
description: Documents the mip::metadataaction class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 02/14/2020
---

# class mip::MetadataAction 
An Action that adds metadata information to the content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<std::string\>& GetMetadataToRemove() const  |  Get the list of names of metadata that should be removed from content.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetMetadataToAdd() const  |  Get the metadata name/value pairs that should be added to the content.
  
## Members
  
### GetMetadataToRemove function
Get the list of names of metadata that should be removed from content.

  
**Returns**: A vector of strings to remove. 
Removing metadata should be done before adding metadata.
  
### GetMetadataToAdd function
Get the metadata name/value pairs that should be added to the content.

  
**Returns**: Const std::vector<std::pair<std::string, std::string>>& 
Removing metadata should be done before adding metadata.