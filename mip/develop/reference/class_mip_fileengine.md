# class mip::FileEngine 
Interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public virtual ~FileEngine()  | _Not yet documented._
 public const Settings& GetSettings() const  |  Returns the engine settings.
public const std::vector<std::shared_ptr<Label>>& ListSensitivityLabels()  |  Returns a list of sensitivity labels.
public void CreateFileHandlerAsync(const std::string& inputFilePath, const std::shared_ptr<FileHandler::Observer>& fileHandlerObserver, const std::shared_ptr<void>& context)  |  Starts creating a file handler for given file path.
public void CreateFileHandlerAsync(const std::shared_ptr<Stream>& inputStream, const std::string& inputFileName, const std::shared_ptr<FileHandler::Observer>& fileHandlerObserver, const std::shared_ptr<void>& context)  |  Starts creating a file handler for given file stream.
 protected FileEngine()  | _Not yet documented._
  
## Members
  
### ~FileEngine
_Not documented yet._

  
### Settings
Returns the engine settings.
  
### Label
Returns a list of sensitivity labels.
  
### CreateFileHandlerAsync
Starts creating a file handler for given file path.

Parameters:  
* **The**: file to open. The path must include the file name and, if one exists, the file name extension. 


* **A**: class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer.


  
### CreateFileHandlerAsync
Starts creating a file handler for given file stream.

Parameters:  
* **A**: stream that represents the file. 


* **The**: path to the file. The path must include the file name and, if one exists, the file name extension. 


* **A**: class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer.


  
### FileEngine
_Not documented yet._
