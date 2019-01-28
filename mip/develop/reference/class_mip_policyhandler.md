---
title: class mip::PolicyHandler 
description: Documents the mip::policyhandler class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/28/2019
---

# class mip::PolicyHandler 
This class provides an interface for all policy handler functions on a file.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr\<ContentLabel\> GetSensitivityLabel(const ExecutionState& state)  |  Get the sensitivity label from existing content.
public std::vector\<std::shared_ptr\<Action\>\> ComputeActions(const ExecutionState& state)  |  Executes the rules in the handler based on the provided state and returns the list of actions to be executed.
public void NotifyCommittedActions(const ExecutionState& state)  |  Called once the computed actions have been applied, and the data committed to disk.
  
## Members
  
### GetSensitivityLabel function
Get the sensitivity label from existing content.

Parameters:  
* **state**: Current state of the content 



  
**Returns**: The label currently applied to the content. If not labeled, returns empty.
  
### ComputeActions function
Executes the rules in the handler based on the provided state and returns the list of actions to be executed.

Parameters:  
* **state**: the current execution state of the content the rules are running on. 



  
**Returns**: List of actions that should be applied on the content.
  
### NotifyCommittedActions function
Called once the computed actions have been applied, and the data committed to disk.

Parameters:  
* **state**: the current execution state of the content after the actions have been committed 


: This call sends an audit event