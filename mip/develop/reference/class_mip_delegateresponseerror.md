---
title: class DelegateResponseError 
description: Documents the delegateresponseerror::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class DelegateResponseError 
Delegate Response [Error](undefined). Thrown or returned in response to encountering an error in a delegate method.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public explicit DelegateResponseError(const std::exception_ptr& except)  |  Creates an error/exception object. Call this method from a MIP delegate function to create a MIP or standard C++ exception object.
public DelegateResponseError(const std::string& message, const std::string& stackTrace, const std::string& name)  |  Creates an error/exception object. Call this method from a MIP delegate function to create a generic MIP C++ exception object.
public DelegateResponseError(const std::string& message, long HResult, const std::string& stackTrace, const std::string& name)  |  Creates an error/exception object. Call this method from a MIP delegate function to create a generic MIP C++ exception object.
public DelegateResponseError(const std::string& message, long HResult)  |  Creates an error/exception object. Call this method from a MIP delegate function to create a generic MIP C++ exception object.
public DelegateResponseError(const std::string& message)  |  Creates an error/exception object. Call this method from a MIP delegate function to create a generic MIP C++ exception object.
  
## Members
  
### DelegateResponseError function
Creates an error/exception object. Call this method from a MIP delegate function to create a MIP or standard C++ exception object.

Parameters:  
* **except**: The C++ exception that was encountered.


  
### DelegateResponseError function
Creates an error/exception object. Call this method from a MIP delegate function to create a generic MIP C++ exception object.

Parameters:  
* **message**: Message associated with the exception. 


* **stackTrace**: The stack trace at the time of the exception. 


* **name**: Some string to uniquely identify the type of this exception.


  
### DelegateResponseError function
Creates an error/exception object. Call this method from a MIP delegate function to create a generic MIP C++ exception object.

Parameters:  
* **message**: Message associated with the exception. 


* **HResult**: HResult that identifies the error that caused this exception. 


* **stackTrace**: The stack trace at the time of the exception. 


* **name**: Some string to uniquely identify the type of this exception.


  
### DelegateResponseError function
Creates an error/exception object. Call this method from a MIP delegate function to create a generic MIP C++ exception object.

Parameters:  
* **message**: Message associated with the exception. 


* **HResult**: HResult that identifies the error that caused this exception.


  
### DelegateResponseError function
Creates an error/exception object. Call this method from a MIP delegate function to create a generic MIP C++ exception object.

Parameters:  
* **message**: Message associated with the exception.

