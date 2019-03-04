---
title: class mip::ServiceDisabledError 
description: Documents the mip::servicedisablederror class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::ServiceDisabledError 
The user could not get access to the content due to a service being disabled.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Extent GetExtent() const  |  Gets the extent for which the service is disabled.
public char const* what() const  |  Get the error message.
public std::shared_ptr\<Error\> Clone() const  |  Clone the error.
public virtual ErrorType GetErrorType() const  |  Get the error type.
public virtual const std::string& GetErrorName() const  |  Get the error name.
public virtual const std::string& GetMessage() const  |  Get the error message.
public virtual void SetMessage(const std::string& msg)  |  Set the error message.
enum Extent  |  Describes the extent for which the service is disabled.
  
## Members
  
### GetExtent function
Gets the extent for which the service is disabled.

  
**Returns**: Extent for which the service is disabled
  
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


  
### Extent enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
User            | Service is disabled for the user.
Device            | Service is disabled for the device.
Platform            | Service is disabled for the platform.
Tenant            | Service is disabled for the tenant.
Describes the extent for which the service is disabled.
