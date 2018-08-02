# Engines

- [Engines](#engines)
    - [Summary](#summary)
    - [Engine States](#engine-states)
    - [Engine ID](#engine-id)
    - [Engine Management Methods](#engine-management-methods)
        - [AddEngineAsync](#addengineasync)
        - [DeleteEngineAsync](#deleteengineasync)
        - [UnloadEngineAsync](#unloadengineasync)

## Summary

In the MIP SDK File, Profile, and Protection APIs, engines provide an interface to all operations that are performed on behalf of a specified identity. One engine will be added for each user that signs in to the application and all operations that engine performs will be performed in the context of that identity.

There are three engine classes in the SDK, one for each API. The following is a list of those classes and a few of the functions associated with each.

- [`mip::ProtectionEngine`]
  - Details here...
  - More details here.
- [`mip::PolicyEngine`](https://docs.microsoft.com/en-us/azure/information-protection/develop/mip/class_mip_policyengine)
  - `ListSensitivityLabels()`: Gets the list of labels for the loaded engine.
  - `GetSensitivityLabel()`: Gets the label from existing content.
  - `ComputeActions()`: Provided with a label ID and optional metadata, returns the list of actions that should occur for a specific item.
- [`mip::FileEngine`](https://docs.microsoft.com/en-us/azure/information-protection/develop/mip/class_mip_fileengine)
  - `ListSensitivityLabels()`: Gets the list of labels for the loaded engine.
  - `CreateFileHandler()`: Creates a `mip::FileHandler` for a specific file or stream.

## Engine States

An engine may have one of two states.

- `CREATED`: Created indicates that the SDK has enough local state information after calling the required backend services.
- `LOADED`: The SDK has built the required data structures for the engine to be operational.

An engine must be both created and loaded to perform any operations. The `Profile` class exposes a few engine management methods: `AddEngineAsync`, `RemoveEngineAsync`, and `UnloadEngineAsync`.

The following table describes the possible engine states and which method can changes that state.

|         | NONE              | CREATED           | LOADED         |
|---------|-------------------|-------------------|----------------|
| NONE    |                   |                   | AddEngineAsync |
| CREATED | DeleteEngineAsync |                   | AddEngineAsync |
| LOADED  | DeleteEngineAsync | UnloadEngineAsync |                |

## Engine ID

It is important to understand that each engine has a unique identifier, `id`, that is used in all engine management operations. The application can provide an `id` or the SDK will generate a new unique identifier if one is not provided by the application. All other engine properties (e.g. email address in the identity info) are opaque payloads for the SDK and the SDK does NOT perform any logic to keep any of the other properties unique, or enforce any other constraints.

## Engine Management Methods

As mentioned above, there are three engine management methods in the SDK: `AddEngineAsync`, `DeleteEngineAsync`, and `UnloadEngineAsync`.

### AddEngineAsync

This method loads an existing engine or created a new one if one doesn't already exist in local state.

If an `id` is not provided by the application, `AddEngineAsync` generates a new `id`. It then checks to see if an engine with that `id` already exists in local state. If it does, it loads that engine.

If the engine does *not* exist in local state, a new engine is created by calling the necessary APIs and backend services.

In both cases, if the method succeeds, the engine is loaded and ready to use.

### DeleteEngineAsync

Deletes the engine with the given `id`. All traces of this engine are removed from the local state.

### UnloadEngineAsync

Unloads the in-memory data structures for the engine with the given `id`. The local state of this engine is still intact, and can be reloaded with `AddEngineAsync`.

This method allows the application to be judicious about the memory usage by unloading engines which are not expected to be used soon.