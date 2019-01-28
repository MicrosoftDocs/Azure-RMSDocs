---
title: class mip::Action 
description: Documents the mip::action class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/28/2019
---

# class mip::Action 
Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).
  
## Members
  
### GetType function
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.