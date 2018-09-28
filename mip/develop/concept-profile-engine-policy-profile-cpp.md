---
title: Concepts - The Policy API profile object
description: This article will help you understand the concepts around the Policy profile object, which is created during application initialization.
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 09/27/2018
ms.author: bryanla
---

# Microsoft Information Protection SDK - Policy API profile concepts

The `mip::Profile` must be loaded before any Policy API operations can be performed.

The two examples below show how to create the profileSettings object using local storage for state storage as well as in-memory only. Both assume that the `authDelegateImpl` object has already been created.

## Load a Profile

Now that the `ProfileObserver` and `AuthDelegateImpl` are defined, we'll use the them to instantiate `mip::Profile`. Creating the `mip::Profile` object requires [`mip::Profile::Settings`](reference/class_mip_Profile_settings.md).

### Profile::Settings Parameters

- `std::string path`: File path under which logging, telemetry, and other persistent state is stored.
- `bool useInMemoryStorage`: Defines whether or not all state should be stored in memory as opposed to on disk.
- `std::shared_ptr<mip::AuthDelegate> authDelegate`: A shared pointer of class `mip::AuthDelegate` 
- `std::shared_ptr<mip::Profile::Observer> observer`: A shared pointer to the `Profile::Observer` implementation.
- `mip::ApplicationInfo applicationInfo`: object. Used to define info regarding application that is consuming the SDK.

The two examples below show how to create the profileSettings object using local storage for state storage as well as in-memory only. Both assume that the `authDelegateImpl` object has already been created.

#### Store state in memory only

```cpp
Profile::Settings profileSettings("",
    true,
    authDelegateImpl,
    std::make_shared<ProfileObserver>(),
    mip::ApplicationInfo{ "MyClientId", "MyAppFriendlyName" });
```

#### Read/write profile settings from storage path on disk

```cpp
Profile::Settings profileSettings("./mip_app_data",
    false,
    authDelegateImpl,
    std::make_shared<ProfileObserver>(),
    mip::ApplicationInfo{ "MyClientId", "MyAppFriendlyName" });
```

Next, use the promise/future pattern to load the `Profile`.

```cpp
auto profilePromise = std::make_shared<std::promise<std::shared_ptr<Profile>>>();
auto profileFuture = profilePromise->get_future();
Profile::LoadAsync(profileSettings, profilePromise);
```

If a profile is successfully loaded, `ProfileObserver::OnLoadSuccess`, our implementation of `mip::Profile::Observer::OnLoadSuccess` is notified. The resulting object, in this case a `mip::Profile`, as well as the context, are passed in as parameters to the observer function.

The *context* is a pointer to the `std::promise` we created to handle the async operation. The function simply sets the value of the promise to the Profile object that was passed in for the first parameter. When the main function uses `Future.get()`, the result can be stored in a new object in the calling thread.

```cpp
//get the future value and store in profile. 
auto profile = profileFuture.get();
```

### Putting it Together

Having fully implemented the observers and authentication delegate, it's now possible to fully load a profile. The code snip below assumes all necessary headers are already included.

```cpp
int main()
{
    const string userName = "MyTestUser@consoto.com";
    const string password = "P@ssw0rd!";
    const string clientId = "MyClientId";
    auto authDelegateImpl = make_shared<sample::auth::AuthDelegateImpl>(userName, password, clientId);

    Profile::Settings profileSettings("", false, authDelegateImpl, std::make_shared<ProfileObserver>(), mip::ApplicationInfo{ "MyClientId", "MyAppFriendlyName" });

    auto profilePromise = std::make_shared<promise<shared_ptr<Profile>>>();
    auto profileFuture = profilePromise->get_future();
    Profile::LoadAsync(profileSettings, profilePromise);
    auto profile = profileFuture.get();
}
```

The end result being that we've successfully loaded the profile and stored in the object called `profile`.

## Next Steps

Now that the profile has been added, the next step is to add an engine to the profile.

[Policy engine concepts](concept-profile-engine-policy-engine-cpp.md)