---
title: class HttpOperation 
description: Documents the httpoperation::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 11/15/2021
---

# class HttpOperation 
Interface that describes a single HTTP operation, implemented by client app when overriding [HttpDelegate](undefined).
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetId() const  |  Gets operation ID.
public std::shared_ptr\<HttpResponse\> GetResponse()  |  Get response, if any.
public bool IsCancelled()  |  Get cancellation status of operation.
  
## Members
  
### GetId function
Gets operation ID.

  
**Returns**: Operation ID
The corresponding [HttpRequest](undefined) and [HttpResponse](undefined) will have the same ID
  
### GetResponse function
Get response, if any.

  
**Returns**: Response
  
### IsCancelled function
Get cancellation status of operation.

  
**Returns**: Cancellation status