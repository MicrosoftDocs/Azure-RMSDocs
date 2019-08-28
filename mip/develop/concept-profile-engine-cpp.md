---
title: Concepts - The core concepts in the MIP SDK - Profile and Engine
description: This article will help you understand the core SDK concepts called the Profile and Engine, which are created during application initialization.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.date: 07/29/2019
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - Profile and Engine object concepts

## Profiles

Where the `MipContext` is the class for storing SDK-specific settings, the profile is the root class for all MIP labeling and protection-specific operations in the MIP SDK. Before using any of the three API sets, the client application must create a profile. Future operations are performed by the profile, or by other objects *added* to the profile.

There are three types of profile in the MIP SDK:

- [`PolicyProfile`](reference/class_mip_policyprofile.md): The profile class for the MIP Policy API.
- [`ProtectionProfile`](reference/class_mip_protectionprofile.md): The profile class for the MIP Protection API.
- [`FileProfile`](reference/class_mip_fileprofile.md): The profile class for the MIP File API.

The API used in the consuming application determines which profile class should be used.

The profile itself provides the following functionality:

- Defines whether state should be loaded in memory or persisted to disk and, if persisted to disk, should it be encrypted.
- Handles authentication by accepting a `mip::AuthDelegate`.
- Defines the `mip::ConsentDelegate` that should be used for consent operations.
- Defines the `mip::FileProfile::Observer` implementation that will be used for asynchronous callbacks for profile operations.

### Profile Settings

- `MipContext`: The `MipContext` object that was initialized to store application info, state path, etc.
- `CacheStorageType`: Defines how to store state: In memory, on disk, or on disk and encrypted.
- `authDelegate`: A shared pointer of class `mip::AuthDelegate`.
- `consentDelegate`: A shared pointer of class [`mip::ConsentDelegate`](reference/class_mip_consentdelegate.md).
- `observer`: A shared pointer to the profile `Observer` implementation (in [`PolicyProfile`](reference/class_mip_policyprofile_observer.md), [`ProtectionProfile`](reference/class_mip_protectionprofile_observer.md), and [`FileProfile`](reference/class_mip_fileprofile_observer.md)).
- `applicationInfo`: A [`mip::ApplicationInfo`](reference/mip-enums-and-structs.md#structures) object. Information about the application that is consuming the SDK, which matches your Azure Active Directory application registration ID and name.

## Engines

The File, Profile, and Protection API engines provide an interface for operations performed on by a specific identity. One engine is added to the Profile object for each user or service principal that signs in to the application. It is possible to perform delegated operations via `mip::ProtectionSettings` and the file or protection handler. See [the protection settings section in the FileHandler concepts](concept-handler-file-cpp.md) for more details.

There are three engine classes in the SDK, one for each API. The following list shows the engine classes and a few of the functions associated with each:

- [`mip::ProtectionEngine`](reference/class_mip_protectionengine.md)
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

The following table describes the possible engine states, and which methods can change that state:

|         | NONE              | CREATED           | LOADED         |
|---------|-------------------|-------------------|----------------|
| NONE    |                   |                   | AddEngineAsync |
| CREATED | DeleteEngineAsync |                   | AddEngineAsync |
| LOADED  | DeleteEngineAsync | UnloadEngineAsync |                |

### Engine ID

Each engine has a unique identifier, `id`, that is used in all engine management operations. The application can provide an `id`, or the SDK can generated one, if it's not provided by the application. All other engine properties (for example, email address in the identity info) are opaque payloads for the SDK. The SDK does NOT perform any logic to keep any of the other properties unique, or enforce any other constraints.

> [!IMPORTANT]
> As a best practice, use an engine Id that is unique to the user and use that each time the user performs an operation with the SDK. Failing to provide an existing engine Id will result in extra service round trips to fetch policy and will fetch licenses that may have already been cached for the existing engine.

### Engine Management Methods

As mentioned previously, there are three engine management methods in the SDK: `AddEngineAsync`, `DeleteEngineAsync`, and `UnloadEngineAsync`.

#### AddEngineAsync

This method loads an existing engine, or creates one if one doesn't already exist in local state.

If the application doesn't provide an `id`, `AddEngineAsync` generates a new `id`. It then checks to see if an engine with that `id` already exists in local state. If it does, it loads that engine. If the engine does *not* exist in local state, a new engine is created by calling the necessary APIs and backend services.

In both cases, if the method succeeds, the engine is loaded and ready to use.

#### DeleteEngineAsync

Deletes the engine with the given `id`. All traces of the engine are removed from the local state.

#### UnloadEngineAsync

Unloads the in-memory data structures for the engine with the given `id`. The local state of this engine is still intact, and can be reloaded with `AddEngineAsync`.

This method allows the application to be judicious about memory usage, by unloading engines that aren't expected to be used soon.

## Next Steps

- Next, learn more about [Authentication concepts](concept-authentication-cpp.md) and [Observers](concept-async-observers.md). MIP provides an extensible authentication model, while observers are used to provide event notifications for asynchronous events. Both are fundamental, and apply to all MIP API sets.
- Then work through the profile and engine concepts for the File, Policy, and Protection APIs
  - [File API profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [File API engine concepts](concept-profile-engine-file-engine-cpp.md)
  - [Policy API profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [Policy API engine concepts](concept-profile-engine-file-engine-cpp.md)
  - [Protection API profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [Protection API engine concepts](concept-profile-engine-file-engine-cpp.md)  
