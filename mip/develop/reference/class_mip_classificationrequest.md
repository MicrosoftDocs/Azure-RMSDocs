---
title: class mip::ClassificationRequest 
description: Documents the mip::classificationrequest class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
manager: mbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/17/2019
---

# class mip::ClassificationRequest 
Class that contains the request of a classification call on the Execution State.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public std::string GetClassificationId() const  |  Get the ID of the classification policy.
 public std::string GetRulePackageId() const  |  Get the ID of the rule package.
  
## Members
  
### GetClassificationId
Get the ID of the classification policy.

  
**Returns**: ID of the classification policy.
  
### GetRulePackageId
Get the ID of the rule package.

  
**Returns**: ID of the rule package. prebuilt classifications will be set to empty guid.