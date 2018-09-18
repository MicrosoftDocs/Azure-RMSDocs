# class mip::FileEngine 
This class provides an interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const Settings& GetSettings() const  |  Returns the engine settings.
public const std::vector<std::shared_ptr<Label>>& ListSensitivityLabels()  |  Returns a list of sensitivity labels.
 public const std::string& GetMoreInfoUrl() const  |  Provide a url for looking up more information regarding the policy/labels.
 public bool IsLabelingRequired() const  |  Checks whether or not the policy dictates that a document must be labeled.
public void CreateFileHandlerAsync(const std::string& inputFilePath, const mip::ContentState contentState, const std::shared_ptr<FileHandler::Observer>& fileHandlerObserver, const std::shared_ptr<void>& context)  |  Starts creating a file handler for given file path.
public void CreateFileHandlerAsync(const std::shared_ptr<Stream>& inputStream, const std::string& inputFileName, const mip::ContentState contentState, const std::shared_ptr<FileHandler::Observer>& fileHandlerObserver, const std::shared_ptr<void>& context)  |  Starts creating a file handler for given file stream.
  
## Members
  
### Settings
Returns the engine settings.
  
### Label
Returns a list of sensitivity labels.
  
### GetMoreInfoUrl
Provide a url for looking up more information regarding the policy/labels.

  
**Returns**: A url in string format.
  
### IsLabelingRequired
Checks whether or not the policy dictates that a document must be labeled.

  
**Returns**: True if labelling is mandatory, else false.
  
### CreateFileHandlerAsync
Starts creating a file handler for given file path.

Parameters:  
* **The**: file to open. The path must include the file name and, if one exists, the file name extension. 


* **contentState**: The state of the content being acted upon : MOTION|REST|USE 


* **A**: class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer.


  
### CreateFileHandlerAsync
Starts creating a file handler for given file stream.

Parameters:  
* **inputStream**: A stream that represents the file. 


* **inputFileName**: The path to the file. The path must include the file name and, if one exists, the file name extension. 


* **contentState**: The state of the content being acted upon : MOTION|REST|USE 


* **fileHandlerObserver**: A class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer.

