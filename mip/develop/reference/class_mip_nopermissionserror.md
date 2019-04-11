---
title: class mip::NoPermissionsError 
description: Documents the mip::nopermissionserror class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::NoPermissionsError 
The user could not get access to the content. For example, no permissions, content revoked.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::string GetReferrer() const  |  Gets the contact in case of missing rights to the document.
public std::string GetOwner() const  | _Not yet documented._
public char const* what() const  |  Get the error message.
public std::shared_ptr\<Error\> Clone() const  |  Clone the error.
public virtual ErrorType GetErrorType() const  |  Get the error type.
public virtual const std::string& GetErrorName() const  |  Get the error name.
public virtual const std::string& GetMessage() const  |  Get the error message.
public virtual void SetMessage(const std::string& msg)  |  Set the error message.
  
## Members

### GetReferrer function
Gets the contact in case of missing rights to the document.

  
**Returns**: The contact in case of missing rights to the document.
  
### GetOwner function
_Not documented yet._

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