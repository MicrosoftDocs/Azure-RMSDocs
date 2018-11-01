---
title: Concepts - Implementing ExecutionState in the Microsoft Information Protection SDK
description: This article will help you understand how to use the ExecutionState in the Microsoft Information Protection SDK to compute actions and provide details for audit logging.
services: information-protection
author: tommoser
ms.service: information-protection
ms.topic: conceptual
ms.date: 10/22/2018
ms.author: tommos
---

# Implement ExecutionState

Passing information into the MIP SDK to compute an action that should be taken, based on the current state and desired state, is implemented via the `mip::ExecutionState` class. Like other classes in the SDK, the `ExecutionState` is an abstract class and must be implemented by the developer.

> For a complete example of an `ExecutionState` implementation, review the following sample source:
>
> * [execution_state_impl.h](https://github.com/Azure-Samples/mipsdk-policyapi-cpp-sample-basic/blob/master/mipsdk-policyapi-cpp-sample-basic/execution_state_impl.h)
> * [execution_state_impl.cpp](https://github.com/Azure-Samples/mipsdk-policyapi-cpp-sample-basic/blob/master/mipsdk-policyapi-cpp-sample-basic/execution_state_impl.cpp)

## mip::ExecutionState Members

`ExecutionState` exposes the following virtual members. Each provides some context to the policy engine to return information on which actions ought to be taken by the application. Additionally, this information may be used to provide audit information to the Azure Information Protection Reporting feature.


| Member                                                                           | Returns                                                                                                              |
|----------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| `std::string GetNewLabelId()`                                                      | Returns the label ID to be applied to the object.                                                                    |
| `mip::ContentState GetContentState()`                                              | Returns the mip::ContentState of the object.                                                                         |
| `std::pair<bool, std::string> IsDowngradeJustified()`                              | Returns a std::pair expressing whether downgrade is justified and the justification.                                 |
| `std::string GetContentIdentifier()`                                               | Returns the content identifier. This should be a human-readable identifier, indicating the location of the object.   |
| `mip::ActionSource GetNewLabelActionSource()`                                      | Returns the mip::ActionSource of the label.                                                                          |
| `mip::AssignmentMethod GetNewLabelAssignmentMethod()`                              | Returns the mip::AssignmentMethod of the label                                                                        |
| `std::vector<std::pair<std::string, std::string>> GetNewLabelExtendedProperties()` | Returns a std::vector of std::pairs of strings, containing the custom metadata that will be applied to the document. |
| `std::vector<std::pair<std::string, std::string>> GetContentMetadata()`            | Returns a std::vector of std::pairs of string containing the current content metadata.                               |
| `std::shared_ptr<mip::ProtectionDescriptor> GetProtectionDescriptor()`           | Returns a pointer to a mip::ProtectionDescriptor                                                                     |
| `mip::ContentFormat GetContentFormat()`                                            | Returns mip::ContentFormat                                                                                           |
| `mip::ActionType GetSupportedActions()`                                           | Returns mip::ActionTypes for the label.                                                                              |

Each must be overridden in an implementation of a class derived from `mip::ExecutionState`. In the sample application linked above, this is accomplished by implementing a struct called `ExecutionStateOptions`, and passing that in to the constructor of the derived class.

In the [example](https://github.com/Azure-Samples/mipsdk-policyapi-cpp-sample-basic/blob/master/mipsdk-policyapi-cpp-sample-basic/execution_state_impl.h), a struct called `ExecutionStateOptions` is defined as:

```cpp
struct ExecutionStateOptions {
    std::unordered_map<std::string, std::string> metadata;
    std::string newLabelId;
    std::string contentIdentifier;
    mip::ActionSource actionSource = mip::ActionSource::MANUAL;
    mip::ContentState contentState = mip::ContentState::REST;
    mip::AssignmentMethod assignmentMethod = mip::AssignmentMethod::STANDARD;
    bool isDowngradeJustified = false;
    std::string downgradeJustification;
    std::string templateId;
    mip::ContentFormat contentFormat = mip::ContentFormat::DEFAULT;
};
```

Each property is set by the application and then `ExecutionSateOptions` is passed in to the constructor of the class derived from `mip::ExecutionState`. This information is used to determine the actions to take. Data provided in the `mip::ExecutionState` will also surface in Azure Information Protection Analytics.

### Next Steps

Next, learn more about [computing actions](concept-policy-computeactions.md).
