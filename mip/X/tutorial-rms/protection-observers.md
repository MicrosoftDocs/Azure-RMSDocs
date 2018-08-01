# Protection API Observers

- [Protection API Observers](#protection-api-observers)
  - [Summary](#summary)
  - [Observer Classes](#observer-classes)
  - [Protection Protection Observer Implementation](#protection-protection-observer-implementation)
    - [ProtectionProfileObserverImpl Class Declaration](#protectionprofileobserverimpl-class-declaration)
    - [ProtectionProfileObserverImpl Implementation](#protectionprofileobserverimpl-implementation)
  - [ProtectionHandler Observer Implementation](#protectionhandler-observer-implementation)
    - [ProtectionHandlerObserverImpl Class Declaration](#protectionhandlerobserverimpl-class-declaration)
    - [ProtectionHandlerObserverImpl Partial Implementation](#protectionhandlerobserverimpl-partial-implementation)
  - [Next Steps](#next-steps)

## Summary

The MIP SDK makes use of various observers for to implement asynchronous operations. When constructing an object that will be loaded or added via an asynchronous operation, an `Observer` must be provided. Observers will receive the notification events related to the asynchronous operations and provide the result to the caller.

The included observers can be extended to implement the desired callback behavior. The SDK samples are implemented via future/promise and the implementations below will demonstrate that pattern.

## Observer Classes

The Protection API contains three observer classes. Observer members are virtual and can be overridden to handle callbacks for asynchronous operations.

- [Protection Profile: `mip::ProtectionProfile::Observer`](https://docs.microsoft.com/en-us/azure/information-protection/develop/mip/class_mip_ProtectionProfile_observer)
- [Protection Engine: `mip::ProtectionEngine::Observer`](https://docs.microsoft.com/en-us/azure/information-protection/develop/mip/class_mip_ProtectionEngine_observer)
- [Protection Handler: `mip::ProtectionHandler::Observer`](https://docs.microsoft.com/en-us/azure/information-protection/develop/mip/class_mip_Protectionhandler_observer)


When an asynchronous operation completes, the member function corresponding to the result is called. Examples are `OnLoadSuccess()`, `OnLoadFailure()`, and `OnAddEngineSuccess()` for `mip::ProtectionProfile::Observer`.

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

With the `ProtectionProfileObserverImpl` and `ProtectionHandlerObserverImpl` defined, we can now move on to using these observers to create a `mip::ProtectionProfile`, load a `mip::ProtectionEngine`, and perform Protection operations with `mip::ProtectionHandler`.

[Link to the next step]()