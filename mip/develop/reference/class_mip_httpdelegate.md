---
title: class mip::HttpDelegate 
description: Documents the mip::httpdelegate class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/22/2019
---

# class mip::HttpDelegate 
Interface for overriding HTTP handling.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr<HttpResponse> Send(const std::shared_ptr<HttpRequest>& request, const std::shared_ptr<void>& context)  |  Send HTTP request.
public void SendAsync(const std::shared_ptr<HttpRequest>& request, const std::shared_ptr<void>& context, const std::function<void(std::shared_ptr<HttpResponse>)>& fnCallback)  | _Not yet documented._
  
## Members
  
### HttpResponse
Send HTTP request.

Parameters:  
* **request**: HTTP request 


* **context**: The same opaque client context that was passed to the API that resulted in this HTTP request



  
**Returns**: HTTP response
  
### SendAsync
_Not documented yet._
