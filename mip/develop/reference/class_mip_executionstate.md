---
title: class mip::ExecutionState 
description: Documents the mip::executionstate class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: msmbaldwin
ms.date: 04/11/2019
---

# class mip::ExecutionState 
Interface for all the state needed to execute the engine.
Clients should only call the methods to obtain the state that is needed. Hence, for efficiency, clients may want to implement this interface such that the corresponding state is computed dynamically instead of computing in advance.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetNewLabelId() const  |  Gets the sensitivity label ID that should be applied on the document.
public ActionSource GetNewLabelActionSource() const  |  Gets the source for a new label action.
public std::string GetContentIdentifier() const  |  Gets the content description that describes the document. example for a file: [path\filename] example for an email: [Subject:Sender].
public virtual DataState GetDataState() const  |  Gets the state of the content while the application is interacting with it.
public std::pair\<bool, std::string\> IsDowngradeJustified() const  |  Implementation should pass if justification to downgrade an existing label was given.
public AssignmentMethod GetNewLabelAssignmentMethod() const  |  Get the new label's assignment method.
public virtual std::vector\<std::pair\<std::string, std::string\>\> GetNewLabelExtendedProperties() const  |  Return new label's extended properties.
public std::vector\<std::pair\<std::string, std::string\>\> GetContentMetadata(const std::vector\<std::string\>& names, const std::vector\<std::string\>& namePrefixes) const  |  Get the meta-data items from the content.
public std::shared_ptr\<ProtectionDescriptor\> GetProtectionDescriptor() const  |  Get the Protection Descriptor.
public ContentFormat GetContentFormat() const  |  Gets the content format.
public ActionType GetSupportedActions() const  |  Gets a masked enum describing all the supported action types.
public virtual std::shared_ptr\<ClassificationResults\> GetClassificationResults(const std::vector\<std::shared_ptr\<ClassificationRequest\>\> &) const  |  Return a map of classification results.
public virtual std::map\<std::string, std::string\> GetAuditMetadata() const  |  Return a map of application specific audit key-value pairs.
  
## Members
  
### GetNewLabelId function
Gets the sensitivity label ID that should be applied on the document.

  
**Returns**: Sensitivity label ID to be applied to the content if exists else empty to remove label.
  
### GetNewLabelActionSource function
Gets the source for a new label action.

  
**Returns**: Action source.
  
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
  
**See also**: [mip::JustifyAction](class_mip_justifyaction.md)
  
### GetNewLabelAssignmentMethod function
Get the new label's assignment method.

  
**Returns**: The assignment method STANDARD, PRIVILEGED, AUTO. 
  
**See also**: [mip::AssignmentMethod](mip-enums-and-structs.md#assignmentmethod-enum)
  
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

  
**Returns**: DEFAULT, EMAIL 
  
**See also**: [mip::ContentFormat](mip-enums-and-structs.md#contentformat-enum)
  
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
Registered Key:Value pairs Sender: Email Id for the sender Recipients: Represents a JSON array of recipients for an email LastModifiedBy: Email Id for the user who last modified the content LastModifiedDate: Date the content was last modified