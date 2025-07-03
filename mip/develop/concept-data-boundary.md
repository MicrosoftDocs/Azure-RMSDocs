---
title: Concepts - Data boundary
description: This article will help you understand the concepts around data compliance boundaries in MIP SDK.
author: tommoser
ms.service: information-protection
ms.topic: conceptual
ms.date: 04/10/2025
ms.author: tommos
---

# Concept - Data boundaries in the MIP SDK

To support requirements around data privacy regulations, the Microsoft Information Protection SDK allows developers to specify a data boundary. This data boundary controls the region to which audit and telemetry events are sent and in certain cases, where these events are stored and processed.

## Data boundary values and behaviors

Possible values for the `DataBoundary` enum are:

| Value                    | Details                                                                                                                 |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| Default                  | Audit and telemetry events are emitted to the nearest collector and forwarded to the United States.                     |
| Asia                     | Audit and telemetry events are emitted to a collector in the Asia Pacific region and forwarded to the United States.    |
| Europe_MiddleEast_Africa | Audit and telemetry events are emitted to a collector in the EMEA region and forwarded to the United States.            |
| European_Union           | Audit and telemetry events are emitted to a collector in the European Union region and remain in region for processing. |
| North_America            | Audit and telemetry events are emitted to North America region and remain in region for processing.                     |

## When to set the data boundary

Your application will need to provide an interface that allows users or administrators to set this property based on their data residency requirements. For applications with an administrative interface, this option can be done inside the admin portal. For client applications, you may need to enable deployment of a registry key, configuration value, or other setting. Your application will need to read this value and set the data boundary appropriately.

In coming releases, we'll make this setting transparent based on the data boundary defined in the customer tenancy.

## Setting the data boundary

The `DataBoundary` is set on the `FileEngineSettings`, `ProtectionEngineSettings`, or `PolicyEngineSettings` objects. 

```csharp
var engineSettings = new FileEngineSettings(identity.Email, authDelegate, "", "en-US")
{        
    Identity = identity,
    // Set the data boundary to EU
    DataBoundary = DataBoundary.European_Union
};
```

In the example above, all telemetry and audit events will be sent directly to the European Union.

## Sovereign Cloud support

The `DataBoundary` setting has no effect on clouds other than the default commercial cloud. Clouds such as Government Community Cloud High (GCC High) and 21-Vianet send data directly to those clouds by default.
