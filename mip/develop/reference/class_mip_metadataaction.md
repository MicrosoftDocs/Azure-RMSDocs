---
title: class MetadataAction 
description: Documents the metadataaction::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class MetadataAction 
An [Action](class_mip_action.md) that adds metadata information to the content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector&lt;std::string&gt;& GetMetadataToRemove() const  |  Get the list of names of metadata that should be removed from content.
public const std::vector&lt;MetadataEntry&gt;& GetMetadataToAdd() const  |  Get the metadata name/value pairs that should be added to the content.
  
## Members
  
### GetMetadataToRemove function
Get the list of names of metadata that should be removed from content.

  
**Returns**: A vector of strings to remove. 
Removing metadata should be done before adding metadata.
  
### GetMetadataToAdd function
Get the metadata name/value pairs that should be added to the content.

  
**Returns**: Const std::vector&lt;MetadataEntry&gt;& 
Removing metadata should be done before adding metadata.a.