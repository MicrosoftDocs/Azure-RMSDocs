---
title: class FileExecutionState 
description: Documents the fileexecutionstate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/23/2021
---

# class FileExecutionState 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual DataState GetDataState() const  |  Gets the state of the content while the application is interacting with it.
public virtual std::shared_ptr\<ClassificationResults\> GetClassificationResults(const std::shared_ptr\<FileHandler\> &, const std::vector\<std::shared_ptr\<ClassificationRequest\>\> &) const  |  Return a map of classification results.
public virtual std::map\<std::string, std::string\> GetAuditMetadata() const  |  Return a map of application specific audit key-value pairs.
public virtual const std::string GetApplicationScenarioId() const  |  Return an identifier which correlates application events with the corresponding protection service REST requests.
  
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
  
### GetAuditMetadata function
Return a map of application specific audit key-value pairs.

  
**Returns**: A list of application specific audit metadata
Registered Key:Value pairs Sender: Email Id for the sender Recipients: Represents a JSON array of recipients for an email LastModifiedBy: Email Id for the user who last modified the content LastModifiedDate: Date the content was last modified
  
### GetApplicationScenarioId function
Return an identifier which correlates application events with the corresponding protection service REST requests.

  
**Returns**: An identifier (usually specified as a GUID)