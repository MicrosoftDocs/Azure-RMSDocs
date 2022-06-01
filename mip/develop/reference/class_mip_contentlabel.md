---
title: class ContentLabel 
description: Documents the contentlabel::undefined class of the Microsoft Information Protection SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class ContentLabel 
Abstraction for a Microsoft Purview Information Protection label that is applied to a piece of content, typically a document.
It also holds properties for a specific applied label instance.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::chrono::time_point\<std::chrono::system_clock\> GetCreationTime() const  |  Get the creation time of the label.
public AssignmentMethod GetAssignmentMethod() const  |  Get the assignment method of the label.
public const std::vector\<MetadataEntry\>& GetExtendedProperties() const  |  Gets extended properties.
public bool IsProtectionAppliedFromLabel() const  |  Gets if protection was applied by the label or not.
public std::shared_ptr\<Label\> GetLabel() const  |  Get the actual label object applied on the content.
  
## Members
  
### GetCreationTime function
Get the creation time of the label.

  
**Returns**: Creation time.
  
### GetAssignmentMethod function
Get the assignment method of the label.

  
**Returns**: AssignmentMethod STANDARD | PRIVILEGED | AUTO. 
  
**See also**: mip::AssignmentMethod
  
### GetExtendedProperties function
Gets extended properties.

  
**Returns**: Extended properties.
  
### IsProtectionAppliedFromLabel function
Gets if protection was applied by the label or not.

  
**Returns**: True if there is template protection and it was by this label, else false.
  
### GetLabel function
Get the actual label object applied on the content.

  
**Returns**: The label object applied on the content. 
  
**See also**: mip::Labelel