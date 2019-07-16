---
title: class mip::ApplicationActionState 
description: Documents the mip::applicationactionstate class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::ApplicationActionState 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public LabelState GetNewLabelState() const  |  Gets the new label state.
public std::shared_ptr\<Label\> GetNewLabel() const  |  Gets the sensitivity label ID that should be applied on the document.
public std::pair\<bool, std::string\> IsDowngradeJustified() const  |  Implementation should pass if justification to downgrade an existing label was given.
public AssignmentMethod GetNewLabelAssignmentMethod() const  |  Get the new label's assignment method.
public virtual std::vector\<std::pair\<std::string, std::string\>\> GetNewLabelExtendedProperties() const  |  Return new label's extended properties.
public ActionType GetSupportedActions() const  |  Gets a masked enum describing all the supported action types.
public bool IsRecommendationEnabled() const  |  Get a bool that signifying recommend action will return. by default should be true unless user specifies else.
  
## Members
  
### GetNewLabelState function
Gets the new label state.

  
**Returns**: The new label state. 
  
**See also**: [mip::LabelState](undefined)
  
### GetNewLabel function
Gets the sensitivity label ID that should be applied on the document.

  
**Returns**: Sensitivity label ID to be applied to the content if exists else empty to remove label.
  
### IsDowngradeJustified function
Implementation should pass if justification to downgrade an existing label was given.

  
**Returns**: True if downgrade is justifiedalong with the justification messageelse false 
  
**See also**: [mip::JustifyAction](class_mip_justifyaction.md)
  
### GetNewLabelAssignmentMethod function
Get the new label's assignment method.

  
**Returns**: The assignment method STANDARD, PRIVILEGED, AUTO. 
  
**See also**: [mip::AssignmentMethod](mip-enums-and-structs.md#assignmentmethod-enum)
  
### GetNewLabelExtendedProperties function
Return new label's extended properties.

  
**Returns**: The extended properties applied to the content.
  
### GetSupportedActions function
Gets a masked enum describing all the supported action types.

  
**Returns**: A masked enum describing all the supported action types.
ActionType::Justify must be supported. When a policy and label change requires justification, a justification action will always be returned.
  
### IsRecommendationEnabled function
Get a bool that signifying recommend action will return. by default should be true unless user specifies else.

  
**Returns**: A bool that signifying recommend action will return.
ActionType::RecommendLabel must be enable for this field to have an affect.