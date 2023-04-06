---
title: class LogMessageData 
description: Documents the logmessagedata::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class LogMessageData 
A class that stores log messages.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public LogMessageData(const LogLevel level, const std::string& message, const std::string& function, const std::string& file, int32_t line, const std::shared_ptr&lt;void&gt;& context, std::chrono::time_point&lt;std::chrono::system_clock&gt; messageTime, std::thread::id messageThreadId)  | _Not yet documented._
public LogLevel GetLevel() const  |  The log level for the log statement.
public const std::string& GetLogMessage() const  |  The message for the log statement.
public const std::string& GetFunction() const  |  The function name for the log statement.
public const std::string& GetFile() const  |  The file name for the log statement.
public int32_t GetLine() const  |  The line number for the log statement.
public const std::shared_ptr&lt;void&gt;& GetContext() const  |  The logger context for the log statement.
public std::chrono::time_point&lt;std::chrono::system_clock&gt; GetMessageTime() const  |  The message time of the log statement.
public std::thread::id GetMessageThreadId() const  |  The thread id of the log statement.
  
## Members
  
### LogMessageData function
_Not documented yet._

  
### GetLevel function
The log level for the log statement.
  
### GetLogMessage function
The message for the log statement.
  
### GetFunction function
The function name for the log statement.
  
### GetFile function
The file name for the log statement.
  
### GetLine function
The line number for the log statement.
  
### GetContext function
The logger context for the log statement.
  
### GetMessageTime function
The message time of the log statement.
  
### GetMessageThreadId function
The thread id of the log statement.ent.