---
title: class HttpResponse 
description: Documents the httpresponse::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class HttpResponse 
Interface that describes a single HTTP response, implemented by client app when overriding [HttpDelegate](class_mip_httpdelegate.md).
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetId() const  |  Gets response ID.
public int32_t GetStatusCode() const  |  Get response status code.
public const std::vector\&lt;uint8_t\&gt;& GetBody() const  |  Get request body.
public const std::map\&lt;std::string, std::string, CaseInsensitiveComparator\&gt;& GetHeaders() const  |  Get request headers.
  
## Members
  
### GetId function
Gets response ID.

  
**Returns**: Response ID
The corresponding [HttpRequest](class_mip_httprequest.md) will have had the same ID
  
### GetStatusCode function
Get response status code.

  
**Returns**: Status code
  
### GetBody function
Get request body.

  
**Returns**: Request body
  
### GetHeaders function
Get request headers.

  
**Returns**: Request headers