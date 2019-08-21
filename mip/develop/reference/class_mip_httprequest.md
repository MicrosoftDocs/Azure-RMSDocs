---
title: class mip::HttpRequest 
description: Documents the mip::httprequest class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 07/16/2019
---

# class mip::HttpRequest 
Interface that describes a single HTTP request.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetId() const  |  Gets request ID.
public HttpRequestType GetRequestType() const  |  Get request type.
public const std::string& GetUrl() const  |  Get request url.
public const std::vector\<uint8_t\>& GetBody() const  |  Get request body.
public const std::map\<std::string, std::string, CaseInsensitiveComparator\>& GetHeaders() const  |  Get request headers.
  
## Members
  
### GetId function
Gets request ID.

  
**Returns**: Request ID
The corresponding HttpResponse will have the same ID
  
### GetRequestType function
Get request type.

  
**Returns**: Request type
  
### GetUrl function
Get request url.

  
**Returns**: Request url
  
### GetBody function
Get request body.

  
**Returns**: Request body
  
### GetHeaders function
Get request headers.

  
**Returns**: Request headers