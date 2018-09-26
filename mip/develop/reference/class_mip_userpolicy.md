# class mip::UserPolicy 
Represents the policy associated with protected content.
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 public bool AccessCheck(const std::string& right) const  |  Checks if policy grants user access to specified right.
 public UserPolicyType GetType()  |  Gets policy type.
 public std::string GetName()  |  Gets policy name.
 public std::string GetDescription()  |  Gets policy description.
public std::shared_ptr<TemplateDescriptor> GetTemplateDescriptor()  |  Gets [TemplateDescriptor](class_mip_templatedescriptor.md) for a template-based [UserPolicy](class_mip_userpolicy.md).
public std::shared_ptr<PolicyDescriptor> GetPolicyDescriptor()  |  Gets [PolicyDescriptor](class_mip_policydescriptor.md) for an ad hoc [UserPolicy](class_mip_userpolicy.md).
 public std::string GetOwner()  |  Gets email address of content owner.
 public std::string GetIssuedTo()  |  Gets user associated with the protection policy.
 public bool IsIssuedToOwner()  |  Gets whether or not the current user is the content owner.
 public std::string GetContentId()  |  Gets unique identifier for the document/content.
 public const mip::AppDataHashMap GetEncryptedAppData()  |  Gets app-specific data that was encrypted.
 public const mip::AppDataHashMap GetSignedAppData()  |  Gets the app-specific data that was signed.
public std::chrono::time_point<std::chrono::system_clock> GetContentValidUntil()  |  Gets policy expiration time.
 public bool DoesUseDeprecatedAlgorithms()  |  Gets whether or not policy uses deprecated crypto algorithms (ECB) for backward compatibility.
 public bool IsAuditedExtractAllowed()  |  Gets whether or not policy grants user 'audited extract' right.
public const std::vector<unsigned char> GetSerializedPolicy()  |  Serialize [UserPolicy](class_mip_userpolicy.md) into a publishing license (PL)
public std::shared_ptr<rmscore::core::ProtectionPolicy> GetImpl()  |  Gets internal derived class implementation of [UserPolicy](class_mip_userpolicy.md).
  
## Members
  
### AccessCheck
Checks if policy grants user access to specified right.

Parameters:  
* **right**: Right to check



  
**Returns**: Whether or not policy grants user access to specified right
  
### UserPolicyType
Gets policy type.

  
**Returns**: Policy type
  
### GetName
Gets policy name.

  
**Returns**: Policy name
  
### GetDescription
Gets policy description.

  
**Returns**: Policy description
  
### TemplateDescriptor
Gets [TemplateDescriptor](class_mip_templatedescriptor.md) for a template-based [UserPolicy](class_mip_userpolicy.md).

  
**Returns**: [TemplateDescriptor](class_mip_templatedescriptor.md) if [UserPolicy](class_mip_userpolicy.md) is template-based, else nullptr
  
### PolicyDescriptor
Gets [PolicyDescriptor](class_mip_policydescriptor.md) for an ad hoc [UserPolicy](class_mip_userpolicy.md).

  
**Returns**: [PolicyDescriptor](class_mip_policydescriptor.md) if [UserPolicy](class_mip_userpolicy.md) is ad hoc, else nullptr
  
### GetOwner
Gets email address of content owner.

  
**Returns**: Email address of content owner
  
### GetIssuedTo
Gets user associated with the protection policy.

  
**Returns**: User associated with protection policy
  
### IsIssuedToOwner
Gets whether or not the current user is the content owner.

  
**Returns**: Whether or not the current user is the content owner
  
### GetContentId
Gets unique identifier for the document/content.

  
**Returns**: Unique content identifier
  
### mip::AppDataHashMap
Gets app-specific data that was encrypted.
A [UserPolicy](class_mip_userpolicy.md) may contain a dictionary of app-specific data that was encrypted by the RMS service. This encrypted data is independent of the signed data accessible via [UserPolicy::GetSignedAppData](class_mip_userpolicy.md#getsignedappdata)
  
### mip::AppDataHashMap
Gets the app-specific data that was signed.
A [UserPolicy](class_mip_userpolicy.md) may contain a dictionary of app-specific data that was signed by the RMS service. This signed data is independent of the encrypted data accessible via [UserPolicy::GetEncryptedAppData](class_mip_userpolicy.md#getencryptedappdata)
  
### GetContentValidUntil
Gets policy expiration time.

  
**Returns**: Policy expiration time
  
### DoesUseDeprecatedAlgorithms
Gets whether or not policy uses deprecated crypto algorithms (ECB) for backward compatibility.

  
**Returns**: Whether or not policy uses deprecated crypto algorithms
  
### IsAuditedExtractAllowed
Gets whether or not policy grants user 'audited extract' right.

  
**Returns**: Whether or not policy grants user 'audited extract' right
  
### GetSerializedPolicy
Serialize [UserPolicy](class_mip_userpolicy.md) into a publishing license (PL)

  
**Returns**: Serialized [UserPolicy](class_mip_userpolicy.md)
  
### GetImpl
Gets internal derived class implementation of [UserPolicy](class_mip_userpolicy.md).

  
**Returns**: Derived class implementation of [UserPolicy](class_mip_userpolicy.md)
Internal only