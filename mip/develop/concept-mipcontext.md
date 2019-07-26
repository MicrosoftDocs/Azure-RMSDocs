---
title: Concepts - The core concepts in the MIP SDK - MipContext
description: This article will help you understand the core SDK concept called MipContext which drives application initialization.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.date: 09/27/2018
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - MipContext object concepts

## MipContext

`MipContext` is the highest level object in the SDK. It's responsible for managing state across all profiles that may be created as part of an application or service. Additionally, it handles releasing MIP SDK resources once the MipContext object has been destroyed.

Specifically, `MipContext` sets the following:

- `mip::ApplicationInfo` across the SDK, used for application ID, version, and application name.
- The path where MIP state information should be stored, if enabled.
- Logging level.
- A custom logger delegate, if desired.
- Telemetry configuration override.
- Enable preview features in the SDK that are behind feature flags.

Once an object of `mip::MipContext` has been created, the `MipContext` object can be used to create `mip::FileProfile` objects (or `PolicyProfile`/`ProtectionProfile`).

### MipContext Functions

`mip::MipContext` exposes three important static functions use to create and destroy `MipContext` objects.

#### `mip::MipContext::Create()`

Creates a new MipContext instance to be used when initializing profiles. This function accepts:

- `mip::ApplicationInfo`
- A path for the MIP storage cache. 
- `mip::LogLevel`
- (Optional) `mip::LoggerDelegate`
- (Optional) `mip::TelemetryConfiguration`

#### `mip::MipContext::CreateWithCustomFeatureSettings()`

Creates a new MipContext instance to be used when initializing profiles, with custom feature settings enabled.

- `mip::ApplicationInfo`
- A path for the MIP storage cache. 
- `mip::LogLevel`
- (Optional) `mip::LoggerDelegate`
- (Optional) `mip::TelemetryConfiguration`
- `mip::FlightingFeature`

#### `mip::mipContext::Shutdown()`

Releases all MIP resources. Should be called prior to app shutdown. The `MipContext` destructor will also call this when the `MipContext` object is destroyed.

## Next Steps

- Next, learn more about [Authentication concepts](concept-authentication-cpp.md) and [Observers](concept-async-observers.md). MIP provides an extensible authentication model, while observers are used to provide event notifications for asynchronous events. Both are fundamental, and apply to all MIP API sets.
- Then work through the profile and engine concepts for the File, Policy, and Protection APIs
  - [File API profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [File API engine concepts](concept-profile-engine-file-engine-cpp.md)
  - [Policy API profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [Policy API engine concepts](concept-profile-engine-file-engine-cpp.md)
  - [Protection API profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [Protection API engine concepts](concept-profile-engine-file-engine-cpp.md)  
