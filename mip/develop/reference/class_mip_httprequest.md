---
title: class HttpRequest 
description: Documents the httprequest::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/23/2021
---

# class HttpRequest 
Interface that describes a single HTTP request.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetId() const  |  Gets request ID.
public HttpRequestType GetRequestType() const  |  Get request type.
public const std::string& GetUrl() const  |  Get request url.
public const std::vector\<uint8_t\>& GetBody() const  |  Get request body.
public const std::map\<std::string, std::string, CaseInsensitiveComparator\>& GetHeaders() const  |  Get request headers.
public TransportLayerSecurityMinimumVersion GetTransportLayerSecurityMinimumVersion() const  |  Get the minimum required TLS version for this request.
  
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
  
### GetTransportLayerSecurityMinimumVersion function
Get the minimum required TLS version for this request.

  
**Returns**: The minimum required TLS version the Http transport provider should be secured with.