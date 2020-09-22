---
title: class DocumentState 
description: Documents the documentstate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 04/16/2020
---

# class DocumentState 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetContentIdentifier() const  |  Gets the content description that describes the document. example for a file: [path\filename] example for an email: [Subject:Sender].
public virtual DataState GetDataState() const  |  Gets the state of the content while the application is interacting with it.
public std::vector\<MetadataEntry\> GetContentMetadata(const std::vector\<std::string\>& names, const std::vector\<std::string\>& namePrefixes) const  |  Get the meta-data items from the content.
public std::shared_ptr\<ProtectionDescriptor\> GetProtectionDescriptor() const  |  Get the Protection Descriptor.
public ContentFormat GetContentFormat() const  |  Gets the content format.
public virtual unsigned int GetContentMetadataVersion() const  |  Gets the highest metadata version supported by the application for the tenant.
public virtual std::shared_ptr\<ClassificationResults\> GetClassificationResults(const std::vector\<std::shared_ptr\<ClassificationRequest\>\> &) const  |  Return a map of classification results.
public virtual std::map\<std::string, std::string\> GetAuditMetadata() const  |  Return a map of application specific audit key-value pairs.
public virtual std::chrono::time_point\<std::chrono::system_clock\> GetLastModifiedTime() const  |  Return a time point to the last time the document was modified.
  
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
  
**See also**: mip::MetadataEntry.
  
### GetProtectionDescriptor function
Get the Protection Descriptor.

  
**Returns**: The Protection Descriptor
  
### GetContentFormat function
Gets the content format.

  
**Returns**: DEFAULT, EMAIL 
  
**See also**: mip::ContentFormat
  
### GetContentMetadataVersion function
Gets the highest metadata version supported by the application for the tenant.

  
**Returns**: Content metadata version. If 0, metadata is un-versioned. 
If a file format supports multiple versions of metadata, this allows MIP to understand all metadata and report granular metadata changes on a per-version basis.
  
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
  
### GetLastModifiedTime function
Return a time point to the last time the document was modified.

  
**Returns**: The last modified time of the documents time point.