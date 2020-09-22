---
title: class ComputeEngine 
description: Documents the computeengine::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 09/21/2020
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
public const std::string& GetUpn() const  | _Not yet documented._
public bool IsLabelingRequired() const  | _Not yet documented._
public const std::string& GetFileId() const  | _Not yet documented._
public bool HasClassificationRules() const  | _Not yet documented._
public bool IsEnhancedClassificationEnabled() const  | _Not yet documented._
public std::shared_ptr\<Label\> GetLabelById(const std::string& id) const  | _Not yet documented._
public const std::string& GetTenantId() const  | _Not yet documented._
public void SetSensitivityTypesRulePackages(std::vector\<std::shared_ptr\<SensitivityTypesRulePackage\>\> && custom)  | _Not yet documented._
public const std::vector\<std::shared_ptr\<SensitivityTypesRulePackage\>\>& GetSensitivityTypesRulePackages() const  | _Not yet documented._
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  | _Not yet documented._
public uint32_t GetOpcMetadataVersion() const  | _Not yet documented._
public const std::string& GetUserObjectId() const  | _Not yet documented._
public virtual ~ComputeEngine()  | _Not yet documented._
  
## Members
  
### ListSensitivityLabels function
Not yet documented.

  
### GetSensitivityLabel function
Not yet documented.

  
### ComputeActions function
Not yet documented.

  
### ComputeActionsWithRemoteState function
Computes actions while choosing between remote and local state.
State is selected using this priority. Unknown protection types, (template or ad-hoc not in the policy). Protection state is always preferable to unprotected state. Document state with label is preferred above one without. Label order, higher is preferred. Label timestamp, prefer newest labelled document. DocumentState LastModifiedTime optionally implemented, prefer newly modified file.

Parameters:  
* **context**: Comput engine context. 


* **localDocumentState**: Local document state. 


* **remoteDocumentState**: Remote document state. 


* **actionState**: The application's action state.



  
**Returns**: Methods return a pair. first contains a list of the action the second is whether it should be applied on the local, if false actions should be applied on the remote document and that document state should be used.
  
### NotifyCommittedActions function
Not yet documented.

  
### GetDefaultLabel function
Not yet documented.

  
### GetMoreInfoUrl function
Not yet documented.

  
### GetUpn function
Not yet documented.

  
### IsLabelingRequired function
Not yet documented.

  
### GetFileId function
Not yet documented.

  
### HasClassificationRules function
Not yet documented.

  
### IsEnhancedClassificationEnabled function
Not yet documented.

  
### GetLabelById function
Not yet documented.

  
### GetTenantId function
Not yet documented.

  
### SetSensitivityTypesRulePackages function
Not yet documented.

  
### GetSensitivityTypesRulePackages function
Not yet documented.

  
### GetCustomSettings function
Not yet documented.

  
### GetOpcMetadataVersion function
Not yet documented.

  
### GetUserObjectId function
Not yet documented.

  
### ~ComputeEngine function
Not yet documented.
