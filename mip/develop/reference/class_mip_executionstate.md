---
title: class ExecutionState 
description: Documents the executionstate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 05/31/2022
---

# class ExecutionState 
Interface for all the state needed to execute the engine.
Clients should only call the methods to obtain the state that is needed. Hence, for efficiency, clients may want to implement this interface such that the corresponding state is computed dynamically instead of computing in advance.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr&lt;Label&gt; GetNewLabel() const  |  Gets the sensitivity label ID that should be applied on the document.
public std::string GetContentIdentifier() const  |  Gets the content description that describes the document. example for a file: [path\filename] example for an email: [Subject:Sender].
public virtual DataState GetDataState() const  |  Gets the state of the content while the application is interacting with it.
public std::pair&lt;bool, std::string&gt; IsDowngradeJustified() const  |  Implementation should pass if justification to downgrade an existing label was given.
public AssignmentMethod GetNewLabelAssignmentMethod() const  |  Get the new label's assignment method.
public virtual std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt; GetNewLabelExtendedProperties() const  |  Return new label's extended properties.
public std::vector&lt;MetadataEntry&gt; GetContentMetadata(const std::vector&lt;std::string&gt;& names, const std::vector&lt;std::string&gt;& namePrefixes) const  |  Get the meta-data items from the content.
public std::shared_ptr&lt;ProtectionDescriptor&gt; GetProtectionDescriptor() const  |  Get the Protection Descriptor.
public std::string GetContentFormat() const  |  Gets the content format.
public virtual MetadataVersion GetContentMetadataVersion() const  |  Gets the highest metadata version supported by the application for the tenant.
public ActionType GetSupportedActions() const  |  Gets a masked enum describing all the supported action types.
public virtual std::shared_ptr&lt;ClassificationResults&gt; GetClassificationResults(const std::vector&lt;std::shared_ptr&lt;ClassificationRequest&gt;&gt; &) const  |  Return a map of classification results.
public virtual std::map&lt;std::string, std::string&gt; GetAuditMetadata() const  |  Return a map of application specific audit key-value pairs.
  
## Members
  
### GetNewLabel function
Gets the sensitivity label ID that should be applied on the document.

  
**Returns**: Sensitivity label ID to be applied to the content if exists else empty to remove label.
  
### GetContentIdentifier function
Gets the content description that describes the document. example for a file: [path\filename] example for an email: [Subject:Sender].

  
**Returns**: Content description to be applied to the content.
This value is used by auditing as a human-readable description of the content
  
### GetDataState function
Gets the state of the content while the application is interacting with it.

  
**Returns**: State of the content data
  
### IsDowngradeJustified function
Implementation should pass if justification to downgrade an existing label was given.

  
**Returns**: True if downgrade is justifiedalong with the justification messageelse false 
  
**See also**: mip::JustifyAction
  
### GetNewLabelAssignmentMethod function
Get the new label's assignment method.

  
**Returns**: The assignment method STANDARD, PRIVILEGED, AUTO. 
  
**See also**: mip::AssignmentMethod
  
### GetNewLabelExtendedProperties function
Return new label's extended properties.

  
**Returns**: The extended properties applied to the content.
  
### GetContentMetadata function
Get the meta-data items from the content.

  
**Returns**: The metadata applied to the content. 
Each metadata item is a pair of name and value.
  
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
  
### GetSupportedActions function
Gets a masked enum describing all the supported action types.

  
**Returns**: A masked enum describing all the supported action types.
ActionType::Justify must be supported. When a policy and label change requires justification, a justification action will always be returned.
  
### GetClassificationResults function
Return a map of classification results.

Parameters:  
* **classificationIds**: a list of classification IDs. 



  
**Returns**: A list of classification results. 
return nullptr if no classification cycle executed.
  
### GetAuditMetadata function
Return a map of application specific audit key-value pairs.

  
**Returns**: A list of application specific audit metadata
Registered Key:Value pairs Sender: Email Id for the sender Recipients: Represents a JSON array of recipients for an email LastModifiedBy: Email Id for the user who last modified the content LastModifiedDate: Date the content was last modified.
