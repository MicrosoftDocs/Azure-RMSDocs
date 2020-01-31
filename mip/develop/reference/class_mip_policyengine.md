---
title: class mip::PolicyEngine 
description: Documents the mip::policyengine class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/31/2020
---

# class mip::PolicyEngine 
This class provides an interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Get the policy engine [Settings](undefined).
public const std::vector\<std::shared_ptr\<Label\>\>& ListSensitivityLabels()  |  list the sensitivity labels associated with the policy engine.
public const std::vector\<std::shared_ptr\<SensitivityTypesRulePackage\>\>& ListSensitivityTypes() const  |  list the sensitivity types associated with the policy engine.
public const std::string& GetMoreInfoUrl() const  |  Provide a url for looking up more information about the policy/labels.
public bool IsLabelingRequired() const  |  Checks if the policy dictates that a document must be labeled or not.
public std::shared_ptr\<Label\> GetDefaultSensitivityLabel()  |  Get the default sensitivity label.
public std::shared_ptr\<Label\> GetLabelById(const std::string& id) const  |  Gets the label according to the provided id.
public std::shared_ptr\<PolicyHandler\> CreatePolicyHandler(bool isAuditDiscoveryEnabled)  |  Create a Policy Handler to execute policy-related functions on a file's execution state.
public void SendApplicationAuditEvent(const std::string& level, const std::string& eventType, const std::string& eventData)  |  Logs an application specific event to the audit pipeline.
public const std::string& GetPolicyDataXml() const  |  Gets policy data XML which describes the settings, labels, and rules associated with this policy.
public const std::string& GetSensitivityTypesDataXml() const  |  Gets sensitivity types data XML which describes the sensitivity types associated with this policy.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  |  Gets a list of custom settings.
public const std::string& GetPolicyFileId() const  |  Gets the policy file ID.
public const std::string& GetSensitivityFileId() const  |  Gets the sensitivity file ID.
public bool HasClassificationRules() const  |  Gets if the policy has automatic or recommendation rules.
public std::chrono::time_point\<std::chrono::system_clock\> GetLastPolicyFetchTime() const  |  Gets the time when the policy was last fetched.
  
## Members
  
### GetSettings function
Get the policy engine [Settings](undefined).

  
**Returns**: Policy engine settings. 
  
**See also**: [mip::PolicyEngine::Settings](undefined)
  
### ListSensitivityLabels function
list the sensitivity labels associated with the policy engine.

  
**Returns**: A list of sensitivity labels.
  
### ListSensitivityTypes function
list the sensitivity types associated with the policy engine.

  
**Returns**: A list of sensitivity labels. empty if LoadSensitivityTypesEnabled was false (
  
**See also**: [PolicyEngine::Settings](undefined)).
  
### GetMoreInfoUrl function
Provide a url for looking up more information about the policy/labels.

  
**Returns**: A url in string format.
  
### IsLabelingRequired function
Checks if the policy dictates that a document must be labeled or not.

  
**Returns**: True if labeling is mandatory, else false.
  
### GetDefaultSensitivityLabel function
Get the default sensitivity label.

  
**Returns**: Default sensitivity label if exists, nullptr if there is no default label set.
  
### GetLabelById function
Gets the label according to the provided id.
  
### CreatePolicyHandler function
Create a Policy Handler to execute policy-related functions on a file's execution state.

Parameters:  
* **A**: bool representing whether audit discovery is enabled or not.



  
**Returns**: Policy Handler.
Application needs to keep the policy handler object for the lifetime of the document.
  
### SendApplicationAuditEvent function
Logs an application specific event to the audit pipeline.

Parameters:  
* **level**: of the log level: Info/Error/Warning. 


* **eventType**: a description of the type of event. 


* **eventData**: the data associated with the event.


  
### GetPolicyDataXml function
Gets policy data XML which describes the settings, labels, and rules associated with this policy.

  
**Returns**: Policy data XML.
  
### GetSensitivityTypesDataXml function
Gets sensitivity types data XML which describes the sensitivity types associated with this policy.

  
**Returns**: Sensitivity types data XML.
  
### GetCustomSettings function
Gets a list of custom settings.

  
**Returns**: A vector of custom settings.
  
### GetPolicyFileId function
Gets the policy file ID.

  
**Returns**: A string that represent the policy file ID
  
### GetSensitivityFileId function
Gets the sensitivity file ID.

  
**Returns**: A string that represent the policy file ID
  
### HasClassificationRules function
Gets if the policy has automatic or recommendation rules.

  
**Returns**: A bool that will tell if there any automatic or recommendation rules in the policy
  
### GetLastPolicyFetchTime function
Gets the time when the policy was last fetched.

  
**Returns**: The time when the policy was last fetched