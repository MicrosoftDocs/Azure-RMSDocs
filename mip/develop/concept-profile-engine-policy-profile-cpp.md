---
title: Concepts - The Policy SDK profile object
description: This article will help you understand the concepts around the Policy profile object, which is created during application initialization.
author: msmbaldwin
ms.service: azure-information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - Policy SDK profile concepts

The `mip::Profile` must be loaded before any Policy SDK operations can be performed.

The two examples below show how to create the profileSettings object using local storage for state storage as well as in-memory only. 

## Load a Profile

Now that the `MipContext` and `ProfileObserver` are defined, we'll use the them to instantiate `mip::PolicyProfile`. Creating the `mip::PolicyProfile` object requires [`mip::PolicyProfile::Settings`](reference/class_mip_PolicyProfile_settings.md) and `mip::MipContext`.

### Profile::Settings Parameters

The `PolicyProfile::Settings` constructor accepts four parameters, listed below:

- `const std::shared_ptr<MipContext>`: The `mip::MipContext` object that was initialized to store application info, state path, etc.
- `mip::CacheStorageType`: Defines how to store state: In memory, on disk, or on disk and encrypted. For more details, see the [Cache storage concepts](concept-cache-storage.md).
- `std::shared_ptr<mip::PolicyProfile::Observer> observer`: A shared pointer to the profile `Observer` implementation (in [`PolicyProfile`](https://microsoftdocs.github.io/mip-sdk-docs/cpp/classPolicyProfile_1_1Observer.html), [`ProtectionProfile`](https://microsoftdocs.github.io/mip-sdk-docs/cpp/classFileProfile.html), and [`FileProfile`](https://microsoftdocs.github.io/mip-sdk-docs/cpp/classFileProfile_1_1Observer.html)).

The two examples below show how to create the profileSettings object using local storage for state storage as well as in-memory only. 

#### Store state in memory only

```cpp
mip::ApplicationInfo appInfo {clientId, "APP NAME", "1.2.3" };

std::shared_ptr<mip::MipConfiguration> mipConfiguration = std::make_shared<mip::MipConfiguration>(mAppInfo,
				                                                                                  "mip_data",
                                                                                        		  mip::LogLevel::Trace,
                                                                                                  false);

std::shared_ptr<mip::MipContext> mMipContext = mip::MipContext::Create(mipConfiguration);

PolicyProfile::Settings profileSettings(
    mMipContext,                                  // mipContext object
    mip::CacheStorageType::InMemory,              // use in memory storage
    std::make_shared<PolicyProfileObserverImpl>()); // new protection profile observer
```

#### Read/write profile settings from storage path on disk

```cpp
mip::ApplicationInfo appInfo {clientId, "APP NAME", "1.2.3" };

std::shared_ptr<mip::MipConfiguration> mipConfiguration = std::make_shared<mip::MipConfiguration>(mAppInfo,
			                                                                                      "mip_data",
                                                                                       			  mip::LogLevel::Trace,
                                                                                                  false);

std::shared_ptr<mip::MipContext> mMipContext = mip::MipContext::Create(mipConfiguration);

PolicyProfile::Settings profileSettings(
    mipContext,                                    // mipContext object
    mip::CacheStorageType::OnDisk,                 // use on disk storage
    std::make_shared<PolicyProfileObserverImpl>());  // new protection profile observer
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

    mip::ApplicationInfo appInfo {clientId, "APP NAME", "1.2.3" };
 
    std::shared_ptr<mip::MipConfiguration> mipConfiguration = std::make_shared<mip::MipConfiguration>(mAppInfo,
				                                                                                       "mip_data",
                                                                                        			   mip::LogLevel::Trace,
                                                                                                       false);

    std::shared_ptr<mip::MipContext> mMipContext = mip::MipContext::Create(mipConfiguration);

    PolicyProfile::Settings profileSettings(
        mMipContext,                                    // mipContext object
        mip::CacheStorageType::OnDisk,                 // use on disk storage
        std::make_shared<PolicyProfileObserverImpl>());  // new protection profile observer

    auto profilePromise = std::make_shared<promise<shared_ptr<PolicyProfile>>>();
    auto profileFuture = profilePromise->get_future();
    Profile::LoadAsync(profileSettings, profilePromise);
    auto profile = profileFuture.get();
}
```

The end result being that we've successfully loaded the profile and stored in the object called `profile`.

## Next Steps

Now that the profile has been added, the next step is to add an engine to the profile.

[Policy engine concepts](concept-profile-engine-policy-engine-cpp.md)
