---
title: class HttpOperation 
description: Documents the httpoperation::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class HttpOperation 
Interface that describes a single HTTP operation, implemented by client app when overriding [HttpDelegate](undefined).
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetId() const  |  Gets operation ID.
public std::shared_ptr\&lt;HttpResponse\&gt; GetResponse()  |  Get response, if any.
public bool IsCancelled()  |  Get cancellation status of operation.
  
## Members
  
### GetId function
Gets operation ID.

  
**Returns**: Operation ID
The corresponding [HttpRequest](#class_http_request) and [HttpResponse](#class_http_response) will have the same ID
  
### GetResponse function
Get response, if any.

  
**Returns**: Response
  
### IsCancelled function
Get cancellation status of operation.

  
**Returns**: Cancellation status