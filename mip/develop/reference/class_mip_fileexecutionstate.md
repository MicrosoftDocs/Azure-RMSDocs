---
title: class mip::FileExecutionState 
description: Documents the mip::fileexecutionstate class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/25/2019
---

# class mip::FileExecutionState 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual std::map\<std::string, std::shared_ptr\<ClassificationResult\>\> GetClassificationResults(const std::shared_ptr\<FileHandler\> &, const std::vector\<std::shared_ptr\<ClassificationRequest\>\> &) const  |  Return a map of classification results.
public virtual std::vector\<uint8_t\> GetSerializedProtectionInfo() const  |  Return a buffer with the serialized PL.
  
## Members
  
### GetClassificationResults function
Return a map of classification results.

Parameters:  
* **fileHandler**: - the file handler of the used file 


* **classificationIds**: a list of classification IDs. 



  
**Returns**: A list of classification result.
  
### GetSerializedProtectionInfo function
Return a buffer with the serialized PL.

  
**Returns**: A buffer with the serialized PL.