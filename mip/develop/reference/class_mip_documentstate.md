---
title: class mip::DocumentState 
description: Documents the mip::documentstate class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::DocumentState 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetContentIdentifier() const  |  Gets the content description that describes the document. example for a file: [path\filename] example for an email: [Subject:Sender].
public virtual DataState GetDataState() const  |  Gets the state of the content while the application is interacting with it.
public std::vector\<std::pair\<std::string, std::string\>\> GetContentMetadata(const std::vector\<std::string\>& names, const std::vector\<std::string\>& namePrefixes) const  |  Get the meta-data items from the content.
public std::shared_ptr\<ProtectionDescriptor\> GetProtectionDescriptor() const  |  Get the Protection Descriptor.
public ContentFormat GetContentFormat() const  |  Gets the content format.
public virtual std::shared_ptr\<ClassificationResults\> GetClassificationResults(const std::vector\<std::shared_ptr\<ClassificationRequest\>\> &) const  |  Return a map of classification results.
public virtual std::map\<std::string, std::string\> GetAuditMetadata() const  |  Return a map of application specific audit key-value pairs.
  
## Members
  
### GetContentIdentifier function
Gets the content description that describes the document. example for a file: [path\filename] example for an email: [Subject:Sender].

  
**Returns**: Content description to be applied to the content.
This value is used by auditing as a human-readable description of the content
  
### GetDataState function
Gets the state of the content while the application is interacting with it.

  
**Returns**: State of the content data
  
### GetContentMetadata function
Get the meta-data items from the content.

  
**Returns**: The metadata applied to the content. 
Each metadata item is a pair of name and value.
  
### GetProtectionDescriptor function
Get the Protection Descriptor.

  
**Returns**: The Protection Descriptor
  
### GetContentFormat function
Gets the content format.

  
**Returns**: DEFAULT, EMAIL 
  
**See also**: [mip::ContentFormat](mip-enums-and-structs.md#contentformat-enum)
  
### GetClassificationResults function
Return a map of classification results.

Parameters:  
* **classificationIds**: a list of classification IDs. 



  
**Returns**: A list of classification results. 
return nullptr if no classification cycle executed.
  
### GetAuditMetadata function
Return a map of application specific audit key-value pairs.

  
**Returns**: A list of application specific audit metadata
Registered Key:Value pairs Sender: Email Id for the sender Recipients: Represents a JSON array of recipients for an email LastModifiedBy: Email Id for the user who last modified the content LastModifiedDate: Date the content was last modified