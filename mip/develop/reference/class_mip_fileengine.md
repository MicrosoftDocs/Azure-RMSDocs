---
title: class mip::FileEngine 
description: Documents the mip::fileengine class of the Microsoft Information Protection (MIP) SDK.
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---

# class mip::FileEngine 
This class provides an interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Returns the engine settings.
public const std::vector\<std::shared_ptr\<SensitivityTypesRulePackage\>\>& ListSensitivityTypes() const  |  list the sensitivity types associated with the policy engine.
public const std::shared_ptr\<Label\> GetDefaultSensitivityLabel() const  |  Get the default sensitivity label.
public const std::vector\<std::shared_ptr\<Label\>\>& ListSensitivityLabels()  |  Returns a list of sensitivity labels.
public const std::string& GetMoreInfoUrl() const  |  Provide a url for looking up more information about the policy/labels.
public const std::string& GetPolicyId() const  |  Gets the policy ID.
public bool IsLabelingRequired() const  |  Checks if the policy dictates that a document must be labeled.
public std::chrono::time_point\<std::chrono::system_clock\> GetLastPolicyFetchTime() const  |  Gets the time when the policy was last fetched.
public void CreateFileHandlerAsync(const std::string& inputFilePath, const std::string& actualFilePath, bool isAuditDiscoveryEnabled, const std::shared_ptr\<FileHandler::Observer\>& fileHandlerObserver, const std::shared_ptr\<void\>& context, const std::shared_ptr\<FileExecutionState\>& fileExecutionState)  |  Starts creating a file handler for given file path.
public void CreateFileHandlerAsync(const std::shared_ptr\<Stream\>& inputStream, const std::string& actualFilePath, bool isAuditDiscoveryEnabled, const std::shared_ptr\<FileHandler::Observer\>& fileHandlerObserver, const std::shared_ptr\<void\>& context, const std::shared_ptr\<FileExecutionState\>& fileExecutionState)  |  Starts creating a file handler for given file stream.
public void SendApplicationAuditEvent(const std::string& level, const std::string& eventType, const std::string& eventData)  |  Logs an application specific event to the audit pipeline.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  |  Gets a list of custom settings.
public bool HasClassificationRules() const  |  Gets if the policy has automatic or recommendation rules.
  
## Members
  
### GetSettings function
Returns the engine settings.
  
### ListSensitivityTypes function
list the sensitivity types associated with the policy engine.

  
**Returns**: A list of sensitivity labels. empty if LoadSensitivityTypesEnabled was false (
  
**See also**: [FileEngine::Settings](class_mip_fileengine_settings.md)).
  
### GetDefaultSensitivityLabel function
Get the default sensitivity label.

  
**Returns**: Default sensitivity label if exists, nullptr if there is no default label set.
  
### ListSensitivityLabels function
Returns a list of sensitivity labels.
  
### GetMoreInfoUrl function
Provide a url for looking up more information about the policy/labels.

  
**Returns**: A url in string format.
  
### GetPolicyId function
Gets the policy ID.

  
**Returns**: A string that represnt the policy ID
  
### IsLabelingRequired function
Checks if the policy dictates that a document must be labeled.

  
**Returns**: True if labeling is mandatory, else false.
  
### GetLastPolicyFetchTime function
Gets the time when the policy was last fetched.

  
**Returns**: The time when the policy was last fetched
  
### CreateFileHandlerAsync function
Starts creating a file handler for given file path.

Parameters:  
* **inputFilePath**: The file to open. The path must include the file name and, if one exists, the file name extension. 


* **actualFilePath**: The actual (not temporary) file path, will be used for audit. 


* **isAuditDiscoveryEnabled**: representing whether audit discovery is enabled or not. 


* **fileHandlerObserver**: A class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer.


  
### CreateFileHandlerAsync function
Starts creating a file handler for given file stream.

Parameters:  
* **inputStream**: A stream containing the file data. 


* **actualFilePath**: The path to the file. The path must include the file name and, if one exists, the file name extension. will also use to identify the file in audit. 


* **isAuditDiscoveryEnabled**: representing whether audit discovery is enabled or not. 


* **fileHandlerObserver**: A class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer.


  
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

  
**Returns**: A bool that will tell if there any automatic or recommandation rules in the policy