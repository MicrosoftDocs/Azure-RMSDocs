# class mip::AddWatermarkAction 
An action class that specifies adding watermark.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::string& GetUIElementName()  |  An API used to mark the watermark element.
public WatermarkLayout GetLayout() const  |  An API used to get the water mark layout.
public const std::string& GetText() const  |  Get the text thats meant to go into the content header.
public const std::string& GetFontName() const  |  Get the font name, used to display the content header.
public int GetFontSize() const  |  Get the font size, used to display the content header.
public const std::string& GetFontColor() const  |  Get the font color, used to display the content header.
public ActionType GetType() const  |  Get the type of [Action](#classmip_1_1_action).
  
## Members
  
### GetUIElementName
An API used to mark the watermark element.
  
#### Returns
the name that should be used for the UI element that holds the watermark. The same name will be returned in RemoveWatermarkingAction in case the watermark needs to be removed.
  
### GetLayout
An API used to get the water mark layout.
  
#### Returns
WatermarkLayout the watermarking layout in th form of an enum HORIZONTAL|DIAGONAL. ,
  
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
  
### ActionType
Get the type of [Action](#classmip_1_1_action).
  
#### Returns
ActionType The type of derived action this base class can be cast to.