---
title: class mip ContentLabel 
description: Reference for class mip ContentLabel 
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 09/27/2018
ms.author: bryanla
---
# class mip::ContentLabel 
Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
It also holds properties for a specific applied label instance.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const std::string& GetCreationTime() const  |  Get the creation time of the label.
 public AssignmentMethod GetAssignmentMethod() const  |  Get the assignment method of the label.
public const std::vector<std::pair<std::string, std::string>>& GetExtendedProperties() const  |  Gets extended properties.
 public bool IsProtectionAppliedFromLabel() const  |  Gets if protection was applied by the label or not.
public std::shared_ptr<Label> GetLabel() const  |  Get the actual label object applied on the content.
  
## Members
  
### GetCreationTime
Get the creation time of the label.

  
**Returns**: Creation time as a GMT string.
  
### GetAssignmentMethod
Get the assignment method of the label.

  
**Returns**: AssignmentMethod STANDARD | PRIVILEGED | AUTO. 
  
**See also**: mip::AssignmentMethod
  
### GetExtendedProperties
Gets extended properties.

  
**Returns**: Extended properties.
  
### IsProtectionAppliedFromLabel
Gets if protection was applied by the label or not.

  
**Returns**: True if there is template protection and it was by this label, else false.
  
### Label
Get the actual label object applied on the content.

  
**Returns**: The label object applied on the content. 
  
**See also**: [mip::Label](class_mip_label.md)