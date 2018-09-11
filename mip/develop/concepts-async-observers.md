---
title: Concepts - Observers in the MIP SDK.
description: The MIP SDK is designed to be almost entirely asynchronous. This article will help you understand how Observers are implemented and used for asynchronicity.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 09/10/2018
ms.author: bryanla
---
# Observers in the MIP SDK

## Summary

The MIP SDK is designed to be almost entirely asynchronous. Any operation resulting in network or file IO is performed asynchronously. To handle the event notifications for these asynchronous events, the SDK makes use of the [observer pattern](https://wikipedia.org/wiki/Observer_pattern). When constructing an object that will perform an asynchronous operation, an `Observer` class must be implemented. Observers will receive the notification events related to the various asynchronous operations in the MIP SDK, and provide the result to the caller.

Functions in each `Observer` class are virtual and should be overridden by the developer for the preferred asynchronous pattern. In each of our examples, we demonstrate this event notification observer pattern via `std::promise` and `std::future`.

Each class-specific observer contains a set of functions related to the possible success or failure outcomes of the async operation. *Success* functions return the object associated with the operation. *Failure* functions return an exception that contains details on why the operation was unsuccessful.

As an example, `FileProfile::Observer` can perform two operations: It can load a profile via `FileProfile::LoadAsync`, or it can load an engine via `FileProfile::AddEngineAsync`. Since we implement two `Observer` functions per asynchronous operation, it can be assumed that there are **four** `Observer` methods associated with `FileProfile`: `OnLoadSuccess()`, `OnLoadFailure()`, `OnAddEngineSuccess`, and `OnAddEngineFailure()`. 

## File API Observer Classes

The MIP SDK File API contains two observers:

* `mip::FileProfile::Observer`
* `mip::FileHandler::Observer`

## Policy API Observer Classes

The MIP SDK Policy API has just a single observer:

* `mip::Profile::Observer`

## Protection API Observer Classes

The MIP SDK Protection API has three observers:

* `mip::ProtectionProfile::Observer`
* `mip::ProtectionEngine::Observer`
* `mip::ProtectionHandler::Observer`

## Next Steps (TBD)

Learn more about how observers are implemented and used, by the various APIs:

* [File API Observers (C++)](concepts-async-observers-file-cpp.md)
* [Policy API Observers (C++)](concepts-async-observers-policy-cpp.md)
* [Protection API Observers (C++)](concepts-async-observers-protection-cpp.md)
