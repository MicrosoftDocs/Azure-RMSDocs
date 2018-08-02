# class mip::RemoveWatermarkAction 
An action class which specifies removing the watermarking from the document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector<std::string>& GetUIElementNames()  |  Gets a list of names that should be used to find the UI elements that should be removed.
 public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).
  
## Members
  
### GetUIElementNames
Gets a list of names that should be used to find the UI elements that should be removed.

  
**Returns**: A list of ui element names.
  
### ActionType
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.