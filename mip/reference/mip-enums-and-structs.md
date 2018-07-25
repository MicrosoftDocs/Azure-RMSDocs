# Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 enum Consent       |  Represents a user's decision to consent to connect to a service endpoint.
 struct ApplicationInfo  |  Application ID as set in the Azure AD portal.
**mip** |
 enum ActionType       |  Different action types.
 enum ErrorType       | _Not yet documented._
 enum LogLevel       |  Different log levels used across the mip sdk.
 enum ProtectionHandlerCreationOptions       |  Bit flags that dictate additional policy creation behavior.
 enum ProtectionType       |  Describes whether protection is based off a template or ad-hoc (custom)

  
## Enumerations (common)
  
### Consent
Represents a user's decision to consent to connect to a service endpoint.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
AcceptAlways            | Consent, and remember this decision
Accept            | Consent, just one time
Reject            | Do not consent
  
## Enumerations (mip)

### ActionType

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
ADD_CONTENT_FOOTER            | Add a content footer to the document action type.
ADD_CONTENT_HEADER            | Add a content header to the document action type.
ADD_WATERMARK            | Add a water mark to the entire document action type.
CUSTOM            | A custom defined action type.
JUSTIFY            | A justify action type.
METADATA            | A Meta data change action type.
PROTECT_ADHOC            | A protect by adhoc policy action type.
PROTECT_BY_TEMPLATE            | A protect by template action type.
PROTECT_DO_NOT_FORWARD            | A protect by do not forward action type.
REMOVE_CONTENT_FOOTER            | Remove content footer action type.
REMOVE_CONTENT_HEADER            | Remove content header action type.
REMOVE_PROTECTION            | Remove protection action type.
REMOVE_WATERMARK            | Remove watermarking action type.
APPLY_LABEL            | Apply label action type.
RECOMMEND_LABEL            | Recommend label action type.
Different action types.
CUSTOM is the generic action type. Every other action type is a specific action with a specific meaning.
  
**ActionType** values support the following operators:

* Or (|) operator for [Action](class_mip_action.md) type enum.  
* And (&) operator for [Action](class_mip_action.md) type enum.  
* Xor (^) operator for [Action](class_mip_action.md) type enum.  

### ErrorType

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
BAD_INPUT_ERROR            | Caller passed bad input.
FILE_IO_ERROR            | General File IO error.
NETWORK_ERROR            | General network issues; e.g. unreachable service.
INTERNAL_ERROR            | Internal unexpected errors. e.g. in client-server protocol (received unexpected response).
JUSTIFICATION_REQUIRED            | Justification should be provided to complete the action on the file.
NOT_SUPPORTED_OPERATION            | The requested operation is not yet supported.
PRIVILEGED_REQUIRED            | Can't override privileged label when new label method is standard.
ACCESS_DENIED            | The user could not get access to the content. e.g. no permissions, content revoked etc.
  
### LogLevel

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Trace            | 
Info            | 
Warning            | 
Error            | 
Different log levels used across the mip sdk.
  
### ProtectionHandlerCreationOptions

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
None            | None
OfflineOnly            | Do not allow UI and network operations.
AllowAuditedExtraction            | Content can be opened in a non-protection-sdk-aware app
PreferDeprecatedAlgorithms            | Use deprecated crypto algorithms (ECB) for backwards compatibility
Bit flags that dictate additional policy creation behavior.
  
### ProtectionType

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
TemplateBased            | Handle was created from a template
Custom            | Handle was created ad hoc
Describes whether protection is based off a template or ad-hoc (custom)
  
### ProtectionHandlerCreationOptions

ProtectionHandlerCreationOptions bitwise OR operator.

Parameters: 
 
* **a**: Left value 

* **b**: Right value
  
**Returns**: Bitwise OR of parameters
  


## Structures

### ApplicationInfo 
Application identifier as set in the Azure AD portal.
  
 Fields                        | Descriptions                                
--------------------------------|---------------------------------------------
 public std::string applicationId  | Application ID within the Azure AD portal.
 public std::string friendlyName  | Friendly name of the app, as specified in the portal.
  
