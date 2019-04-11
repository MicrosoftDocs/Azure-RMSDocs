---
title: class mip::HttpDelegate 
description: Documents the mip::httpdelegate class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: msmbaldwin
ms.date: 04/11/2019
---

# class mip::HttpDelegate 
Interface for overriding HTTP handling.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr\<HttpOperation\> Send(const std::shared_ptr\<HttpRequest\>& request, const std::shared_ptr\<void\>& context)  |  Send HTTP request.
public std::shared_ptr\<HttpOperation\> SendAsync(const std::shared_ptr\<HttpRequest\>& request, const std::shared_ptr\<void\>& context, const std::function\<void(std::shared_ptr\<HttpOperation\>)\>& callbackFn)  |  Send HTTP request asynchronously.
public void CancelOperation(const std::string& requestId)  |  Cancel a specific HTTP operation.
public void CancelAllOperations()  |  Cancel ongoing HTTP requests.
  
## Members
  
### Send function
Send HTTP request.

Parameters:  
* **request**: HTTP request 


* **context**: The same opaque client context that was passed to the API that resulted in this HTTP request



  
**Returns**: HTTP operation container
  
### SendAsync function
Send HTTP request asynchronously.

Parameters:  
* **request**: HTTP request 


* **context**: The same opaque client context that was passed to the API that resulted in this HTTP request 


* **callbackFn**: Function that will be executed upon completion



  
**Returns**: HTTP operation container
  
### CancelOperation function
Cancel a specific HTTP operation.

Parameters:  
* **requestId**: ID of request to cancel


  
### CancelAllOperations function
Cancel ongoing HTTP requests.