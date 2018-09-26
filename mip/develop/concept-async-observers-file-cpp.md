---
title: Concepts - File API observers in the MIP SDK.
description: The MIP SDK is designed to be almost entirely asynchronous. This article will help you understand how File API observers are implemented and used for asynchronicity.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 09/27/2018
ms.author: bryanla
---

# File API Observers

The File API contains two observer classes. Observer members are virtual and can be overridden to handle event callbacks.

- [`mip::FileProfile::Observer`](reference/class_mip_fileprofile_observer.md)
- [`mip::FileHandler::Observer`](reference/class_mip_filehandler_observer.md)

When an asynchronous operation completes, the `OnXxx()` member function corresponding to the result is called. Examples are `OnLoadSuccess()`, `OnLoadFailure()`, and `OnAddEngineSuccess()` for `mip::FileProfile::Observer`.

The examples below demonstrate the promise/future pattern, which is also used by the SDK samples, and can be extended to implement the desired callback behavior. 

## File Profile Observer Implementation

In the following example, we've created a class, `ProfileObserver` that is derived from `mip::FileProfile::Observer`. The member functions have been overridden to use the future/promise pattern used throughout the samples.

**Note**: The below samples are only partially implemented and do not include overrides for the `mip::FileEngine` related observers.

### profile_observer.h

In the header, we define `ProfileObserver`, deriving from `mip::FileProfile::Observer`, then override each of the member functions.

```cpp
class ProfileObserver final : public mip::FileProfile::Observer {
public:
ProfileObserver() { }
  void OnLoadSuccess(const std::shared_ptr<mip::FileProfile>& profile, const std::shared_ptr<void>& context) override;
  void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context) override;
  //TODO: Implement mip::FileEngine related observers.
};
```

### profile_observer.cpp

In the implementation itself, we define an action to take for each observer member function.

Each member accepts two parameters. The first is a shared pointer to the class we're handling in the function. `ProfileObserver::OnLoadSuccess` would expect to receive a `mip::FileProfile`. `ProfileObserver::OnAddEngineSuccess` would expect `mip::FileEngine`.

The second is a shared pointer to the *context*. In our implementation, the context is a reference to a `std::promise`, passed by reference as `std::shared_ptr<void>`. The first line of the function casts this to `std::promise`, then stored in an object called `promise`.

Finally, the future is made ready by setting the `promise->set_value()` and passing in the `mip::FileProfile` object.

```cpp
#include "profile_observer.h"
#include <future>

//Called when FileProfile is successfully loaded
void ProfileObserver::OnLoadSuccess(const std::shared_ptr<mip::FileProfile>& profile, const std::shared_ptr<void>& context) {
  //cast context to promise
  auto promise = 
  std::static_pointer_cast<std::promise<std::shared_ptr<mip::FileProfile>>>(context);
  //set promise value to profile
  promise->set_value(profile);
}

//Called when FileProfile fails to load
void ProfileObserver::OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context) {
  auto promise = std::static_pointer_cast<std::promise<std::shared_ptr<mip::FileProfile>>>(context);
  promise->set_exception(error);
}

//TODO: Implement mip::FileEngine related observers.
```

When we instantiate any SDK class or use a function that performs asynchronous operations, we will pass the observer implementation to the settings constructor or async function itself. When instantiating the `mip::FileProfile::Settings` object, the constructor takes in `mip::FileProfile::Observer` as one of the parameters. The example below shows our custom `ProfileObserver`, used in a  `mip::FileProfile::Settings` constructor.

## FileHandler Observer Implementation

Similar to the profile observer, the `mip::FileHandler` implements a `mip::FileHandler::Observers` class for handling asynchronous event notifications during file operations. The implementation is similar to that detailed above. `FileHandlerObserver` is partially defined below. The full implementation can be found in our [GitHub sample repo](). TODO: LINK

### file_handler_observer.h

```cpp
#include "mip/file/file_handler.h"

class FileHandlerObserver final : public mip::FileHandler::Observer {
public:
  void OnCreateFileHandlerSuccess(
      const std::shared_ptr<mip::FileHandler>& fileHandler,
      const std::shared_ptr<void>& context) override;

  void OnCreateFileHandlerFailure(
      const std::exception_ptr& error,
      const std::shared_ptr<void>& context) override;

  //TODO: override remaining member functions inherited from mip::FileHandler::Observer
};
```

### file_handler_observer.cpp

This sample is just the first two functions, but the remaining functions use a similar pattern to these and to `ProfileObserver`.

```cpp
#include "file_handler_observer.h"

void FileHandlerObserver::OnCreateFileHandlerSuccess(const std::shared_ptr<mip::FileHandler>& fileHandler, const std::shared_ptr<void>& context) {
    auto promise = std::static_pointer_cast<std::promise<std::shared_ptr<mip::FileHandler>>>(context);
    promise->set_value(fileHandler);
}

void FileHandlerObserver::OnCreateFileHandlerFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context) {
    auto promise = std::static_pointer_cast<std::promise<std::shared_ptr<mip::FileHandler>>>(context);
    promise->set_exception(error);
}

//TODO: override remaining member functions inherited from mip::FileHandler::Observer
```

## Next Steps

[TBD - Link to create a `mip::FileProfile`, load a `mip::FileEngine`, and perform file operations with `mip::FileHandler`.]()
