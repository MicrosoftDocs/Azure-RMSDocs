# class mip::LoggerDelegate 
A class that defines the interface to the mip sdk logger.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public void Init(const std::string& storagePath)  |  Initialize the logger.
 public void Flush()  |  Flush the logger.
 public void WriteToLog(const LogLevel level, const std::string& message, const std::string& function, const std::string& file, const uint64_t line)  |  Write a log statement to log file.
  
## Members
  
### Init
Initialize the logger.

Parameters:  
* **storagePath**: the path to the location where persistent state, including logs, may be stored.


  
### Flush
Flush the logger.
  
### WriteToLog
Write a log statement to log file.

Parameters:  
* **level**: the loglevel for the log statement. 


* **message**: the message for the log statement. 


* **function**: the function name for the log statement. 


* **file**: the file name where log statement was generated. 


* **line**: the line number where the log statement was generated.

