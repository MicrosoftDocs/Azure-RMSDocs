---
title: class mip::PolicyEngine 
description: Documents the mip::policyengine class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/18/2019
---

# class mip::PolicyEngine 
This class provides an interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Get the policy engine [Settings](class_mip_policyengine_settings.md).
public const std::vector<std::shared_ptr<Label>>& ListSensitivityLabels()  |  list the sensitivity labels associated with the policy engine.
public const std::vector<std::shared_ptr<SensitivityTypesRulePackage>>& ListSensitivityTypes() const  |  list the sensitivity types associated with the policy engine.
public const std::string& GetMoreInfoUrl() const  |  Provide a url for looking up more information about the policy/labels.
public bool IsLabelingRequired() const  |  Checks if the policy dictates that a document must be labeled or not.
public std::shared_ptr<Label> GetDefaultSensitivityLabel()  |  Get the default sensitivity label.
public std::shared_ptr<PolicyHandler> CreatePolicyHandler(bool isAuditDiscoveryEnabled)  |  Create a Policy Handler to execute policy-related functions on a file's execution state.
public void SendApplicationAuditEvent(const std::string& level, const std::string& eventType, const std::string& eventData)  |  Logs an application specific event to the audit pipeline.
public const std::string& GetPolicyDataXml() const  |  Gets policy data XML which describes the settings, labels, and rules associated with this policy.
public const std::vector<std::pair<std::string, std::string>>& GetCustomSettings() const  |  Gets a list of custom settings.
  
## Members
  
### Settings
Get the policy engine [Settings](class_mip_policyengine_settings.md).

  
**Returns**: Policy engine settings. 
  
**See also**: [mip::PolicyEngine::Settings](class_mip_policyengine_settings.md)
  
### Label
list the sensitivity labels associated with the policy engine.

  
**Returns**: A list of sensitivity labels.
  
### SensitivityTypesRulePackage
list the sensitivity types associated with the policy engine.

  
**Returns**: A list of sensitivity labels. empty if LoadSensitivityTypesEnabled was false (
  
**See also**: [PolicyEngine::Settings](class_mip_policyengine_settings.md)).
  
### GetMoreInfoUrl
Provide a url for looking up more information about the policy/labels.

  
**Returns**: A url in string format.
  
### IsLabelingRequired
Checks if the policy dictates that a document must be labeled or not.

  
**Returns**: True if labeling is mandatory, else false.
  
### Label
Get the default sensitivity label.

  
**Returns**: Default sensitivity label if exists, nullptr if there is no default label set.
  
### PolicyHandler
Create a Policy Handler to execute policy-related functions on a file's execution state.

Parameters:  
* **A**: bool representing whether audit discovery is enabled or not



  
**Returns**: Policy Handler.
Application needs to keep the policy handler object for the lifetime of the document
  
### SendApplicationAuditEvent
Logs an application specific event to the audit pipeline.

Parameters:  
* **level**: of the log level : Info/Error/Warning 


* **eventType**: a description of the type of event 


* **eventData**: the data associated with the event


  
### GetPolicyDataXml
Gets policy data XML which describes the settings, labels, and rules associated with this policy.

  
**Returns**: Policy data XML
  
### GetCustomSettings
Gets a list of custom settings.

  
**Returns**: A vector of custom settings