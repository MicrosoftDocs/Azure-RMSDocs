---
title: Concepts - The Policy SDK engine object
description: This article will help you understand the concepts around the Policy engine object, which is created during application initialization.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 07/30/2019
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - Policy SDK engine concepts

`mip::PolicyEngine` implements all operations that the Policy SDK can perform, with the exception of loading the profile.

## Implementation: Add a Policy Engine

### Implementation: Create Policy Engine Settings

Similar to a profile, the engine also requires a settings object, `mip::PolicyEngine::Settings`. This object stores the unique engine identifier, an object of your `mip::AuthDelegate` implementation, customizable client data that can be used for debugging or telemetry, and, optionally, the locale.

Here we create a `FileEngine::Settings` object called *engineSettings* using the identity of the application user:

```cpp
PolicyEngine::Settings engineSettings(
  mip::Identity(mUsername), // mip::Identity.  
  authDelegateImpl,         // Auth delegate object
  "",                       // Client data. Customizable by developer, stored with engine.
  "en-US",                  // Locale.
  false);                   // Load sensitive information types for driving classification.
```

When creating engineSettings in this manner, it's important to also explicitly set a unique engineId via:

```cpp
engineSettings.SetEngineId(engineId);
```

Using the **username or email** helps to ensure that the same engine is loaded each time the user uses the service or application. 

Also valid is providing a custom engine ID:

```cpp
PolicyEngine::Settings engineSettings(
  "myEngineId",     // String
  authDelegateImpl, // Auth delegate object
  "",               // Client data in string format. Customizable by developer, stored with engine.
  "en-US",          // Locale. Default is en-US
  false);           // Load sensitive information types for driving classification. Default is false.
```

As a best practice, the first parameter, **id**, should be something that allows the engine to be easily connected to the associated user, preferably the user principal name.

### Implementation: Add the Policy Engine

To add the engine, we'll go back to the future/promise pattern used to load the profile. Instead of creating the promise for `mip::Profile`, we'll use `mip::PolicyEngine`.

```cpp

  // Auto profile will be std::shared_ptr<mip::Profile>.
  auto profile = profileFuture.get();

  // Create the delegate
  auto authDelegateImpl = std::make_shared<sample::auth::AuthDelegateImpl>(appInfo, userName, password);


  // Create the PolicyEngine::Settings object.
  PolicyEngine::Settings engineSettings("UniqueID", authDelegateImpl, "");

  // Create a promise for std::shared_ptr<mip::PolicyEngine>.
  auto enginePromise = std::make_shared<std::promise<std::shared_ptr<mip::PolicyEngine>>>();

  // Instantiate the future from the promise.
  auto engineFuture = enginePromise->get_future();

  // Add the engine using AddEngineAsync, passing in the engine settings and the promise.
  profile->AddEngineAsync(engineSettings, enginePromise);

  // Get the future value and store in std::shared_ptr<mip::PolicyEngine>.
  auto engine = engineFuture.get();
```

The end result of the code above is that we've successfully added an engine for the authenticated user to the profile.

## Implementation: List Sensitivity Labels

Using the added engine, it's now possible to list all of the sensitivity labels available to the authenticated user by calling `engine->ListSensitivityLabels()`.

`ListSensitivityLabels()` will fetch the list of labels and attributes of those labels for a specific user from the service. The result is stored in a vector of `std::shared_ptr<mip::Label>`.

### Implementation: ListSensitivityLabels()

```cpp
std::vector<shared_ptr<mip::Label>> labels = engine->ListSensitivityLabels();
```

### Implementation: Print the Labels

```cpp
//Iterate through all labels in the vector
for (const auto& label : labels) {
  //print the label name
  cout << label->GetName() << endl;
  //Iterate through all child labels
  for (const auto& child : label->GetChildren()) {
    //Print the label with some formatting
    cout << "->  " << child->GetName() << endl;
  }
}
```

Printing the names is an easy way to show that we successfully pulled policy from the service and were able to get the labels. To apply the label, the label identifier is required. Modifying the snip above to return the label ID results in:

```cpp
for (const auto& label : labels) {
  //Print label name and GUID
  cout << label->GetName() << " : " << label->GetId() << endl;

  //Print child label name and GUID
  for (const auto& child : label->GetChildren()) {
    cout << "->  " << child->GetName() <<  " : " << child->GetId() << endl;
  }
}
```

The collection of `mip::Label` returned by `GetSensitivityLabels()` can be used to display all labels available to the user and then, when selected, use the ID to apply labels to a file.
