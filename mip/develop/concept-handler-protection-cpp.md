---
title: Concepts - Protection handlers in the MIP SDK.
description: This article will help you understand how Protection SDK handlers are created and used for calling operations.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mbaldwin
---
# Microsoft Information Protection SDK - Protection handler concepts

In the MIP Protection SDK, the `mip::ProtectionHandler` exposes the functions for encrypting and decrypting protected streams and buffers, performing access checks, obtaining the publishing license, and getting attributes from the protected information.

## Requirements

Creating a `ProtectionHandler` to work with a specific file requires:

- A `mip::MipContext`
- A `mip::ProtectionProfile`
- A `mip::ProtectionEngine` added to the `ProtectionProfile`
- A class that inherits `mip::ProtectionHandler::Observer`.
- A `mip::ProtectionDescriptor` or publishing license

## Create a protection handler

`mip::ProtectionHandler` objects are constructed for either **protection** or **consumption** operations. The handler is created using one of four functions, depending on the scenario.

- `mip::ProtectionEngine->CreateProtectionHandlerForConsumptionAsync()`
- `mip::ProtectionEngine->CreateProtectionHandlerForConsumption()`
- `mip::ProtectionEngine->CreateProtectionHandlerForPublishingAsync()`
- `mip::ProtectionEngine->CreateProtectionHandlerForPublishing()`

These functions accept either a `mip::ProtectionHandler::PublishingSettings` or `mip::ProtectionHandler::ConsumptionSettings` object.

### Create a publishing handler

Creating a publishing handler requires three steps:

 1) Create a `mip::ProtectionDescriptor` object.
 2) Use the `mip::ProtectionDescriptor` to instantiate `mip::ProtectionHandler::PublishingSettings`.
 3) Call `mip::ProtectionEngine::CreateProtectionHandlerForPublishingAsync()` passing in the `PublishingSettings` object, observer, and promise.

#### Create from descriptor

If protecting content that hasn't yet been protected, or when applying new protection to content, which implies that it's been decrypted, a `mip::ProtectionDescriptor` must be constructed. Once constructed, it's used to instantiate the `mip::ProtectionHandler::PublishingSettings()` object.  The result is returned via the `mip::ProtectionHandler::Observer`.

```cpp
// Create the protection descriptor, passing in a templateId. 
auto descriptorBuilder = mip::ProtectionDescriptorBuilder::CreateFromTemplate(protectionOptions.templateId);
std::shared_ptr<mip::ProtectionDescriptor> descriptor = descriptorBuilder->Build();

// Define the handler promise, future, and observer.
auto handlerPromise = std::make_shared<std::promise<std::shared_ptr<ProtectionHandler>>>();
auto handlerFuture = handlerPromise->get_future();
auto handlerObserver = std::make_shared<ProtectionHandlerObserverImpl>();

// Create the PublishingSettings object using the previously-created descriptor as input.
mip::ProtectionHandler::PublishingSettings publishingSettings = mip::ProtectionHandler::PublishingSettings(descriptor);

// Create/get the publishing handler from the publishing settings, observer, and promise.
mEngine->CreateProtectionHandlerForPublishingAsync(publishingSettings, handlerObserver, handlerPromise);
auto handler = handlerFuture.get();
return handler;
```

After you successfully create the `ProtectionHandler` object, protection operations (encrypt/decrypt) can be performed. The **publishing license** must be fetched from the handler and stored with the encrypted content. The publishing license can be fetched by calling: `handler->GetSerializedPublishingLicense();`

Protected content without the corresponding publishing license **cannot be decrypted**.

### Create the consumption handler

Creating a publishing handler requires three steps:

 1) Extract a serialized publishing license as `std::vector<uint8_t>` from the protected content.
 2) Use the serialized publishing license to instantiate `mip::ProtectionHandler::ConsumptionSettings`.
 3) Call `mip::ProtectionEngine::CreateProtectionHandlerForConsumptionAsync()` passing in the `ConsumptionSettings` object, observer, and promise.

This example assumes that the publishing license has already been read from some source and stored in `std::vector<uint8_t> serializedPublishingLicense`.

```cpp
//TODO: Implement GetPublishingLicense()
//Snip implies that function reads PL from source file, database, stream, etc.
std::vector<uint8_t> serializedPublishingLicense = GetPublishingLicense(filePath);

// Define the handler promise, future, and observer.
auto handlerPromise = std::make_shared<std::promise<std::shared_ptr<ProtectionHandler>>>();
auto handlerFuture = handlerPromise->get_future();
shared_ptr<ProtectionHandlerObserverImpl> handlerObserver = std::make_shared<ProtectionHandlerObserverImpl>();

// Create the consumption settings object from the publishing license.
mip::ProtectionHandler::ConsumptionSettings consumptionSettings = mip::ProtectionHandler::ConsumptionSettings(serializedPublishingLicense);

// Create/get the publishing handler from the publishing settings, observer, and promise.
mEngine->CreateProtectionHandlerForConsumptionAsync(consumptionSettings, handlerObserver, handlerPromise);
auto handler = handlerFuture.get();
```