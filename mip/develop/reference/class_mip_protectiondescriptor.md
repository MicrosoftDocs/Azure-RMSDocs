# class mip::ProtectionDescriptor 
Represents an ad-hoc policy associated with protected content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public ProtectionType GetProtectionType() const  |  Gets type of protection, whether it originated from protection sdk template or not.
 public std::string GetOwner() const  |  Gets owner for the protection.
 public std::string GetName() const  |  Gets policy name.
 public std::string GetDescription() const  |  Gets policy description.
 public std::string GetTemplateId() const  |  Gets the protection template id.
 public std::string GetLabelId() const  |  Gets the label id.
public std::vector<UserRights> GetUserRights() const  |  Gets collection of users-to-rights mappings.
public std::vector<UserRoles> GetUserRoles() const  |  Gets collection of users-to-roles mappings.
public std::chrono::time_point<std::chrono::system_clock> GetContentValidUntil() const  |  Gets policy expiration time.
 public bool DoesAllowOfflineAccess() const  |  Gets whether or not policy allows offline content access.
 public std::string GetReferrer() const  |  Gets policy referrer address.
public std::map<std::string, std::string> GetEncryptedAppData() const  |  Gets app-specific data that was encrypted.
public std::map<std::string, std::string> GetSignedAppData() const  |  Gets the app-specific data that was signed.
  
## Members
  
### ProtectionType
Gets type of protection, whether it originated from protection sdk template or not.

  
**Returns**: Type of protection
  
### GetOwner
Gets owner for the protection.

  
**Returns**: Owner of protection
  
### GetName
Gets policy name.

  
**Returns**: Policy name
  
### GetDescription
Gets policy description.

  
**Returns**: Policy description
  
### GetTemplateId
Gets the protection template id.

  
**Returns**: Template id
  
### GetLabelId
Gets the label id.

  
**Returns**: [Label](class_mip_label.md) id
This property will only be populated in ProtectionDescriptors for preexisting protected content. i.e. It is a field populated by the server at the moment protected content is consumed.
  
### UserRights
Gets collection of users-to-rights mappings.

  
**Returns**: Collection of users-to-rights mappings
The value of the [UserRights](class_mip_userrights.md) property will be empty if the current user doesn't have access to the user rights information (i.e. is not the owner and does not have the VIEWRIGHTSDATA right).
  
### UserRoles
Gets collection of users-to-roles mappings.

  
**Returns**: Collection of users-to-roles mappings
  
### GetContentValidUntil
Gets policy expiration time.

  
**Returns**: Policy expiration time
  
### DoesAllowOfflineAccess
Gets whether or not policy allows offline content access.

  
**Returns**: Whether or not policy allows offline content access (default = true)
  
### GetReferrer
Gets policy referrer address.

  
**Returns**: Policy referrer address
The referrer is a URI that can be displayed to the user upon failed policy acquisition that contains information on how that user can gain permission to access the content.
  
### GetEncryptedAppData
Gets app-specific data that was encrypted.

  
**Returns**: App-specific data
A [ProtectionHandler](class_mip_protectionhandler.md) may contain a dictionary of app-specific data that was encrypted by the protection service.This encrypted data is independent of the signed data accessible via [ProtectionDescriptor::GetSignedAppData](class_mip_protectiondescriptor.md#getappsigneddata)
  
### GetSignedAppData
Gets the app-specific data that was signed.

  
**Returns**: App-specific data
A [ProtectionHandler](class_mip_protectionhandler.md) may contain a dictionary of app-specific data that was signed by the protection service. This signed data is independent of the encrypted data accessible via [ProtectionDescriptor::GetEncryptedAppData](class_mip_protectiondescriptor.md#getencryptedappdata)