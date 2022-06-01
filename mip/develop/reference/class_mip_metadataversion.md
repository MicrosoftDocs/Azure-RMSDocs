---
title: class MetadataVersion 
description: Documents the metadataversion::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 05/31/2022
---

# class MetadataVersion 
Interface for a MetadataVersion. MetadataVersion determines which metadata is active and how it is processed.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public MetadataVersion(uint32_t version, MetadataVersionFormat flags)  |  MetadataVersion constructor.
public virtual uint32_t GetValue() const  |  Get the numerical version.
public virtual bool HasFlag(MetadataVersionFormat flag) const  |  Get whether a specific flag is set.
public virtual MetadataVersionFormat GetFlags() const  |  Get the flags that define how metadata is processed for a given version.
  
## Members
  
### MetadataVersion function
MetadataVersion constructor.

Parameters:  
* **version**: numerical version to use for metadata actions 


* **flags**: flags to specify how the version is used to calculate metadata actions


  
### GetValue function
Get the numerical version.

  
**Returns**: The numerical version.
  
### HasFlag function
Get whether a specific flag is set.

  
**Returns**: True if the flag is set.
  
### GetFlags function
Get the flags that define how metadata is processed for a given version.

  
**Returns**: The flags that specify how the metadata is processed.