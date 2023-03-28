---
title: class TemplateNotFoundError 
description: Documents the templatenotfounderror::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class TemplateNotFoundError 
Template ID is not recognized by RMS service.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string mMessage  | _Not yet documented._
public std::map&lt;std::string, std::string&gt; mDebugInfo  | _Not yet documented._
public std::string mName  | _Not yet documented._
public ErrorType mType  | _Not yet documented._
public ErrorCode GetErrorCode() const  |  Gets the errorCode of bad input.
public char const* what() const  |  Get the error message.
public std::shared_ptr&lt;Error&gt; Clone() const  |  Clone the error.
public virtual ErrorType GetErrorType() const  |  Get the error type.
public const std::string& GetErrorName() const  |  Get the error name.
public const std::string& GetMessage() const  |  Get the error message.
public void SetMessage(const std::string& msg)  |  Set the error message.
public void AddDebugInfo(const std::string& key, const std::string& value)  |  Add debug info entry.
public const std::map&lt;std::string, std::string&gt;& GetDebugInfo() const  |  Get debug info.
enum ErrorCode  |  ErrorCode of bad input error.
  
## Members
  
### mMessage
_Not documented yet._

  
### mDebugInfo
_Not documented yet._

  
### mName
_Not documented yet._

  
### ErrorType
_Not documented yet._

  
### GetErrorCode function
Gets the errorCode of bad input.

  
**Returns**: ErrorCode of bad input error
  
### what function
Get the error message.

  
**Returns**: The error message
  
### Clone function
Clone the error.

  
**Returns**: A clone of the error.
  
### GetErrorType function
Get the error type.

  
**Returns**: The error type.
  
### GetErrorName function
Get the error name.

  
**Returns**: The error name.
  
### GetMessage function
Get the error message.

  
**Returns**: The error message.
  
### SetMessage function
Set the error message.

Parameters:  
* **msg**: the error message.


  
### AddDebugInfo function
Add debug info entry.

Parameters:  
* **key**: Debug info key 


* **value**: Debug info value


  
### GetDebugInfo function
Get debug info.

  
**Returns**: Debug info (keys/values)
  
### ErrorCode enum

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
General            | General bad input error
FileIsTooLargeForProtection            | File is too large for protection
ParameterParsing            | Parameter cannot be parsed correctly
LicenseNotTrusted            | Publishing license not issued by trusted source
DoubleKey            | A paremeter for double key encryption is needed and missing

ErrorCode of bad input error.
