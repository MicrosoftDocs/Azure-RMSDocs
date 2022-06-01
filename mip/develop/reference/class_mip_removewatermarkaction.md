---
title: class RemoveWatermarkAction 
description: Documents the removewatermarkaction::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class RemoveWatermarkAction 
An action class that specifies removing the watermarking from the document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector&lt;std::string&gt;& GetUIElementNames()  |  Gets a list of names that should be used to find the UI elements that should be removed.
public ActionType GetType() const  |  Get the type of Action.
  
## Members
  
### GetUIElementNames function
Gets a list of names that should be used to find the UI elements that should be removed.

  
**Returns**: A list of ui element names.
  
### GetType function
Get the type of Action.

  
**Returns**: ActionType The type of derived action this base class can be cast to.o.