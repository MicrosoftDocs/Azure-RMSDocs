---
title: class mip::FileExecutionState 
description: Documents the mip::fileexecutionstate class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 07/02/2019
---

# class mip::FileExecutionState 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual DataState GetDataState() const  |  Gets the state of the content while the application is interacting with it.
public virtual std::shared_ptr\<ClassificationResults\> GetClassificationResults(const std::shared_ptr\<FileHandler\> &, const std::vector\<std::shared_ptr\<ClassificationRequest\>\> &) const  |  Return a map of classification results.
public virtual std::vector\<uint8_t\> GetSerializedProtectionInfo() const  |  Return a buffer with the serialized PL.
public virtual std::map\<std::string, std::string\> GetAuditMetadata() const  |  Return a map of application specific audit key-value pairs.
  
## Members
  
### GetDataState function
Gets the state of the content while the application is interacting with it.

  
**Returns**: State of the content data
  
### GetClassificationResults function
Return a map of classification results.

Parameters:  
* **fileHandler**: - the file handler of the used file 


* **classificationIds**: a list of classification IDs. 



  
**Returns**: A list of classification results.
  
### GetSerializedProtectionInfo function
Return a buffer with the serialized PL.

  
**Returns**: A buffer with the serialized PL.
  
### GetAuditMetadata function
Return a map of application specific audit key-value pairs.

  
**Returns**: A list of application specific audit metadata
Registered Key:Value pairs Sender: Email Id for the sender Recipients: Represents a JSON array of recipients for an email LastModifiedBy: Email Id for the user who last modified the content LastModifiedDate: Date the content was last modified