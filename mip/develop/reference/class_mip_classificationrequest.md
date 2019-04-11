---
title: class mip::ClassificationRequest 
description: Documents the mip::classificationrequest class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::ClassificationRequest 
Class that contains the request of a classification call on the Execution State.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetClassificationId() const  |  Get the ID of the classification policy.
public std::string GetRulePackageId() const  |  Get the ID of the rule package.
  
## Members
  
### GetClassificationId function
Get the ID of the classification policy.

  
**Returns**: ID of the classification policy.
  
### GetRulePackageId function
Get the ID of the rule package.

  
**Returns**: ID of the rule package. prebuilt classifications will be set to empty guid.