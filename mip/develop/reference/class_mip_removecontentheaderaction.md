---
title: class mip::RemoveContentHeaderAction 
description: Documents the mip::removecontentheaderaction class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
manager: mbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/17/2019
---

# class mip::RemoveContentHeaderAction 
An action class that specifies removing the content header from the document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector<std::string>& GetUIElementNames()  |  Gets a list of names that should be used to find the UI elements that should be removed.
 public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).
  
## Members
  
### GetUIElementNames
Gets a list of names that should be used to find the UI elements that should be removed.

  
**Returns**: A list of ui element names.
  
### ActionType
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.