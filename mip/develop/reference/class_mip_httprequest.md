---
title: class mip::HttpRequest 
description: Documents the mip::httprequest class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::HttpRequest 
Interface that describes a single HTTP request.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public HttpRequestType GetRequestType() const  |  Get request type.
public const std::string& GetUrl() const  |  Get request url.
public const std::string& GetBody() const  |  Get request body.
public const std::map\<std::string, std::string, CaseInsensitiveComparator\>& GetHeaders() const  |  Get request headers.
  
## Members
  
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
