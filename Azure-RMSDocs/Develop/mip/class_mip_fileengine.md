# class mip::FileEngine 
Interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline virtual ~FileEngine()  |  
public const Settings& GetSettings() const  |  Returns the engine settings.
public const std::vector<std::shared_ptr<Label>>& ListSensitivityLabels()  |  Returns a list of sensitivity labels.
public std::shared_ptr<FileHandler> CreateFileHandler(const std::string& inputFilePath, const std::shared_ptr<FileHandler::Observer>& fileHandlerObserver)  |  Returns the file handler for given file path.
public std::shared_ptr<FileHandler> CreateFileHandler(const std::shared_ptr<Stream>& inputStream, const std::string& inputFileName, const std::shared_ptr<FileHandler::Observer>& fileHandlerObserver)  |  Returns the file handler for given file stream.
protected inline FileEngine()  |  
  
## Members
  
### ~FileEngine
  
### Settings
Returns the engine settings.
  
### Label
Returns a list of sensitivity labels.
  
### FileHandler
Returns the file handler for given file path.
  
#### Parameters
* The file to open. The path must include the file name and, if one exists, the file name extension. 
* A class implementing the [FileHandler::Observer](#classmip_1_1_file_handler_1_1_observer) interface.
  
### FileHandler
Returns the file handler for given file stream.
  
#### Parameters
* A stream that represents the file. 
* The path to the file. The path must include the file name and, if one exists, the file name extension. 
* A class implementing the [FileHandler::Observer](#classmip_1_1_file_handler_1_1_observer) interface.
  
### FileEngine