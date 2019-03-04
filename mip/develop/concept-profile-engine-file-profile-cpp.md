---
title: Concepts - The File API profile object
description: This article will help you understand the concepts around the File profile object, which is created during application initialization.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.date: 09/27/2018
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - File API profile concepts

The profile is the root class for all operations in the MIP SDK. Before using any of the File API functionality, a `FileProfile` must be created and all future operations will be performed by the profile or by other objects *added* to the profile.

There are a few code-prerequisites that should be met prior to attempting to instantiate a profile:

- `AuthDelegateImpl` is implemented to extend `mip::AuthDelegate`.
- `ConsentDelegateImpl` is implemented to extend `mip::ConsentDelegate`.
- The application has been [registered in Azure Active Directory](/azure/active-directory/develop/quickstart-v1-integrate-apps-with-azure-ad.md) and the client ID is hard-coded in to the application or configuration files. 
- A class inheriting `mip::FileProfile::Observer` has been appropriately implemented.

## Load a Profile

With the `ProfileObserver`, `ConsentDelegateImpl`, and `AuthDelegateImpl` defined, `mip::FileProfile` can now be instantiated. Creating the `mip::FileProfile` object requires [`mip::FileProfile::Settings`](reference/class_mip_fileprofile_settings.md) to store all of the settings information about the `FileProfile`.

### FileProfile::Settings Parameters

The `FileProfile::Settings` constructor accepts five parameters, listed below:

- `std::string path`: File path under which logging, telemetry, and other persistent state is stored.
- `bool useInMemoryStorage`: Defines whether or not all state should be stored in memory as opposed to on disk.
- `std::shared_ptr<mip::AuthDelegate> authDelegate`: A shared pointer of class `mip::AuthDelegate` 
- `std::shared_ptr<mip::ConsentDelegate>`: 
- `std::shared_ptr<mip::FileProfile::Observer> observer`: A shared pointer to the `FileProfile::Observer` implementation.
- `mip::ApplicationInfo applicationInfo`: object. Used to define info regarding application that is consuming the SDK.

The following examples show how to create the `profileSettings` object using local storage for state storage as well as in-memory only. Both assume that the `authDelegateImpl` object has already been created.

#### Store state in memory only

```cpp
FileProfile::Settings profileSettings(
    "",                                          //path to store settings
    true,                                        //useInMemoryStorage
    authDelegateImpl,                            //auth delegate object
    std::make_shared<ConsentDelegateImpl>(),     //new consent delegate
    std::make_shared<FileProfileObserverImpl>(), //new protection profile observer
    mip::ApplicationInfo{ "MyClientId", "MyAppFriendlyName" }); //ApplicationInfo object
```

#### Read/write profile settings from storage path on disk

The following code snip will instruct the `FileProfile` to store all app state data in `./mip_app_data`.

```cpp
FileProfile::Settings profileSettings(
    "./mip_app_data",                            //path to store settings
    false,                                       //useInMemoryStorage
    authDelegateImpl,                            //auth delegate object
    std::make_shared<ConsentDelegateImpl>(),     //new consent delegate
    std::make_shared<FileProfileObserverImpl>(), //new protection profile observer
    mip::ApplicationInfo{ "MyClientId", "MyAppFriendlyName" }); //ApplicationInfo object
```

#### Load the Profile

Using either approach details above, now use the promise/future pattern to load the `FileProfile`.

```cpp
auto profilePromise = std::make_shared<std::promise<std::shared_ptr<FileProfile>>>();
auto profileFuture = profilePromise->get_future();
FileProfile::LoadAsync(profileSettings, profilePromise);
```

If we've loaded a profile, and that operation was successful, `ProfileObserver::OnLoadSuccess`, our implementation of `mip::FileProfile::Observer::OnLoadSuccess` is called. The resulting object or exception pointer, as well as the context, are passed in as parameters to the function. The context is a pointer to the `std::promise` we created to handle the async operation. The function simply sets the value of the promise to the FileProfile object that was passed in for the first parameter. When the main function uses `Future.get()`, the result can be stored in a new object.

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

    FileProfile::Settings profileSettings("",
            false,
            authDelegateImpl,
            std::make_shared<ConsentDelegateImpl>(),
            std::make_shared<ProfileObserver>(),
            mip::ApplicationInfo{ "MyClientId", "MyAppFriendlyName" });

    auto profilePromise = std::make_shared<promise<shared_ptr<FileProfile>>>();
    auto profileFuture = profilePromise->get_future();
    FileProfile::LoadAsync(profileSettings, profilePromise);
    auto profile = profileFuture.get();
}
```

The end result being that we've successfully loaded the profile and stored in the object called `profile`.

## Next Steps

Now that the profile has been added, the next step is to add an engine to the profile. 

- [File engine concepts](concept-profile-engine-file-engine-cpp.md)
