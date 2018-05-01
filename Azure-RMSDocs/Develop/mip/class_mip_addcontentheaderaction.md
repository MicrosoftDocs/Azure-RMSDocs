# class mip::AddContentHeaderAction 
An action class that specifies adding content header.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetUIElementName()  |  An API used to mark the content header element.
public const std::string& GetText() const  |  Get the text thats meant to go into the content header.
public const std::string& GetFontName() const  |  Get the font name, used to display the content header.
public int GetFontSize() const  |  Get the font size, used to display the content header.
public const std::string& GetFontColor() const  |  Get the font color, used to display the content header.
public ContentMarkAlignment GetAlignment() const  |  Get the Alignment of the header.
public int GetMargin() const  |  Get the margin of the header from the bottom.
public ActionType GetType() const  |  Get the type of [Action](#classmip_1_1_action).
  
## Members
  
### GetUIElementName
An API used to mark the content header element.
  
#### Returns
the name that should be used for the UI element that holds the content header. The same name will be returned in [RemoveContentHeaderAction](#classmip_1_1_remove_content_header_action) in case the content header needs to be removed.
  
### GetText
Get the text thats meant to go into the content header.
  
#### Returns
content header text.
  
### GetFontName
Get the font name, used to display the content header.
  
#### Returns
Font name, default value if not set by policy Calibri.
  
### GetFontSize
Get the font size, used to display the content header.
  
#### Returns
font size as an integer.
  
### GetFontColor
Get the font color, used to display the content header.
  
#### Returns
font color as a string (e.g."#000000").
  
### GetAlignment
Get the Alignment of the header.
  
#### Returns
The ContentMarkAlignment enumerator, LEFT|RIGHT|CENTER. 
**See also**: ContentMarkAlignment
  
### GetMargin
Get the margin of the header from the bottom.
  
#### Returns
an integer represeting the margins from the bottom of the document (e.g. 10 mm).
  
### ActionType
Get the type of [Action](#classmip_1_1_action).
  
#### Returns
ActionType The type of derived action this base class can be cast to.