# class mip::ProtectionDescriptor 
Represents an ad-hoc policy associated with protected content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public ProtectionType GetProtectionType() const  |  Gets type of protection, whether it originated from protection sdk template or not.
 public const std::string& GetName() const  |  Gets policy name.
 public const std::string& GetDescription() const  |  Gets policy description.
 public const std::string& GetTemplateId() const  |  Gets the protection template id.
public const std::vector<UserRights>& GetUserRights() const  |  Gets collection of users-to-rights mappings.
public const std::vector<UserRoles>& GetUserRoles() const  |  Gets collection of users-to-roles mappings.
public const std::chrono::time_point<std::chrono::system_clock>& GetContentValidUntil() const  |  Gets policy expiration time.
 public bool DoesAllowOfflineAccess() const  |  Gets whether or not policy allows offline content access.
 public const std::string& GetReferrer() const  |  Gets policy referrer address.
public const std::map<std::string, std::string>& GetEncryptedAppData() const  |  Gets app-specific data that was encrypted.
public const std::map<std::string, std::string>& GetSignedAppData() const  |  Gets the app-specific data that was signed.
  
## Members
  
### ProtectionType
Gets type of protection, whether it originated from protection sdk template or not.

  
**Returns**: Type of protection
  
### GetName
Gets policy name.

  
**Returns**: Policy name
  
### GetDescription
Gets policy description.

  
**Returns**: Policy description
  
### GetTemplateId
Gets the protection template id.

  
**Returns**: Template id
  
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
A [ProtectionHandler](class_mip_protectionhandler.md) may contain a dictionary of app-specific data that was encrypted by the protection service.This encrypted data is independent of the signed data accessible via [ProtectionDescriptor::GetSignedAppData](class_mip_protectiondescriptor.md#getsignedappdata)
  
### GetSignedAppData
Gets the app-specific data that was signed.

  
**Returns**: App-specific data
A [ProtectionHandler](class_mip_protectionhandler.md) may contain a dictionary of app-specific data that was signed by the protection service. This signed data is independent of the encrypted data accessible via [ProtectionDescriptor::GetEncryptedAppData](class_mip_protectiondescriptor.md#getencryptedappdata)