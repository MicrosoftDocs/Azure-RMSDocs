---
title: class LoggerDelegate 
description: Documents the loggerdelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/07/2023
---

# class LoggerDelegate 
A class that defines the interface to the MIP SDK logger.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void Init(const std::string& storagePath)  |  Initialize the logger.
public void Flush()  |  Flush the logger.
public void WriteToLog(const LogLevel level, const std::string& message, const std::string& function, const std::string& file, const int32_t line)  |  Write a log statement to log file.
public virtual void WriteToLogWithContext(const LogLevel level, const std::string& message, const std::string& function, const std::string& file, const int32_t line, const std::shared_ptr\<void\> &)  |  Write a log statement to log file with a context. Override this function to handle the context.
public virtual void WriteToLogWithLogMessage(const LogMessageData& logMessage)  |  Write a log statement to a log.
  
## Members
  
### Init function
Initialize the logger.

Parameters:  
* **storagePath**: the path to the location where persistent state, including logs, may be stored.


  
### Flush function
Flush the logger.
  
### WriteToLog function
Write a log statement to log file.

Parameters:  
* **level**: the log level for the log statement. 


* **message**: the message for the log statement. 


* **function**: the function name for the log statement. 


* **file**: the file name where log statement was generated. 


* **line**: the line number where the log statement was generated.


  
### WriteToLogWithContext function
Write a log statement to log file with a context. Override this function to handle the context.

Parameters:  
* **level**: the log level for the log statement. 


* **message**: the message for the log statement. 


* **function**: the function name for the log statement. 


* **file**: the file name where log statement was generated. 


* **line**: the line number where the log statement was generated. 


* **context**: Client context that was passed into the call that generated this log message


  
### WriteToLogWithLogMessage function
Write a log statement to a log.

Parameters:  
* **logMessage**: The log message data containing the logging information

