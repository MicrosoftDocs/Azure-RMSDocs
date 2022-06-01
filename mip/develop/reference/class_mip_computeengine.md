---
title: class ComputeEngine 
description: Documents the computeengine::undefined class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 05/31/2022
---

# class ComputeEngine 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector\<std::shared_ptr\<Label\>\> ListSensitivityLabels(const std::vector\<std::string\>& contentFormats)  | _Not yet documented._
public std::shared_ptr\<ContentLabel\> GetSensitivityLabel(ComputeEngineContext& context, const DocumentState& state)  | _Not yet documented._
public std::vector\<std::shared_ptr\<Action\>\> ComputeActions(ComputeEngineContext& context, const DocumentState& documentState, const ApplicationActionState& actionState)  | _Not yet documented._
public std::pair\<std::vector\<std::shared_ptr\<Action\>\>, bool\> ComputeActionsWithRemoteState(ComputeEngineContext& context, const DocumentState& localDocumentState, const DocumentState& remoteDocumentState, const ApplicationActionState& actionState)  |  Computes actions while choosing between remote and local state.
public void NotifyCommittedActions(ComputeEngineContext& context, const DocumentState& documentState, const ApplicationActionState& actionState)  | _Not yet documented._
public const std::shared_ptr\<Label\> GetDefaultLabel(const std::string& contentFormat) const  | _Not yet documented._
public const std::string& GetMoreInfoUrl() const  | _Not yet documented._
public const std::string& GetUpn() const  | _Not yet documented._
public bool IsLabelingRequired(const std::string& contentFormat) const  | _Not yet documented._
public bool IsDowngradeJustificationRequired() const  | _Not yet documented._
public const std::string& GetFileId() const  | _Not yet documented._
public bool HasClassificationRules(const std::vector\<std::string\>& contentFormats) const  | _Not yet documented._
public bool IsEnhancedClassificationEnabled() const  | _Not yet documented._
public std::shared_ptr\<Label\> GetLabelById(const std::string& id) const  | _Not yet documented._
public const std::string& GetTenantId() const  | _Not yet documented._
public void SetSensitivityTypesRulePackages(std::vector\<std::shared_ptr\<SensitivityTypesRulePackage\>\> && custom)  | _Not yet documented._
public const std::vector\<std::shared_ptr\<SensitivityTypesRulePackage\>\>& GetSensitivityTypesRulePackages() const  | _Not yet documented._
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  | _Not yet documented._
public uint32_t GetOpcMetadataVersion() const  | _Not yet documented._
public const std::string& GetUserObjectId() const  | _Not yet documented._
public bool HasWorkloadConsent(Workload workload) const  | _Not yet documented._
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
State is selected using this priority. Unknown protection types, (template or ad-hoc not in the policy). Protection state is always preferable to unprotected state. Document state with label is preferred above one without. Label order, higher is preferred. Label timestamp, prefer newest labelled document. DocumentState LastModifiedTime optionally implemented, prefer newly modified file.

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

  
### GetUpn function
_Not documented yet._

  
### IsLabelingRequired function
_Not documented yet._

  
### IsDowngradeJustificationRequired function
_Not documented yet._

  
### GetFileId function
_Not documented yet._

  
### HasClassificationRules function
_Not documented yet._

  
### IsEnhancedClassificationEnabled function
_Not documented yet._

  
### GetLabelById function
_Not documented yet._

  
### GetTenantId function
_Not documented yet._

  
### SetSensitivityTypesRulePackages function
_Not documented yet._

  
### GetSensitivityTypesRulePackages function
_Not documented yet._

  
### GetCustomSettings function
_Not documented yet._

  
### GetOpcMetadataVersion function
_Not documented yet._

  
### GetUserObjectId function
_Not documented yet._

  
### HasWorkloadConsent function
_Not documented yet._

  
### ~ComputeEngine function
_Not documented yet._
