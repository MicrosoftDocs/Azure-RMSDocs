# class mip::PolicyDescriptor 
Represents an ad-hoc policy associated with protected content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public const std::string& GetName()  |  Gets policy name.
 public void SetName(const std::string& value)  |  Sets policy name.
 public const std::string& GetDescription()  |  Gets policy description.
 public void SetDescription(const std::string& value)  |  Sets policy description.
public const std::vector<UserRights>& GetUserRightsList() const  |  Gets collection of users-to-rights mappings.
public const std::vector<mip::UserRoles>& GetUserRolesList()  |  Gets collection of users-to-roles mappings.
public const std::chrono::time_point<std::chrono::system_clock>& GetContentValidUntil()  |  Gets policy expiration time.
public void SetContentValidUntil(const std::chrono::time_point<std::chrono::system_clock>& value)  |  Sets policy expiration time.
 public bool DoesAllowOfflineAccess()  |  Gets whether or not policy allows offline content access.
 public void SetAllowOfflineAccess(bool value)  |  Sets whether or not policy allows offline content access.
 public const std::string& GetReferrer() const  |  Gets policy referrer address.
 public void SetReferrer(const std::string& uri)  |  Sets policy referrer address.
 public const AppDataHashMap& GetEncryptedAppData()  |  Gets app-specific data that was encrypted.
 public void SetEncryptedAppData(const AppDataHashMap& value)  |  Sets app-specific data that should be encrypted.
 public const AppDataHashMap& GetSignedAppData()  |  Gets the app-specific data that was signed.
 public void SetSignedAppData(const AppDataHashMap& value)  |  Sets app-specific data that should be signed.
  
## Members
  
### GetName
Gets policy name.

  
**Returns**: Policy name
  
### SetName
Sets policy name.

Parameters:  
* **value**: Policy name


  
### GetDescription
Gets policy description.

  
**Returns**: Policy description
  
### SetDescription
Sets policy description.

Parameters:  
* **value**: Policy description


  
### UserRights
Gets collection of users-to-rights mappings.

  
**Returns**: Collection of users-to-rights mappings
The value of the UserRightsList property will be empty if the current user doesn't have access to the user rights information (i.e. is not the owner and does not have the VIEWRIGHTSDATA right).
  
### mip::UserRoles
Gets collection of users-to-roles mappings.

  
**Returns**: Collection of users-to-roles mappings
  
### GetContentValidUntil
Gets policy expiration time.

  
**Returns**: Policy expiration time
  
### SetContentValidUntil
Sets policy expiration time.

Parameters:  
* **value**: Policy expiration time


  
### DoesAllowOfflineAccess
Gets whether or not policy allows offline content access.

  
**Returns**: Whether or not policy allows offline content access (default = true)
  
### SetAllowOfflineAccess
Sets whether or not policy allows offline content access.

Parameters:  
* **value**: Whether or not policy allows offline content access


  
### GetReferrer
Gets policy referrer address.

  
**Returns**: Policy referrer address
The referrer is a URI that can be displayed to the user upon failed policy acquisition that contains information on how that user can gain permission to access the content.
  
### SetReferrer
Sets policy referrer address.

Parameters:  
* **uri**: Policy referrer address


The referrer is a URI that can be displayed to the user upon failed policy acquisition that contains information on how that user can gain permission to access the content.
  
### AppDataHashMap
Gets app-specific data that was encrypted.

  
**Returns**: App-specific data
A [UserPolicy](class_mip_userpolicy.md) may contain a dictionary of app-specific data that was encrypted by the RMS service. This encrypted data is independent of the signed data accessible via [PolicyDescriptor::GetSignedAppData](class_mip_policydescriptor.md#getsignedappdata)
  
### SetEncryptedAppData
Sets app-specific data that should be encrypted.

Parameters:  
* **value**: App-specific data


An application can specify a dictionary of app-specific data that will be encrypted by the RMS service. This encrypted data is independent of the signed data set by [PolicyDescriptor::SetSignedAppData](class_mip_policydescriptor.md#setsignedappdata).
  
### AppDataHashMap
Gets the app-specific data that was signed.

  
**Returns**: App-specific data
A [UserPolicy](class_mip_userpolicy.md) may contain a dictionary of app-specific data that was signed by the RMS service. This signed data is independent of the encrypted data accessible via [PolicyDescriptor::GetEncryptedAppData](class_mip_policydescriptor.md#getencryptedappdata)
  
### SetSignedAppData
Sets app-specific data that should be signed.

Parameters:  
* **value**: App-specific data


An application can specify a dictionary of app-specific data that will be signed by the RMS service. This signed data is independent of the encrypted data set by [PolicyDescriptor::SetEncryptedAppData](class_mip_policydescriptor.md#setencryptedappdata).