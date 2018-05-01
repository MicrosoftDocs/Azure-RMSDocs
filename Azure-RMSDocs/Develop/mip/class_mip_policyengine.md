# class mip::PolicyEngine 
This class provides an interface for all engine functions.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Get the policy engine [Settings](#classmip_1_1_policy_engine_1_1_settings).
public const std::vector<std::shared_ptr<Label>>& ListSensitivityLabels()  |  list the sensitivity labels associated with the policy engine.
public std::shared_ptr<ContentLabel> GetSensitivityLabel(const ExecutionState& state)  |  Get the sensitivity label from existing content.
public std::shared_ptr<Label> GetDefaultSensitivityLabel()  |  Get the default sensitivity label.
public std::vector<std::shared_ptr<Action>> ComputeActions(const ExecutionState& state)  |  Executes the rules in the engine based on the provided state and returns the list of actions to be executed.
  
## Members
  
### Settings
Get the policy engine [Settings](#classmip_1_1_policy_engine_1_1_settings).
  
#### Returns
policy engine settings. 
**See also**: [mip::PolicyEngine::Settings](#classmip_1_1_policy_engine_1_1_settings)
  
### Label
list the sensitivity labels associated with the policy engine.
  
#### Returns
a list of sensitivity labels.
  
### ContentLabel
Get the sensitivity label from existing content.
Required information to retrieve the label will be obtained by using the provided execution state. 
  
#### Parameters
* state 
  
#### Returns
a content label object that contains the sensitivity label as well as additional information. returns empty if non exists. 
**See also**: [mip::ContentLabel](#classmip_1_1_content_label).
  
### Label
Get the default sensitivity label.
  
#### Returns
default sensitivy label if exists, nullptr if there is no default label set.
  
### Action
Executes the rules in the engine based on the provided state and returns the list of actions to be executed.
  
#### Parameters
* state the current execution state of the content the rules are running on. 
  
#### Returns
list of actions that should be applied on the content.