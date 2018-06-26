# namespace `mip` 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 enum ErrorType       | _Not yet documented._
 enum LogLevel       |  Different log levels used across the mip sdk.
 enum ProtectionType       |  Describes whether protection is based off a template or ad-hoc (custom)
 enum ProtectionHandlerCreationOptions       |  Bit flags that dictate additional policy creation behavior.
 enum ActionType       |  Different action types.
public MIP_API std::shared_ptr<mip::Stream> CreateStreamFromStdStream(const std::shared_ptr<std::istream>& stdIStream)       |  Creates a [Stream](class_mip_stream.md) from a std::istream.
public MIP_API std::shared_ptr<mip::Stream> CreateStreamFromStdStream(const std::shared_ptr<std::ostream>& stdOStream)       |  Creates a [Stream](class_mip_stream.md) from a std::ostream.
public MIP_API std::shared_ptr<mip::Stream> CreateStreamFromStdStream(const std::shared_ptr<std::iostream>& stdIOStream)       |  Creates a [Stream](class_mip_stream.md) from a std::iostream.
public MIP_API std::shared_ptr<mip::Stream> CreateStreamFromBuffer(uint8_t* buffer, const int64_t size)       |  Creates an [Stream](class_mip_stream.md) from a buffer.
 public ActionType operator &(ActionType a, ActionType b)       |  And (&) operator for [Action](class_mip_action.md) type enum.
 public ActionType operator^(ActionType a, ActionType b)       |  Xor (^) operator for [Action](class_mip_action.md) type enum.
 class mip::AccessDeniedError  |  The user could not get access to the content. e.g. no permissions, content revoked etc.
 class mip::Action  |  Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
 class mip::AddContentFooterAction  |  An action class which specifies adding a content footer to the document.
 class mip::AddContentHeaderAction  |  An action class that specifies adding content header.
 class mip::AddWatermarkAction  |  An action class that specifies adding watermark.
 class mip::ApplyLabelAction  |  Apply label actions requires the calling application to apply a specific label.
 class mip::BadInputError  |  Bad input error, thrown when the input to an sdk api is invalid.
 class mip::ClassificationResult  |  Class that contains the result of a classification call on the Execution State.
 class mip::ContentLabel  |  Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
 class mip::CustomAction  |  [CustomAction](class_mip_customaction.md) is a generic action class that captures all the sub-properties of the action as a property bag. The caller is responsible to understand the meaning of the action.
 class mip::Error  |  Base class for all errors that will be reported (thrown or returned) from MIP SDK.
 class mip::ExecutionState  |  Interface for all the state needed to execute the engine.
 class mip::FileEngine  |  Interface for all engine functions.
 class mip::FileHandler  |  Interface for all file handling functions.
 class mip::FileIOError  |  File IO error.
 class mip::FileProfile  |  [FileProfile](class_mip_fileprofile.md) class is the root class for using the Microsoft Information Protection operations.
 class mip::InternalError  |  Internal error. This error is thrown when something unexpected happens during execution.
 class mip::JustificationRequiredError  | _Not yet documented._
 class mip::JustifyAction  |  Justify [Action](class_mip_action.md) requires providing a justification to a label downgrade and setting the response in the execution state.
 class mip::Label  |  Abstraction for a single Microsoft Information Protection label.
 class mip::LabelingOptions  |  Interface for configuring labeling options for the SetLabel method.
 class mip::LoggerDelegate  |  A class that defines the interface to the mip sdk logger.
 class mip::MetadataAction  |  An [Action](class_mip_action.md) that adds metadata information to the content.
 class mip::NetworkError  |  Networking error. Caused by unexpected behavior when making network calls to service endpoints.
 class mip::NotSupportedError  |  The operation requested by the application is not supported by the sdk.
 class mip::PolicyEngine  |  This class provides an interface for all engine functions.
 class mip::PrivilegedRequiredError  |  Current label was assigned as a privileged operation (The equivalent to an administrator operation), therefore it can't be overriden.
 class mip::Profile  |  [Profile](class_mip_profile.md) class is the root class for using the Microsoft Information Protection operations. A typical application will only need one [Profile](class_mip_profile.md) but it can create multiple profiles if needed.
 class mip::ProtectAdhocAction  |  An action class which specifies adding adhoc protection to the document.
 class mip::ProtectByTemplateAction  |  An action class which specifies adding protection by template to the document.
 class mip::ProtectDoNotForwardAction  |  An action class which specifies adding do not forward protection to the document.
 class mip::ProtectionDescriptor  |  Represents an ad-hoc policy associated with protected content.
 class mip::ProtectionDescriptorBuilder  |  Represents an ad-hoc policy associated with protected content.
 class mip::ProtectionEngine  |  Performs protection-related actions related to a specific identity.
 class mip::ProtectionHandler  |  Performs protection-related actions for a specific protection configuration (i.e. users, rights, roles, etc.)
 class mip::ProtectionProfile  |  [ProtectionProfile](class_mip_protectionprofile.md) is the root class for performing protection operations.
 class mip::RecommendLabelAction  |  Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
 class mip::RemoveContentFooterAction  |  An action class which specifies removing the content footer from the document.
 class mip::RemoveContentHeaderAction  |  An action class which specifies removing the content header from the document.
 class mip::RemoveProtectionAction  |  An action class which specifies removing protection from the document.
 class mip::RemoveWatermarkAction  |  An action class which specifies removing the watermarking from the document.
 class mip::Stream  |  A class that defines the interface between the mip sdk and stream based content.
 class mip::UserRights  |  Represents a group of users and the rights associated with them.
 class mip::UserRoles  |  Represents a group of users and the roles associated with them.
  
## Members
  
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
  
### ProtectionType
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
TemplateBased            | Handle was created from a template
Custom            | Handle was created ad hoc
Describes whether protection is based off a template or ad-hoc (custom)
  
### ProtectionHandlerCreationOptions
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
None            | None
OfflineOnly            | Do not allow UI and network operations.
AllowAuditedExtraction            | Content can be opened in a non-protection-sdk-aware app
PreferDeprecatedAlgorithms            | Use deprecated crypto algorithms (ECB) for backwards compatibility
Bit flags that dictate additional policy creation behavior.
  
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
  
### ProtectionHandlerCreationOptions
ProtectionHandlerCreationOptions bitwise OR operator.

Parameters:  
* **a**: Left value 


* **b**: Right value



  
**Returns**: Bitwise OR of parameters
  
### mip::Stream
Creates a [Stream](class_mip_stream.md) from a std::istream.

Parameters:  
* **stdIStream**: Backing std::istream



  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::istream
  
### mip::Stream
Creates a [Stream](class_mip_stream.md) from a std::ostream.

Parameters:  
* **stdOStream**: Backing std::ostream



  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::ostream
  
### mip::Stream
Creates a [Stream](class_mip_stream.md) from a std::iostream.

Parameters:  
* **stdIOStream**: Backing std::iostream



  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::iostream
  
### mip::Stream
Creates an [Stream](class_mip_stream.md) from a buffer.

Parameters:  
* **buffer**: Pointer to a buffer



  
**Returns**: Size Size of buffer
  
### ActionType
Or (|) operator for [Action](class_mip_action.md) type enum.
  
### ActionType
And (&) operator for [Action](class_mip_action.md) type enum.
  
### ActionType
Xor (^) operator for [Action](class_mip_action.md) type enum.