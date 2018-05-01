# class mip::RemoveContentHeaderAction 
An action class which specifies removing the content header from the document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector<std::string>& GetUIElementNames()  |  Gets a list of names that should be used to find the UI elements that should be removed.
public ActionType GetType() const  |  Get the type of [Action](#classmip_1_1_action).
  
## Members
  
### GetUIElementNames
Gets a list of names that should be used to find the UI elements that should be removed.
  
#### Returns
a list of ui element names.
  
### ActionType
Get the type of [Action](#classmip_1_1_action).
  
#### Returns
ActionType The type of derived action this base class can be cast to.