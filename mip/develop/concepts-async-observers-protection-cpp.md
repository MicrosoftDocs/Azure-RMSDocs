---
title: Concepts - Protection API observers in the MIP SDK.
description: The MIP SDK is designed to be almost entirely asynchronous. This article will help you understand how Protection API observers are implemented and used for asynchronicity.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 09/10/2018
ms.author: bryanla
---

# Protection API Observers

The Protection API contains three observer classes. Observer members are virtual and can be overridden to handle callbacks for asynchronous operations.

- [Protection Profile: `mip::ProtectionProfile::Observer`](reference/class_mip_ProtectionProfile_observer)
- [Protection Engine: `mip::ProtectionEngine::Observer`](reference/class_mip_ProtectionEngine_observer)
- [Protection Handler: `mip::ProtectionHandler::Observer`](reference/class_mip_Protectionhandler_observer)

When an asynchronous operation completes, the `OnXxx()` member function corresponding to the result is called. Examples are `OnLoadSuccess()`, `OnLoadFailure()`, and `OnAddEngineSuccess()` for `mip::ProtectionProfile::Observer`.

The examples below demonstrate the promise/future pattern, which is also used by the SDK samples, and can be extended to implement the desired callback behavior. 

## Protection Protection Observer Implementation

In the following example, we've created a class, `ProtectionProfileObserverImpl` that is derived from `mip::ProtectionProfile::Observer`. The member functions have been overridden to use the promise/future pattern used throughout the samples.

### ProtectionProfileObserverImpl Class Declaration

In the header, we define `ProtectionProfileObserverImpl`, deriving from `mip::ProtectionProfile::Observer`, then override each of the member functions.

```cpp
//ProtectionProfileObserverImpl.h
class ProtectionProfileObserverImpl final : public mip::ProtectionProfile::Observer {
public:
  ProtectionProfileObserverImpl() { }
  void OnLoadSuccess(const shared_ptr<mip::ProtectionProfile>& profile, const shared_ptr<void>& context) override;
  void OnLoadFailure(const exception_ptr& error, const shared_ptr<void>& context) override;
  void OnAddEngineSuccess(const shared_ptr<mip::ProtectionEngine>& engine, const shared_ptr<void>& context) override;
  void OnAddEngineError(const exception_ptr& error, const shared_ptr<void>& context) override;
};
```

### ProtectionProfileObserverImpl Implementation

In the implementation itself, we simply define an action to take for each observer member function.

Each member accepts two parameters. The first is a shared pointer to the class we're handling in the function. `ProtectionObserver::OnLoadSuccess` would expect to receive a `mip::ProtectionProtection`, `ProtectionObserver::OnAddEngineSuccess` would expect `mip::ProtectionEngine`.

The second is a shared pointer to the *context*. In our implementation the context is a reference to a `std::promise`, passed in as `shared_ptr<void>`. The first line of the function casts this to `std::promise`, then stored in an object called `promise`.

Finally, the future is made ready by setting the `promise->set_value()` and passing in the `mip::ProtectionProtection` object.

```cpp
//protection_observers.cpp

void ProtectionProfileObserverImpl::OnLoadSuccess(
  const shared_ptr<mip::ProtectionProfile>& profile,
  const shared_ptr<void>& context) {
  auto loadPromise = static_cast<promise<shared_ptr<mip::ProtectionProfile>>*>(context.get());
  loadPromise->set_value(profile);
};

void ProtectionProfileObserverImpl::OnLoadFailure(const exception_ptr& error, const shared_ptr<void>& context) {
  auto loadPromise = static_cast<promise<shared_ptr<mip::ProtectionProfile>>*>(context.get());
  loadPromise->set_exception(error);
};

void ProtectionProfileObserverImpl::OnAddEngineSuccess(
  const shared_ptr<mip::ProtectionEngine>& engine,
  const shared_ptr<void>& context) {
  auto addEnginePromise = static_cast<promise<shared_ptr<mip::ProtectionEngine>>*>(context.get());
  addEnginePromise->set_value(engine);
};

void ProtectionProfileObserverImpl::OnAddEngineError(
  const exception_ptr& error,
  const shared_ptr<void>& context) {
  auto addEnginePromise = static_cast<promise<shared_ptr<mip::ProtectionEngine>>*>(context.get());
  addEnginePromise->set_exception(error);
};
```

When we instantiate any SDK class or use a function that performs asynchronous operations, we will pass the observer implementation to the settings constructor or async function itself. When instantiating the `mip::ProtectionProfile::Settings` object, the constructor takes in `mip::ProtectionProfile::Observer` as one of the parameters. The example below shows our custom `ProtectionProfileObserverImpl`, used in a  `mip::ProtectionProfile::Settings` constructor.

## ProtectionHandler Observer Implementation

Similar to the Protection observer, `mip::ProtectionHandler` implements a `mip::ProtectionHandler::Observer` class for handling asynchronous event notifications during protection operations. The implementation is similar to that detailed above. `ProtectionHandlerObserverImpl` is partially defined below. The full implementation can be found in our [GitHub sample repo]().

### ProtectionHandlerObserverImpl Class Declaration

```cpp
//protection_observers.h

class ProtectionHandlerObserverImpl final : public mip::ProtectionHandler::Observer {
public:
  ProtectionHandlerObserverImpl() { }
  void OnCreateProtectionHandlerSuccess(const shared_ptr<mip::ProtectionHandler>& protectionHandler, const shared_ptr<void>& context) override;
  void OnCreateProtectionHandlerError(const exception_ptr& error, const shared_ptr<void>& context) override;
};
```

### ProtectionHandlerObserverImpl Partial Implementation

This sample is just the first two functions, but the remaining functions use a similar pattern to these and to `ProtectionObserver`.

```cpp
//protection_observers.cpp

void ProtectionHandlerObserverImpl::OnCreateProtectionHandlerSuccess(
  const shared_ptr<mip::ProtectionHandler>& protectionHandler,
  const shared_ptr<void>& context) {
  auto createProtectionHandlerPromise = static_cast<promise<shared_ptr<mip::ProtectionHandler>>*>(context.get());
  createProtectionHandlerPromise->set_value(protectionHandler);
};

void ProtectionHandlerObserverImpl::OnCreateProtectionHandlerError(
  const exception_ptr& error,
  const shared_ptr<void>& context) {
  auto createProtectionHandlerPromise = static_cast<promise<shared_ptr<mip::ProtectionHandler>>*>(context.get());
  createProtectionHandlerPromise->set_exception(error);
};
```

## Next Steps

[TBD - Link to create a `mip::ProtectionProfile`, load a `mip::ProtectionEngine`, and perform Protection operations with `mip::ProtectionHandler`]()