---
title: Concepts - Policy handlers in the MIP SDK.
description: This article will help you understand how Policy API handlers are created and used for calling operations.
author: tommoser
ms.service: information-protection
ms.topic: conceptual
ms.date: 11/01/2018
ms.author: tommos
---
# Microsoft Information Protection SDK - Policy handler concepts

In the Policy API, `mip::PolicyHandler` exposes the various operations that can be used to compute policy actions and submit audit events.

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

The first step required in obtaining policy actions, is to create a `PolicyHandler` object. This class implements the functionality required to get the list of actions a specific label must take, and the function to trigger an audit event.

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

# Compute an Action

As previously detailed, the primary functions of the Policy API are to:

- List the available labels.
- Return the specific set of actions that should be taken, based on the current and desired state. 

The last step in the process is to provide a label identifier and, optionally, metadata about the existing label to the `ComputeActions()` function.

Sample code for this article can be found on GitHub.

* [mipsdk-policyapi-cpp-sample-basic](https://github.com/Azure-Samples/mipsdk-policyapi-cpp-sample-basic)

## Compute an Action for a New Label

Computing the `mip::Actions` for a new label can be achieved by using the `ExecutionStateImpl` defined in the [ExecutionState](concept-auditing-policy-executionstate-cpp.md) section.

```cpp
// Replace with valid label ID.
string newLabelId = "d7b93a40-4df3-47e4-b2fd-7862fc6b095c"; 
sample::policy::ExecutionStateOptions options;

// Set desired newLabelId in ExecutionStateOptions.
options.newLabelId = newLabelId;

// Initialize ExecutionStateImpl with options, create handler, call ComputeActions.
std::unique_ptr<ExecutionStateImpl> state(new ExecutionStateImpl(options));
auto handler = mEngine->CreatePolicyHandler(false); // Don't generate audit event.
auto actions = handler->ComputeActions(*state);
```

Writing just the `mip::MetadataActions` returned as part of `actions` displays:

```cpp
Add: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_Enabled : true
Add: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_SetDate : 2018-10-23T20:39:06-0800
Add: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_Method : Standard
Add: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_Name : Contoso FTEs (C)
Add: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_SiteId : 94f6984e-8d31-4794-bdeb-3ac89ad2b660
Add: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_ActionId : 2266fbe8-a0d9-44e8-bad8-00008f2a0915
Add: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_ContentBits : 3
```

The `PolicyHandler` computes the actions and returns a `std::vector` of `mip::Action`. It's up to the application developer to apply this metadata to the file or data.

> [!NOTE]
> The example above displays only the `mip::MetadataAction` output. For an example of displaying additional action types, review the sample bundles with the [policy API download](https://aka.ms/mipsdkbins).

## Compute Actions with an Existing Label

When using the Policy API, it's up to the application to read metadata from the content. This metadata is provided to the API as part of the `mip::ExecutionState`. `ComputeActions()` can handle more complex operations than applying a new label to an unlabeled document. The example below demonstrates downgrading a label from a more sensitive label to a less sensitive label, where a label already exists. This process is simulated by reading in a comma-separated string of metadata, and providing to the API via `mip::ExecutionState`.

> [!NOTE]
> The sample uses a utility function called `SplitString()`. An example can be found [here](https://github.com/Azure-Samples/mipsdk-policyapi-cpp-sample-advanced/blob/master/mipsdk-policyapi-cpp-sample-advanced/utils.cpp)

```cpp
// Replace with valid label ID.
string newLabelId = "d7b93a40-4df3-47e4-b2fd-7862fc6b095c";

// Comma and Pipe Delimited Metadata.
string metadata = "MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_Enabled|true,MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_SetDate|2018-10-23T21:53:31-0800,MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_Method|Standard,MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_Name|Contoso FTEs (C),MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_SiteId|94f6984e-8d31-4794-bdeb-3ac89ad2b660,MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_ActionId|b56491d9-155f-40ff-866f-0000acd85c31,MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_ContentBits|7";

// Create ExecutionStateOptions and set newLabelId.
sample::policy::ExecutionStateOptions options;
options.newLabelId = newLabelId;

// Split metadata string by commas, store in vector.
vector<string> metadataPairs = sample::utils::SplitString(metadata, ','); 

// Iterate through each string, splitting by the pipe.
// Add each key/value pair to ExecutionStateOptions metadata.
for (const string& metadataPair : metadataPairs) {
    vector<string> keyValue = sample::utils::SplitString(metadataPair, '|');
    options.metadata[keyValue[0]] = keyValue[1];
}

// Initialize ExecutionStateImpl with options, create handler, call ComputeActions
std::unique_ptr<ExecutionStateImpl> state(new ExecutionStateImpl(options));
auto handler = mEngine->CreatePolicyHandler(false); // Don't generate audit event.
auto actions = handler->ComputeActions(*state);
```

The example above may result in several actions. These actions depend upon the labels provided as input and the label configuration. At a minimum, the result will be a single `mip::MetadataAction` that contains the data to remove, via `GetMetadataToRemove()` and the data to add via `GetMetadataToAdd()`.

```
Add: MSIP_Label_d48d0e60-c766-40d6-96d3-53b2857fe775_Enabled : true
Add: MSIP_Label_d48d0e60-c766-40d6-96d3-53b2857fe775_SetDate : 2018-10-23T23:59:41-0800
Add: MSIP_Label_d48d0e60-c766-40d6-96d3-53b2857fe775_Method : Standard
Add: MSIP_Label_d48d0e60-c766-40d6-96d3-53b2857fe775_Name : General
Add: MSIP_Label_d48d0e60-c766-40d6-96d3-53b2857fe775_SiteId : 94f6984e-8d31-4794-bdeb-3ac89ad2b660
Add: MSIP_Label_d48d0e60-c766-40d6-96d3-53b2857fe775_ActionId : 447a996b-28ea-482c-b0b5-000075bd4bb3
Add: MSIP_Label_d48d0e60-c766-40d6-96d3-53b2857fe775_ContentBits : 7
Remove: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_Name
Remove: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_Enabled
Remove: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_SiteId
Remove: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_SetDate
Remove: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_Method
Remove: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_ContentBits
Remove: MSIP_Label_d7b93a40-4df3-47e4-b2fd-7862fc6b095c_ActionId
```

## Next Steps

* Next, download the [Policy API Samples from GitHub and try out the Policy API](https://azure.microsoft.com/resources/samples/?sort=0&term=mipsdk+policyapi)
* Read about how to [pass audit events to the Azure Information Protection Analytics](concept-auditing-policy-cpp.md)