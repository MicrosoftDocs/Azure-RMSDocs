---
title: class RecommendLabelAction 
description: Documents the recommendlabelaction::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class RecommendLabelAction 
Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::shared_ptr&lt;Label&gt;& GetLabel() const  |  Get the label suggested.
public const std::vector&lt;std::string&gt;& GetClassificationIds() const  |  Get the Classification IDs that matched and caused this label to appear.
  
## Members
  
### GetLabel function
Get the label suggested.

  
**Returns**: The label.
  
### GetClassificationIds function
Get the Classification IDs that matched and caused this label to appear.

  

**Returns**: Const std::vector&lt;std::string&gt;& a list of classification IDs that caused this label to appear.
