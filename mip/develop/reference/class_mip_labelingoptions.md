---
title: class mip::LabelingOptions 
description: Documents the mip::labelingoptions class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/22/2019
---

# class mip::LabelingOptions 
Interface for configuring labeling options for the SetLabel/DeleteLabel methods.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public LabelingOptions(AssignmentMethod method, ActionSource actionSource)  | _Not yet documented._
public AssignmentMethod GetAssignmentMethod() const  | _Not yet documented._
public ActionSource GetActionSource() const  | _Not yet documented._
public bool IsDowngradeJustified() const  | _Not yet documented._
public const std::string& GetJustificationMessage() const  | _Not yet documented._
public const std::vector<std::pair<std::string, std::string>>& GetExtendedProperties() const  | _Not yet documented._
public void SetDowngradeJustification(bool isDowngradeJustified, const std::string& justificationMessage)  | _Not yet documented._
public void SetExtendedProperties(const std::vector<std::pair<std::string, std::string>>& extendedProperties)  | _Not yet documented._
  
## Members
  
### LabelingOptions
_Not documented yet._

  
### AssignmentMethod
_Not documented yet._

  
### ActionSource
_Not documented yet._

  
### IsDowngradeJustified
_Not documented yet._

  
### GetJustificationMessage
_Not documented yet._

  
### GetExtendedProperties
_Not documented yet._

  
### SetDowngradeJustification
_Not documented yet._

  
### SetExtendedProperties
_Not documented yet._
