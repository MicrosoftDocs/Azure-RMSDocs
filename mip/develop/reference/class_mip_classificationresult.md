---
title: class mip::ClassificationResult 
description: Documents the mip::classificationresult class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/28/2019
---

# class mip::ClassificationResult 
Class that contains the result of a classification call on the Execution State.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetId() const  |  Get the ID of the classification policy.
public int GetCount() const  |  Get the instance count.
public int GetConfidenceLevel() const  |  Get the confidence in the result.
  
## Members
  
### GetId function
Get the ID of the classification policy.

  
**Returns**: ID of the classification policy.
  
### GetCount function
Get the instance count.

  
**Returns**: The instance count.
  
### GetConfidenceLevel function
Get the confidence in the result.