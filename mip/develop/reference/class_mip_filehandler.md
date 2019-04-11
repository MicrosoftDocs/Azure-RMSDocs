---
title: class mip::FileHandler 
description: Documents the mip::filehandler class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::FileHandler 
Interface for all file handling functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr\<ContentLabel\> GetLabel()  |  Starts retrieving the sensitivity label from the file.
public std::shared_ptr\<ProtectionHandler\> GetProtection()  |  Starts retrieving the protection policy from the file.
public void ClassifyAsync(const std::shared_ptr\<void\>& context)  |  Executes the rules in the handler and returns the list of actions to be executed.
public void SetLabel(const std::string& labelId, const LabelingOptions& labelingOptions)  |  Sets the sensitivity label to the file.
public void DeleteLabel(const LabelingOptions& labelingOptions)  |  Deletes the sensitivity label from the file.
public void SetProtection(const std::shared_ptr\<ProtectionDescriptor\>& protectionDescriptor)  |  Sets either custom or template-based permissions (according to protectionDescriptor->GetProtectionType) to the file.
public void SetProtection(const std::vector\<uint8_t\>& serializedPublishingLicense, const std::vector\<uint8_t\>& serializedProtectionInfo)  |  Sets either custom or template-based permissions (according to serializedPublishingLicense and serializedProtectionInfo) to the file.
public void RemoveProtection()  |  Removes protection from the file. If the file is labeled, the label will be lost.
public void CommitAsync(const std::string& outputFilePath, const std::shared_ptr\<void\>& context) | Writes the changes to the file specified by the \|outputFilePath\ |  parameter.
public void CommitAsync(const std::shared_ptr\<Stream\>& outputStream, const std::shared_ptr\<void\>& context) | Writes the changes to the stream specified by the \|outputStream\ |  parameter.
public void GetDecryptedTemporaryFileAsync(const std::shared_ptr\<void\>& context)  |  Returns a path to a temporary file (that will be deleted if possible) - representing the decrypted content.
public void NotifyCommitSuccessful(const std::string& actualFilePath)  |  To be called when the changes have been committed to disk.
public std::string GetOutputFileName()  |  Calculates the output file name and extension based on the original file name and the accumulated changes.
  
## Members
  
### GetLabel function
Starts retrieving the sensitivity label from the file.
  
### GetProtection function
Starts retrieving the protection policy from the file.
  
### ClassifyAsync function
Executes the rules in the handler and returns the list of actions to be executed.

  
**Returns**: List of actions that should be applied on the content.
  
### SetLabel function
Sets the sensitivity label to the file.
Changes won't be written to the file until CommitAsync is called. Privileged and Auto method allows the API to override any existing label 
Throws [JustificationRequiredError](class_mip_justificationrequirederror.md) when setting the label requires the operation to be justified (via the labelingOptions parameter).
  
### DeleteLabel function
Deletes the sensitivity label from the file.
Changes won't be written to the file until CommitAsync is called. Privileged and Auto method allows the API to override any existing label 
Throws [JustificationRequiredError](class_mip_justificationrequirederror.md) when setting the label requires the operation to be justified (via the labelingOptions parameter).
  
### SetProtection function
Sets either custom or template-based permissions (according to protectionDescriptor->GetProtectionType) to the file.
Changes won't be written to the file until CommitAsync is called.
  
### SetProtection function
Sets either custom or template-based permissions (according to serializedPublishingLicense and serializedProtectionInfo) to the file.
Changes won't be written to the file until CommitAsync is called.
  
### RemoveProtection function
Removes protection from the file. If the file is labeled, the label will be lost.
Changes won't be written to the file until CommitAsync is called.
  
### CommitAsync function
Writes the changes to the file specified by the |outputFilePath| parameter.
[FileHandler::Observer](class_mip_filehandler_observer.md) will be called upon success or failure.
  
### CommitAsync function
Writes the changes to the stream specified by the |outputStream| parameter.
[FileHandler::Observer](class_mip_filehandler_observer.md) will be called upon success or failure.
  
### GetDecryptedTemporaryFileAsync function
Returns a path to a temporary file (that will be deleted if possible) - representing the decrypted content.
[FileHandler::Observer](class_mip_filehandler_observer.md) will be called upon success or failure.
  
### NotifyCommitSuccessful function
To be called when the changes have been committed to disk.

Parameters:  
* **actualFilePath**: The actual file path for the output file 


Fires an Audit event
  
### GetOutputFileName function
Calculates the output file name and extension based on the original file name and the accumulated changes.