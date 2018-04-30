# class mip::MetadataAction 
An [Action](#classmip_1_1_action) meant that specifies what meta data information should be added to the content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector<std::string>& GetMetadataToRemove() const  |  Get the list of names of meta-data that need to be removed from content.
public const std::vector<std::pair<std::string, std::string>>& GetMetadataToAdd() const  |  Get the list of meta-data as key value pairs. The meta-data needs to be added to content meta-data.
public ActionType GetType() const  |  Get the type of [Action](#classmip_1_1_action).
  
## Members
  
### GetMetadataToRemove
Get the list of names of meta-data that need to be removed from content.
  
#### Returns
a vector of strings to remove. 
that removing meta-data should be done before adding meta-data.
  
### GetMetadataToAdd
Get the list of meta-data as key value pairs. The meta-data needs to be added to content meta-data.
  
#### Returns
const std::vector<std::pair<std::string, std::string>>& 
removing meta-data should be done before adding meta-data.
  
### ActionType
Get the type of [Action](#classmip_1_1_action).
  
#### Returns
ActionType The type of derived action this base class can be cast to.