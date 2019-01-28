---
title: Concepts - Observers in the MIP SDK.
description: The MIP SDK is designed to be almost entirely asynchronous. This article will help you understand how Observers are implemented and used for asynchronicity.
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 09/27/2018
ms.author: bryanla
---
# Microsoft Information Protection SDK - Observer concepts

The MIP SDK is designed to be almost entirely asynchronous. For example, any operation resulting in network or file IO is performed asynchronously. To handle the event notifications for these asynchronous events, the SDK makes use of the [observer pattern](https://wikipedia.org/wiki/Observer_pattern). 

## Implementation overview

When constructing an object that will perform an asynchronous operation, an `Observer` class must be implemented. Observers will receive the notification events related to the various asynchronous operations in the MIP SDK, and provide the result to the caller.

Functions in each `Observer` class are virtual and are overridden for the preferred asynchronous pattern. The SDK implements the event notification observer pattern via `std::promise` and `std::future`.

Each class-specific observer contains a set of success and error/failure functions, for the outcome of an async operation. *Success* functions return the object associated with the operation. *Error*/*Failure* functions return an exception that contains details on why the operation was unsuccessful.

As an example, `FileProfile` supports the following two operations: 

- It can add a new engine to the profile via `FileProfile::AddEngineAsync`. 
- It can unload an engine from the profile via `FileProfile::UnloadEngineAsync`.

Since two `Observer` functions are implemented per asynchronous operation, it can be assumed that there are **four** `Observer` methods associated with `FileProfile`: 

- `FileProfileObserver::OnAddEngineSuccess()`
- `FileProfileObserver::OnAddEngineError()`
- `FileProfileObserver::OnUnloadEngineSuccess`
- `FileProfileObserver::OnUnloadEngineError()`. 

## MIP SDK Observer Classes

The MIP SDK File API contains two observers:

* `mip::FileProfile::Observer`
* `mip::FileHandler::Observer`

The MIP SDK Policy API has just a single observer:

* `mip::Profile::Observer`

The MIP SDK Protection API has three observers:

* `mip::ProtectionProfile::Observer`
* `mip::ProtectionEngine::Observer`
* `mip::ProtectionHandler::Observer`

## Next Steps

Learn more about how observers are implemented and used, by the various APIs:

* [File API Observers (C++)](concept-async-observers-file-cpp.md)
* [Policy API Observers (C++)](concept-async-observers-policy-cpp.md)
* [Protection API Observers (C++)](concept-async-observers-protection-cpp.md)
