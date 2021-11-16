---
title: class MetadataAction 
description: Documents the metadataaction::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class MetadataAction 
An Action that adds metadata information to the content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<std::string\>& GetMetadataToRemove() const  |  Get the list of names of metadata that should be removed from content.
public const std::vector\<MetadataEntry\>& GetMetadataToAdd() const  |  Get the metadata name/value pairs that should be added to the content.
  
## Members
  
### GetMetadataToRemove function
Get the list of names of metadata that should be removed from content.

  
**Returns**: A vector of strings to remove. 
Removing metadata should be done before adding metadata.
  
### GetMetadataToAdd function
Get the metadata name/value pairs that should be added to the content.

  
**Returns**: Const std::vector<MetadataEntry>& 
Removing metadata should be done before adding metadata.a.