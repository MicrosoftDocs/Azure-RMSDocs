---
title: class mip::RecommendLabelAction 
description: Documents the mip::recommendlabelaction class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::RecommendLabelAction 
Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::shared_ptr\<Label\>& GetLabel() const  |  Get the label suggested.
public const std::vector\<std::string\>& GetClassificationIds() const  |  Get the Classification IDs that matched and caused this label to appear.
  
## Members
  
### GetLabel function
Get the label suggested.

  
**Returns**: The label.
  
### GetClassificationIds function
Get the Classification IDs that matched and caused this label to appear.

  
**Returns**: Const std::vector<std::string>& a list of classification IDs that caused this label to appear.