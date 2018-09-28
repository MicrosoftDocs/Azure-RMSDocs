---
title: class mip ConsentDeniedError 
description: Reference for class mip ConsentDeniedError 
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 09/27/2018
ms.author: bryanla
---
# class mip::ConsentDeniedError 
An operation that required consent from user was not granted consent.
  
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

