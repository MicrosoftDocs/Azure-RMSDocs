---
title: class HttpOperation 
description: Documents the httpoperation::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/07/2023
---

# class HttpOperation 
Interface that describes a single HTTP operation, implemented by client app when overriding HttpDelegate.
  
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
The corresponding HttpRequest and HttpResponse will have the same ID
  
### GetResponse function
Get response, if any.

  
**Returns**: Response
  
### IsCancelled function
Get cancellation status of operation.

  
**Returns**: Cancellation status