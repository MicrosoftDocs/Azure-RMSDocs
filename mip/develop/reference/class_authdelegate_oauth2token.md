---
title: class AuthDelegate::OAuth2Token 
description: Documents the authdelegate::oauth2token class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 09/21/2020
---

# class AuthDelegate::OAuth2Token 
A class containing access token info provided by an application.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public OAuth2Token()  |  Construct a new [OAuth2Token](undefined) object.
public OAuth2Token(const std::string& accessToken)  |  Construct a new [OAuth2Token](undefined) object from JWT access token.
public const std::string& GetAccessToken() const  |  Get the access token string.
public void SetAccessToken(const std::string& accessToken)  |  Set the access token string.
public const std::string& GetErrorMessage() const  |  Get the error message, if any.
public void SetErrorMessage(const std::string& errorMessage)  |  Set the error message.
  
## Members
  
### OAuth2Token function
Construct a new [OAuth2Token](undefined) object.
  
### OAuth2Token function
Construct a new [OAuth2Token](undefined) object from JWT access token.

Parameters:  
* **accessToken**: JWT access token.


  
### GetAccessToken function
Get the access token string.

  
**Returns**: Access token string.
  
### SetAccessToken function
Set the access token string.

Parameters:  
* **accessToken**: Access token string.


  
### GetErrorMessage function
Get the error message, if any.

  
**Returns**: [Error](undefined) message.
  
### SetErrorMessage function
Set the error message.

Parameters:  
* **errorMessage**: [Error](undefined) message.

