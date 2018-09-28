# class mip::FileEngine 
This class provides an interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const Settings& GetSettings() const  |  Returns the engine settings.
public const std::vector<std::shared_ptr<Label>>& ListSensitivityLabels()  |  Returns a list of sensitivity labels.
 public const std::string& GetMoreInfoUrl() const  |  Provide a url for looking up more information about the policy/labels.
 public bool IsLabelingRequired() const  |  Checks if the policy dictates that a document must be labeled.
public void CreateFileHandlerAsync(const std::string& inputFilePath, const ContentState contentState, const std::shared_ptr<FileHandler::Observer>& fileHandlerObserver, const std::shared_ptr<void>& context)  |  Starts creating a file handler for given file path.
public void CreateFileHandlerAsync(const std::shared_ptr<Stream>& inputStream, const std::string& inputFilePath, const mip::ContentState contentState, const std::shared_ptr<FileHandler::Observer>& fileHandlerObserver, const std::shared_ptr<void>& context)  |  Starts creating a file handler for given file stream.
 public void SendApplicationAuditEvent(const std::string& level, const std::string& eventType, const std::string& eventData)  |  Logs an application specific event to the audit pipeline.
  
## Members
  
### Settings
Returns the engine settings.
  
### Label
Returns a list of sensitivity labels.
  
### GetMoreInfoUrl
Provide a url for looking up more information about the policy/labels.

  
**Returns**: A url in string format.
  
### IsLabelingRequired
Checks if the policy dictates that a document must be labeled.

  
**Returns**: True if labeling is mandatory, else false.
  
### CreateFileHandlerAsync
Starts creating a file handler for given file path.

Parameters:  
* **The**: file to open. The path must include the file name and, if one exists, the file name extension. 


* **contentState**: The state of the content while the application is interacting with it. 


* **A**: class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer.


  
### CreateFileHandlerAsync
Starts creating a file handler for given file stream.

Parameters:  
* **inputStream**: A stream containing the file data. 


* **inputFilePath**: The path to the file. The path must include the file name and, if one exists, the file name extension. 


* **contentState**: The state of the content while the application is interacting with it. 


* **fileHandlerObserver**: A class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer.


  
### SendApplicationAuditEvent
Logs an application specific event to the audit pipeline.

Parameters:  
* **level**: a description of the log level : Info/Error/Warning 


* **eventType**: a description of the type of event 


* **eventData**: the data associated with the event

