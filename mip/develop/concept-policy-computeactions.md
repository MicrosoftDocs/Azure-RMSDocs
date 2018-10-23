---
title: Concepts - Using the Microsoft Information Protection SDK to generate audit events
description: This article will help you understand how to use the Microsoft Information Protection SDK to generate audit events that will surface in the Azure Information Protection audit reports.
services: information-protection
author: BryanLa
ms.service: information-protection
ms.topic: conceptual
ms.date: 10/22/2018
ms.author: bryanla
---

# Compute an Action

##

```cpp
sample::policy::ExecutionStateOptions options;
options.newLabelId = newLabelId;
options.assignmentMethod = mip::AssignmentMethod::STANDARD;
options.contentFormat = mip::ContentFormat::DEFAULT;
options.contentState = mip::ContentState::REST;

std::unique_ptr<ExecutionStateImpl> state(new ExecutionStateImpl(options));
auto handler = mEngine->CreatePolicyHandler(false); // Don't generate audit event.
auto actions = handler->ComputeActions(*state);
```

The `PolicyHandler` will compute the actions and return a `std::vector` of `mip::Action`. The application must be built to do something with these actions.