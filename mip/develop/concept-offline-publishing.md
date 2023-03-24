---
title: Offline publishing in MIP SDK
description: This article helps you to understand how to enable and use offline publishing in MIP SDK.
author: tommoser
ms.service: information-protection
ms.topic: conceptual
ms.date: 03/20/2023
ms.author: tommos
---

# Offline Publishing (Public Preview)

## Overview

Microsoft Information Protection SDK 1.13 adds support for offline publishing. Offline publishing allows a client, after making an initial connection to the rights management service, to generate [publishing licenses](/openspecs/windows_protocols/ms-rmsod/0af175ee-d54d-4d70-b169-b0ade1ab9bf4#gt_3b0362d9-f209-48d2-afd0-0c0f6531a7d1) for newly-protected content without making a service call. Offline protection is useful for applications that either need to function in an offline mode, or want to avoid making service calls.

This feature is in **public preview** for the 1.13 release. Support is provided on a best effort basis and fixes may be delayed.

## Requirements

The offline publishing feature has the following requirements:

- MIP Protection SDK 1.13 or later.
- A user licensed for Microsoft Purview Information Protection. [Licensing requirements](/microsoft-365/compliance/information-protection#licensing-requirements)
- Internet connectivity for the application to initialize and cache data offline.
  
## Not Supported

The following items aren't supported as part of the offline publishing feature:

- Active Directory Rights Management Services is not supported.
- The MIP File SDK. Future versions will add support for this feature.
- Double Key Encryption (DKE): The DKE feature must make a service call to fetch the public key at publishing. 

## Using Offline Publishing

Offline publishing requires three steps to enable the application to publish without calling the service:

1. Enable the offline publishing setting on `ProtectionProfileSettings`.
2. Set the protection refresh rate. This API sets the validity period for the cached templates.
3. Call the `GetTemplatesAsync()` or  API.

## Caching Behavior

An application won't contact the service to get templates until the refresh period has expired or until `GetTemplatesAsync()` or `GetTemplates()` are called. If the application is offline and the cache has expired, publishing will fail. The refresh interval should strike a balance between offline usage for end users and ensuring that templates are fresh. For most applications, 24 hours, or less, is ideal.

## Examples

The followin gcode snippets are taken from these sample applications:

- [
mipsdk-protectionapi-cpp-sample-basic](https://github.com/Azure-Samples/mipsdk-protectionapi-cpp-sample-basic)
- [mipsdk-protection-dotnet-quickstart](https://github.com/Azure-Samples/MipSDK-Protection-Dotnet-Quickstart)

### C++ Example

#### Configure ProtectionProfileSettings (C++)

```cpp
// Initialize ProtectionProfileSettings using MipContext
ProtectionProfile::Settings profileSettings(mMipContext,
    mip::CacheStorageType::OnDiskEncrypted,
    ::make_shared<sample::consent::ConsentDelegateImpl>(),
    std::make_shared<ProtectionProfileObserverImpl>()
);

// Enable Offline Publishing
profileSettings.SetOfflinePublishing(true);
```

#### Set the template refresh period (C++)

```cpp
// Set the template refresh interval
engineSettings.SetTemplateRefreshArgs(std::chrono::hours(24));
```

#### Fetch templates to initialize the cache (C++)

```cpp
auto loadPromise = std::make_shared<std::promise<vector<shared_ptr<mip::TemplateDescriptor>>>>();
std::future<vector<shared_ptr<mip::TemplateDescriptor>>> loadFuture = loadPromise->get_future();
mEngine->GetTemplatesAsync(engineObserver, loadPromise);
auto templates = loadFuture.get();
```

### .NET Example

#### Configure ProtectionProfileSettings (.NET)

```csharp
// Initialize ProtectionProfileSettings
var profileSettings = new ProtectionProfileSettings(mipContext, 
                CacheStorageType.OnDisk, 
                new ConsentDelegateImplementation());

// Enable Offline Publishing
profileSettings.OfflinePublishing = true;
```

#### Set template refresh period (.NET)

```csharp
// Initialize ProtectionEngineSettings
var engineSettings = new ProtectionEngineSettings(identity.Email, authDelegate, "", "")
{
    Identity = identity
};

// Set the template refresh interval
engineSettings.TemplateRefreshRate = new TimeSpan(24, 0, 0);

var engine = profile.AddEngine(engineSettings);
```

#### Fetch templates to initialize the cache (.NET)

```csharp
List<TemplateDescriptor> templates = engine.GetTemplates();
```
