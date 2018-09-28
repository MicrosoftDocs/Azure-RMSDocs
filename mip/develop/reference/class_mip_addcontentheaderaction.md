# class mip::AddContentHeaderAction 
An action class that specifies adding content header.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const std::string& GetUIElementName()  |  An API used to mark the content header element.
 public const std::string& GetText() const  |  Get the text that is meant to go into the content header.
 public const std::string& GetFontName() const  |  Get the font name used to display the content header.
 public int GetFontSize() const  |  Get the font size used to display the content header.
 public const std::string& GetFontColor() const  |  Get the font color used to display the content header.
 public ContentMarkAlignment GetAlignment() const  |  Get the alignment of the header.
 public int GetMargin() const  |  Get the margin of the header from the bottom.
 public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).
  
## Members
  
### GetUIElementName
An API used to mark the content header element.

  
**Returns**: The name that should be used for the UI element that holds the content header. The same name will be returned in [RemoveContentHeaderAction](class_mip_removecontentheaderaction.md) in case the content header needs to be removed.
  
### GetText
Get the text that is meant to go into the content header.

  
**Returns**: Content header text.
  
### GetFontName
Get the font name used to display the content header.

  
**Returns**: Font name. Default value is Calibri if nothing is set by the policy.
  
### GetFontSize
Get the font size used to display the content header.

  
**Returns**: Font size as an integer.
  
### GetFontColor
Get the font color used to display the content header.

  
**Returns**: Font color as a string (for example, #000000").
  
### GetAlignment
Get the alignment of the header.

  
**Returns**: The ContentMarkAlignment enumerator: LEFT|RIGHT|CENTER. 
  
**See also**: ContentMarkAlignment
  
### GetMargin
Get the margin of the header from the bottom.

  
**Returns**: The margins from the bottom of the document (for example, 10 mm).
  
### ActionType
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.