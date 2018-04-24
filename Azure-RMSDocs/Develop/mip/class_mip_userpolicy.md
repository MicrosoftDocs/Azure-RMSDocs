# class mip::UserPolicy 
Represents the policy associated with protected content.
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public bool AccessCheck | Checks if policy grants user access to specified right.
public UserPolicyType GetType | Gets policy type.
public std::string GetName | Gets policy name.
public std::string GetDescription | Gets policy description.
public std::shared_ptr< TemplateDescriptor > GetTemplateDescriptor
public std::shared_ptr< PolicyDescriptor > GetPolicyDescriptor
public std::string GetOwner | Gets email address of content owner.
public std::string GetIssuedTo | Gets user associated with the protection policy.
public bool IsIssuedToOwner | Gets whether or not the current user is the content owner.
public std::string GetContentId | Gets unique identifier for the document/content.
public const mip::AppDataHashMap GetEncryptedAppData | Gets app-specific data that was encrypted.
public const mip::AppDataHashMap GetSignedAppData | Gets the app-specific data that was signed.
public std::chrono::time_point< std::chrono::system_clock > GetContentValidUntil | Gets policy expiration time.
public bool DoesUseDeprecatedAlgorithms | Gets whether or not policy uses deprecated crypto algorithms (ECB) for backward compatibility.
public bool IsAuditedExtractAllowed | Gets whether or not policy grants user 'audited extract' right.
public const std::vector< unsigned char > GetSerializedPolicy
public std::shared_ptr< rmscore::core::ProtectionPolicy > GetImpl
## Members
### AccessCheck
Checks if policy grants user access to specified right.
#### Parameters
* right Right to check
#### Returns
Whether or not policy grants user access to specified right
### UserPolicyType
Gets policy type.
#### Returns
Policy type
### GetName
Gets policy name.
#### Returns
Policy name
### GetDescription
Gets policy description.
#### Returns
Policy description
### TemplateDescriptor
Gets [TemplateDescriptor](#classmip_1_1_template_descriptor) for a template-based [UserPolicy](#classmip_1_1_user_policy).
#### Returns
[TemplateDescriptor](#classmip_1_1_template_descriptor) if [UserPolicy](#classmip_1_1_user_policy) is template-based, else nullptr
### PolicyDescriptor
Gets [PolicyDescriptor](#classmip_1_1_policy_descriptor) for an ad hoc [UserPolicy](#classmip_1_1_user_policy).
#### Returns
[PolicyDescriptor](#classmip_1_1_policy_descriptor) if [UserPolicy](#classmip_1_1_user_policy) is ad hoc, else nullptr
### GetOwner
Gets email address of content owner.
#### Returns
Email address of content owner
### GetIssuedTo
Gets user associated with the protection policy.
#### Returns
User associated with protection policy
### IsIssuedToOwner
Gets whether or not the current user is the content owner.
#### Returns
Whether or not the current user is the content owner
### GetContentId
Gets unique identifier for the document/content.
#### Returns
Unique content identifier
### mip::AppDataHashMap
Gets app-specific data that was encrypted.
A [UserPolicy](#classmip_1_1_user_policy) may contain a dictionary of app-specific data that was encrypted by the RMS service. This encrypted data is independent of the signed data accessible via [UserPolicy::GetSignedAppData](#classmip_1_1_user_policy_1a1c8a284d50adcac1a0a09316afa1d43e)
### mip::AppDataHashMap
Gets the app-specific data that was signed.
A [UserPolicy](#classmip_1_1_user_policy) may contain a dictionary of app-specific data that was signed by the RMS service. This signed data is independent of the encrypted data accessible via [UserPolicy::GetEncryptedAppData](#classmip_1_1_user_policy_1a610fbc799284ab0ce4354c0611ece0e8)
### GetContentValidUntil
Gets policy expiration time.
#### Returns
Policy expiration time
### DoesUseDeprecatedAlgorithms
Gets whether or not policy uses deprecated crypto algorithms (ECB) for backward compatibility.
#### Returns
Whether or not policy uses deprecated crypto algorithms
### IsAuditedExtractAllowed
Gets whether or not policy grants user 'audited extract' right.
#### Returns
Whether or not policy grants user 'audited extract' right
### GetSerializedPolicy
Serialize [UserPolicy](#classmip_1_1_user_policy) into a publishing license (PL)
#### Returns
Serialized [UserPolicy](#classmip_1_1_user_policy)
### GetImpl
Gets internal derived class implementation of [UserPolicy](#classmip_1_1_user_policy).
#### Returns
Derived class implementation of [UserPolicy](#classmip_1_1_user_policy)
Internal only