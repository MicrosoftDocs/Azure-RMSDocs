---
title: Concepts - Delegation
description: This article will help you understand the concepts around delegation in MIP SDK.
author: tommoser
ms.service: azure-information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: tommos
---

# Concept - Delegation in the MIP SDK

The Microsoft Information Protection SDK provides two paths for service-based applications to act on behalf of another user. Delegation may be necessary when files need to be labeled, protected, or consumed in the context of a user identity different from the service identity. This delegated identity can be set at the **engine** or **handler** level and where it's set will depend on the use case.

## Engine Settings-based Delegation

The MIP SDK supports providing a delegated user email address in the settings object for all SDKs; File, Protection, and Policy. This is achieved by setting the `DelegatedUserEmail` property on the settings object. The result is that the engine initialized with that settings object will perform **all MIP operations** as though it were the user provided to the `DelegatedUserEmail` property. Policy will be fetched for that specific user and all protection operations will be performed as that user, including being the owner of files that are protected.

This pattern is useful when your service-based application needs to operate fully as the user; policy needs to be fetched only for the specified user, and any decryption operations need to be done in the context of the user identity. It's important that when creating this engine that the application specifies an engine ID unique to that user, often the mail address. This ensures that the benefits of caching will be realized. If a unique engine ID is not provided, your application may experience poor performance.

### File SDK

The following sample illustrates how to set the delegated identity for a File SDK application in C++ and C#. The same pattern can be used for the Policy SDK.

This sample shows how to create a **delegate engine** in File SDK in .NET.

```csharp
// C# Example for creating a delegated file engine
string delegatedUserEmail = "alice@contoso.com";
var engineSettings = new PolicyEngineSettings(delegatedUserEmail, authDelegate, "", "en-US")
{
    // Provide the identity for service discovery.
    Identity = identity,
    // Set the identity for which all MIP operations will be performed.
    DelegatedUserEmail = delegatedUserEmail
};

var engine = Task.Run(async () => await profile.AddEngineAsync(engineSettings)).Result;
```

This sample shows how to create a **delegate engine** in File SDK in C++.

```c++
// C++ Example for creating a delegated file engine
std::string delegatedUserEmail = "alice@contoso.com";
FileEngine::Settings engineSettings(delegatedUserEmail, mAuthDelegate, "", "en-US", false);
// Set the identity for which all MIP operations will be performed. 
engineSettings.SetDelegatedUserEmail(delegatedUserEmail);

auto enginePromise = std::make_shared<std::promise<std::shared_ptr<FileEngine>>>();
auto engineFuture = enginePromise->get_future();

mProfile->AddEngineAsync(engineSettings, enginePromise);
mEngine = engineFuture.get();
```

The result is that all file engines will be created on behalf of the specified user.


## Handler-based Delegation

In scenarios where we need only to **protect** files in the context of a specific user identity, the `FileHandler` provides a method for passing in the user identity via a `ProtectionSettings` object. The policy and any decryption operations will be performed as the authenticated **service identity**. The protection action will be performed on behalf of the specified user; that user will be the **owner** of MIP protection on the document.

### File SDK

Only the operation of applying protection either directly or via label will be performed as the user provided to the `ProtectionSettings` object. This object is passed in to the `SetLabel()` or `SetProtection()` functions in File SDK.

This sample shows how to perform a **delegate protection operation** in File SDK in .NET.

```csharp
string delegatedUserEmail = "bob@contoso.com";
ProtectionSettings protectionSettings = new ProtectionSettings()
{
    // Set the delegated mail address 
    DelegatedUserEmail = delegatedUserEmail
};
handler.SetLabel(engine.GetLabelById(options.LabelId), labelingOptions, protectionSettings);
// Similar pattern for SetProtection()
// handler.SetProtection(protectionDescriptor, protectionSettings);
```

This sample shows how to perform a **delegate protection operation** in File SDK in C++.

```c++
mip::ProtectionSettings protectionSettings;
// Set the delegated mail address 
protectionSettings.SetDelegatedUserEmail(delegatedUserEmail);
handler->SetLabel(mEngine->GetLabelById(labelId), labelingOptions, protectionSettings);
```

The result is that all handler **write** operations where protection is applied will be performed as the delegated user. 

### Protection SDK

The Protection SDK functions differently than the File SDK. There are **two types of handlers** that can be created, one for publishing and one for consumption. Similar to the File SDK, the delegated mail address is set via the settings object for each type of handler.

#### .NET

This sample demonstrates how to perform **delegated publishing**.

```csharp
string delegatedUserEmail = "bob@contoso.com";
PublishingSettings publishingSettings = new PublishingSettings(protectionDescriptor)
{
    // Set the delegated mail address 
    DelegatedUserEmail = delegatedUserEmail
};          
var protectionHandler = engine.CreateProtectionHandlerForPublishing(publishingSettings);
```

This sample demonstrates how to perform **delegated consumption**.

```csharp
string delegatedUserEmail = "bob@contoso.com";
ConsumptionSettings consumptionSettings = new ConsumptionSettings(plInfo)
{                
    ContentName = "A few bytes.",
    // Set the delegated mail address 
    DelegatedUserEmail = delegatedUserEmail
};
var protectionHandler = engine.CreateProtectionHandlerForConsumption(consumptionSettings);
```

#### C++

This sample demonstrates how to perform **delegated consumption**.

```c++
string delegatedUserEmail = "bob@contoso.com";
mip::ProtectionHandler::PublishingSettings publishingSettings = mip::ProtectionHandler::PublishingSettings(descriptor);
// Set the delegated mail address 
publishingSettings.SetDelegatedUserEmail(delegatedUserEmail);
mEngine->CreateProtectionHandlerForPublishingAsync(publishingSettings, handlerObserver, handlerPromise);
auto handler = handlerFuture.get();	
```

This sample demonstrates how to perform **delegated publishing**.

```c++
string delegatedUserEmail = "bob@contoso.com";
mip::ProtectionHandler::ConsumptionSettings consumptionSettings = mip::ProtectionHandler::ConsumptionSettings(serializedPublishingLicense);
// Set the delegated mail address 
consumptionSettings.SetDelegatedUserEmail(delegatedUserEmail);
mEngine->CreateProtectionHandlerForConsumptionAsync(consumptionSettings, handlerObserver, handlerPromise);
auto handler = handlerFuture.get();	
```

## Required Permissions

Each of the above scenarios requires a different set of permissions. 

| Scenario                             | Permission Required                                                             |
| ------------------------------------ | ------------------------------------------------------------------------------- |
| File SDK Delegated Engine            | UnifiedPolicy.Tenant.Read<br>Content.DelegatedReader<br>Content.DelegatedWriter |
| Policy SDK Delegated Engine          | UnifiedPolicy.Tenant.Read                                                       |
| File SDK Delegated Handler           | Content.DelegatedWriter                                                         |
| Protection SDK Delegated Publish     | Content.DelegatedWriter                                                         |
| Protection SDK Delegated Consumption | Content.DelegatedReader                                                         |

For a full review of permissions and where to set them, review [API permissions for the Microsoft Information Protection SDK](concept-api-permissions.md)

## Next Steps

- Review the [API permissions for the Microsoft Information Protection SDK](concept-api-permissions.md)
