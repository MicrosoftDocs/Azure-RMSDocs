---
title: Concepts - Policy API observers in the MIP SDK.
description: The MIP SDK is designed to be almost entirely asynchronous. This article will help you understand how Policy API observers are implemented and used for asynchronicity.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.date: 09/27/2018
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - Policy API Observers

The Policy API SDK contains one observer class. Observer members are virtual and should be overridden to handle callbacks for asynchronous operations.

- [`mip::PolicyProfile::Observer`](reference/class_mip_policyprofile_observer.md)

When an asynchronous operation completes, the `OnXxx()` member function corresponding to the result is called. Examples are `OnLoadSuccess()`, `OnLoadFailure()`, and `OnAddEngineSuccess()` for `mip::Profile::Observer`.

The examples below demonstrate the promise/future pattern, which is also used by the SDK samples, and can be extended to implement the desired callback behavior. 

## Profile Observer Implementation

In the following example, we've created a class, `ProfileObserver` that is derived from `mip::Profile::Observer`. The member functions have been overridden to use the future/promise pattern used throughout the samples.

**Note**: The below samples are only partially implemented and do not include overrides for the `mip::ProfileEngine` related observers.

### profile_observer.h

In the header, we define `ProfileObserver`, deriving from `mip::Profile::Observer`, then override each of the member functions.

```cpp
class ProfileObserver final : public mip::Profile::Observer {
public:
ProfileObserver() { }
  void OnLoadSuccess(const std::shared_ptr<mip::Profile>& profile, const std::shared_ptr<void>& context) override;
  void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context) override;
  //TODO: Implement remaining members
};
```

### profile_observer.cpp

In the implementation itself, we define an action to take for each observer member function.

Each member accepts two parameters. The first is a shared pointer to the class handled by the function. `ProfileObserver::OnLoadSuccess` would expect to receive a `mip::Profile`. `ProfileObserver::OnAddEngineSuccess` would expect `mip::ProfileEngine`.

The second is a shared pointer to the *context*. In our implementation the context is a reference to a `std::promise`, passed in as `shared_ptr<void>`. The first line of the function casts this to `std::promise`, then stored in an object called `promise`.

Finally, the future is made ready by setting the `promise->set_value()` and passing in the `mip::Profile` object.

```cpp
#include "profile_observer.h"
#include <future>

//Called when Profile is successfully loaded
void ProfileObserver::OnLoadSuccess(const std::shared_ptr<mip::Profile>& profile, const std::shared_ptr<void>& context) {
  //cast context to promise
  auto promise = std::static_pointer_cast<std::promise<std::shared_ptr<mip::Profile>>>(context);
  //set promise value to profile
  promise->set_value(profile);
}

//Called when Profile fails to load
void ProfileObserver::OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context) {
  auto promise = std::static_pointer_cast<std::promise<std::shared_ptr<mip::Profile>>>(context);
  promise->set_exception(error);
}

//TODO: Implement remaining observer members
```

When performing any asynchronous operation, the observer implementation is passed to the settings constructor or async function itself. 

