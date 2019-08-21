---
title: Concepts - The File API engine object
description: This article will help you understand the concepts around the File engine object, which is created during application initialization.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.date: 07/30/2019
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - File API engine concepts

The `mip::FileEngine` in the MIP SDK File API provides an interface to all operations that are performed on behalf of a specified identity. One engine will be added for each user that signs in to the application and all operations that engine performs will be performed in the context of that identity.

The `FileEngine` has two primary responsibilities: Listing labels for an authenticated user and creating file handlers to perform file operations on behalf of the user. 

- [`mip::FileEngine`](reference/class_mip_fileengine.md)
- `ListSensitivityLabels()`: Gets the list of labels for the loaded engine.
- `CreateFileHandler()`: Creates a `mip::FileHandler` for a specific file or stream.

## Add a File Engine

As covered in [Profile and Engine objects](concept-profile-engine-cpp.md), an engine can have two states - `CREATED` or `LOADED`. If it's not one of those two states, it doesn't exist. To both create and load a state, it's only necessary to make a single call to `FileProfile::LoadAsync`. If the engine already exists in the cached state, it will be `LOADED`. If it doesn't exist, it will be `CREATED` and `LOADED`. `CREATED` implies that the application has all of the information from the service needed to load the engine. `LOADED` implies that all of the data structures necessary to leverage the engine have been created in memory.

### Create File Engine Settings

Similar to a profile, the engine also requires a settings object, `mip::FileEngine::Settings`. This object stores the unique engine identifier, customizable client data that can be used for debugging or telemetry, and, optionally, the locale.

Here we create a `FileEngine::Settings` object called *engineSettings* using the identity of the application user.

```cpp
FileEngine::Settings engineSettings(
  mip::Identity(mUsername), // mip::Identity.
  "",                       // Client data. Customizable by developer, stored with engine.
  "en-US",                  // Locale.
  false);                   // Load sensitive information types for driving classification.
```

Also valid is providing a custom engine ID:

```cpp
FileEngine::Settings engineSettings(
  "myEngineId", // string
  "",           // Client data in string format. Customizable by developer, stored with engine.
  "en-US",      // Locale. Default is en-US
  false);       // Load sensitive information types for driving classification. Default is false.
```

As a best practice, the first parameter, `id`, should be something that allows the engine to be easily connected to the associated user. Something like email address, UPN, or AAD object GUID would ensure that the ID is both unique and can be loaded from local state without calling the service.

### Add the File Engine

To add the engine, we'll go back to the promise/future pattern used to load the profile. Rather than creating the promise for `mip::FileProfile`, it's created using `mip::FileEngine`.

```cpp
  //auto profile will be std::shared_ptr<mip::FileProfile>
  auto profile = profileFuture.get();

  //Create the FileEngine::Settings object
  FileEngine::Settings engineSettings("UniqueID", "");

  //Create a promise for std::shared_ptr<mip::FileEngine>
  auto enginePromise = std::make_shared<std::promise<std::shared_ptr<mip::FileEngine>>>();

  //Instantiate the future from the promise
  auto engineFuture = enginePromise->get_future();

  //Add the engine using AddEngineAsync, passing in the engine settings and the promise
  profile->AddEngineAsync(engineSettings, enginePromise);

  //get the future value and store in std::shared_ptr<mip::FileEngine>
  auto engine = engineFuture.get();
```

The end result of the code above is that the engine for the authenticated user will be added to the profile.

## List Sensitivity Labels

Using the added engine, it's now possible to list all of the sensitivity labels available to the authenticated user by calling `engine->ListSensitivityLabels()`.

`ListSensitivityLabels()` will fetch the list of labels and attributes of those labels for a specific user from the service. The result is stored in a vector of `std::shared_ptr<mip::Label>`.

Read more [here](reference/class_mip_label.md) on `mip::Label`.

### ListSensitivityLabels()

```cpp
std::vector<shared_ptr<mip::Label>> labels = engine->ListSensitivityLabels();
```

Or, simplified:

```cpp
auto labels = engine->ListSensitivityLabels();
```

### Print the Labels and IDs

Printing the names is an easy way to show that we successfully pulled policy from the service and were able to get the labels. To apply the label, the label identifier is required. The code below iterates through all labels, displaying the `name` and the `id` for each parent and child label.

```cpp
//Iterate through all labels in the vector
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

## Next Steps

Now that the profile is loaded, the engine added, and we have labels, we can add a handler to begin to read, write, or remove labels from files. See [File handlers in the MIP SDK](concept-handler-file-cpp.md).
