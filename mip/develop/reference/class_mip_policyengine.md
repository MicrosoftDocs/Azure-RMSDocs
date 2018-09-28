# class mip::PolicyEngine 
This class provides an interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const Settings& GetSettings() const  |  Get the policy engine [Settings](class_mip_policyengine_settings.md).
public const std::vector<std::shared_ptr<Label>>& ListSensitivityLabels()  |  list the sensitivity labels associated with the policy engine.
 public const std::string& GetMoreInfoUrl() const  |  Provide a url for looking up more information about the policy/labels.
 public bool IsLabelingRequired() const  |  Checks if the policy dictates that a document must be labeled or not.
public std::shared_ptr<Label> GetDefaultSensitivityLabel()  |  Get the default sensitivity label.
public std::shared_ptr<PolicyHandler> CreatePolicyHandler(const std::string& contentIdentifier)  |  Create a Policy Handler to execute policy-related functions on a file's execution state.
 public void SendApplicationAuditEvent(const std::string& level, const std::string& eventType, const std::string& eventData)  |  Logs an application specific event to the audit pipeline.
  
## Members
  
### Settings
Get the policy engine [Settings](class_mip_policyengine_settings.md).

  
**Returns**: Policy engine settings. 
  
**See also**: [mip::PolicyEngine::Settings](class_mip_policyengine_settings.md)
  
### Label
list the sensitivity labels associated with the policy engine.

  
**Returns**: A list of sensitivity labels.
  
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
* **contentIdentifier**: a human-readable dentifier for the content. example for a file: "C:\mip-sdk-for-cpp\files\audit.docx" [path] example for an email: "RE: Audit design:user1@contoso.com" [Subject:Sender]



  
**Returns**: Policy Handler.
  
### SendApplicationAuditEvent
Logs an application specific event to the audit pipeline.

Parameters:  
* **description**: of the log level : Info/Error/Warning 


* **eventType**: a description of the type of event 


* **eventData**: the data associated with the event

