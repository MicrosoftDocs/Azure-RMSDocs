---
title: class DirectoryObjectRights 
description: Documents the directoryobjectrights::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class DirectoryObjectRights

The directory object and rights associated with it.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public DirectoryObjectRights(const DirectoryObject& directoryObject, const std::vector\&lt;std::string\&gt;& rights)  |  [DirectoryObjectRights](#class_directory_object_rights) constructor.
public const DirectoryObject& GetDirectoryObject() const  |  Gets directory object.
public const std::vector\&lt;std::string\&gt;& GetRights() const  |  Gets rights associated with the directory object.
  
## Members
  
### DirectoryObjectRights function
[DirectoryObjectRights](undefined) constructor.

Parameters:  
* **directoryObject**: The directory object 


* **rights**: Rights associated with the directory object


  
### GetDirectoryObject function
Gets directory object.

  
**Returns**: The directory object
  
### GetRights function
Gets rights associated with the directory object.

  
**Returns**: Rights associated with the directory object