---
title: Concepts - The Protection API profile object
description: This article will help you understand the concepts around the Protection profile object, which is created during application initialization.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.date: 09/27/2018
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - Protection API profile concepts

The two examples below show how to create the profileSettings object using local storage for state storage as well as in-memory only. Both assume that the `authDelegateImpl` object has already been created.

## Load a Profile

Now that the `ProtectionProfileObserverImpl` and `AuthDelegateImpl` are defined, we'll use the them to instantiate `mip::ProtectionProfile`. Creating the `mip::ProtectionProfile` object requires [`mip::ProtectionProfile::Settings`](reference/class_mip_ProtectionProfile_settings.md).

### ProtectionProfile::Settings Parameters

- `std::shared_ptr<MipContext>`: The `mip::MipContext` object that was initialized to store application info, state path, etc.
- `mip::CacheStorageType`: Defines how to store state: In memory, on disk, or on disk and encrypted.
- `std::shared_ptr<mip::AuthDelegate>`: A shared pointer of class `mip::AuthDelegate`.
- `std::shared_ptr<mip::ConsentDelegate>`: A shared pointer of class [`mip::ConsentDelegate`](reference/class_mip_consentdelegate.md).
- `std::shared_ptr<mip::ProtectionProfile::Observer> observer`: A shared pointer to the profile `Observer` implementation (in [`PolicyProfile`](reference/class_mip_policyprofile_observer.md), [`ProtectionProfile`](reference/class_mip_protectionprofile_observer.md), and [`FileProfile`](reference/class_mip_fileprofile_observer.md)).

The two examples below show how to create the profileSettings object using local storage for state storage as well as in-memory only. Both assume that the `authDelegateImpl` object has already been created.

#### Store state in memory only

```cpp
mip::ApplicationInfo appInfo {clientId, "APP NAME", "1.2.3" };

mMipContext = mip::MipContext::Create(appInfo,
                "mip_app_data",
                mip::LogLevel::Trace,
                nullptr /*loggerDelegateOverride*/,
                nullptr /*telemetryOverride*/);

ProtectionProfile::Settings profileSettings(
    mipContext,                                        // mipContext object
    mip::CacheStorageType::InMemory,                   // use in memory storage
    authDelegateImpl,                                  // auth delegate object
    std::make_shared<ConsentDelegateImpl>(),           // new consent delegate
    std::make_shared<ProtectionProfileObserverImpl>()); // new protection profile observer
```

#### Read/write profile settings from storage path on disk

```cpp
mip::ApplicationInfo appInfo {clientId, "APP NAME", "1.2.3" };

mMipContext = mip::MipContext::Create(appInfo,
                "mip_app_data",
                mip::LogLevel::Trace,
                nullptr /*loggerDelegateOverride*/,
                nullptr /*telemetryOverride*/);

ProtectionProfile::Settings profileSettings(
    mipContext,                                         // mipContext object
    mip::CacheStorageType::OnDisk,                      // use on disk storage
    authDelegateImpl,                                   // auth delegate object
    std::make_shared<ConsentDelegateImpl>(),            // new consent delegate
    std::make_shared<ProtectionProfileObserverImpl>()); // new protection profile
```

Next, use the promise/future pattern to load the `ProtectionProfile`.

```cpp
auto profilePromise = std::make_shared<std::promise<std::shared_ptr<ProtectionProfile>>>();
auto profileFuture = profilePromise->get_future();
ProtectionProfile::LoadAsync(profileSettings, profilePromise);
```

If we've loaded a profile, and that operation was successful, `ProtectionProfileObserverImpl::OnLoadSuccess`, our implementation of `mip::ProtectionProfile::Observer::OnLoadSuccess` is called. The resulting object or exception pointer, as well as the context, are passed in as parameters to the function. The context is a pointer to the `std::promise` we created to handle the async operation. The function simply sets the value of the promise to the ProtectionProfile object (context). When the main function uses `Future.get()`, the result can be stored in a new object.

```cpp
//get the future value and store in profile.
auto profile = profileFuture.get();
```

### Putting it Together

Having fully implemented the observers and authentication delegate, it's now possible to fully load a profile. The code snip below assumes all necessary headers are already included.

```cpp
int main()
{
    const string userName = "MyTestUser@contoso.com";
    const string password = "P@ssw0rd!";
    const string clientId = "MyClientId";

    mip::ApplicationInfo appInfo {clientId, "APP NAME", "1.2.3" };

    auto authDelegateImpl = std::make_shared<sample::auth::AuthDelegateImpl>(appInfo, userName, password);

    auto mipContext = mip::MipContext::Create(appInfo,
                        "mip_app_data",
                        mip::LogLevel::Trace,
                        nullptr /*loggerDelegateOverride*/,
                        nullptr /*telemetryOverride*/);

    ProtectionProfile::Settings profileSettings(
        mipContext,                                    // mipContext object
        mip::CacheStorageType::OnDisk,                 // use on disk storage
        authDelegateImpl,                              // auth delegate object
        std::make_shared<ConsentDelegateImpl>(),       // new consent delegate
        std::make_shared<ProfileObserver>());          // new protection profile observer

    auto profilePromise = std::make_shared<promise<shared_ptr<ProtectionProfile>>>();
    auto profileFuture = profilePromise->get_future();
    ProtectionProfile::LoadAsync(profileSettings, profilePromise);
    auto profile = profileFuture.get();
}
```

The end result being that we've successfully loaded the profile and stored in the object called `profile`.

## Next Steps

Now that the profile has been added, the next step is to add an engine to the profile.

[Protection engine concepts](concept-profile-engine-protection-engine-cpp.md)
