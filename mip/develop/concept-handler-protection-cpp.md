---
title: Concepts - Protection handlers in the MIP SDK.
description: This article will help you understand how Protection API handlers are created and used for calling operations.
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.date: 09/27/2018
ms.author: bryanla
---
# Microsoft Information Protection SDK - Protection handler concepts

In the MIP SDK Protection API, the `mip::ProtectionHandler` exposes the functions for encrypting and decrypting protected streams and buffers, performing access checks, obtaining the publishing license, and getting attributes from the protected information. 

## Requirements

Creating a `ProtectionHandler` to work with a specific file requires:

- A `ProtectionProfile`
- A `ProtectionEngine` added to the `ProtectionProfile`
- A class that inherits `mip::ProtectionHandler::Observer`, similar to the pattern outlined [here]().
- A `mip::ProtectionDescriptor` or publishing license

## Create a protection handler

`mip::ProtectionHandler` objects are constructed by providing either a `ProtectionDescriptor` or a serialized publishing license to one of two `ProtectionEngine` functions. The protection descriptor must be generated for protecting plaintext information that doesn't already have a publishing license. The **publishing license** will be used when decrypting already-protected content or when protecting content where the license has already been constructed. Protected content cannot be decrypted without the associated publishing license.

`mip::ProtectionEngine` exposes two functions for creating a `ProtectionHandler`. The parameters are the same, with the exception of the handler or the publishing license as the first parameter.

- `mip::ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync`
  - Requires a `ProtectionDescriptor` as the first parameter.
- `mip::ProtectionEngine::CreateProtectionHandlerFromPublishingLicenseAsync`
  - Requires a serialized publishing license, stored in `std::vector<unint8_t>` as the first parameter.

### Create from descriptor

If protecting content that hasn't yet been protected, or when applying new protection to content, which implies that it's been decrypted, a `mip::ProtectionDescriptor` must be constructed. Once constructed, is passed in to `mip::ProtectionEngine::CreateProtectionHandlerFromDescriptorAsync()` and the result is returned via the `mip::ProtectionHandler::Observer`.

```cpp
auto handlerPromise = std::make_shared<std::promise<std::shared_ptr<ProtectionHandler>>>();
auto handlerFuture = handlerPromise->get_future();
auto observer = std::make_shared<ProtectionHandlerObserverImpl>();

//Refer to ProtectionDescriptor docs for details on creating the descriptor
auto descriptor = CreateProtectionDescriptor(); //Stub function

mEngine->CreateProtectionHandlerFromDescriptorAsync(
    descriptor,
    mip::ProtectionHandlerCreationOptions::None,
    observer,
    handlerPromise);

auto handler = handlerFuture.get();
```

After successfully creating the `ProtectionHandler` object, file operations (get/set/delete/commit) can be performed.

### Create from publishing license

This example assumes that the publishing license has already been read from some source and stored in `std::vector<uint8_t> serializedPublishingLicense`.

```cpp

//TODO: Implement GetPublishingLicense()
//Snip implies that function reads PL from source file, database, stream, etc.
std::vector<uint8_t> serializedPublishingLicense = GetPublishingLicense(filePath);

auto handlerPromise = std::make_shared<std::promise<std::shared_ptr<ProtectionHandler>>>();
auto handlerFuture = handlerPromise->get_future();

shared_ptr<ProtectionHandlerObserverImpl> handleObserver =
    std::make_shared<ProtectionHandlerObserverImpl>();

mEngine->CreateProtectionHandlerFromPublishingLicenseAsync(
    serializedPublishingLicense,
    mip::ProtectionHandlerCreationOptions::None,
    handleObserver,
    handlerPromise);

auto handler = handlerFuture.get();
```

