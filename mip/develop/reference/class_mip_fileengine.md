---
title: class mip::FileEngine 
description: Documents the mip::fileengine class of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 01/28/2019
---

# class mip::FileEngine 
This class provides an interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Returns the engine settings.
public const std::vector\<std::shared_ptr\<SensitivityTypesRulePackage\>\>& ListSensitivityTypes() const  |  list the sensitivity types associated with the policy engine.
public const std::vector\<std::shared_ptr\<Label\>\>& ListSensitivityLabels()  |  Returns a list of sensitivity labels.
public const std::string& GetMoreInfoUrl() const  |  Provide a url for looking up more information about the policy/labels.
public bool IsLabelingRequired() const  |  Checks if the policy dictates that a document must be labeled.
public void CreateFileHandlerAsync(const std::string& inputFilePath, const std::string& contentIdentifier, const ContentState contentState, bool isAuditDiscoveryEnabled, const std::shared_ptr\<FileHandler::Observer\>& fileHandlerObserver, const std::shared_ptr\<void\>& context, const std::shared_ptr\<FileExecutionState\>& fileExecutionState)  |  Starts creating a file handler for given file path.
public void CreateFileHandlerAsync(const std::shared_ptr\<Stream\>& inputStream, const std::string& inputFilePath, const std::string& contentIdentifier, const mip::ContentState contentState, bool isAuditDiscoveryEnabled, const std::shared_ptr\<FileHandler::Observer\>& fileHandlerObserver, const std::shared_ptr\<void\>& context, const std::shared_ptr\<FileExecutionState\>& fileExecutionState)  |  Starts creating a file handler for given file stream.
public void SendApplicationAuditEvent(const std::string& level, const std::string& eventType, const std::string& eventData)  |  Logs an application specific event to the audit pipeline.
public const std::vector\<std::pair\<std::string, std::string\>\>& GetCustomSettings() const  |  Gets a list of custom settings.
  
## Members
  
### GetSettings function
Returns the engine settings.
  
### ListSensitivityTypes function
list the sensitivity types associated with the policy engine.

  
**Returns**: A list of sensitivity labels. empty if LoadSensitivityTypesEnabled was false (
  
**See also**: [FileEngine::Settings](class_mip_fileengine_settings.md)).
  
### ListSensitivityLabels function
Returns a list of sensitivity labels.
  
### GetMoreInfoUrl function
Provide a url for looking up more information about the policy/labels.

  
**Returns**: A url in string format.
  
### IsLabelingRequired function
Checks if the policy dictates that a document must be labeled.

  
**Returns**: True if labeling is mandatory, else false.
  
### CreateFileHandlerAsync function
Starts creating a file handler for given file path.

Parameters:  
* **inputFilePath**: The file to open. The path must include the file name and, if one exists, the file name extension. 


* **contentIdentifier**: a human-readable identifier for the content. example for a file: "C:\mip-sdk-for-cpp\files\audit.docx" [path\filename] example for an email: "RE: Audit design:user1@contoso.com" [Subject:Sender] 


* **contentState**: The state of the content while the application is interacting with it. 


* **isAuditDiscoveryEnabled**: representing whether audit discovery is enabled or not. 


* **fileHandlerObserver**: A class implementing the [FileHandler::Observer](class_mip_filehandler_observer.md) interface. 


* **context**: Client context that will be opaquely passed back to the observer.


  
### CreateFileHandlerAsync function
Starts creating a file handler for given file stream.

Parameters:  
* **inputStream**: A stream containing the file data. 


* **inputFilePath**: The path to the file. The path must include the file name and, if one exists, the file name extension. 


* **contentIdentifier**: a human-readable identifier for the content. example for a file: "C:\mip-sdk-for-cpp\files\audit.docx" [path\filename] example for an email: "RE: Audit design:user1@contoso.com" [Subject:Sender] 


* **contentState**: The state of the content while the application is interacting with it. 


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