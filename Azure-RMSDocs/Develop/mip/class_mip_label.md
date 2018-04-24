# class mip::Label 
Abstraction for a single Microsoft Information Protection label.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string & GetId | Get the label Id.
public const std::string & GetName | Get the label name.
public const std::string & GetDescription | Get the label description.
public const std::string & GetColor | Get the color the label should be displayed.
public const std::string & GetOrder | Get the Order of the label.
public const std::string & GetTooltip | Get the tooltip description of the label.
public bool IsActive | Gets a boolean signaling if the label is active.
public std::weak_ptr< Label > GetParent | Get the parent label.
public const std::vector< std::shared_ptr< Label > > & GetChildren | Get the children labels of the current label.
## Members
### GetId
Get the label Id.
#### Returns
the label id.
### GetName
Get the label name.
#### Returns
the label name.
### GetDescription
Get the label description.
#### Returns
the label description.
### GetColor
Get the color the label should be displayed.
#### Returns
color value the string format. "#RRGGBB" where each of RR, GG, BB is a hexadecimal 0-f.
### GetOrder
Get the Order of the label.
#### Returns
a numerical value ascribed as a string.
### GetTooltip
Get the tooltip description of the label.
#### Returns
a tooltip string.
### IsActive
Gets a boolean signaling if the label is active.
Only active labels can be applied. Inactive labels cannot be applied, and are used for display purposes only. 
#### Returns
true if label is active, else false.
### Label
Get the parent label.
#### Returns
a weak pointer to the parent label if exists else an empty pointer.
### Label
Get the children labels of the current label.
#### Returns
a vector of shared pointers to labels.