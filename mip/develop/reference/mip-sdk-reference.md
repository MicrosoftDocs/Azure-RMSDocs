---
title: MIP SDK for C++ Reference
description: MIP SDK for C++ Reference
author: BryanLa
ms.service: information-protection
ms.topic: reference
ms.collection: M365-security-compliance
ms.author: bryanla
ms.date: 01/28/2019
---
# MIP SDK for C++ Reference

The Microsoft Information Protection (MIP) SDK for C++ allows developers to manage and apply data protection policies to data and other digital assets.  

The MIP SDK for C++ includes:

- [Enumerations and structures](mip-enums-and-structs.md)
- [Functions](mip-functions.md)
- The following classes:

| Namespace::Class name | Description |
| :----------|:------------|
[mip::AccessDeniedError](class_mip_AccessDeniedError.md)  |  The user could not get access to the content. For example, no permissions, content revoked.
[mip::Action](class_mip_Action.md)  |  Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
[mip::AddContentFooterAction](class_mip_AddContentFooterAction.md)  |  An action class that specifies adding a content footer to the document.
[mip::AddContentHeaderAction](class_mip_AddContentHeaderAction.md)  |  An action class that specifies adding content header.
[mip::AddWatermarkAction](class_mip_AddWatermarkAction.md)  |  An action class that specifies adding watermark.
[mip::ApplyLabelAction](class_mip_ApplyLabelAction.md)  |  Apply label actions requires the calling application to apply a specific label.
[mip::AuthDelegate](class_mip_AuthDelegate.md)  |  Delegate for auth related operations.
[mip::BadInputError](class_mip_BadInputError.md)  |  Bad input error, thrown when the input to an SDK API is invalid.
[mip::ClassificationRequest](class_mip_ClassificationRequest.md)  |  Class that contains the request of a classification call on the Execution State.
[mip::ClassificationResult](class_mip_ClassificationResult.md)  |  Class that contains the result of a classification call on the Execution State.
[mip::ConsentDelegate](class_mip_ConsentDelegate.md)  |  Delegate for consent related operations.
[mip::ConsentDeniedError](class_mip_ConsentDeniedError.md)  |  An operation that required consent from user was not granted consent.
[mip::ContentLabel](class_mip_ContentLabel.md)  |  Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
[mip::CustomAction](class_mip_CustomAction.md)  |  [CustomAction](class_mip_customaction.md) is a generic action class that captures all the sub-properties of the action as a property bag. The caller is responsible to understand the meaning of the action.
[mip::Error](class_mip_Error.md)  |  Base class for all errors that will be reported (thrown or returned) from MIP SDK.
[mip::ExecutionState](class_mip_ExecutionState.md)  |  Interface for all the state needed to execute the engine.
[mip::FileEngine](class_mip_FileEngine.md)  |  This class provides an interface for all engine functions.
[mip::FileExecutionState](class_mip_FileExecutionState.md)  | _Not yet documented._
[mip::FileHandler](class_mip_FileHandler.md)  |  Interface for all file handling functions.
[mip::FileIOError](class_mip_FileIOError.md)  |  File IO error.
[mip::FileProfile](class_mip_FileProfile.md)  |  [FileProfile](class_mip_fileprofile.md) class is the root class for using the Microsoft Information Protection operations.
[mip::HttpDelegate](class_mip_HttpDelegate.md)  |  Interface for overriding HTTP handling.
[mip::HttpRequest](class_mip_HttpRequest.md)  |  Interface that describes a single HTTP request.
[mip::HttpResponse](class_mip_HttpResponse.md)  |  Interface that describes a single HTTP response, implemented by client app when overriding [HttpDelegate](class_mip_httpdelegate.md).
[mip::Identity](class_mip_Identity.md)  |  Abstraction for identity.
[mip::InternalError](class_mip_InternalError.md)  |  Internal error. This error is thrown when something unexpected happens during execution.
[mip::JustificationRequiredError](class_mip_JustificationRequiredError.md)  | _Not yet documented._
[mip::JustifyAction](class_mip_JustifyAction.md)  |  Justify [Action](class_mip_action.md) requires providing a justification to a label downgrade and setting the response in the execution state.
[mip::Label](class_mip_Label.md)  |  Abstraction for a single Microsoft Information Protection label.
[mip::LabelingOptions](class_mip_LabelingOptions.md)  |  Interface for configuring labeling options for the SetLabel/DeleteLabel methods.
[mip::LoggerDelegate](class_mip_LoggerDelegate.md)  |  A class that defines the interface to the MIP SDK logger.
[mip::MetadataAction](class_mip_MetadataAction.md)  |  An [Action](class_mip_action.md) that adds metadata information to the content.
[mip::NetworkError](class_mip_NetworkError.md)  |  Networking error. Caused by unexpected behavior when making network calls to service endpoints.
[mip::NoAuthTokenError](class_mip_NoAuthTokenError.md)  |  The user could not get access to the content due to missing authentication token.
[mip::NoPermissionsError](class_mip_NoPermissionsError.md)  |  The user could not get access to the content. For example, no permissions, content revoked.
[mip::NoPolicyError](class_mip_NoPolicyError.md)  |  Tenant policy is not configured for classification/labels.
[mip::NotSupportedError](class_mip_NotSupportedError.md)  |  The operation requested by the application is not supported by the SDK.
[mip::PolicyEngine](class_mip_PolicyEngine.md)  |  This class provides an interface for all engine functions.
[mip::PolicyHandler](class_mip_PolicyHandler.md)  |  This class provides an interface for all policy handler functions on a file.
[mip::PolicyProfile](class_mip_PolicyProfile.md)  |  [PolicyProfile](class_mip_policyprofile.md) class is the root class for using the Microsoft Information Protection operations. A typical application will only need one [PolicyProfile](class_mip_policyprofile.md) but it can create multiple profiles if needed.
[mip::PolicySyncError](class_mip_PolicySyncError.md)  |  An attempt to sync policy data failed.
[mip::PrivilegedRequiredError](class_mip_PrivilegedRequiredError.md)  |  Current label was assigned as a privileged operation (The equivalent to an administrator operation), therefore it can't be overriden.
[mip::ProtectAdhocAction](class_mip_ProtectAdhocAction.md)  |  An action class that specifies adding adhoc protection to the document.
[mip::ProtectByTemplateAction](class_mip_ProtectByTemplateAction.md)  |  An action class that specifies adding protection by template to the document.
[mip::ProtectDoNotForwardAction](class_mip_ProtectDoNotForwardAction.md)  |  An action class that specifies adding do not forward protection to the document.
[mip::ProtectionDescriptor](class_mip_ProtectionDescriptor.md)  |  Description of protection associated with a piece of content.
[mip::ProtectionDescriptorBuilder](class_mip_ProtectionDescriptorBuilder.md)  |  Constructs a [ProtectionDescriptor](class_mip_protectiondescriptor.md) that describes protection associated with a piece of content.
[mip::ProtectionEngine](class_mip_ProtectionEngine.md)  |  Manages protection-related actions related to a specific identity.
[mip::ProtectionHandler](class_mip_ProtectionHandler.md)  |  Manages protection-related actions for a specific protection configuration.
[mip::ProtectionProfile](class_mip_ProtectionProfile.md)  |  [ProtectionProfile](class_mip_protectionprofile.md) is the root class for performing protection operations.
[mip::ProxyAuthenticationError](class_mip_ProxyAuthenticationError.md)  |  Proxy authentication failure.
[mip::RecommendLabelAction](class_mip_RecommendLabelAction.md)  |  Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
[mip::RemoveContentFooterAction](class_mip_RemoveContentFooterAction.md)  |  An action class that specifies removing the content footer from the document.
[mip::RemoveContentHeaderAction](class_mip_RemoveContentHeaderAction.md)  |  An action class that specifies removing the content header from the document.
[mip::RemoveProtectionAction](class_mip_RemoveProtectionAction.md)  |  An action class that specifies removing protection from the document.
[mip::RemoveWatermarkAction](class_mip_RemoveWatermarkAction.md)  |  An action class that specifies removing the watermarking from the document.
[mip::SensitivityTypesRulePackage](class_mip_SensitivityTypesRulePackage.md)  | _Not yet documented._
[mip::ServiceDisabledError](class_mip_ServiceDisabledError.md)  |  The user could not get access to the content due to a service being disabled.
[mip::Stream](class_mip_Stream.md)  |  A class that defines the interface between the MIP SDK and stream-based content.
[mip::TransientNetworkError](class_mip_TransientNetworkError.md)  |  Transient networking error. Caused by unexpected behavior when making network calls to service endpoints. The operation can be retried as this error is a transient error.
[mip::UserRights](class_mip_UserRights.md)  |  A group of users and the rights associated with them.
[mip::UserRoles](class_mip_UserRoles.md)  |  A group of users and the roles associated with them.
