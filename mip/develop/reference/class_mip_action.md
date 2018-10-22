---
title: class mip Action 
description: Reference for class mip Action 
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 09/27/2018
ms.author: bryanla
---
# class mip::Action 
Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).
  
## Members
  
### ActionType
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.