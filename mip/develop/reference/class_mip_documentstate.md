---
title: class DocumentState 
description: Documents the documentstate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class DocumentState 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetContentIdentifier() const  |  Gets the content description that describes the document. example for a file: [path\filename] example for an email: [Subject:Sender].
public virtual DataState GetDataState() const  |  Gets the state of the content while the application is interacting with it.
public std::vector&lt;MetadataEntry&gt; GetContentMetadata(const std::vector&lt;std::string&gt;& names, const std::vector&lt;std::string&gt;& namePrefixes) const  |  Get the meta-data items from the content.
public std::shared_ptr&lt;ProtectionDescriptor&gt; GetProtectionDescriptor() const  |  Get the Protection Descriptor.
public std::string GetContentFormat() const  |  Gets the content format.
public virtual MetadataVersion GetContentMetadataVersion() const  |  Gets the highest metadata version supported by the application for the tenant.
public virtual std::shared_ptr&lt;ClassificationResults&gt; GetClassificationResults(const std::vector&lt;std::shared_ptr&lt;ClassificationRequest&gt;&gt; &) const  |  Return a map of classification results.
public virtual std::map&lt;std::string, std::string&gt; GetAuditMetadata() const  |  Return a map of application specific audit key-value pairs.
public virtual std::chrono::time_point&lt;std::chrono::system_clock&gt; GetLastModifiedTime() const  |  Return a time point to the last time the document was modified.
  
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

  
**Returns**: Content format
  
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
