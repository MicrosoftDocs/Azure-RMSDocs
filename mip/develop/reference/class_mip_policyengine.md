---
title: class PolicyEngine 
description: Documents the policyengine::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 04/23/2021
---

# class PolicyEngine 
This class provides an interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Get the policy engine Settings.
public const std::vector\<std::shared_ptr\<Label\>\> ListSensitivityLabels(const std::vector\<std::string\>& contentFormats)  |  list the sensitivity labels associated with the policy engine according to the provided contentFormats.
public const std::vector\<std::shared_ptr\<SensitivityTypesRulePackage\>\>& ListSensitivityTypes() const  |  list the sensitivity types associated with the policy engine.
public const std::string& GetMoreInfoUrl() const  |  Provide a url for looking up more information about the policy/labels.
public bool IsLabelingRequired(const std::string& contentFormat) const  |  Checks if the policy dictates that a content must be labeled or not according to the provided contentFormat.
public const std::shared_ptr\<Label\> GetDefaultSensitivityLabel(const std::string& contentFormat) const  |  Get the default sensitivity label according to the provided contentFormat.
public std::shared_ptr\<Label\> GetLabelById(const std::string& id) const  |  Gets the label according to the provided id.
public std::shared_ptr\<PolicyHandler\> CreatePolicyHandler(bool isAuditDiscoveryEnabled, bool isGetSensitivityLabelAuditDiscoveryEnabled)  |  Create a Policy Handler to execute policy-related functions on a file's execution state.
public void SendApplicationAuditEvent(const std::string& level, const std::string& eventType, const std::string& eventData)  |  Logs an application specific event to the audit pipeline.
public const std::string& GetTenantId() const  |  Gets tenant ID associated with engine.
public const std::string& GetPolicyDataXml() const  |  Gets policy data XML which describes the settings, labels, and rules associated with this policy.
public const std::string& GetSensitivityTypesDataXml() const  |  Gets sensitivity types data XML which describes the sensitivity types associated with this policy.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  |  Gets a list of custom settings.
public const std::string& GetPolicyFileId() const  |  Gets the policy file ID.
public const std::string& GetSensitivityFileId() const  |  Gets the sensitivity file ID.
public bool HasClassificationRules(const std::vector\<std::string\>& contentFormats) const  |  Gets if the policy has automatic or recommendation rules according to the provided contentFormats.
public std::chrono::time_point\<std::chrono::system_clock\> GetLastPolicyFetchTime() const  |  Gets the time when the policy was last fetched.
public uint32_t GetWxpMetadataVersion() const  |  Gets the recommended WXP (Word, Excel, Powerpoint) metadata version, currently 0 for old verion 1 for co-authoring enabled version.
public bool HasWorkloadConsent(Workload workload) const  |  Checks if user has consented to specific workload,.
  
## Members
  
### GetSettings function
Get the policy engine Settings.

  
**Returns**: Policy engine settings. 
  
**See also**: mip::PolicyEngine::Settings
  
### ListSensitivityLabels function
list the sensitivity labels associated with the policy engine according to the provided contentFormats.

Parameters:  
* **contentFormats**: contentFormats Vector of formats to filter the sensitivity labels by, such as "file", "email", etc. Set contentFormats to an empty vector to filter the sensitivity labels by the default formats.



  
**Returns**: A list of sensitivity labels.
  
### ListSensitivityTypes function
list the sensitivity types associated with the policy engine.

  
**Returns**: A list of sensitivity labels. empty if LoadSensitivityTypesEnabled was false (
  
**See also**: PolicyEngine::Settings).
  
### GetMoreInfoUrl function
Provide a url for looking up more information about the policy/labels.

  
**Returns**: A url in string format.
  
### IsLabelingRequired function
Checks if the policy dictates that a content must be labeled or not according to the provided contentFormat.

Parameters:  
* **contentFormat**: The format to filter by when determining whether a label is required - example: "file", "email", etc. Set contentFormat to an empty string to determine whether labeling is required for the default format.



  
**Returns**: True if labeling is mandatory, else false.
  
### GetDefaultSensitivityLabel function
Get the default sensitivity label according to the provided contentFormat.

Parameters:  
* **contentFormat**: The format to filter by when retrieving the default sensitivity label - example: "file", "email", etc. Set contentFormat to an empty string to retrieve the default sensitivity label for the default format.



  
**Returns**: Default sensitivity label if exists, nullptr if there is no default label set.
  
### GetLabelById function
Gets the label according to the provided id.

Parameters:  
* **id**: Identifier for the label.



  
**Returns**: Label
  
### CreatePolicyHandler function
Create a Policy Handler to execute policy-related functions on a file's execution state.

Parameters:  
* **isAuditDiscoveryEnabled**: Describes whether audit discovery is enabled or not.



  
**Returns**: Policy Handler.
Application needs to keep the policy handler object for the lifetime of the document.
  
### SendApplicationAuditEvent function
Logs an application specific event to the audit pipeline.

Parameters:  
* **level**: of the log level: Info/Error/Warning. 


* **eventType**: a description of the type of event. 


* **eventData**: the data associated with the event.


  
### GetTenantId function
Gets tenant ID associated with engine.

  
**Returns**: Tenant ID
  
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
Gets if the policy has automatic or recommendation rules according to the provided contentFormats.

Parameters:  
* **contentFormat**: Vector of formats to consider when determining if a rule is defined for any provided format. Set contentFormats to an empty vector indicates the provided contentFormats are default formats.



  
**Returns**: A bool that will tell if there any automatic or recommendation rules in the policy
  
### GetLastPolicyFetchTime function
Gets the time when the policy was last fetched.

  
**Returns**: The time when the policy was last fetched
  
### GetWxpMetadataVersion function
Gets the recommended WXP (Word, Excel, Powerpoint) metadata version, currently 0 for old verion 1 for co-authoring enabled version.

  
**Returns**: Uint32_t int indecating what version of metadata the tenant supports for WXP files.
  
### HasWorkloadConsent function
Checks if user has consented to specific workload,.

  
**Returns**: Bool indicating consent.