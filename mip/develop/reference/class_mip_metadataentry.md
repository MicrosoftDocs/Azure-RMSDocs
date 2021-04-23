---
title: class MetadataEntry 
description: Documents the metadataentry::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/23/2021
---

# class MetadataEntry 
An abstraction class for metadata entry.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public MetadataEntry(const std::string& key, const std::string& value, uint32_t version)  |  C'tor for a MetadataEntry abstraction.
public MetadataEntry(const std::string& key, const std::string& value, const MetadataVersion& version)  |  C'tor for a MetadataEntry abstraction.
public MetadataEntry(const std::string& key, const std::string& value)  |  C'tor for a MetadataEntry abstraction, version is set to a default of 0.
public const std::string& GetKey() const  |  Get the metadata entry key.
public const std::string& GetValue() const  |  Get the metadata entry value.
public MetadataVersion GetVersion() const  |  Get the metadata entry version.
  
## Members
  
### MetadataEntry function
C'tor for a MetadataEntry abstraction.

Parameters:  
* **key**: metadata key entry. 


* **value**: metadata value entry 


* **version**: metadata version value


  
### MetadataEntry function
C'tor for a MetadataEntry abstraction.

Parameters:  
* **key**: metadata key entry. 


* **value**: metadata value entry 


* **version**: metadata version value


  
### MetadataEntry function
C'tor for a MetadataEntry abstraction, version is set to a default of 0.

Parameters:  
* **key**: metadata key entry. 


* **value**: metadata value entry


  
### GetKey function
Get the metadata entry key.

  
**Returns**: Metadata entry key.
  
### GetValue function
Get the metadata entry value.

  
**Returns**: Metadata entry value.
  
### GetVersion function
Get the metadata entry version.

  
**Returns**: Metadata entry version.