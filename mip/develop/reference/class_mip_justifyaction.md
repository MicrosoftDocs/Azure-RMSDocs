---
title: class mip::JustifyAction 
description: Documents the mip::justifyaction class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::JustifyAction 
Justify [Action](class_mip_action.md) requires providing a justification to a label downgrade and setting the response in the execution state.
  
**See also**: [mip::ExecutionState::IsDowngradeJustified](class_mip_executionstate.md#isdowngradejustified-function)
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).


### GetType function
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.
