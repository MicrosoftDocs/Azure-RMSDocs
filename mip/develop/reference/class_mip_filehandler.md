# class mip::FileHandler 
Interface for all file handling functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void GetLabelAsync(const std::shared_ptr<void>& context)  |  Starts retrieving the sensitivity label from the file.
public void GetProtectionAsync(const std::shared_ptr<void>& context)  |  Starts retrieving the protection policy from the file.
 public void SetLabel(const std::string& labelId, const LabelingOptions& labelingOptions)  |  Sets the sensitivity label to the file.
 public void DeleteLabel(AssignmentMethod method, const std::string& justificationMessage)  |  Deletes the sensitivity label from the file.
public void SetProtection(const std::shared_ptr<ProtectionDescriptor>& protectionDescriptor)  |  Sets either custom or template based permissions (according to protectionDescriptor->GetProtectionType) to the file.
 public void RemoveProtection()  |  Removes protection from the file. If the file is labeled, the label will be lost.
public void CommitAsync(const std::string& outputFilePath, const std::shared_ptr<void>& context) | Writes the changes to the file specified by the \|outputFilePath\ |  parameter.
public void CommitAsync(const std::shared_ptr<Stream>& outputStream, const std::shared_ptr<void>& context) | Writes the changes to the stream specified by the \|outputStream\ |  parameter.
 public std::string GetOutputFileName()  |  Calculates the output file name and extension based on the original file name and the accumulated changes.
 public virtual ~FileHandler()  | _Not yet documented._
 protected FileHandler()  | _Not yet documented._
  
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
Changes will not be written to the file until CommitAsync will be called.
Throws [JustificationRequiredError](class_mip_justificationrequirederror.md) when setting the label requires a justification and no justification message was provided via the labelingOptions parameter.
  
### DeleteLabel
Deletes the sensitivity label from the file.
Changes will not be written to the file until CommitAsync will be called. Privileged and Auto method allows the API to override any existing label 
Throws [JustificationRequiredError](class_mip_justificationrequirederror.md) when setting the label requires a justification and no justification message was provided via the justificationMessage parameter.
  
### SetProtection
Sets either custom or template based permissions (according to protectionDescriptor->GetProtectionType) to the file.
Changes will not be written to the file until CommitAsync will be called.
  
### RemoveProtection
Removes protection from the file. If the file is labeled, the label will be lost.
Changes will not be written to the file until CommitAsync will be called.
  
### CommitAsync
Writes the changes to the file specified by the |outputFilePath| parameter.
[FileHandler::Observer](class_mip_filehandler_observer.md) will be called upon success or failure.
  
### CommitAsync
Writes the changes to the stream specified by the |outputStream| parameter.
[FileHandler::Observer](class_mip_filehandler_observer.md) will be called upon success or failure.
  
### GetOutputFileName
Calculates the output file name and extension based on the original file name and the accumulated changes.
  
### ~FileHandler
_Not documented yet._

  
### FileHandler
_Not documented yet._
