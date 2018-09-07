---
title: Quickstart - Authentication and initialization for Microsoft Information Protection (MIP) SDK C++ clients
description: A quickstart showing you how to write the authentication and intitialization logic for a Microsoft Information Protection (MIP) SDK clients.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: quickstart
ms.date: 09/10/2018
ms.author: bryanla
---

# Quickstart: Authentication and initialization (C++)

This quickstart illustrates the patterns used by MIP SDK clients for authentication and initialization. The steps outlined in this quickstart are required for any client application that uses the MIP File, Policy, or Protection APIs.

[!NOTE]
> Although this quickstart uses File API examples, this same pattern is applicable to clients using the Policy and Protection APIs.

Perhaps use https://github.com/tommoser/build-ILL-mip-sdk/wiki/Build-2018-Workshop-Instructions 

## Prerequisites

If you haven't already, complete the steps in [Microsoft Information Protection (MIP) SDK setup and configuration](setup-configure-mip.md) before continuing.

## Authentication and observers

### Authentication delegate

Authentication in the MIP SDK is performed by extending the class `mip::AuthDelegate` to implement your preferred method of authentication.

`mip::AuthDelegate` contains two classes:

- `mip::AuthDelegate::OAuth2Challenge`
- `mip::AuthDelegate::OAuth2Token`

`AuthDelegate` has a virtual function called `mip::AuthDelegate::AcquireOAuth2Token`. This virtual function should be extended by developers to use their preferred method of access token acquisition. 

`mip::AuthDelegate::AcquireOAuth2Token` accepts three parameters:

- `mip::Identity`: The identity of the user or service to be authenticated, if known.
- `mip::AuthDelegate::OAuth2Challenge`: Accepts two parameters, **authority** and **resource**. **Authority** is the service the token will be generated against. **Resource** is the service we're trying to access. The SDK will handle passing these parameters in to the delegate when called.
- `mip::AuthDelegate::OAuth2Token`: We will write the token result to this object. It will be consumed by the SDK when the engine is loaded. Outside of our authentication implementation, it shouldn't be necessary to get or set this value anywhere.

`AcquireOAuth2Token` returns a bool that indicates whether token acquisition was successful.

**Important:** Applications won't ever have to call `AcquireOAuth2Token` directly. The SDK will call this on the auth delegate implementation when required.


### Implement an authentication delegate 

## Profile creation

## Engine creation

## Next Steps

Now you're ready for the next quickstart, where you'll start to experience the MIP File APIs.

> [!div class="nextstepaction"]
> [List sensitivity labels](quick-file-list-labels-cpp.md)