---
title: class mip::ProtectByTemplateAction 
description: Documents the mip::protectbytemplateaction class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::ProtectByTemplateAction 
An action class that specifies adding protection by template to the document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetTemplateId() const  |  Get the protection template ID associated with the action.
public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).

## Members
  
### GetTemplateId function
Get the protection template ID associated with the action.

  
**Returns**: The protection template ID.


### GetType function
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.