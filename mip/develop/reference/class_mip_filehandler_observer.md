# class mip::FileHandler::Observer 
[Observer](class_mip_filehandler_observer.md) interface for clients to get notifications for file handler related events.
If an *Error event occurs, error object holds inside [mip::Error](class_mip_error.md) class. 
Client should not call the engine back on the thread that calls the observer.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public virtual ~Observer()  | _Not yet documented._
public virtual void OnCreateFileHandlerSuccess(const std::shared_ptr<FileHandler>& fileHandler, const std::shared_ptr<void>& context)  |  Called when the handler is created successfully.
public virtual void OnCreateFileHandlerFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when the creating the handler failed due to an error.
public virtual void OnGetLabelSuccess(const std::shared_ptr<ContentLabel>& label, const std::shared_ptr<void>& context)  |  Called when the label is retrieved (from the file) successfully.
public virtual void OnGetLabelFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when retrieving the label (from the file) failed due to an error.
public virtual void OnGetProtectionSuccess(const std::shared_ptr<ProtectionHandler>& protectionHandler, const std::shared_ptr<void>& context)  |  Called when the protection policy is retrieved (from the file) successfully.
public virtual void OnGetProtectionFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when retrieving the protection policy (from the file) failed due to an error.
public virtual void OnCommitSuccess(bool committed, const std::shared_ptr<void>& context)  |  Called when committing the changes to the file were successful.
public virtual void OnCommitFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when committing the changes to the file failed due to an error.
 protected Observer()  | _Not yet documented._
  
## Members
  
### ~Observer
_Not documented yet._

  
### OnCreateFileHandlerSuccess
Called when the handler is created successfully.
  
### OnCreateFileHandlerFailure
Called when the creating the handler failed due to an error.
  
### OnGetLabelSuccess
Called when the label is retrieved (from the file) successfully.
  
### OnGetLabelFailure
Called when retrieving the label (from the file) failed due to an error.
  
### OnGetProtectionSuccess
Called when the protection policy is retrieved (from the file) successfully.
  
### OnGetProtectionFailure
Called when retrieving the protection policy (from the file) failed due to an error.
  
### OnCommitSuccess
Called when committing the changes to the file were successful.
  
### OnCommitFailure
Called when committing the changes to the file failed due to an error.
  
### Observer
_Not documented yet._
