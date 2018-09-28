---
title: Concepts - The Protection API engine object
description: This article will help you understand the concepts around the Protection engine object, which is created during application initialization.
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 09/27/2018
ms.author: bryanla
---

# Microsoft Information Protection SDK - Protection API engine concepts

## Implementation: Add a Protection Engine

In the File API, the `mip::ProtectionProfile` class is the root class for all SDK operations. Having already created the profile, we can now add an engine to the profile.

The example below demonstrates using a single engine for a single authenticated user.

### Implementation: Create Protection Engine Settings

Similar to a profile, the engine also requires a settings object, `mip::ProtectionEngine::Settings`. This object stores the unique engine identifier, customizable client data that can be used for debugging or telemetry, and, optionally, the locale.

Here we create a `ProtectionEngine::Settings` object called *engineSettings*. 

```cpp
ProtectionEngine::Settings engineSettings("UniqueID", "");
```

**Note**: If using this method to create the protection settings object, you must also manually set the CloudEndpointBaseUrl to https://api.aadrm.com

As a best practice, the first parameter, **id**, should be something that allows the engine to be easily connected to the associated user, **or** a `mip::Identity` object. To initialize the settings with `mip::Identity`:

```cpp
ProtectionEngine::Settings engineSettings(mip::Identity("Bob@Contoso.com", "");
```

Though generally you'd pass in a variable to identity rather than hard code.

### Implementation: Add the Protection Engine

To add the engine, we'll go back to the future/promise pattern used to load the profile. Instead of creating the promise for `mip::ProtectionProfile`, we'll use `mip::ProtectionEngine`.

```cpp

  //auto profile will be std::shared_ptr<mip::ProtectionProfile>
  auto profile = profileFuture.get();

  //Create the ProtectionEngine::Settings object
  ProtectionEngine::Settings engineSettings("UniqueID", "");

  //Create a promise for std::shared_ptr<mip::ProtectionEngine>
  auto enginePromise = std::make_shared<std::promise<std::shared_ptr<mip::ProtectionEngine>>>();

  //Instantiate the future from the promise
  auto engineFuture = enginePromise->get_future();

  //Add the engine using AddEngineAsync, passing in the engine settings and the promise
  profile->AddEngineAsync(engineSettings, enginePromise);

  //get the future value and store in std::shared_ptr<mip::ProtectionEngine>
  auto engine = engineFuture.get();
```

The end result of the code above is that we've successfully added an engine for the authenticated user to the profile.

## Implementation: List Templates

Using the added engine, it's now possible to list all of the sensitivity templates available to the authenticated user by calling `engine->GetTemplatesAsync()`. 

`GetTemplatesAsync()` will fetch the list of templates identifiers. The result is stored in a vector of `std::shared_ptr<std::string>`.

### Implementation: ListSensitivityTemplates()

```cpp
auto loadPromise = std::make_shared<std::promise<shared_ptr<vector<string>>>>();
std::future<std::shared_ptr<std::vector<std::string>>> loadFuture = loadPromise->get_future();
mEngine->GetTemplatesAsync(engineObserver, loadPromise);
auto templates = loadFuture.get();
```

### Implementation: Print the Template Ids

```cpp
//Iterate through all template IDs in the vector
for (const auto& temp : *templates) {
  cout << "Template:" << "\n\tId: " << temp << endl;
}
```

Printing the names is an easy way to show that we successfully pulled policy from the service and were able to get the templates. To apply the template, the template identifier is required.

Mapping templates to labels can only be done via Policy API by examining the result of `ComputeActions()`.

