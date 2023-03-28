---
title: Quickstart - Active Directory Rights Management Server Protection
description: A quickstart showing you how to configure the MIP SDK to use Active Directory Rights Management Server (AD RMS)
author: tommoser
ms.service: information-protection
ms.topic: quickstart
ms.date: 11/14/2022
ms.author: tommos
ms.custom: has-adal-ref, mode-portal
#Customer intent: As a an application developer, I want to learn how to use the MIP SDK to connect to AD RMS so I can consume and protect using my on-premises service.
---

# Quickstart: Active Directory Rights Management Server (AD RMS) Protection

This quickstart will show you how to implement support for Active Directory Rights Management Server (AD RMS) using MIP SDK.

> [!NOTE]
> The steps outlined in this quickstart applicable to only File SDK for C# or C++ and Protection SDK for C++ only.

## Prerequisites

If you haven't already, be sure to:

- Complete [Quickstart: Client application initialization (C++)](quick-app-initialization-cpp.md) first, which builds a starter Visual Studio solution.
- Complete [Quickstart: List sensitivity labels (C++)](quick-file-list-labels-cpp.md) or [Quickstart: List sensitivity labels (C#)](quick-file-list-labels-csharp.md)
- Deploy AD RMS with [Mobile Device Extension](/azure/information-protection/active-directory-rights-manage-mobile-device).
- Optionally, ensure that the [DNS SRV record for AD RMS MDE](/azure/information-protection/active-directory-rights-manage-mobile-device#specifying-the-dns-srv-records-for-the-ad-rms-mobile-device-extension) is published.

## Service Discovery

The SDK does service discovery based on the `mip::Identity` provided via `FileEngineSettings` or `ProtectionEngineSettings` by using the UPN or mail address suffix. It first searches the domain hierarchy for the *_rmsdisco* record for MDE. For more details on that process, review [Specifying the DNS SRV records for the AD RMS mobile device extension](/azure/information-protection/active-directory-rights-manage-mobile-device#specifying-the-dns-srv-records-for-the-ad-rms-mobile-device-extension). If that DNS SRV record isn't found, it defaults to the Azure Information Protection service as the service location.

<!-- 
If an identity isn't available, or the DNS SRV record for MDE hasn't been published, the service discovery process can be overridden by explicitly settings the [cloud endpoint URL](./reference/class_mip_fileengine_settings.md#setpolicycloudendpointbaseurl-function).
-->

## Configuring File SDK in C# to use AD RMS

Two minor changes are required if your application is using Active Directory Authentication Library (ADAL) and the File SDK on C#. The `FileEngineSettings` object and `AuthenticationContext` constructor must be updated to function with AD RMS and Active Directory Federations Services (ADFS).

If you've deployed the mobile device extension DNS SRV record and plan to pass in a user principal name or email address, [follow the instructions for using an identity](#update-the-file-engine-settings-to-use-ad-rms-with-an-identity).

<!--
If you don't have the mobile device extension DNS SRV record, or won't have an identity at runtime, [follow the explicit endpoint instructions](#update-the-file-engine-settings-to-use-ad-rms-with-an-explicit-endpoint).
-->

### Update the File Engine Settings to use AD RMS with an Identity

If the DNS SRV record for MDE has been published and `Microsoft.InformationProtection.Identity` has been provided as part of the engine settings, the only required code change is to set `FileEngineSettings.ProtectionOnlyEngine = true`. This property must be set as labeling (policy) operations aren't supported for AD RMS protection endpoints.

```csharp
// Configure FileEngineSettings as protection only engine.
var engineSettings = new FileEngineSettings("", authDelegate, "", "en-US")
{
     // Provide the identity for service discovery.
     Identity = identity,
     // Set ProtectionOnlyEngine to true for AD RMS as labeling isn't supported
     ProtectionOnlyEngine = true
};
```

<!-- tommos removed because this might be invalid based on testing. -->
<!-- 
### Update the File Engine Settings to use AD RMS with an explicit endpoint

If the DNS SRV record for MDE isn't published, or `Microsoft.InformationProtection.Identity` isn't available to pass in when creating the `FileEngine`, there are two required code changes. is to set `FileEngineSettings.ProtectionOnlyEngine = true`. This property must be set as labeling (policy) operations aren't  supported for AD RMS protection endpoints.

```csharp
// Configure FileEngineSettings as protection only engine and generate a unique engine id.
var engineSettings = new FileEngineSettings("", authDelegate, "", "en-US")
{
     // Set ProtectionOnlyEngine to true for AD RMS as labeling isn't supported
     ProtectionOnlyEngine = true,
     // Provide the explicit AD RMS endpoint
     ProtectionCloudEndpointBaseUrl = "https://rms.contoso.com"
};
```
-->

### Update the authentication delegate

If you're using the ADAL in your .NET application, you'll need to make a  change to the `Microsoft.InformationProtection.AuthDelegate` implementation to disable authority validation. Disable authority validation by setting `validateAuthority` in the `AuthenticationContext` constructor to **false**.

   ```csharp
   AuthenticationContext authContext = new AuthenticationContext(authority, false, tokenCache);
   ```

## Configuring File SDK in C++ to use AD RMS

If you've deployed the mobile device extension DNS SRV record and plan to pass in a user principal name or email address, [follow the instructions for using an identity](#update-the-fileenginesettings-to-use-ad-rms-with-an-identity).

<!--
If you don't have the mobile device extension DNS SRV record, or won't have an identity at runtime, [follow the explicit endpoint instructions](#update-the-fileenginesettings-to-use-ad-rms-with-an-explicit-endpoint).
-->

### Update the FileEngine::Settings to use AD RMS with an Identity

If the DNS SRV record for MDE has been published and `mip::Identity` is provided in the `FileEngine::Settings`, then the only action is to set the engine to a protection-only engine.

```cpp
FileEngine::Settings engineSettings(mip::Identity(mUsername), "");
engineSettings.SetProtectionOnlyEngine = true;
```

<!-- tommos removed because this might be invalid based on testing. -->
<!--

### Update the FileEngine::Settings to use AD RMS with an explicit endpoint

If the DNS SRV record for MDE isn't published, or an identity isn't available for service discovery, then the engine must be set to protection only and the explicit cloud endpoint URL provided via `SetProtectionCloudEndpointBaseUrl()`.

```cpp
FileEngine::Settings engineSettings("", authDelegate, "");
engineSettings.SetProtectionOnlyEngine = true;
engineSettings.SetProtectionCloudEndpointBaseUrl("https://rms.contoso.com");
```
-->

## Configuring Protection SDK in C++ to use AD RMS

If you've deployed the mobile device extension DNS SRV record and plan to pass in a user principal name or email address, [follow the instructions for using an identity](#set-the-protectionenginesettings-to-use-ad-rms-with-an-identity).

<!--
If you don't have the mobile device extension DNS SRV record, or won't have an identity at runtime, [follow the explicit endpoint instructions](#set-the-protectionenginesettings-to-use-ad-rms-with-an-explicit-endpoint).
-->

### Set the ProtectionEngine::Settings to use AD RMS with an Identity

If the DNS SRV record for mobile device extension has been published, and an identity provided in the `ProtectionEngine::Settings`, no extra code changes are required to use AD RMS. Service discovery will find the AD RMS endpoint and use it for protection operations.

```cpp
ProtectionEngine::Settings engineSettings(mip::Identity(mUsername), authDelegate, "");
```

<!-- tommos removed because this might be invalid based on testing. -->
<!--

### Set the ProtectionEngine::Settings to use AD RMS with an explicit endpoint

If the DNS SRV record isn't published or an identity isn't provided in the `ProtectionEngine::Settings`, then the protection endpoint URL must be set explicitly via `SetProtectionCloudEndpointBaseUrl()`.

```cpp
ProtectionEngine::Settings engineSettings("", authDelegate, "");
engineSettings.SetProtectionCloudEndpointBaseUrl("https://RMS.CONTOSO.COM");
```
-->

## Remove or Comment Label References

If you build the application from one of the quickstart guides, you'll find that your application has references to labels in the form of `fileEngine.SensitivityLabels` or `engine->ListSensitivityLabels();`. Because the application has been set to protection only, these blocks of code must be commented out or removed as running them will cause an exception.

## Next Steps

Now that you've made the changes to support AD RMS, your application can perform any protection-only operations using the AD RMS service as the protection provider.
