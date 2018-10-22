---
title: class mip ProtectionDescriptor 
description: Reference for class mip ProtectionDescriptor 
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.date: 09/27/2018
ms.author: bryanla
---
# class mip::ProtectionDescriptor 
Description of protection associated with a piece of content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public ProtectionType GetProtectionType() const  |  Gets type of protection, whether it originated from protection SDK template or not.
 public std::string GetOwner() const  |  Gets owner for the protection.
 public std::string GetName() const  |  Gets protection name.
 public std::string GetDescription() const  |  Gets protection description.
 public std::string GetTemplateId() const  |  Gets the protection template ID, if any.
 public std::string GetLabelId() const  |  Gets the label ID, if any.
public std::vector<UserRights> GetUserRights() const  |  Gets collection of users-to-rights mappings.
public std::vector<UserRoles> GetUserRoles() const  |  Gets collection of users-to-roles mappings.
public std::chrono::time_point<std::chrono::system_clock> GetContentValidUntil() const  |  Gets protection expiration time.
 public bool DoesAllowOfflineAccess() const  |  Gets if protection allows offline content access or not.
 public std::string GetReferrer() const  |  Gets protection referrer address.
public std::map<std::string, std::string> GetEncryptedAppData() const  |  Gets app-specific data that was encrypted.
public std::map<std::string, std::string> GetSignedAppData() const  |  Gets the app-specific data that was signed.
  
## Members
  
### ProtectionType
Gets type of protection, whether it originated from protection SDK template or not.

  
**Returns**: Type of protection
  
### GetOwner
Gets owner for the protection.

  
**Returns**: Owner of protection
  
### GetName
Gets protection name.

  
**Returns**: Protection name
  
### GetDescription
Gets protection description.

  
**Returns**: Protection description
  
### GetTemplateId
Gets the protection template ID, if any.

  
**Returns**: Template ID
  
### GetLabelId
Gets the label ID, if any.

  
**Returns**: [Label](class_mip_label.md) ID
This property will only be populated in ProtectionDescriptors for preexisting protected content. It is a field populated by the server at the moment protected content is consumed.
  
### UserRights
Gets collection of users-to-rights mappings.

  
**Returns**: Collection of users-to-rights mappings
The value of the [UserRights](class_mip_userrights.md) property will be empty if the current user doesn't have access to this information (that is, if the user is not the owner and does not have the VIEWRIGHTSDATA right).
  
### UserRoles
Gets collection of users-to-roles mappings.

  
**Returns**: Collection of users-to-roles mappings
  
### GetContentValidUntil
Gets protection expiration time.

  
**Returns**: Protection expiration time
  
### DoesAllowOfflineAccess
Gets if protection allows offline content access or not.

  
**Returns**: If protection allows offline content access or not (default = true)
  
### GetReferrer
Gets protection referrer address.

  
**Returns**: Protection referrer address
The referrer is a URI that is displayable to the user if they cannot unprotect the content. It contains information on how that user can gain permission to access the content.
  
### GetEncryptedAppData
Gets app-specific data that was encrypted.

  
**Returns**: App-specific data
A [ProtectionHandler](class_mip_protectionhandler.md) may hold a dictionary of app-specific data that was encrypted by the protection service. This encrypted data is independent of the signed data accessible via [ProtectionDescriptor::GetSignedAppData](class_mip_protectiondescriptor.md#getsignedappdata)
  
### GetSignedAppData
Gets the app-specific data that was signed.

  
**Returns**: App-specific data
A [ProtectionHandler](class_mip_protectionhandler.md) may hold a dictionary of app-specific data that was signed by the protection service. This signed data is independent of the encrypted data accessible via [ProtectionDescriptor::GetEncryptedAppData](class_mip_protectiondescriptor.md#getencryptedappdata)