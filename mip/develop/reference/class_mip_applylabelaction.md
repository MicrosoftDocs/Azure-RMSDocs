---
title: class mip::ApplyLabelAction 
description: Documents the mip::applylabelaction class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
manager: mbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/17/2019
---

# class mip::ApplyLabelAction 
Apply label actions requires the calling application to apply a specific label.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const std::string& GetLabelId() const  |  Get the label ID required.
public const std::vector<std::string>& GetClassificationIds() const  |  Get the Classification IDs that matched and caused this label to appear.
 public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).
  
## Members
  
### GetLabelId
Get the label ID required.

  
**Returns**: The label ID.
  
### GetClassificationIds
Get the Classification IDs that matched and caused this label to appear.

  
**Returns**: Const std::vector<std::string>& a list of classification IDs that caused this label to appear.
  
### ActionType
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.