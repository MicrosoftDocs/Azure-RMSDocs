---
title: class mip::ApplyLabelAction 
description: Documents the mip::applylabelaction class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::ApplyLabelAction 
Apply label actions requires the calling application to apply a specific label.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::shared_ptr\<Label\>& GetLabel() const  |  Get the label required.
public const std::vector\<std::string\>& GetClassificationIds() const  |  Get the Classification IDs that matched and caused this label to appear.
  
## Members
  
### GetLabel function
Get the label required.

  
**Returns**: The label.
  
### GetClassificationIds function
Get the Classification IDs that matched and caused this label to appear.

  
**Returns**: Const std::vector<std::string>& a list of classification IDs that caused this label to appear.