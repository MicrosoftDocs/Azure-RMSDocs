# class mip::ContentLabel 
Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
In addition to the label information, it holds properties for a specific applied label.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const std::string& GetCreationTime() const  |  Get the creation time of the label.
 public AssignmentMethod GetAssignmentMethod() const  |  Get the assignment method of the label.
public std::shared_ptr<Label> GetLabel() const  |  Get the actual label object applied on the content.
  
## Members
  
### GetCreationTime
Get the creation time of the label.

  
**Returns**: Creation time as a gmt string.
  
### GetAssignmentMethod
Get the assignment method of the label.

  
**Returns**: AssignmentMethod STANDARD | PRIVILEGED | AUTO. 
  
**See also**: mip::AssignmentMethod
  
### Label
Get the actual label object applied on the content.

  
**Returns**: The label object applied on the content. 
  
**See also**: [mip::Label](class_mip_label.md)