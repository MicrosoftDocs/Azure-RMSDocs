---
title: class ComputeEngine 
description: Documents the computeengine::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/16/2020
---

# class ComputeEngine 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<std::shared_ptr\<Label\>\>& ListSensitivityLabels()  | _Not yet documented._
public std::shared_ptr\<ContentLabel\> GetSensitivityLabel(ComputeEngineContext& context, const DocumentState& state)  | _Not yet documented._
public std::vector\<std::shared_ptr\<Action\>\> ComputeActions(ComputeEngineContext& context, const DocumentState& documentState, const ApplicationActionState& actionState)  | _Not yet documented._
public std::pair\<std::vector\<std::shared_ptr\<Action\>\>, bool\> ComputeActionsWithRemoteState(ComputeEngineContext& context, const DocumentState& localDocumentState, const DocumentState& remoteDocumentState, const ApplicationActionState& actionState)  |  Computes actions while choosing between remote and local state.
public void NotifyCommittedActions(ComputeEngineContext& context, const DocumentState& documentState, const ApplicationActionState& actionState)  | _Not yet documented._
public const std::shared_ptr\<Label\>& GetDefaultLabel() const  | _Not yet documented._
public const std::string& GetMoreInfoUrl() const  | _Not yet documented._
public virtual ~ComputeEngine()  | _Not yet documented._
  
## Members
  
### ListSensitivityLabels function
_Not documented yet._

  
### GetSensitivityLabel function
_Not documented yet._

  
### ComputeActions function
_Not documented yet._

  
### ComputeActionsWithRemoteState function
Computes actions while choosing between remote and local state.
State is selected using this priority. Unknown protection types, (template or ad-hoc not in the policy). Protection state is always preferable to unprotected state. Document state with label is preferred above one without. Label order, higher is preferred. Label timestamp, prefer newest labelled document. [DocumentState](class_mip_documentstate,md) LastModifiedTime optionally implemented, prefer newly modified file.

Parameters:  
* **context**: Comput engine context. 


* **localDocumentState**: Local document state. 


* **remoteDocumentState**: Remote document state. 


* **actionState**: The application's action state.



  
**Returns**: Methods return a pair. first contains a list of the action the second is whether it should be applied on the local, if false actions should be applied on the remote document and that document state should be used.
  
### NotifyCommittedActions function
_Not documented yet._

  
### GetDefaultLabel function
_Not documented yet._

  
### GetMoreInfoUrl function
_Not documented yet._

  
### ~ComputeEngine function
_Not documented yet._
