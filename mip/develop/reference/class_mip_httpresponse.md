---
title: class HttpResponse 
description: Documents the httpresponse::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 08/23/2021
---

# class HttpResponse 
Interface that describes a single HTTP response, implemented by client app when overriding HttpDelegate.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetId() const  |  Gets response ID.
public int32_t GetStatusCode() const  |  Get response status code.
public const std::vector\<uint8_t\>& GetBody() const  |  Get request body.
public const std::map\<std::string, std::string, CaseInsensitiveComparator\>& GetHeaders() const  |  Get request headers.
  
## Members
  
### GetId function
Gets response ID.

  
**Returns**: Response ID
The corresponding HttpRequest will have had the same ID
  
### GetStatusCode function
Get response status code.

  
**Returns**: Status code
  
### GetBody function
Get request body.

  
**Returns**: Request body
  
### GetHeaders function
Get request headers.

  
**Returns**: Request headers