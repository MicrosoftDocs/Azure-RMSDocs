---
title: class mip::FileIOError 
description: Documents the mip::fileioerror class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/18/2019
---

# class mip::FileIOError 
File IO error.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public char const* what() const  |  Get the error message.
public std::shared_ptr<Error> Clone() const  |  Clone the error.
public virtual ErrorType GetErrorType() const  |  Get the error type.
public virtual const std::string& GetErrorName() const  |  Get the error name.
public virtual const std::string& GetMessage() const  |  Get the error message.
public virtual void SetMessage(const std::string& msg)  |  Set the error message.
  
## Members
  
### what
Get the error message.

  
**Returns**: The error message
  
### Error
Clone the error.

  
**Returns**: A clone of the error.
  
### ErrorType
Get the error type.

  
**Returns**: The error type.
  
### GetErrorName
Get the error name.

  
**Returns**: The error name.
  
### GetMessage
Get the error message.

  
**Returns**: The error message.
  
### SetMessage
Set the error message.

Parameters:  
* **msg**: the error message.

