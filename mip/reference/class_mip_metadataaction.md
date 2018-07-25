# class mip::MetadataAction 
An [Action](class_mip_action.md) that adds metadata information to the content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const std::vector<std::string>& GetMetadataToRemove() const  |  Get the list of names of metadata that need to be removed from content.
public const std::vector<std::pair<std::string, std::string>>& GetMetadataToAdd() const  |  Get the list of metadata as key value pairs. The metadata needs to be added to content metadata.
 public ActionType GetType() const  |  Get the type of [Action](class_mip_action.md).
  
## Members
  
### GetMetadataToRemove
Get the list of names of metadata that need to be removed from content.

  
**Returns**: A vector of strings to remove. 
removing metadata should be done before adding metadata.
  
### GetMetadataToAdd
Get the list of metadata as key value pairs. The metadata needs to be added to content metadata.

  
**Returns**: Const std::vector<std::pair<std::string, std::string>>& 
removing metadata should be done before adding metadata.
  
### ActionType
Get the type of [Action](class_mip_action.md).

  
**Returns**: ActionType The type of derived action this base class can be cast to.