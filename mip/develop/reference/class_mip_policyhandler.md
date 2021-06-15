---
title: class PolicyHandler 
description: Documents the policyhandler::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 04/23/2021
---

# class PolicyHandler 
This class provides an interface for all policy handler functions on a file.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr\<ContentLabel\> GetSensitivityLabel(const ExecutionState& state)  |  Get the sensitivity label from existing content.
public std::vector\<std::shared_ptr\<Action\>\> ComputeActions(const ExecutionState& state)  |  Executes the rules in the handler based on the provided state and returns the list of actions to be executed.
public void NotifyCommittedActions(const ExecutionState& state)  |  Called once the computed actions have been applied, and the data committed to disk.
public static bool __CDECL IsLabeled(const std::vector<MetadataEntry>& metadata, const std::shared_ptr<MipContext>& mipContext) | Checks whether metadata contains label artifacts.

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

This call sends an audit event.

### IsLabeled function

Checks whether metadata contains label artifacts.

Parameters:

* **metadata** Metadata of file to check
* **mipContext** Global MIP context

**Returns** True if metadata contains active label artifacts, else false

This will only detect Microsoft labels. It will not detect 3rd-party labels, even if a tenant is configured to translate 3rd-party label metadata to Microsoft labels. The primary purpose of this API is to allow an application to quickly detect labeled content without any HTTP calls, and ths limitation is caused by the fact that retrieving tenant-specific label mapping would require an HTTP call.