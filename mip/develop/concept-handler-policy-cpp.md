---
title: Concepts - Policy handlers in the MIP SDK.
description: This article will help you understand how Policy API handlers are created and used for calling operations.
author: tommoser
ms.service: information-protection
ms.topic: conceptual
ms.date: 11/16/2018
ms.author: tommos
---
# Microsoft Information Protection SDK - Policy handler concepts

In the Policy API, `mip::PolicyHandler` exposes operations used to compute policy actions, and submit audit events.

## Policy handler functions

`mip::PolicyHandler` exposes methods for reading, writing, and removing both labels and protection information. For the full list, consult the [API reference](reference/class_mip_PolicyHandler.md).

In this article, the following methods will be covered:

- `ComputeActions`
- `NotifyCommittedActions`

## Requirements

Creating a `PolicyHandler` requires:

- A `PolicyProfile`
- A `PolicyEngine` added to the `PolicyProfile`
- A class that inherits `mip::PolicyHandler::Observer`

## Create a policy handler

The first step required in obtaining policy actions, is to create a `PolicyHandler` object. This class implements functionality required to get the list of actions a specific label must take. It also implements the function to trigger an audit event.

Creating the `PolicyHandler` is as easy as calling the `PolicyEngine`'s `CreatePolicyHandlerAsync` function using the promise/future pattern.

`CreatePolicyHandlerAsync` accepts a single parameter: **isAuditDiscoveryEnabled**. Set this value to **true** if the application should surface heartbeat events in audit logging.

> [!NOTE]
> The `mip::PolicyHandler::Observer` class must be implemented in a derived class as `CreatePolicyHandler` requires the `Observer` object. 

```cpp
auto createPolicyHandlerPromise = std::make_shared<std::promise<std::shared_ptr<mip::PolicyHandler>>>();
auto createPolicyHandlerFuture = createPolicyHandlerPromise->get_future();
PolicyEngine->CreatePolicyHandlerAsync(true);
auto handler = createPolicyHandlerFuture.get();
```

After successfully creating the `PolicyHandler` object, actions may be computed and audit events submitted.

## Next Steps

Now that you've learned about creation of a Policy handler:

- Learn how to [create an execution state class](concept-handler-policy-execution-state-cpp.md), which is used for determining compute actions.
- Download the [Policy API Samples from GitHub and try out the Policy API](https://azure.microsoft.com/resources/samples/?sort=0&term=mipsdk+policyapi)
