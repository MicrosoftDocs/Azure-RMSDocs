---
title: class FileHandler 
description: Documents the filehandler::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class FileHandler 
Interface for all file handling functions.
  
## Summary


 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr&lt;ContentLabel&gt; GetLabel()  |  Starts retrieving the sensitivity label from the file.
public std::vector&lt;std::pair&lt;std::string, std::string&gt;&gt; GetProperties(uint32_t version)  |  Retrieves the file properties according to version.
public std::shared_ptr&lt;ProtectionHandler&gt; GetProtection()  |  Starts retrieving the protection policy from the file.
public void RegisterContentForTrackingAndRevocationAsync(bool isOwnerNotificationEnabled, const std::shared_ptr&lt;ProtectionEngine::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context)  |  Parameters: isOwnerNotificationEnabled: Set to true to notify the owner via email whenever the document is decrypted, or false to not send the notification; observer: A class implementing the ProtectionHandler::Observer interface; context: Client context that will be opaquely forwarded to observers and optional HttpDelegate.
public void RevokeContentAsync(const std::shared_ptr&lt;ProtectionEngine::Observer&gt;& observer, const std::shared_ptr&lt;void&gt;& context)  |  Perform revocation for the content.
public void ClassifyAsync(const std::shared_ptr&lt;void&gt;& context)  |  Executes the rules in the handler and returns the list of actions to be executed.
public void InspectAsync(const std::shared_ptr&lt;void&gt;& context)  |  Create a file inspector object, used to retrieve file contents from compatible file formats.
public void SetLabel(const std::shared_ptr&lt;Label&gt;& label, const LabelingOptions& labelingOptions, const ProtectionSettings& protectionSettings)  |  Sets the sensitivity label to the file.
public void DeleteLabel(const LabelingOptions& labelingOptions)  |  Deletes the sensitivity label from the file.
public void SetProtection(const std::shared_ptr&lt;ProtectionDescriptor&gt;& protectionDescriptor, const ProtectionSettings& protectionSettings)  |  Sets either custom or template-based permissions (according to protectionDescriptor-&gt;GetProtectionType) to the file.
public void SetProtection(const std::shared_ptr&lt;ProtectionHandler&gt;& protectionHandler)  |  Sets protection on a document using an existing protection handler.
public void RemoveProtection()  |  Removes protection from the file. If the original file format does not support labeling, the label will be lost when protection is removed. When the native format supports labeling, the label metadata is maintained.
public void CommitAsync(const std::string& outputFilePath, const std::shared_ptr&lt;void&gt;& context) | Writes the changes to the file specified by the outputFilePath  parameter.
public void CommitAsync(const std::shared_ptr&lt;Stream&gt;& outputStream, const std::shared_ptr&lt;void&gt;& context) | Writes the changes to the stream specified by the outputStream  parameter.
public bool IsModified()  |  Checks if there are changes to commit to the file.
public void GetDecryptedTemporaryFileAsync(const std::shared_ptr&lt;void&gt;& context)  |  Returns a path to a temporary file (that will be deleted if possible) - representing the decrypted content.
public void GetDecryptedTemporaryStreamAsync(const std::shared_ptr&lt;void&gt;& context)  |  Returns a stream - representing the decrypted content.
public void NotifyCommitSuccessful(const std::string& actualFilePath)  |  To be called when the changes have been committed to disk.
public std::string GetOutputFileName()  |  Calculates the output file name and extension based on the original file name and the accumulated changes.

  
## Members
  
### GetLabel function
Starts retrieving the sensitivity label from the file.
  
### GetProperties function
Retrieves the file properties according to version.
  
### GetProtection function
Starts retrieving the protection policy from the file.
  
### RegisterContentForTrackingAndRevocationAsync function

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
  
### InspectAsync function
Create a file inspector object, used to retrieve file contents from compatible file formats.

  
**Returns**: A file inspector.
  
### SetLabel function
Sets the sensitivity label to the file.
Changes won't be written to the file until CommitAsync is called. Privileged and Auto method allows the API to override any existing label 
Throws JustificationRequiredError when setting the label requires the operation to be justified (via the labelingOptions parameter).
  
### DeleteLabel function
Deletes the sensitivity label from the file.
Changes won't be written to the file until CommitAsync is called. Privileged and Auto method allows the API to override any existing label 
Throws JustificationRequiredError when setting the label requires the operation to be justified (via the labelingOptions parameter).
  
### SetProtection function
Sets either custom or template-based permissions (according to protectionDescriptor-&gt;GetProtectionType) to the file.
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
  
### CommitAsync function
Writes the changes to the stream specified by the |outputStream| parameter.
|outputStream| must not be the same as inputStream used for creating the handler.
FileHandler::Observer will be called upon success or failure.
  
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
  
### GetOutputFileName function
Calculates the output file name and extension based on the original file name and the accumulated changes.
