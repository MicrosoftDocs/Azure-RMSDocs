---
title: class FileHandler 
description: Documents the filehandler::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/07/2023
---

# class FileHandler 
Interface for all file handling functions.
  
## Summary

 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr\<ContentLabel\> GetLabel()  |  Starts retrieving the sensitivity label from the file.
public std::vector\<std::pair\<std::string, std::string\>\> GetProperties(uint32_t version)  |  Retrieves the file properties according to version.
public std::shared_ptr\<ProtectionHandler\> GetProtection()  |  Starts retrieving the protection policy from the file.
public void RegisterContentForTrackingAndRevocationAsync(bool isOwnerNotificationEnabled, const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Register the content for tracking and revocation.
public void RevokeContentAsync(const std::shared_ptr\<ProtectionEngine::Observer\>& observer, const std::shared_ptr\<void\>& context)  |  Perform revocation for the content.
public void ClassifyAsync(const std::shared_ptr\<void\>& context)  |  Executes the rules in the handler and returns the list of actions to be executed.
public void InspectAsync(const std::shared_ptr\<void\>& context)  |  Create a file inspector object, used to retrieve file contents from compatible file formats.
public void SetLabel(const std::shared_ptr\<Label\>& label, const LabelingOptions& labelingOptions, const ProtectionSettings& protectionSettings)  |  Sets the sensitivity label to the file.
public void DeleteLabel(const LabelingOptions& labelingOptions)  |  Deletes the sensitivity label from the file.
public void SetProtection(const std::shared_ptr\<ProtectionDescriptor\>& protectionDescriptor, const ProtectionSettings& protectionSettings)  |  Sets either custom or template-based permissions (according to protectionDescriptor->GetProtectionType) to the file.
public void SetProtection(const std::shared_ptr\<ProtectionHandler\>& protectionHandler)  |  Sets protection on a document using an existing protection handler.
public void RemoveProtection()  |  Removes protection from the file. If the original file format does not support labeling, the label will be lost when protection is removed. When the native format supports labeling, the label metadata is maintained.
public void CommitAsync(const std::string& outputFilePath, const std::shared_ptr\<void\>& context) | Writes the changes to the file specified by the outputFilePath  parameter.
public void CommitAsync(const std::shared_ptr\<Stream\>& outputStream, const std::shared_ptr\<void\>& context) | Writes the changes to the stream specified by the outputStream  parameter.
public bool IsModified()  |  Checks if there are changes to commit to the file.
public void GetDecryptedTemporaryFileAsync(const std::shared_ptr\<void\>& context)  |  Returns a path to a temporary file (that will be deleted if possible) - representing the decrypted content.
public void GetDecryptedTemporaryStreamAsync(const std::shared_ptr\<void\>& context)  |  Returns a stream - representing the decrypted content.
public void NotifyCommitSuccessful(const std::string& actualFilePath)  |  To be called when the changes have been committed to disk.
public std::string GetOutputFileName()  |  Calculates the output file name and extension based on the original file name and the accumulated changes.
  
## Members
  
### GetLabel function
Starts retrieving the sensitivity label from the file.
  
#### Exceptions
* **NotSupportedError**: when a protection only engine is in use and no policy handler is found.


  
### GetProperties function
Retrieves the file properties according to version.
  
### GetProtection function
Starts retrieving the protection policy from the file.
  
### RegisterContentForTrackingAndRevocationAsync function
Register the content for tracking and revocation.

Parameters:  
* **isOwnerNotificationEnabled**: Set to true to notify the owner via email whenever the document is decrypted, or false to not send the notification. 


* **observer**: A class implementing the ProtectionHandler::Observer interface 


* **context**: Client context that will be opaquely forwarded to observers and optional HttpDelegate



  
**Returns**: Async control object.
  
### RevokeContentAsync function
Perform revocation for the content.

Parameters:  
* **observer**: A class implementing the ProtectionHandler::Observer interface 


* **context**: Client context that will be opaquely forwarded to observers and optional HttpDelegate



  
**Returns**: Async control object.
  
### ClassifyAsync function
Executes the rules in the handler and returns the list of actions to be executed.

  
**Returns**: List of actions that should be applied on the content. 
  
#### Exceptions
* **NotSupportedError**: when a protection only engine is in use and no policy handler is found.


  
### InspectAsync function
Create a file inspector object, used to retrieve file contents from compatible file formats.

  
**Returns**: A file inspector.
  
### SetLabel function
Sets the sensitivity label to the file.
Changes won't be written to the file until CommitAsync is called. Privileged and Auto method allows the API to override any existing label 
Throws JustificationRequiredError when setting the label requires the operation to be justified (via the labelingOptions parameter). 
  
#### Exceptions
* **NotSupportedError**: when a protection only engine is in use and no policy handler is found.


  
### DeleteLabel function
Deletes the sensitivity label from the file.
Changes won't be written to the file until CommitAsync is called. Privileged and Auto method allows the API to override any existing label 
Throws JustificationRequiredError when setting the label requires the operation to be justified (via the labelingOptions parameter). 
  
#### Exceptions
* **NotSupportedError**: when a protection only engine is in use and no policy handler is found.


  
### SetProtection function
Sets either custom or template-based permissions (according to protectionDescriptor->GetProtectionType) to the file.
Changes won't be written to the file until CommitAsync is called.
  
### SetProtection function
Sets protection on a document using an existing protection handler.
Changes won't be written to the file until CommitAsync is called.
  
### RemoveProtection function
Removes protection from the file. If the original file format does not support labeling, the label will be lost when protection is removed. When the native format supports labeling, the label metadata is maintained.
Changes won't be written to the file until CommitAsync is called.
  
### CommitAsync function
Writes the changes to the file specified by the |outputFilePath| parameter.
FileHandler::Observer will be called upon success or failure.
If the output file's disk space is insufficient, the FileHandler::CommitAsync function may generate corrupted files. In this case, delete the corrupted files and either adjust the disk size or choose another disk before retrying the operation.
  
### CommitAsync function
Writes the changes to the stream specified by the |outputStream| parameter.
|outputStream| must not be the same as inputStream used for creating the handler.
FileHandler::Observer will be called upon success or failure.
If the output file's disk space is insufficient, the FileHandler::CommitAsync function may generate corrupted files. In this case, delete the corrupted files and either adjust the disk size or choose another disk before retrying the operation.
  
### IsModified function
Checks if there are changes to commit to the file.
Changes won't be written to the file until CommitAsync is called.
  
### GetDecryptedTemporaryFileAsync function
Returns a path to a temporary file (that will be deleted if possible) - representing the decrypted content.
FileHandler::Observer will be called upon success or failure.
  
### GetDecryptedTemporaryStreamAsync function
Returns a stream - representing the decrypted content.
FileHandler::Observer will be called upon success or failure.
  
### NotifyCommitSuccessful function
To be called when the changes have been committed to disk.

Parameters:  
* **actualFilePath**: The actual file path for the output file 


Fires an Audit event 
  
#### Exceptions
* **NotSupportedError**: when a protection only engine is in use and no policy handler is found.


  
### GetOutputFileName function
Calculates the output file name and extension based on the original file name and the accumulated changes.