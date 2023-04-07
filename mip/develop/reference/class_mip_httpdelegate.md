---
title: class HttpDelegate 
description: Documents the httpdelegate::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class HttpDelegate 
Interface for overriding HTTP handling.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr&lt;HttpOperation&gt; Send(const std::shared_ptr&lt;HttpRequest&gt;& request, const std::shared_ptr&lt;void&gt;& context)  |  Send HTTP request.
public std::shared_ptr&lt;HttpOperation&gt; SendAsync(const std::shared_ptr&lt;HttpRequest&gt;& request, const std::shared_ptr&lt;void&gt;& context, const std::function&lt;void(std::shared_ptr&lt;HttpOperation&gt;)&gt;& callbackFn)  |  Send HTTP request asynchronously.
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