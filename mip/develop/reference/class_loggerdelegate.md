---
title: class LoggerDelegate 
description: Documents the loggerdelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 09/21/2020
---

# class LoggerDelegate 
A class that defines the interface to the MIP SDK logger.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public void Init(const std::string& storagePath)  |  Initialize the logger.
public void Flush()  |  Flush the logger.
public void WriteToLog(const LogLevel level, const std::string& message, const std::string& function, const std::string& file, const int32_t line)  |  Write a log statement to log file.
  
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

