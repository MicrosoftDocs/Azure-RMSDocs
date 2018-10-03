---
title: class mip ProtectByTemplateAction 
description: Reference for class mip ProtectByTemplateAction 
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 09/27/2018
ms.author: bryanla
---
# class mip::ProtectByTemplateAction 
An action class that specifies adding protection by template to the document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const std::string& GetTemplateId() const  |  Get the protection template ID associated with the action.
 public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).
  
## Members
  
### GetTemplateId
Get the protection template ID associated with the action.

  
**Returns**: The protection template ID.
  
### ActionType
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.