---
title: MIP SDK for C++ Reference
description: MIP SDK for C++ Reference
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: mbaldwin
ms.date: 01/28/2019
---
# MIP SDK for C++ Reference

The Microsoft Information Protection (MIP) SDK for C++ allows developers to manage and apply data protection policies to data and other digital assets.

The MIP SDK for C++ includes:

- [Enumerations and structures](mip-enums-and-structs.md)
- [Functions](mip-functions.md)
- The following classes:

 Class                         | Description                                
--------------------------------|---------------------------------------------
class mip::AccessDeniedError  |  The user could not get access to the content. For example, no permissions, content revoked.
class mip::Action  |  Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
class mip::ActionData  | _Not yet documented._
class mip::AddContentFooterAction  |  An action class that specifies adding a content footer to the document.
class mip::AddContentHeaderAction  |  An action class that specifies adding content header.
class mip::AddWatermarkAction  |  An action class that specifies adding watermark.
class mip::AddWatermarkActionData  | _Not yet documented._
class mip::AdhocProtectionRequiredError  |  Adhoc protection should be set to complete the action on the file.
class mip::ApplicationActionState  | _Not yet documented._
class mip::ApplyLabelAction  |  Apply label actions requires the calling application to apply a specific label.
class mip::ArgumentData  | _Not yet documented._
class mip::AuthDelegate  |  Delegate for auth related operations.
class mip::BadInputError  |  Bad input error, thrown when the input to an SDK API is invalid.
class mip::ClassificationData  | _Not yet documented._
class mip::ClassificationRequest  |  Class that contains the request of a classification call on the Execution State.
class mip::ClassificationResult  |  Class that contains the result of a classification call on the Execution State.
class mip::ComputeEngine  | _Not yet documented._
class mip::ComputeEngineContext  | _Not yet documented._
class mip::ConditionData  | _Not yet documented._
class mip::ConsentDelegate  |  Delegate for consent related operations.
class mip::ConsentDeniedError  |  An operation that required consent from user was not granted consent.
class mip::ContentLabel  |  Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
class mip::ContentMarkingActionData  | _Not yet documented._
class mip::CustomAction  |  [CustomAction](class_mip_customaction.md) is a generic action class that captures all the sub-properties of the action as a property bag. The caller is responsible to understand the meaning of the action.
class mip::DeprecatedApiError  |  Caller invoked a deprecated API.
class mip::DocumentState  | _Not yet documented._
class mip::Error  |  Base class for all errors that will be reported (thrown or returned) from MIP SDK.
class mip::ExecutionState  |  Interface for all the state needed to execute the engine.
class mip::FileEngine  |  This class provides an interface for all engine functions.
class mip::FileExecutionState  | _Not yet documented._
class mip::FileHandler  |  Interface for all file handling functions.
class mip::FileInspector  | _Not yet documented._
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
class mip::LabelActionData  | _Not yet documented._
class mip::LabelDisabledError  |  [Label](class_mip_label.md) is disabled or inactive.
class mip::LabelGroupData  | _Not yet documented._
class mip::LabelingOptions  |  Interface for configuring labeling options for the SetLabel/DeleteLabel methods.
class mip::LabelNotFoundError  |  [Label](class_mip_label.md) ID is not recognized.
class mip::LoggerDelegate  |  A class that defines the interface to the MIP SDK logger.
class mip::MetadataAction  |  An [Action](class_mip_action.md) that adds metadata information to the content.
class mip::MipContext  | MipContext represents state that is shared across all profiles, engines, handlers.
class mip::MsgAttachmentData  | _Not yet documented._
class mip::MsgInspector  | _Not yet documented._
class mip::NetworkError  |  Networking error. Caused by unexpected behavior when making network calls to service endpoints.
class mip::NoAuthTokenError  |  The user could not get access to the content due to missing authentication token.
class mip::NoPermissionsError  |  The user could not get access to the content. For example, no permissions, content revoked.
class mip::NoPolicyError  |  Tenant policy is not configured for classification/labels.
class mip::NotSupportedError  |  The operation requested by the application is not supported by the SDK.
class mip::OperationCancelledError  |  Operation was cancelled.
class mip::PolicyEngine  |  This class provides an interface for all engine functions.
class mip::PolicyHandler  |  This class provides an interface for all policy handler functions on a file.
class mip::PolicyPackageData  | _Not yet documented._
class mip::PolicyProfile  |  [PolicyProfile](class_mip_policyprofile.md) class is the root class for using the Microsoft Information Protection operations. A typical application will only need one [PolicyProfile](class_mip_policyprofile.md) but it can create multiple profiles if needed.
class mip::PolicyRuleData  | _Not yet documented._
class mip::PolicySyncError  |  An attempt to sync policy data failed.
class mip::PrivilegedRequiredError  |  Current label was assigned as a privileged operation (The equivalent to an administrator operation), therefore it can't be overriden.
class mip::PropertyData  | _Not yet documented._
class mip::ProtectAdhocAction  |  An action class that specifies adding adhoc protection to the document.
class mip::ProtectByTemplateAction  |  An action class that specifies adding protection by template to the document.
class mip::ProtectDoNotForwardAction  |  An action class that specifies adding do not forward protection to the document.
class mip::ProtectionActionData  | _Not yet documented._
class mip::ProtectionDescriptor  |  Description of protection associated with a piece of content.
class mip::ProtectionDescriptorBuilder  |  Constructs a [ProtectionDescriptor](class_mip_protectiondescriptor.md) that describes protection associated with a piece of content.
class mip::ProtectionEngine  |  Manages protection-related actions related to a specific identity.
class mip::ProtectionHandler  |  Manages protection-related actions for a specific protection configuration.
class mip::ProtectionProfile  |  [ProtectionProfile](class_mip_protectionprofile.md) is the root class for performing protection operations.
class mip::ProtectionSettings  |  Interface for configuring protection options for the SetLabel method.
class mip::ProxyAuthenticationError  |  Proxy authentication failure.
class mip::PublishingLicenseInfo  |  Holds the details of a Publishing License used to create a protection handler.
class mip::RecommendLabelAction  |  Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
class mip::RemoveContentFooterAction  |  An action class that specifies removing the content footer from the document.
class mip::RemoveContentHeaderAction  |  An action class that specifies removing the content header from the document.
class mip::RemoveProtectionAction  |  An action class that specifies removing protection from the document.
class mip::RemoveWatermarkAction  |  An action class that specifies removing the watermarking from the document.
class mip::RulePackageData  | _Not yet documented._
class mip::SensitivityConditionData  | _Not yet documented._
class mip::SensitivityTypesRulePackage  | _Not yet documented._
class mip::ServiceDisabledError  |  The user could not get access to the content due to a service being disabled.
class mip::Stream  |  A class that defines the interface between the MIP SDK and stream-based content.
class mip::SyncFileBaseData  | _Not yet documented._
class mip::SyncFilePolicyData  | _Not yet documented._
class mip::SyncFileSensitivityData  | _Not yet documented._
class mip::TaskDispatcherDelegate  |  A class that defines the interface to the MIP SDK task dispatcher.
class mip::TemplateNotFoundError  |  Template ID is not recognized by RMS service.
class mip::TransientNetworkError  |  Transient networking error. Caused by unexpected behavior when making network calls to service endpoints. The operation can be retried as this error is a transient error.
class mip::UserRights  |  A group of users and the rights associated with them.
class mip::UserRoles  |  A group of users and the roles associated with them.
