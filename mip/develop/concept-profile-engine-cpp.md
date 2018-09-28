---
title: Concepts - The core concepts in the MIP SDK - Profile and Engine
description: This article will help you understand the core SDK concepts called the Profile and Engine, which are created during application initialization.
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 09/27/2018
ms.author: bryanla
---

# Microsoft Information Protection SDK - Profile and Engine object concepts

## Profiles

The profile is the root class for all operations in the MIP SDK. Before using any of the three APIs, a profile must be created by the client application. All future operations will be performed by the profile or by other objects *added* to the profile.

There are three types of profile in the MIP SDK:

- [`PolicyProfile`](reference/class_mip_policyprofile.md): The profile class for the MIP Policy API.
- [`ProtectionProfile`](reference/class_mip_protectionprofile.md): The profile class for the MIP Protection API.
- [`FileProfile`](reference/class_mip_fileprofile.md): The profile class for the MIP File API.

The API used in the consuming application will determine which profile class should be used.

The profile itself provides the following functionality:

- Defines storage location for SDK state. State data includes user details, downloaded user policies, logs, and telemetry data.
- Defines whether state should be loaded in memory or persisted to disk.
- Handles authentication by accepting a `mip::AuthDelegate`.
- Sets application ID and friendly name of the app consuming the SDK.

### Profile Settings

- `Path`: File path under which logging, telemetry, and other persistent state is stored.
- `useInMemoryStorage`: A bool that defines whether state should be stored in memory, or on disk.
- `authDelegate`: A shared pointer of class `mip::AuthDelegate`. 
- `consentDelegate`: A shared pointer of class `mip::ConsentDelegate`. 
- `observer`: A shared pointer to the profile `Observer` implementation (in `PolicyProfile`, `ProtectionProfile`, and `EngineProfile`).
- `applicationInfo`: A `mip::ApplicationInfo` object. Information about the application that is consuming the SDK.

## Engines

In the File, Profile, and Protection APIs, engines provide an interface to operations performed on behalf of a specific identity. One engine will be added to the Profile object, for each user that signs in to the application. All operations performed by the engine will be in the context of that identity.

There are three engine classes in the SDK, one for each API. The following list shows the engine classes and a few of the functions associated with each:

- [`mip::ProtectionEngine`]
- [`mip::PolicyEngine`](reference/class_mip_policyengine.md)
  - `ListSensitivityLabels()`: Gets the list of labels for the loaded engine.
  - `GetSensitivityLabel()`: Gets the label from existing content.
  - `ComputeActions()`: Provided with a label ID and optional metadata, returns the list of actions that should occur for a specific item.
- [`mip::FileEngine`](reference/class_mip_fileengine.md)
  - `ListSensitivityLabels()`: Gets the list of labels for the loaded engine.
  - `CreateFileHandler()`: Creates a `mip::FileHandler` for a specific file or stream.

### Engine States

An engine may have one of two states:

- `CREATED`: Created indicates that the SDK has enough local state information after calling the required backend services.
- `LOADED`: The SDK has built the required data structures for the engine to be operational.

An engine must be both created and loaded to perform any operations. The `Profile` class exposes a few engine management methods: `AddEngineAsync`, `RemoveEngineAsync`, and `UnloadEngineAsync`.

The following table describes the possible engine states and which method can changes that state.

|         | NONE              | CREATED           | LOADED         |
|---------|-------------------|-------------------|----------------|
| NONE    |                   |                   | AddEngineAsync |
| CREATED | DeleteEngineAsync |                   | AddEngineAsync |
| LOADED  | DeleteEngineAsync | UnloadEngineAsync |                |

### Engine ID

Each engine has a unique identifier, `id`, that is used in all engine management operations. The application can provide an `id` or the SDK will generate a new unique identifier, if one is not provided by the application. All other engine properties (for example, email address in the identity info) are opaque payloads for the SDK. The SDK does NOT perform any logic to keep any of the other properties unique, or enforce any other constraints.

### Engine Management Methods

As mentioned above, there are three engine management methods in the SDK: `AddEngineAsync`, `DeleteEngineAsync`, and `UnloadEngineAsync`.

#### AddEngineAsync

This method loads an existing engine, or creates a new one if one doesn't already exist in local state.

If the application doesn't provide an `id`, `AddEngineAsync` generates a new `id`. It then checks to see if an engine with that `id` already exists in local state. If it does, it loads that engine. If the engine does *not* exist in local state, a new engine is created by calling the necessary APIs and backend services.

In both cases, if the method succeeds, the engine is loaded and ready to use.

#### DeleteEngineAsync

Deletes the engine with the given `id`. All traces of the engine are removed from the local state.

#### UnloadEngineAsync

Unloads the in-memory data structures for the engine with the given `id`. The local state of this engine is still intact, and can be reloaded with `AddEngineAsync`.

This method allows the application to be judicious about memory usage, by unloading engines that are not expected to be used soon.

## Next Steps

- Next, learn more about [Authentication concepts](concept-authentication-cpp.md) and [Observers](concept-async-observers.md). MIP provides an extensible authentication model, while observers are used to provide event notifications for asynchronous events. Both are fundamental, and apply to all MIP API sets.
- Then work through the profile and engine concepts for the File, Policy, and Protection APIs
  - [File API profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [File API engine concepts](concept-profile-engine-file-engine-cpp.md)
  - [Policy API profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [Policy API engine concepts](concept-profile-engine-file-engine-cpp.md)
  - [Protection API profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [Protection API engine concepts](concept-profile-engine-file-engine-cpp.md)  
