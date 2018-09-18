# class mip::PolicyHandler 
This class provides an interface for all policy handler functions on a file.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public std::shared_ptr<ContentLabel> GetSensitivityLabel(const ExecutionState& state)  |  Get the sensitivity label from existing content.
public std::vector<std::shared_ptr<Action>> ComputeActions(const ExecutionState& state)  |  Executes the rules in the handler based on the provided state and returns the list of actions to be executed.
 public void NotifyCommitedActions(const ExecutionState& state)  |  Called once the computed actions have been applied, and the data commited to disk.
  
## Members
  
### ContentLabel
Get the sensitivity label from existing content.
Required information to retrieve the label will be obtained by using the provided execution state. 

Parameters:  
* **state**: 



  
**Returns**: A content label object that contains the sensitivity label as well as additional information. returns empty if non exists. 
  
**See also**: [mip::ContentLabel](class_mip_contentlabel.md).
  
### Action
Executes the rules in the handler based on the provided state and returns the list of actions to be executed.

Parameters:  
* **state**: the current execution state of the content the rules are running on. 



  
**Returns**: List of actions that should be applied on the content.
  
### NotifyCommitedActions
Called once the computed actions have been applied, and the data commited to disk.

Parameters:  
* **state**: the current execution state of the content after the actions have been commited 


: This call sends an audit event