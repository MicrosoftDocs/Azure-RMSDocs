---
title: class PolicyHandler 
description: Documents the policyhandler::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 11/14/2022
---

# class PolicyHandler 
This class provides an interface for all policy handler functions on a file.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr&lt;ContentLabel&gt; GetSensitivityLabel(const ExecutionState& state)  |  Get the sensitivity label from existing content.
public std::vector&lt;std::shared_ptr&lt;Action&gt;&gt; ComputeActions(const ExecutionState& state)  |  Executes the rules in the handler based on the provided state and returns the list of actions to be executed.
public void NotifyCommittedActions(const ExecutionState& state)  |  Called once the computed actions have been applied, and the data committed to disk.
  
## Members
  
### GetSensitivityLabel function
Get the sensitivity label from existing content.

Parameters:  
* **state**: Current state of the content. 



  
**Returns**: The label currently applied to the content. If not labeled, returns empty.
  
### ComputeActions function
Executes the rules in the handler based on the provided state and returns the list of actions to be executed.

Parameters:  
* **state**: the current execution state of the content the rules are running on. 



  
**Returns**: List of actions that should be applied on the content.
  
### NotifyCommittedActions function
Called once the computed actions have been applied, and the data committed to disk.

Parameters:  
* **state**: the current execution state of the content after the actions have been committed. 


: This call sends an audit event.
