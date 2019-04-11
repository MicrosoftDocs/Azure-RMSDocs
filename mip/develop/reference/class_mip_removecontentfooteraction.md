---
title: class mip::RemoveContentFooterAction 
description: Documents the mip::removecontentfooteraction class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::RemoveContentFooterAction 
An action class that specifies removing the content footer from the document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<std::string\>& GetUIElementNames()  |  Gets a list of names that should be used to find the UI elements that should be removed.
public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).

## Members
  
### GetUIElementNames function
Gets a list of names that should be used to find the UI elements that should be removed.

  
**Returns**: A list of ui element names.

### GetType function	
Get the type of [Action](class_mip_action.md).	

**Returns**: ActionType The type of derived action this base class can be cast to.