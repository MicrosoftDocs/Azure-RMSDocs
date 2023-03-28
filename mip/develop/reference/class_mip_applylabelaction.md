---
title: class ApplyLabelAction 
description: Documents the applylabelaction::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class ApplyLabelAction 
Apply label actions requires the calling application to apply a specific label.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::shared_ptr&lt;Label&gt;& GetLabel() const  |  Get the label required.
public const std::vector&lt;std::string&gt;& GetClassificationIds() const  |  Get the Classification IDs that matched and caused this label to appear.
  
## Members
  
### GetLabel function
Get the label required.

  
**Returns**: The label.
  
### GetClassificationIds function
Get the Classification IDs that matched and caused this label to appear.

  

**Returns**: Const std::vector\<std::string\>& a list of classification IDs that caused this label to appear.r.

