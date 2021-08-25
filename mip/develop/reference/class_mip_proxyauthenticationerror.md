---
title: class ProxyAuthenticationError 
description: Documents the proxyauthenticationerror::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 08/23/2021
---

# class ProxyAuthenticationError 
Proxy authentication failure.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public Category GetCategory() const  |  Gets the category of network failure.
public int32_t GetResponseStatusCode() const  |  Gets the HTTP response status code.
enum Category  |  Category of network error.
  
## Members
  
### GetCategory function
Gets the category of network failure.

  
**Returns**: Category of network failure
  
### GetResponseStatusCode function
Gets the HTTP response status code.

  
**Returns**: HTTP response status code, 0 if none
  
### Category enum

Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Unknown            | Unknown network failure
FailureResponseCode            | HTTP response code indicates failure
BadResponse            | HTTP response could not be read
UnexpectedResponse            | HTTP response completed but contained unexpected data
NoConnection            | Failed to establish a connection
Proxy            | Proxy failure
SSL            | SSL failure
Timeout            | Connection timed out
Offline            | Operation requires network connectivity
Throttled            | HTTP operation failed due to server traffic throttling
Cancelled            | HTTP operation has been cancelled by the application
FunctionNotImplemented            | HTTP response code indicates called function is not implemented

Category of network error.