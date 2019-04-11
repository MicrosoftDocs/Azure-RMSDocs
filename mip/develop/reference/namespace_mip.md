---
title: namespace `mip` 
description: Documents the mip namespace of the Microsoft Information Protection (MIP) SDK.
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.author: bryanla
ms.date: 04/11/2019
---

# namespace `mip` 
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
enum WatermarkLayout       |  Layout for watermarks.
enum ContentMarkAlignment       |  Alignment for content marks (content header or content footer).
enum AssignmentMethod       |  The assignment method of the label on the document. Whether the Assignment of the label was done automatically, standard or as a privileged operation (The equivalent to an administrator operation).
enum ActionSource       |  defines what triggered the SetLabel event
enum DataState       |  Defines what state of the data is the application acting upon.
enum ContentFormat       |  Content format.
enum Consent       |  A user's response when consent is requested to connect to a service endpoint.
enum ErrorType       | _Not yet documented._
enum HttpRequestType       |  HTTP request type.
enum LogLevel       |  Different log levels used across the MIP SDK.
enum ProtectionHandlerCreationOptions       |  Bit flags that dictate additional policy creation behavior.
enum ProtectionType       |  Describes whether protection is based off a template or ad-hoc (custom)
enum ActionType       |  Different action types.
public std::string GetAssignmentMethodString(AssignmentMethod method)       |  Converts AssignmentMethod enum to a string description.
public static std::string GetActionSourceString(ActionSource actionSource)       |  Get the action source name.
public static std::string GetDataStateString(mip::DataState state)       |  Get the content state name.
public const std::string& GetCustomSettingPolicyDataName()       |  Name of the setting to explicitly specify policy data.
public const std::string& GetCustomSettingExportPolicyFileName()       |  Name of the setting to explicitly specify file path to export SCC policy data to.
public const std::string& GetCustomSettingSensitivityTypesDataName()       |  Name of the setting to explicitly specify sensitivity data.
public const std::string& GetCustomSettingPolicyDataFile()       |  Name of the setting to explicitly specify policy data file path.
public const std::string& GetCustomSettingSensitivityTypesDataFile()       |  Name of the setting to explicitly specify sensitivity types data file path.
public const std::string& GetCustomSettingExternalLabelsEnabled()       |  Name of the setting that allows to enable "external labels" feature.
public MIP_API void __CDECL ReleaseAllResources()       |  Releases all resources (threads, etc) before shutdown.
public MIP_API std::shared_ptr\<mip::Stream\> CreateStreamFromStdStream(const std::shared_ptr\<std::istream\>& stdIStream)       |  Creates a [Stream](class_mip_stream.md) from a std::istream.
public MIP_API std::shared_ptr\<mip::Stream\> CreateStreamFromStdStream(const std::shared_ptr\<std::ostream\>& stdOStream)       |  Creates a [Stream](class_mip_stream.md) from a std::ostream.
public MIP_API std::shared_ptr\<mip::Stream\> CreateStreamFromStdStream(const std::shared_ptr\<std::iostream\>& stdIOStream)       |  Creates a [Stream](class_mip_stream.md) from a std::iostream.
public MIP_API std::shared_ptr\<mip::Stream\> CreateStreamFromBuffer(uint8_t* buffer, const int64_t size)       |  Creates an [Stream](class_mip_stream.md) from a buffer.
class mip::AccessDeniedError  |  The user could not get access to the content. For example, no permissions, content revoked.
class mip::Action  |  Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
class mip::AddContentFooterAction  |  An action class that specifies adding a content footer to the document.
class mip::AddContentHeaderAction  |  An action class that specifies adding content header.
class mip::AddWatermarkAction  |  An action class that specifies adding watermark.
class mip::AdhocProtectionRequiredError  |  Adhoc protection should be set to complete the action on the file.
class mip::ApplyLabelAction  |  Apply label actions requires the calling application to apply a specific label.
class mip::AuthDelegate  |  Delegate for auth related operations.
class mip::BadInputError  |  Bad input error, thrown when the input to an SDK API is invalid.
class mip::ClassificationRequest  |  Class that contains the request of a classification call on the Execution State.
class mip::ClassificationResult  |  Class that contains the result of a classification call on the Execution State.
class mip::ConsentDelegate  |  Delegate for consent related operations.
class mip::ConsentDeniedError  |  An operation that required consent from user was not granted consent.
class mip::ContentLabel  |  Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
class mip::CustomAction  |  [CustomAction](class_mip_customaction.md) is a generic action class that captures all the sub-properties of the action as a property bag. The caller is responsible to understand the meaning of the action.
class mip::Error  |  Base class for all errors that will be reported (thrown or returned) from MIP SDK.
class mip::ExecutionState  |  Interface for all the state needed to execute the engine.
class mip::FileEngine  |  This class provides an interface for all engine functions.
class mip::FileExecutionState  | _Not yet documented._
class mip::FileHandler  |  Interface for all file handling functions.
class mip::FileIOError  |  File IO error.
class mip::FileProfile  |  [FileProfile](class_mip_fileprofile.md) class is the root class for using the Microsoft Information Protection operations.
class mip::HttpDelegate  |  Interface for overriding HTTP handling.
class mip::HttpOperation  |  Interface that describes a single HTTP operation, implemented by client app when overriding [HttpDelegate](class_mip_httpdelegate.md).
class mip::HttpRequest  |  Interface that describes a single HTTP request.
class mip::HttpResponse  |  Interface that describes a single HTTP response, implemented by client app when overriding [HttpDelegate](class_mip_httpdelegate.md).
class mip::Identity  |  Abstraction for identity.
class mip::InternalError  |  Internal error. This error is thrown when something unexpected happens during execution.
class mip::JustificationRequiredError  | _Not yet documented._
class mip::JustifyAction  |  Justify [Action](class_mip_action.md) requires providing a justification to a label downgrade and setting the response in the execution state.
class mip::Label  |  Abstraction for a single Microsoft Information Protection label.
class mip::LabelingOptions  |  Interface for configuring labeling options for the SetLabel/DeleteLabel methods.
class mip::LoggerDelegate  |  A class that defines the interface to the MIP SDK logger.
class mip::MetadataAction  |  An [Action](class_mip_action.md) that adds metadata information to the content.
class mip::NetworkError  |  Networking error. Caused by unexpected behavior when making network calls to service endpoints.
class mip::NoAuthTokenError  |  The user could not get access to the content due to missing authentication token.
class mip::NoPermissionsError  |  The user could not get access to the content. For example, no permissions, content revoked.
class mip::NoPolicyError  |  Tenant policy is not configured for classification/labels.
class mip::NotSupportedError  |  The operation requested by the application is not supported by the SDK.
class mip::OperationCancelledError  |  Operation was cancelled.
class mip::PolicyEngine  |  This class provides an interface for all engine functions.
class mip::PolicyHandler  |  This class provides an interface for all policy handler functions on a file.
class mip::PolicyProfile  |  [PolicyProfile](class_mip_policyprofile.md) class is the root class for using the Microsoft Information Protection operations. A typical application will only need one [PolicyProfile](class_mip_policyprofile.md) but it can create multiple profiles if needed.
class mip::PolicySyncError  |  An attempt to sync policy data failed.
class mip::PrivilegedRequiredError  |  Current label was assigned as a privileged operation (The equivalent to an administrator operation), therefore it can't be overriden.
class mip::ProtectAdhocAction  |  An action class that specifies adding adhoc protection to the document.
class mip::ProtectByTemplateAction  |  An action class that specifies adding protection by template to the document.
class mip::ProtectDoNotForwardAction  |  An action class that specifies adding do not forward protection to the document.
class mip::ProtectionDescriptor  |  Description of protection associated with a piece of content.
class mip::ProtectionDescriptorBuilder  |  Constructs a [ProtectionDescriptor](class_mip_protectiondescriptor.md) that describes protection associated with a piece of content.
class mip::ProtectionEngine  |  Manages protection-related actions related to a specific identity.
class mip::ProtectionHandler  |  Manages protection-related actions for a specific protection configuration.
class mip::ProtectionProfile  |  [ProtectionProfile](class_mip_protectionprofile.md) is the root class for performing protection operations.
class mip::ProxyAuthenticationError  |  Proxy authentication failure.
class mip::RecommendLabelAction  |  Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
class mip::RemoveContentFooterAction  |  An action class that specifies removing the content footer from the document.
class mip::RemoveContentHeaderAction  |  An action class that specifies removing the content header from the document.
class mip::RemoveProtectionAction  |  An action class that specifies removing protection from the document.
class mip::RemoveWatermarkAction  |  An action class that specifies removing the watermarking from the document.
class mip::SensitivityTypesRulePackage  | _Not yet documented._
class mip::ServiceDisabledError  |  The user could not get access to the content due to a service being disabled.
class mip::Stream  |  A class that defines the interface between the MIP SDK and stream-based content.
class mip::TaskDispatcherDelegate  |  A class that defines the interface to the MIP SDK task dispatcher.
class mip::TransientNetworkError  |  Transient networking error. Caused by unexpected behavior when making network calls to service endpoints. The operation can be retried as this error is a transient error.
class mip::UserRights  |  A group of users and the rights associated with them.
class mip::UserRoles  |  A group of users and the roles associated with them.
struct mip::ApplicationInfo  |  A struct that includes application specific information.
struct mip::PublishingLicenseContext  |  Holds the details of a Publishing License used to create a protection handler.
  
## Members
  
### WatermarkLayout enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
HORIZONTAL            | Watermark layout is horizontal
DIAGONAL            | Watermark layout is diagonal
Layout for watermarks.
  
### ContentMarkAlignment enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
LEFT            | Content marking is aligned to the left
RIGHT            | Content marking is aligned to the right
CENTER            | Content marking is centered
Alignment for content marks (content header or content footer).
  
### AssignmentMethod enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
STANDARD            | [Label](class_mip_label.md) assignment method is standard
PRIVILEGED            | [Label](class_mip_label.md) assignment method is privileged
AUTO            | [Label](class_mip_label.md) assignment method is automatic
The assignment method of the label on the document. Whether the Assignment of the label was done automatically, standard or as a privileged operation (The equivalent to an administrator operation).
  
### ActionSource enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
MANUAL            | Selected manually by user
AUTOMATIC            | Set by policy conditions
RECOMMENDED            | Set by user after label was recommended by policy conditions
DEFAULT            | Set by default in policy
MANDATORY            | Set by user after policy enforced to set a label
defines what triggered the SetLabel event
  
### DataState enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
REST            | Inactive data stored physically in databases/file/warehouses
MOTION            | Data traversing a network or temporarily residing in computer memory to be read or updated
USE            | Active data under constant change stored physically in databases/file/warehouses etc
Defines what state of the data is the application acting upon.
  
### ContentFormat enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
DEFAULT            | Content format is standard file format
EMAIL            | Content format is email format
Content format.
  
### Consent enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
AcceptAlways            | Consent, and remember this decision
Accept            | Consent, just one time
Reject            | Do not consent
A user's response when consent is requested to connect to a service endpoint.
  
### ErrorType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
BAD_INPUT_ERROR            | Caller passed bad input.
FILE_IO_ERROR            | General File IO error.
NETWORK_ERROR            | General network issues; for example, unreachable service.
TRANSIENT_NETWORK_ERROR            | Transient network issues; for example, bad gateway.
INTERNAL_ERROR            | Internal unexpected errors.
JUSTIFICATION_REQUIRED            | Justification should be provided to complete the action on the file.
NOT_SUPPORTED_OPERATION            | The requested operation is not yet supported.
PRIVILEGED_REQUIRED            | Can't override privileged label when new label method is standard.
ACCESS_DENIED            | The user could not get access to services.
CONSENT_DENIED            | An operation that required consent from user was not granted consent.
POLICY_SYNC_ERROR            | An attempt to sync policy data failed.
NO_PERMISSIONS            | The user could not get access to the content. For example, no permissions, content revoked
NO_AUTH_TOKEN            | The user could not get access to the content due to an empty auth token.
DISABLED_SERVICE            | The user could not get access to the content due to the service being disabled
PROXY_AUTH_ERROR            | Proxy authentication failed.
NO_POLICY_ERROR            | No policy is configured for user/tenant
OPERATION_CANCELLED            | Operation cancelled
ADHOC_PROTECTION_REQUIRED            | Adhoc protection should be set to complete the action on the file
  
### HttpRequestType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Get            | GET
Post            | POST
HTTP request type.
  
### LogLevel enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
Trace            | 
Info            | 
Warning            | 
Error            | 
Different log levels used across the MIP SDK.
  
### ProtectionHandlerCreationOptions enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
None            | None
OfflineOnly            | Do not allow UI and network operations.
AllowAuditedExtraction            | Content can be opened in a non-protection-SDK-aware app
PreferDeprecatedAlgorithms            | Use deprecated crypto algorithms (ECB) for backwards compatibility
Bit flags that dictate additional policy creation behavior.
  
### ProtectionType enum
 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
TemplateBased            | Handle was created from a template
Custom            | Handle was created ad hoc
Describes whether protection is based off a template or ad-hoc (custom)
  
### ActionType enum
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
  
### GetAssignmentMethodString function
Converts AssignmentMethod enum to a string description.

Parameters:  
* **method**: an assignment method. 



  
**Returns**: A string description of the assignment method.
  
### GetActionSourceString function
Get the action source name.

Parameters:  
* **actionSource**: The action source. 



  
**Returns**: A string representation of the action source.
  
### GetDataStateString function
Get the content state name.

Parameters:  
* **actionSource**: The state of the content being worked upon. 



  
**Returns**: A string representation of the content state.
  
### GetCustomSettingPolicyDataName function
Name of the setting to explicitly specify policy data.

  
**Returns**: The custom settings key.
  
### GetCustomSettingExportPolicyFileName function
Name of the setting to explicitly specify file path to export SCC policy data to.

  
**Returns**: The custom settings key.
  
### GetCustomSettingSensitivityTypesDataName function
Name of the setting to explicitly specify sensitivity data.

  
**Returns**: The custom settings key.
  
### GetCustomSettingPolicyDataFile function
Name of the setting to explicitly specify policy data file path.

  
**Returns**: The custom settings key.
  
### GetCustomSettingSensitivityTypesDataFile function
Name of the setting to explicitly specify sensitivity types data file path.

  
**Returns**: The custom settings key.
  
### GetCustomSettingExternalLabelsEnabled function
Name of the setting that allows to enable "external labels" feature.

  
**Returns**: The custom settings key.
  
### ReleaseAllResources function
Releases all resources (threads, etc) before shutdown.
This function must be called exactly once prior to process termination. It provides MIP the opportunity to uninitialize itself in a moment where its dependent libraries are still guaranteed to be loaded and thread joining is still possible. Applications must release references to all MIP objects (for example, Profiles, Engines, Handlers) before calling this function.
If this function is not called, MIP will be naturally unloaded as part of standard process teardown. On some platforms, this may result in deadlock (for example, threads cannot be joined on win32 in response to process teardown) or crashes (for example, the DLL unload order for delay-loaded libraries on win32 is not controlled by MIP, so its dependent libraries may have been unloaded by the time MIP shutdown code executes, resulting in invalid read failures).
  
### CreateStreamFromStdStream function
Creates a [Stream](class_mip_stream.md) from a std::istream.

Parameters:  
* **stdIStream**: Backing std::istream



  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::istream
  
### CreateStreamFromStdStream function
Creates a [Stream](class_mip_stream.md) from a std::ostream.

Parameters:  
* **stdOStream**: Backing std::ostream



  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::ostream
  
### CreateStreamFromStdStream function
Creates a [Stream](class_mip_stream.md) from a std::iostream.

Parameters:  
* **stdIOStream**: Backing std::iostream



  
**Returns**: [Stream](class_mip_stream.md) wrapping a std::iostream
  
### CreateStreamFromBuffer function
Creates an [Stream](class_mip_stream.md) from a buffer.

Parameters:  
* **buffer**: Pointer to a buffer



  
**Returns**: Size Size of buffer