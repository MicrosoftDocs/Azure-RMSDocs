---
title: class FileEngine 
description: Documents the fileengine::undefined class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---

# class FileEngine 
This class provides an interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Returns the engine settings.
public const std::vector\&lt;std::shared_ptr\&lt;SensitivityTypesRulePackage\&gt;\&gt;& ListSensitivityTypes() const  |  list the sensitivity types associated with the policy engine.
public const std::shared_ptr\&lt;Label\&gt; GetDefaultSensitivityLabel() const  |  Get the default sensitivity label.
public std::shared_ptr\&lt;Label\&gt; GetLabelById(const std::string& id) const  |  Gets the label according to the provided id.
public const std::vector\&lt;std::shared_ptr\&lt;Label\&gt;\&gt; ListSensitivityLabels()  |  Returns a list of sensitivity labels.
public const std::string& GetMoreInfoUrl() const  |  Provide a url for looking up more information about the policy/labels.
public const std::string& GetPolicyFileId() const  |  Gets the policy file ID.
public const std::string& GetSensitivityFileId() const  |  Gets the sensitivity file ID.
public bool IsLabelingRequired() const  |  Checks if the policy dictates that a document must be labeled.
public std::chrono::time_point\&lt;std::chrono::system_clock\&gt; GetLastPolicyFetchTime() const  |  Gets the time when the policy was last fetched.
public const std::string& GetPolicyDataXml() const  |  Gets policy data XML which describes the settings, labels, and rules associated with this policy.
public std::shared_ptr\&lt;AsyncControl\&gt; CreateFileHandlerAsync(const std::string& inputFilePath, const std::string& actualFilePath, bool isAuditDiscoveryEnabled, const std::shared_ptr\&lt;FileHandler::Observer\&gt;& fileHandlerObserver, const std::shared_ptr\&lt;void\&gt;& context, const std::shared_ptr\&lt;FileExecutionState\&gt;& fileExecutionState, bool isGetSensitivityLabelAuditDiscoveryEnabled)  |  Starts creating a file handler for given file path.
public std::shared_ptr\&lt;AsyncControl\&gt; CreateFileHandlerAsync(const std::shared_ptr\&lt;Stream\&gt;& inputStream, const std::string& actualFilePath, bool isAuditDiscoveryEnabled, const std::shared_ptr\&lt;FileHandler::Observer\&gt;& fileHandlerObserver, const std::shared_ptr\&lt;void\&gt;& context, const std::shared_ptr\&lt;FileExecutionState\&gt;& fileExecutionState, bool isGetSensitivityLabelAuditDiscoveryEnabled)  |  Starts creating a file handler for given file stream.
public void SendApplicationAuditEvent(const std::string& level, const std::string& eventType, const std::string& eventData)  |  Logs an application specific event to the audit pipeline.
public const std::vector\&lt;std::pair\&lt;std::string, std::string\&gt;\&gt;& GetCustomSettings() const  |  Gets a list of custom settings.
public bool HasClassificationRules() const  |  Gets if the policy has automatic or recommendation rules.
public bool HasWorkloadConsent(Workload workload) const  |  Checks if user has consented to specific workload,.
  
## Members
  
### GetSettings function
Returns the engine settings.
  
### ListSensitivityTypes function
list the sensitivity types associated with the policy engine.

  
**Returns**: A list of sensitivity labels. empty if LoadSensitivityTypesEnabled was false (
  
**See also**: [FileEngine::Settings](#class_file_engine_1_1_settings)).
  
### GetDefaultSensitivityLabel function
Get the default sensitivity label.

  
**Returns**: Default sensitivity label if exists, nullptr if there is no default label set.
  
### GetLabelById function
Gets the label according to the provided id.
  
### ListSensitivityLabels function
Returns a list of sensitivity labels.
  
### GetMoreInfoUrl function
Provide a url for looking up more information about the policy/labels.

  
**Returns**: A url in string format.
  
### GetPolicyFileId function
Gets the policy file ID.

  
**Returns**: A string that represent the policy file ID
  
### GetSensitivityFileId function
Gets the sensitivity file ID.

  
**Returns**: A string that represent the policy file ID
  
### IsLabelingRequired function
Checks if the policy dictates that a document must be labeled.

  
**Returns**: True if labeling is mandatory, else false.
  
### GetLastPolicyFetchTime function
Gets the time when the policy was last fetched.

  
**Returns**: The time when the policy was last fetched
  
### GetPolicyDataXml function
Gets policy data XML which describes the settings, labels, and rules associated with this policy.

  
**Returns**: Policy data XML.
  
### CreateFileHandlerAsync function
Starts creating a file handler for given file path.

Parameters:  
* **inputFilePath**: The file to open. The path must include the file name and, if one exists, the file name extension. 


* **actualFilePath**: The actual (not temporary) file path, will be used for audit. 


* **isAuditDiscoveryEnabled**: representing whether audit discovery is enabled or not. 


* **fileHandlerObserver**: A class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer. 


* **isGetSensitivityLabelAuditDiscoveryEnabled**: representing whether audit discovery is triggered for getSensitivityLabel or not. 



  
**Returns**: Async control object.
  
### CreateFileHandlerAsync function
Starts creating a file handler for given file stream.

Parameters:  
* **inputStream**: A stream containing the file data. 


* **actualFilePath**: The path to the file. The path must include the file name and, if one exists, the file name extension. will also use to identify the file in audit. 


* **isAuditDiscoveryEnabled**: representing whether audit discovery is enabled or not. 


* **fileHandlerObserver**: A class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer. 


* **isGetSensitivityLabelAuditDiscoveryEnabled**: representing whether audit discovery is triggered for getSensitivityLabel or not. 



  
**Returns**: Async control object.
  
### SendApplicationAuditEvent function
Logs an application specific event to the audit pipeline.

Parameters:  
* **level**: a description of the log level : Info/Error/Warning 


* **eventType**: a description of the type of event 


* **eventData**: the data associated with the event


  
### GetCustomSettings function
Gets a list of custom settings.

  
**Returns**: A vector of custom settings
  
### HasClassificationRules function
Gets if the policy has automatic or recommendation rules.

  
**Returns**: A bool that will tell if there any automatic or recommendation rules in the policy
  
### HasWorkloadConsent function
Checks if user has consented to specific workload,.

  
**Returns**: Bool indicating consent.