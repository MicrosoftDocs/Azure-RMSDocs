---
title: Concepts - The core concepts in the MIP SDK - Telemetry Control
description: This article will help you understand how to opt out of telemetry and which events are still sent when opted out.
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.collection: M365-security-compliance
ms.date: 10/01/2019
ms.author: tommoser
---

# Microsoft Information Protection SDK - Telemetry Configuration

## Telemetry

By default, the Microsoft Information Protection SDK sends telemetry data to Microsoft. This telemetry data is useful for troubleshooting bugs, quality, and performance issues across the SDK install base that we may not capture in our internal testing. When implementing your application with the SDK, it's important to give users and admins the ability to opt out of telemetry if required.

## Telemetry Configuration

Telemetry options in the MIP SDK can be controlled via [TelemetryConfiguration](https://docs.microsoft.com/en-us/dotnet/api/microsoft.informationprotection.telemetryconfiguration?view=mipsdk-dotnet). Create an instance of this class, then set **IsTelemetryOptedOut** to true. Provide the object of class **TelemetryConfiguration** to the function used to create **MipContext**. This doesn't completely eliminate telemetry data, but reduces to a minimum set with all end-user identifiable information scrubbed.

### Minimum Telemetry Events

When telemetry is set to *opted out*, a minimum set of data is sent to Microsoft. All personally identifiable information is scrubbed from this information. This data includes heartbeat information to understand that the SDK is being used, and system metadata. **No user content or end user identifiable information is set to the service.**

Review the tables below to see exactly what events and data are sent with minimum telemetry set.

#### Event: Heartbeat

| Name                                 | Description                                                   | Scrubbed |
| ------------------------------------ | ------------------------------------------------------------- | -------- |
| App.ApplicationId                    | The application identifier provided via mip::ApplicationInfo. | No       |
| App.ApplicationName                  | The application name provided via mip::ApplicationInfo.       | No       |
| App.ApplicationVersion               | The application version profided via mip::ApplicationInfo.    | No       |
| ApplicationId                        |                                                               | No       |
| ApplicationName                      |                                                               | No       |
| CreationTime                         |                                                               | No       |
| DefaultLabel.Id                      |                                                               | No       |
| Engine.TenantId                      |                                                               | No       |
| Tenant ID                            |                                                               | No       |
| Engine.UserObjectId                  |                                                               | No       |
| User GUID                            |                                                               | No       |
| Event.CorrelationId                  |                                                               | No       |
| Event.CorrelationIdDescription       |                                                               | No       |
| Event.ParentCorrelationId            |                                                               | No       |
| Event.ParentCorrelationIdDescription |                                                               | No       |
| Event.UniqueId                       |                                                               | No       |
| MachineName                          |                                                               | **Yes**  |
| MIP.Version                          |                                                               | No       |
| Operation                            |                                                               | No       |
| OrganizationId                       |                                                               | No       |
| Tenant ID                            |                                                               | No       |
| Platform                             |                                                               | No       |
| ProcessName                          |                                                               | No       |
| ProductVersion                       |                                                               | No       |
| SDKVersion                           |                                                               | No       |
| UserId                               |                                                               | **Yes**  |
| UserObjectId                         |                                                               | No       |
| Version                              |                                                               | No       |

#### Event: Discovery

| Name                                 | Description                                                   | Scrubbed |
| ------------------------------------ | ------------------------------------------------------------- | -------- |
| ActionId                             |                                                               | No       |
| App.ApplicationId                    | The application identifier provided via mip::ApplicationInfo. | No       |
| App.ApplicationName                  | The application name provided via mip::ApplicationInfo.       | No       |
| App.ApplicationVersion               | The application version profided via mip::ApplicationInfo.    | No       |
| ApplicationId                        |                                                               | No       |
| ApplicationName                      |                                                               | No       |
| CreationTime                         |                                                               | No       |
| DataState                            |                                                               | No       |
| DefaultLabel.Id                      |                                                               | No       |
| Engine.TenantId                      |                                                               | No       |
| Engine.UserObjectId                  |                                                               | No       |
| Event.CorrelationId                  |                                                               | No       |
| Event.CorrelationIdDescription       |                                                               | No       |
| Event.ParentCorrelationId            |                                                               | No       |
| Event.ParentCorrelationIdDescription |                                                               | No       |
| Event.UniqueId                       |                                                               | No       |
| LabelId                              |                                                               | No       |
| MachineName                          |                                                               | **Yes**  |
| MIP.Version                          |                                                               | No       |
| ObjectId                             |                                                               | **Yes**  |
| Operation                            |                                                               | No       |
| OrganizationId                       |                                                               | No       |
| Platform                             |                                                               | No       |
| ProcessName                          |                                                               | No       |
| Protected                            |                                                               | No       |
| Protection                           |                                                               | **Yes**  |
| ProtectionOwner                      |                                                               | **Yes**  |
| SDKVersion                           |                                                               | No       |
| UserId                               |                                                               | **Yes**  |
| UserObjectId                         |                                                               | No       |
| Version                              |                                                               | No       |

#### Event: Label Change

| Name                                 | Description                                                   | Scrubbed |
| ------------------------------------ | ------------------------------------------------------------- | -------- |
| ActionId                             |                                                               | No       |
| ActionIdBefore                       |                                                               | No       |
| ActionSource                         |                                                               | No       |
| App.ApplicationId                    | The application identifier provided via mip::ApplicationInfo. | No       |
| App.ApplicationName                  | The application name provided via mip::ApplicationInfo.       | No       |
| App.ApplicationVersion               | The application version profided via mip::ApplicationInfo.    | No       |
| ApplicationId                        |                                                               | No       |
| ApplicationName                      |                                                               | No       |
| CreationTime                         |                                                               | No       |
| DataState                            |                                                               | No       |
| DefaultLabel.Id                      |                                                               | No       |
| Engine.TenantId                      |                                                               | No       |
| Engine.UserObjectId                  |                                                               | No       |
| Event.CorrelationId                  |                                                               | No       |
| Event.CorrelationIdDescription       |                                                               | No       |
| Event.ParentCorrelationId            |                                                               | No       |
| Event.ParentCorrelationIdDescription |                                                               | No       |
| Event.UniqueId                       |                                                               | No       |
| IsLabelChanged                       |                                                               | No       |
| IsProtectionChanged                  |                                                               | No       |
| LabelId                              |                                                               | No       |
| LabelIdBefore                        |                                                               | No       |
| MachineName                          |                                                               | **Yes**  |
| MIP.Version                          |                                                               | No       |
| ObjectId                             |                                                               | **Yes**  |
| Operation                            |                                                               | No       |
| OrganizationId                       |                                                               | No       |
| Platform                             |                                                               | No       |
| ProcessName                          |                                                               | No       |
| Product Version                      |                                                               | No       |
| Protected                            |                                                               | No       |
| Protected Before                     |                                                               | No       |
| Protection                           |                                                               | **Yes**  |
| Protection Before                    |                                                               | **Yes**  |
| ProtectionContentId                  |                                                               | No       |
| ProtectionContentIdBefore            |                                                               | No       |
| ProtectionOwner                      |                                                               | **Yes**  |
| ProtectionOwnerBefore                |                                                               | **Yes**  |
| SDKVersion                           |                                                               | No       |
| UserId                               |                                                               | **Yes**  |
| UserObjectId                         |                                                               | No       |
| Version                              |                                                               | No       |


### Opting out in C++

To set telemetry to minimum only, create a shared pointer of **mip::TelemetryConfiguration()** and set **isTelemetryOptedOut** to true. Pass the configuration object in to **MipContent::Create()**.

```cpp
auto telemetryConfig = std::make_shared<mip::TelemetryConfiguration>();										
telemetryConfig->isTelemetryOptedOut = true;
					   
// Create MipContext, passing in mip::TelemetryConfiguration object.
mMipContext = mip::MipContext::Create(
    mAppInfo,
	"mip_data",
	mip::LogLevel::Trace,
	false,
	nullptr /*loggerDelegateOverride*/,
	telemetryConfig /*telemetryOverride*/
);
```

### Opting out in .NET

To set telemetry to minimum only, create a **TelemetryConfiguration()** object and set **isTelemetryOptedOut** to true. Pass the configuration object in to **MIP.CreateMipContext()**.

```csharp
TelemetryConfiguration telemetryConfiguration = new TelemetryConfiguration();
telemetryConfiguration.IsTelemetryOptedOut = true;

// Create MipContext, passing in TelemetryConfiguration object.
mipContext = MIP.CreateMipContext(appInfo, 
    "mip_data", 
    LogLevel.Trace, 
    null, 
    telemetryConfiguration);
```

