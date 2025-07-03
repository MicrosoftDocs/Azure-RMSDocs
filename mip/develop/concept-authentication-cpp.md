---
title: Concepts - Authentication in the MIP SDK.
description: This article will help you understand how the MIP SDK implements authentication, and the requirements for client applications to provide OAuth2 access token acquisition logic.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - Authentication concepts

Authentication in the MIP SDK is performed by extending the class `mip::AuthDelegate` to implement your preferred method of authentication. `mip::AuthDelegate` contains:

- `mip::AuthDelegate::OAuth2Challenge` - a class that manages the OAuth2 authority info and provides to the client application.
- `mip::AuthDelegate::OAuth2Token` - a class manages OAuth2 access token acquisition (from the client application) and token storage.
- `mip::AuthDelegate::AcquireOAuth2Token()` - a pure virtual function, whose implementation determines the method of access token acquisition. After being called by the SDK, it acquires the access token, then provides it back to the SDK's authentication logic.

`mip::AuthDelegate::AcquireOAuth2Token` accepts the following parameters, and returns a bool indicating whether token acquisition was successful:

- `mip::Identity`: The identity of the user or service to be authenticated, if known.
- `mip::AuthDelegate::OAuth2Challenge`: Accepts four parameters, **authority**, **resource**, **claims**, and **scopes**. **Authority** is the service the token will be generated against. **Resource** is the service we're trying to access. The SDK will handle passing these parameters into the delegate when called. **Claims** are the label-specific claims required by the protection service. **Scopes** are the Microsoft Entra permission scopes required to access the resource. 
- `mip::AuthDelegate::OAuth2Token`: The token result is written to this object. It will be consumed by the SDK when the engine is loaded. Outside of our authentication implementation, it shouldn't be necessary to get or set this value anywhere.

**Important:** Applications don't call `AcquireOAuth2Token` directly. The SDK will call this function when required.

## Next steps

For simplicity, samples demonstrating the delegate will implement token acquisition by calling an external script. This script can be replaced by any other type of script, an open-source OAuth2 library, or a custom OAuth2 library.

- [Acquire an access token using Python](concept-authentication-acquire-token-py.md)
