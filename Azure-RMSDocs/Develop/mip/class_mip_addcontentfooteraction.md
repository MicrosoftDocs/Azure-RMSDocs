# class mip::AddContentFooterAction 
An action class which specifies adding a content footer to the document.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetUIElementName()  |  An API used to mark the content footer element.
public const std::string& GetText() const  |  Get the text thats meant to go into the content footer.
public const std::string& GetFontName() const  |  Get the font name, used to display the content footer.
public int GetFontSize() const  |  Get the font size, used to display the content footer.
public const std::string& GetFontColor() const  |  Get the font color, used to display the content footer.
public ContentMarkAlignment GetAlignment() const  |  Get the Alignment of the footer.
public int GetMargin() const  |  Get the margin of the footer from the bottom.
public ActionType GetType() const  |  Get the type of [Action](#classmip_1_1_action).
  
## Members
  
### GetUIElementName
An API used to mark the content footer element.
  
#### Returns
the name that should be used for the UI element that holds the content footer. The same name will be returned in [RemoveContentFooterAction](#classmip_1_1_remove_content_footer_action) in case the content footer needs to be removed.
  
### GetText
Get the text thats meant to go into the content footer.
  
#### Returns
content footer text.
  
### GetFontName
Get the font name, used to display the content footer.
  
#### Returns
Font name, default value if not set by policy Calibri.
  
### GetFontSize
Get the font size, used to display the content footer.
  
#### Returns
font size as an integer.
  
### GetFontColor
Get the font color, used to display the content footer.
  
#### Returns
font color as a string (e.g."#000000").
  
### GetAlignment
Get the Alignment of the footer.
  
#### Returns
The ContentMarkAlignment enumerator, LEFT|RIGHT|CENTER. 
**See also**: ContentMarkAlignment
  
### GetMargin
Get the margin of the footer from the bottom.
  
#### Returns
an integer represeting the margins from the bottom of the document (e.g. 10 mm).
  
### ActionType
Get the type of [Action](#classmip_1_1_action).
  
#### Returns
ActionType The type of derived action this base class can be cast to.