---
title: Concepts - The core concepts in the MIP SDK - MipContext
description: This article will help you understand the core SDK concept called MipContext, which drives application initialization.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - MipContext object concepts

## MipContext

`MipContext` is the highest level object in the SDK. It's responsible for managing state across all profiles that may be created as part of an application or service. Additionally, it handles releasing MIP SDK resources once the MipContext object has been destroyed. 

> [!IMPORTANT]
> Only a single `MipContext` per process is permitted. Creating more than one may result in unexpected behavior. `MipContext` should be created at app start, and the same MipContext used for the lifetime of the application. 

Once an object of `mip::MipContext` has been created, the `MipContext` object can be used to create `mip::FileProfile`, `mip::PolicyProfile`, or `mip::ProtectionProfile` objects.

### Creating MipConfiguration

The `mip::MipConfiguration` class allows the application to set various application-wide configuration settings for MIP SDK. These settings include: 

- Application Info: Name, Application ID, Version
- Storage directory for logs and cache
- Logging level
- Offline mode
- Feature flighting settings
- Delegates, including logging, storage, HTTP, JSON parsing, and XML parsing.
- Diagnostic configuration

```cpp
std::shared_ptr<mip::MipConfiguration> mipConfiguration = std::make_shared<mip::MipConfiguration>(mAppInfo,
				"mip_data",
				mip::LogLevel::Trace,
				false);
```

```csharp
MipConfiguration mipConfiguration = new MipConfiguration(appInfo, "mip_data", LogLevel.Trace, false);
```

Once `MipConfiguration` is initialized, it can be used to create the `MipContext` object.

### Creating MipContext

The `MipContext::Create()` function is used, taking the provided `MipConfiguration` object, to create the `MipContext`.

```cpp
std::shared_ptr<mip::MipContext> mMipContext = mip::MipContext::Create(mipConfiguration);
```

```csharp
MipContext = mipContext = MIP.CreateMipContext(mipConfiguration);
```

Once the `MipContext` object is created, it can be used to create `FileProfile`, `PolicyProfile`, or `ProtectionProfile` objects, depending on which SDK your application is using.

#### Shutting Down

Properly destroying all MIP SDK objects requires shutting down MIPContext. This can be achieved by calling the **Shutdown** function. The `MipContext` destructor will also call `MipContext.Shutdown()` when the `MipContext` object is destroyed.

<!--remove from docs in 1.11 -->
#### `mip::MipContext::CreateWithCustomFeatureSettings()`

> [!NOTE]
> This API is deprecated in MIP SDK 1.10 and on. Please update to using `MipConfiguration` and `mip::MipContext::Create()`.

Creates a new MipContext instance to be used when initializing profiles, with custom feature settings enabled.

- `mip::ApplicationInfo`
- A path for the MIP storage cache.
- `mip::LogLevel`
- (Optional) `mip::LoggerDelegate`
- (Optional) `mip::TelemetryConfiguration`
- `mip::FlightingFeature`

## Next Steps

- Next, learn more about [Authentication concepts](concept-authentication-cpp.md) and [Observers](concept-async-observers.md). MIP provides an extensible authentication model, while observers are used to provide event notifications for asynchronous events. Both are fundamental, and apply to all MIP API sets.
- Then work through the profile and engine concepts for the File, Policy, and Protection SDKs
  - [File SDK profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [File SDK engine concepts](concept-profile-engine-file-engine-cpp.md)
  - [Policy SDK profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [Policy SDK engine concepts](concept-profile-engine-file-engine-cpp.md)
  - [Protection SDK profile concepts](concept-profile-engine-file-profile-cpp.md)
  - [Protection SDK engine concepts](concept-profile-engine-file-engine-cpp.md)
