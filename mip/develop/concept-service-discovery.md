---
title: Concepts - Service discovery in the MIP SDK.
description: This article will help you understand how the MIP SDK implements service discovery
author: msmbaldwin
ms.service: information-protection
ms.topic: conceptual
ms.date: 11/14/2022
ms.author: mbaldwin
---

# Microsoft Information Protection SDK - Service Discovery

## Overview

The Microsoft Information Protection SDK supports the Azure commercial cloud, sovereign/government clouds and on-premises Active Directory Rights Management Service (AD RMS). There are different mechanisms used to discover which endpoint the SDK should use. This article will cover the discovery mechanisms and how to use each.

## Service discovery with mip::Identity

When creating any of the three engine types, the MIP SDK requires that the developer specifies either a `mip::Identity` or a `mip::Cloud` as part of the engine settings object. Take the File SDK as an example:

```cpp
FileEngine::Settings engineSettings(mip::Identity(mUsername), 
													mAuthDelegate, 
													"", 
													"en-US", 
													false);
```

The `FileEngine::Settings` object accepts a `mip::Identity` as the first parameter of the constructor. The UPN or email suffix provided via the `mip::Identity` is used first to determine whether the enterprise has any Active Directory Rights Management Service (AD RMS) cluster that should be used instead of Azure. This is done by attempting to resolve the **_rmsdisco._http._tcp** DNS SRV record under the domain suffix obtained from the `mip::Identity`. If name resolution fails for this SRV record, the SDK defaults to commercial cloud.

> When an AD RMS cluster is found, the `mip::FileEngine::FileEngineSettings` property `IsProtectionOnlyEngine` must be set to true. The Policy SDK cannot be used in conjuction with AD RMS publishing (Hold Your Own Key).

For example, if the `mip::Identity` is *Bob@contoso.com*, the SDK uses the mail address suffix *contoso.com* to generate a DNS query for SRV record. If the AD RMS Mobile Device Extensions (MDE) SRV record for Contoso (**_rmsdisco._http._tcp.contoso.com**) is found, the SDK will attempt to connect to the service referred to by the SRV record. If the Contoso record isn't found, the SDK defaults to the commercial endpoint at https://api.aadrm.com. For additional details on AD RMS configuration and DNS registration, please review the [AD RMS MDE documentation](./quick-app-adrms.md#service-discovery).

## Service discovery with mip::Cloud

If the identity of the user isn't know at engine creation, or the customer is in a sovereign cloud that doesn't support implicit service discovery, the `mip::Cloud` enum can be used to explicitly tell the SDK which cloud to use.

```cpp
FileEngine::Settings engineSettings("engineGUID",
                        				mAuthDelegate,
				                        "",
				                        "en-US",
				                        false);
engineSettings.SetCloud(mip::Cloud::US_GCC); // Tell engine to use US_GCC
```

The above sample passes in some unique engine GUID instead of `mip::Identity` and uses the `SetCloud()` method on the settings object to tell the SDK to use the United States Government Computing Cloud for both policy and protection functions. Expliticly setting the cloud applies to File, Protection, and Policy SDKs.

### Service discovery override with explicit endpoint

The last, least common way that applications can set the service endpoints is to override the service base URL by using one of the following APIs.

| SDK        | API                                 | Purpose                                                |
| ---------- | ----------------------------------- | ------------------------------------------------------ |
| File       | SetProtectionCloudEndpointBaseUrl() | Sets the protection endpoint to be used by the engine. |
| File       | SetPolicyCloudEndpointBaseUrl()     | Sets the policy endpoint to be used by the engine.     |
| Policy     | SetCloudEndpointBaseUrl()           | Sets the policy endpoint to be used by the engine.     |
| Protection | SetCloudEndpointBaseUrl()           | Sets the protection endpoint to be used by the engine. |

Each can be set on the engine settings object in the relevent engines settings object for that SDK.

## Protected Content Consumption

When protected content is consumed by the MIP SDK, service discovery is performed based on the licensing endpoint stored in the protected document. The application must still create a file or protection engine relevent to their own identity. When the `mip::FileHandler` object is created, the SDK will parse the license information and connect to the appropriate endpoint. If authentication is required, the user may be prompted to authenticate.