---
title: class mip::JustificationRequiredError 
description: Documents the mip::justificationrequirederror class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/28/2019
---

# class mip::JustificationRequiredError 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public virtual std::shared_ptr\<Error\> Clone() const  |  Clone the error.
public char const* what() const  |  Get the error message.
public virtual ErrorType GetErrorType() const  |  Get the error type.
public virtual const std::string& GetErrorName() const  |  Get the error name.
public virtual const std::string& GetMessage() const  |  Get the error message.
public virtual void SetMessage(const std::string& msg)  |  Set the error message.
  
## Members
  
### Clone function
Clone the error.

  
**Returns**: A clone of the error.
  
### what function
Get the error message.

  
**Returns**: The error message
  
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

