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

The MIP SDK is designed to be almost entirely asynchronous. Any operation resulting in network or file IO is performed asynchronously. To handle the event notifications for these asynchronous events, the SDK makes use of various `Observer` classes.

Functions in each `Observer` class are virtual and should be overridden by the developer for the preferred asynchronous pattern. In each of our examples, we demonstrate this event notification observer pattern via `std::promise` and `std::future`.

Each class-specific observer contains a set of functions related to the possible success or failure outcomes of the async operation. *Success* functions return the object associated with the operation. *Failure* functions return an exception that contains details on why the operation was unsuccessful.

As an example, `FileProfile::Observer` can perform two operations: It can load a profile via `FileProfile::LoadAsync`, or it can load an engine via `FileProfile::AddEngineAsync`. Since we implement two `Observer` functions per asynchronous operation, it can be assumed that there are **four** `Observer` methods associated with `FileProfile`: `OnLoadSuccess()`, `OnLoadFailure()`, `OnAddEngineSuccess`, and `OnAddEngineFailure()`. 

** (TBD) Is it pure virtual? **

## File API Observer Classes

MIP SDK File API contains two observers:

* `mip::FileProfile::Observer`
* `mip::FileHandler::Observer`

## Policy API Observer Classes

MIP SDK Policy API has just a single observer:

* `mip::Profile::Observer`

## Protection API Observer Classes

MIP SDK Protection API has

* `mip::ProtectionEngine::Observer`
* `mip::ProtectionHandler::Observer`

## Next Steps (TBD)

* File API Observers
* Policy API Observers
* Protection API Observers
* Implementation Examples