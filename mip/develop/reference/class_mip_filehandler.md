# class mip::FileHandler 
Interface for all file handling functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void GetLabelAsync(const std::shared_ptr<void>& context)  |  Starts retrieving the sensitivity label from the file.
public void GetProtectionAsync(const std::shared_ptr<void>& context)  |  Starts retrieving the protection policy from the file.
 public void SetLabel(const std::string& labelId, const LabelingOptions& labelingOptions)  |  Sets the sensitivity label to the file.
 public void DeleteLabel(const LabelingOptions& labelingOptions)  |  Deletes the sensitivity label from the file.
public void SetProtection(const std::shared_ptr<ProtectionDescriptor>& protectionDescriptor)  |  Sets either custom or template-based permissions (according to protectionDescriptor->GetProtectionType) to the file.
 public void RemoveProtection()  |  Removes protection from the file. If the file is labeled, the label will be lost.
public void CommitAsync(const std::string& outputFilePath, const std::shared_ptr<void>& context) | Writes the changes to the file specified by the \|outputFilePath\ |  parameter.
public void CommitAsync(const std::shared_ptr<Stream>& outputStream, const std::shared_ptr<void>& context) | Writes the changes to the stream specified by the \|outputStream\ |  parameter.
 public void NotifyCommitSuccessful(const std::string& contentIdentifier)  |  To be called when the changes have been committed to disk.
 public std::string GetOutputFileName()  |  Calculates the output file name and extension based on the original file name and the accumulated changes.
  
## Members
  
### GetLabelAsync
Starts retrieving the sensitivity label from the file.
[FileHandler::Observer](class_mip_filehandler_observer.md) will be called upon success or failure.

Parameters:  
* **context**: Client context that will be opaquely passed back to the observer.


  
### GetProtectionAsync
Starts retrieving the protection policy from the file.
[FileHandler::Observer](class_mip_filehandler_observer.md) will be called upon success or failure.

Parameters:  
* **context**: Client context that will be opaquely passed back to the observer.


  
### SetLabel
Sets the sensitivity label to the file.
Changes won't be written to the file until CommitAsync is called. Privileged and Auto method allows the API to override any existing label 
Throws [JustificationRequiredError](class_mip_justificationrequirederror.md) when setting the label requires the operation to be justified (via the labelingOptions parameter).
  
### DeleteLabel
Deletes the sensitivity label from the file.
Changes won't be written to the file until CommitAsync is called. Privileged and Auto method allows the API to override any existing label 
Throws [JustificationRequiredError](class_mip_justificationrequirederror.md) when setting the label requires the operation to be justified (via the labelingOptions parameter).
  
### SetProtection
Sets either custom or template-based permissions (according to protectionDescriptor->GetProtectionType) to the file.
Changes won't be written to the file until CommitAsync is called.
  
### RemoveProtection
Removes protection from the file. If the file is labeled, the label will be lost.
Changes won't be written to the file until CommitAsync is called.
  
### CommitAsync
Writes the changes to the file specified by the |outputFilePath| parameter.
[FileHandler::Observer](class_mip_filehandler_observer.md) will be called upon success or failure.
  
### CommitAsync
Writes the changes to the stream specified by the |outputStream| parameter.
[FileHandler::Observer](class_mip_filehandler_observer.md) will be called upon success or failure.
  
### NotifyCommitSuccessful
To be called when the changes have been committed to disk.

Parameters:  
* **contentIdentifier**: example for a file: "C:\mip-sdk-for-cpp\files\audit.docx" [path] example for an email: "RE: Audit design:user1@contoso.com" [Subject:Sender] 


Fires an Audit event
  
### GetOutputFileName
Calculates the output file name and extension based on the original file name and the accumulated changes.