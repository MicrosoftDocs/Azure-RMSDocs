# class mip::ExecutionState 
Interface for all the state needed to execute the engine.
Clients should only call the methods to obtain the state that is needed. Hence, for efficiency, clients may want to implement this interface such that the corresponding state is computed dynamically instead of computing in advance.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public std::string GetNewLabelId() const  |  Gets the sensitivity label id that should be applied on the document.
 public bool IsDowngradeJustified() const  |  Implementation should pass whether or not justification to downgrade an existing label was given.
 public AssignmentMethod GetNewLabelAssignmentMethod() const  |  Get the new label's assignment method.
public std::vector<std::pair<std::string, std::string>> GetContentMetadata(const std::vector<std::string>& names, const std::vector<std::string>& namePrefixes) const  |  Get the meta-data items from the content.
 public std::string GetTemplateId() const  |  Gets the rights managment service protection template id.
 public ContentFormat GetContentFormat() const  |  Gets the content format.
 public const ActionType GetSupportedActions() const  |  Return a list of actions that the application supports. All actions types are listed in [mip/upe/action.h](#action).
  
## Members
  
### GetNewLabelId
Gets the sensitivity label id that should be applied on the document.

  
**Returns**: Sensitivity label id to be applied to the content if exists else empty to remove label.
  
### IsDowngradeJustified
Implementation should pass whether or not justification to downgrade an existing label was given.

  
**Returns**: True if downgrade is already justified, false if it hasn't yet been justified. 
**See also**: [mip::JustifyAction](class_mip_justifyaction.md)
  
### GetNewLabelAssignmentMethod
Get the new label's assignment method.

  
**Returns**: The assignment method STANDARD, PRIVILEGED, AUTO. 
**See also**: mip::AssignmentMethod
  
### GetContentMetadata
Get the meta-data items from the content.

  
**Returns**: A vector of key value pairs representing the meta data applied to the content. 
Each meta-data item is a pair of name and value.
  
### GetTemplateId
Gets the rights managment service protection template id.

  
**Returns**: The rights managment service protection template id if exists else in a guid format without braces, return an empty string.
  
### GetContentFormat
Gets the content format.

  
**Returns**: DEFAULT, EMAIL 
**See also**: mip::ContentFormat
  
### ActionType
Return a list of actions that the application supports. All actions types are listed in [mip/upe/action.h](#action).