---
title: class ClassificationResult 
description: Documents the classificationresult::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class ClassificationResult 
Class that contains the result of a classification call on the Execution State.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetId() const  |  Get the ID of the classification policy.
public std::string GetName() const  |  Get the name of the classification policy.
public int GetCount() const  |  Get the instance count.
public int GetConfidenceLevel() const  |  Get the confidence in the result.
public std::string GetSensitiveInformationDetections() const  |  Get the sensitive information detections.
public virtual std::vector\<std::shared_ptr\<mip::DetailedClassificationResult\>\> GetDetailedClassificationAttributes() const  |  Get the specific detection bands if the enchanced classification is enabled.
  
## Members
  
### GetId function
Get the ID of the classification policy.

  
**Returns**: ID of the classification policy.
  
### GetName function
Get the name of the classification policy.

  
**Returns**: Name of the classification policy.
  
### GetCount function
Get the instance count.

  
**Returns**: The instance count.
  
### GetConfidenceLevel function
Get the confidence in the result.
  
### GetSensitiveInformationDetections function
Get the sensitive information detections.

  
**Returns**: Json string of all the sensitive information detections. if not empty must be a valid json format.
  
### GetDetailedClassificationAttributes function
Get the specific detection bands if the enchanced classification is enabled.

  
**Returns**: A vector of instance counts at different confidence thresholdsds