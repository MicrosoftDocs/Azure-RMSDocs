---
title: Concepts - Using the Microsoft Information Protection SDK to generate audit events
description: This article will help you understand how to use the Microsoft Information Protection SDK to compute.
services: information-protection
author: tommoser
ms.service: information-protection
ms.topic: conceptual
ms.date: 11/16/2018
ms.author: tommos
---

# Compute an Action

As previously detailed, the primary functions of the Policy API are to:
- list available labels
- return a set of actions that should be taken, based on the current and desired state

The last step in the process is to provide a label identifier and, optionally, metadata about the existing label to the `ComputeActions()` function.

Sample code for this article can be found on GitHub.

* [mipsdk-policyapi-cpp-sample-basic](https://github.com/Azure-Samples/mipsdk-policyapi-cpp-sample-basic)

## Compute an Action for a New Label

Computing the `mip::Actions` for a new label, can be achieved by using the `ExecutionStateImpl` defined in  [ExecutionState](concept-handler-policy-executionstate-cpp.md).

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

When using the Policy API, it's up to the application to read metadata from  content. This metadata is provided to the API as part of the `mip::ExecutionState`. `ComputeActions()` can handle more complex operations than applying a new label to an unlabeled document. The example below demonstrates downgrading a label from a more sensitive label, to a less sensitive label. This process is simulated by reading a comma-separated string of metadata, and providing to the API via `mip::ExecutionState`.

> [!NOTE]
> The sample uses a utility function called `SplitString()`. An example can be found [here](https://github.com/Azure-Samples/mipsdk-policyapi-cpp-sample-basic/blob/master/mipsdk-policyapi-cpp-sample-basic/utils.cpp)

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

- Learn how to [pass audit events to Azure Information Protection Analytics](concept-handler-policy-auditing.md)
- Download the [Policy API Samples from GitHub and try out the Policy API](https://azure.microsoft.com/resources/samples/?sort=0&term=mipsdk+policyapi)