---
title: class AuthDelegate::OAuth2Token 
description: Documents the authdelegate::oauth2token class of the Microsoft Information Protection SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/15/2021
---

# class AuthDelegate::OAuth2Token 
A class containing access token info provided by an application.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public OAuth2Token()  |  Construct a new OAuth2Token object.
public OAuth2Token(const std::string& accessToken)  |  Construct a new OAuth2Token object from JWT access token.
public const std::string& GetAccessToken() const  |  Get the access token string.
public void SetAccessToken(const std::string& accessToken)  |  Set the access token string.
public const std::string& GetErrorMessage() const  |  Get the error message, if any.
public void SetErrorMessage(const std::string& errorMessage)  |  Set the error message.
  
## Members
  
### OAuth2Token function
Construct a new OAuth2Token object.
  
### OAuth2Token function
Construct a new OAuth2Token object from JWT access token.

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

  
**Returns**: Error message.
  
### SetErrorMessage function
Set the error message.

Parameters:  
* **errorMessage**: Error message.



