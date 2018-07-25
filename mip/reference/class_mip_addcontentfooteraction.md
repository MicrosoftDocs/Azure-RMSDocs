# class mip::AddContentFooterAction 
An action class which specifies adding a content footer to the document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const std::string& GetUIElementName()  |  An API used to mark the content footer element.
 public const std::string& GetText() const  |  Get the text that is meant to go into the content footer.
 public const std::string& GetFontName() const  |  Get the font name, used to display the content footer.
 public int GetFontSize() const  |  Get the font size used to display the content footer.
 public const std::string& GetFontColor() const  |  Get the font color used to display the content footer.
 public ContentMarkAlignment GetAlignment() const  |  Get the alignment of the footer.
 public int GetMargin() const  |  Get the margin of the footer from the bottom.
 public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).
  
## Members
  
### GetUIElementName
An API used to mark the content footer element.

  
**Returns**: The name that should be used for the UI element that holds the content footer. The same name will be returned in [RemoveContentFooterAction](class_mip_removecontentfooteraction.md) in case the content footer needs to be removed.
  
### GetText
Get the text that is meant to go into the content footer.

  
**Returns**: Content footer text.
  
### GetFontName
Get the font name, used to display the content footer.

  
**Returns**: Font name. Default value is Calibri if nothing is set by the policy.
  
### GetFontSize
Get the font size used to display the content footer.

  
**Returns**: Font size as an integer.
  
### GetFontColor
Get the font color used to display the content footer.

  
**Returns**: Font color as a string (e.g."#000000").
  
### GetAlignment
Get the alignment of the footer.

  
**Returns**: The ContentMarkAlignment enumerator: LEFT|RIGHT|CENTER. 
  
**See also**: ContentMarkAlignment
  
### GetMargin
Get the margin of the footer from the bottom.

  
**Returns**: An integer representing the margins from the bottom of the document (e.g. 10 mm).
  
### ActionType
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.