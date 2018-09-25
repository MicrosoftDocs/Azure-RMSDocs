# class mip::Label 
Abstraction for a single Microsoft Information Protection label.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const std::string& GetId() const  |  Get the label Id.
 public const std::string& GetName() const  |  Get the label name.
 public const std::string& GetDescription() const  |  Get the label description.
 public const std::string& GetColor() const  |  Get the color the label should be displayed.
 public int GetSensitivity() const  |  Get the Sensitivity of the label.
 public const std::string& GetTooltip() const  |  Get the tooltip description of the label.
 public bool IsActive() const  |  Gets a boolean signaling if the label is active.
public std::weak_ptr<Label> GetParent() const  |  Get the parent label.
public const std::vector<std::shared_ptr<Label>>& GetChildren() const  |  Get the children labels of the current label.
  
## Members
  
### GetId
Get the label Id.

  
**Returns**: The label id.
  
### GetName
Get the label name.

  
**Returns**: The label name.
  
### GetDescription
Get the label description.

  
**Returns**: The label description.
  
### GetColor
Get the color the label should be displayed.

  
**Returns**: Color value the string format. "#RRGGBB" where each of RR, GG, BB is a hexadecimal 0-f.
  
### GetSensitivity
Get the Sensitivity of the label.

  
**Returns**: A numerical value. Higher value defines higher Sensitivity.
  
### GetTooltip
Get the tooltip description of the label.

  
**Returns**: A tooltip string.
  
### IsActive
Gets a boolean signaling if the label is active.
Only active labels can be applied. Inactive labels cannot be applied, and are used for display purposes only. 

  
**Returns**: True if label is active, else false.
  
### Label
Get the parent label.

  
**Returns**: A weak pointer to the parent label if exists else an empty pointer.
  
### Label
Get the children labels of the current label.

  
**Returns**: A vector of shared pointers to labels.