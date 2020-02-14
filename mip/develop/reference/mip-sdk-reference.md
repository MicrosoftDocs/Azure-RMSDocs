---
title: MIP SDK for C++ Reference
description: MIP SDK for C++ Reference
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 01/28/2019
---
# MIP SDK for C++ Reference

The Microsoft Information Protection (MIP) SDK for C++ allows developers to manage and apply data protection policies to data and other digital assets.

The MIP SDK for C++ includes:

- [Enumerations and structures](mip-enums-and-structs.md)
- [Functions](mip-functions.md)
- The following classes:

## namespace mip classes

 Class                         | Description                                
--------------------------------|---------------------------------------------
[class mip::AccessDeniedError](class_mip_accessdeniederror.md)  |  The user could not get access to the content. For example, no permissions, content revoked.
[class mip::Action](class_mip_action.md)  |  Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
[class mip::ActionData](class_mip_actiondata.md)  | Not yet documented.
[class mip::AddContentFooterAction](class_mip_addcontentfooteraction.md)  |  An action class that specifies adding a content footer to the document.
[class mip::AddContentHeaderAction](class_mip_addcontentheaderaction.md)  |  An action class that specifies adding content header.
[class mip::AddWatermarkAction](class_mip_addwatermarkaction.md)  |  An action class that specifies adding watermark.
[class mip::AddWatermarkActionData](class_mip_addwatermarkactiondata.md)  | Not yet documented.
[class mip::AdhocProtectionRequiredError](class_mip_adhocprotectionrequirederror.md)  |  Adhoc protection should be set to complete the action on the file.
[class mip::ApplicationActionState](class_mip_applicationactionstate.md)  | Not yet documented.
[class mip::ApplyLabelAction](class_mip_applylabelaction.md)  |  Apply label actions requires the calling application to apply a specific label.
[class mip::ArgumentData](class_mip_argumentdata.md)  | Not yet documented.
[class mip::AsyncControl](class_mip_asynccontrol.md)  |  Class used to cancel async operation.
[class mip::AuthDelegate](class_mip_authdelegate.md)  |  Delegate for auth related operations.
[class mip::BadInputError](class_mip_badinputerror.md)  |  Bad input error, thrown when the input to an SDK API is invalid.
[class mip::ClassificationData](class_mip_classificationdata.md)  | Not yet documented.
[class mip::ClassificationRequest](class_mip_classificationrequest.md)  |  Class that contains the request of a classification call on the Execution State.
[class mip::ClassificationResult](class_mip_classificationresult.md)  |  Class that contains the result of a classification call on the Execution State.
[class mip::ComputeEngine](class_mip_computeengine.md)  | Not yet documented.
[class mip::ComputeEngineContext](class_mip_computeenginecontext.md)  | Not yet documented.
[class mip::ConditionData](class_mip_conditiondata.md)  | Not yet documented.
[class mip::ConsentDelegate](class_mip_consentdelegate.md)  |  Delegate for consent related operations.
[class mip::ConsentDeniedError](class_mip_consentdeniederror.md)  |  An operation that required consent from user was not granted consent.
[class mip::ContentLabel](class_mip_contentlabel.md)  |  Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
[class mip::ContentMarkingActionData](class_mip_contentmarkingactiondata.md)  | Not yet documented.
[class mip::CustomAction](class_mip_customaction.md)  |  CustomAction is a generic action class that captures all the sub-properties of the action as a property bag. The caller is responsible to understand the meaning of the action.
[class mip::DeprecatedApiError](class_mip_deprecatedapierror.md)  |  Caller invoked a deprecated API.
[class mip::DocumentState](class_mip_documentstate.md)  | Not yet documented.
[class mip::Error](class_mip_error.md)  |  Base class for all errors that will be reported (thrown or returned) from MIP SDK.
[class mip::ExecutionState](class_mip_executionstate.md)  |  Interface for all the state needed to execute the engine.
[class mip::FileEngine](class_mip_fileengine.md)  |  This class provides an interface for all engine functions.
[class mip::FileExecutionState](class_mip_fileexecutionstate.md)  | Not yet documented.
[class mip::FileHandler](class_mip_filehandler.md)  |  Interface for all file handling functions.
[class mip::FileInspector](class_mip_fileinspector.md)  | Not yet documented.
[class mip::FileIOError](class_mip_fileioerror.md)  |  File IO error.
[class mip::FileProfile](class_mip_fileprofile.md)  |  FileProfile class is the root class for using the Microsoft Information Protection operations.
[class mip::HttpDelegate](class_mip_httpdelegate.md)  |  Interface for overriding HTTP handling.
[class mip::HttpOperation](class_mip_httpoperation.md)  |  Interface that describes a single HTTP operation, implemented by client app when overriding HttpDelegate.
[class mip::HttpRequest](class_mip_httprequest.md)  |  Interface that describes a single HTTP request.
[class mip::HttpResponse](class_mip_httpresponse.md)  |  Interface that describes a single HTTP response, implemented by client app when overriding HttpDelegate.
[class mip::Identity](class_mip_identity.md)  |  Abstraction for identity.
[class mip::InsufficientBufferError](class_mip_insufficientbuffererror.md)  |  Insufficient buffer error.
[class mip::InternalError](class_mip_internalerror.md)  |  Internal error. This error is thrown when something unexpected happens during execution.
[class mip::JustificationRequiredError](class_mip_justificationrequirederror.md)  | Not yet documented.
[class mip::JustifyAction](class_mip_justifyaction.md)  |  Justify Action requires providing a justification to a label downgrade and setting the response in the execution state.
[class mip::Label](class_mip_label.md)  |  Abstraction for a single Microsoft Information Protection label.
[class mip::LabelActionData](class_mip_labelactiondata.md)  | Not yet documented.
[class mip::LabelDisabledError](class_mip_labeldisablederror.md)  |  Label is disabled or inactive.
[class mip::LabelGroupData](class_mip_labelgroupdata.md)  | Not yet documented.
[class mip::LabelingOptions](class_mip_labelingoptions.md)  |  Interface for configuring labeling options for the SetLabel/DeleteLabel methods.
[class mip::LabelNotFoundError](class_mip_labelnotfounderror.md)  |  Label ID is not recognized.
[class mip::LoggerDelegate](class_mip_loggerdelegate.md)  |  A class that defines the interface to the MIP SDK logger.
[class mip::MetadataAction](class_mip_metadataaction.md)  |  An Action that adds metadata information to the content.
[class mip::MipContext](class_mip_mipcontext.md)  |  MipContext represents state that is shared across all profiles, engines, handlers.
[class mip::MsgAttachmentData](class_mip_msgattachmentdata.md)  | Not yet documented.
[class mip::MsgInspector](class_mip_msginspector.md)  | Not yet documented.
[class mip::NetworkError](class_mip_networkerror.md)  |  Networking error. Caused by unexpected behavior when making network calls to service endpoints.
[class mip::NoAuthTokenError](class_mip_noauthtokenerror.md)  |  The user could not get access to the content due to missing authentication token.
[class mip::NoPermissionsError](class_mip_nopermissionserror.md)  |  The user could not get access to the content. For example, no permissions, content revoked.
[class mip::NoPolicyError](class_mip_nopolicyerror.md)  |  Tenant policy is not configured for classification/labels.
[class mip::NotSupportedError](class_mip_notsupportederror.md)  |  The operation requested by the application is not supported by the SDK.
[class mip::OperationCancelledError](class_mip_operationcancellederror.md)  |  Operation was cancelled.
[class mip::PolicyEngine](class_mip_policyengine.md)  |  This class provides an interface for all engine functions.
[class mip::PolicyHandler](class_mip_policyhandler.md)  |  This class provides an interface for all policy handler functions on a file.
[class mip::PolicyPackageData](class_mip_policypackagedata.md)  | Not yet documented.
[class mip::PolicyProfile](class_mip_policyprofile.md)  |  PolicyProfile class is the root class for using the Microsoft Information Protection operations. A typical application will only need one PolicyProfile but it can create multiple profiles if needed.
[class mip::PolicyRuleData](class_mip_policyruledata.md)  | Not yet documented.
[class mip::PrivilegedRequiredError](class_mip_privilegedrequirederror.md)  |  Current label was assigned as a privileged operation (The equivalent to an administrator operation), therefore it can't be overriden.
[class mip::PropertyData](class_mip_propertydata.md)  | Not yet documented.
[class mip::ProtectAdhocAction](class_mip_protectadhocaction.md)  |  An action class that specifies adding adhoc protection to the document.
[class mip::ProtectAdhocDkAction](class_mip_protectadhocdkaction.md)  |  An action class that specifies adding adhoc double key protection to the document.
[class mip::ProtectByTemplateAction](class_mip_protectbytemplateaction.md)  |  An action class that specifies adding protection by template to the document.
[class mip::ProtectByTemplateDkAction](class_mip_protectbytemplatedkaction.md)  |  An action class that specifies adding protection by template double key to the document.
[class mip::ProtectDoNotForwardAction](class_mip_protectdonotforwardaction.md)  |  An action class that specifies adding do not forward protection to the document.
[class mip::ProtectDoNotForwardDkAction](class_mip_protectdonotforwarddkaction.md)  |  An action class that specifies adding do not forward double key protection to the document.
[class mip::ProtectionActionData](class_mip_protectionactiondata.md)  | Not yet documented.
[class mip::ProtectionDescriptor](class_mip_protectiondescriptor.md)  |  Description of protection associated with a piece of content.
[class mip::ProtectionDescriptorBuilder](class_mip_protectiondescriptorbuilder.md)  |  Constructs a ProtectionDescriptor that describes protection associated with a piece of content.
[class mip::ProtectionEngine](class_mip_protectionengine.md)  |  Manages protection-related actions related to a specific identity.
[class mip::ProtectionHandler](class_mip_protectionhandler.md)  |  Manages protection-related actions for a specific protection configuration.
[class mip::ProtectionProfile](class_mip_protectionprofile.md)  |  ProtectionProfile is the root class for performing protection operations.
[class mip::ProtectionSettings](class_mip_protectionsettings.md)  |  Interface for configuring protection options for the SetLabel method.
[class mip::ProxyAuthenticationError](class_mip_proxyauthenticationerror.md)  |  Proxy authentication failure.
[class mip::PublishingLicenseInfo](class_mip_publishinglicenseinfo.md)  |  Holds the details of a Publishing License used to create a protection handler.
[class mip::RecommendLabelAction](class_mip_recommendlabelaction.md)  |  Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
[class mip::RemoveContentFooterAction](class_mip_removecontentfooteraction.md)  |  An action class that specifies removing the content footer from the document.
[class mip::RemoveContentHeaderAction](class_mip_removecontentheaderaction.md)  |  An action class that specifies removing the content header from the document.
[class mip::RemoveProtectionAction](class_mip_removeprotectionaction.md)  |  An action class that specifies removing protection from the document.
[class mip::RemoveWatermarkAction](class_mip_removewatermarkaction.md)  |  An action class that specifies removing the watermarking from the document.
[class mip::RulePackageData](class_mip_rulepackagedata.md)  | Not yet documented.
[class mip::SensitivityConditionData](class_mip_sensitivityconditiondata.md)  | Not yet documented.
[class mip::SensitivityTypesRulePackage](class_mip_sensitivitytypesrulepackage.md)  | Not yet documented.
[class mip::ServiceDisabledError](class_mip_servicedisablederror.md)  |  The user could not get access to the content due to a service being disabled.
[class mip::Stream](class_mip_stream.md)  |  A class that defines the interface between the MIP SDK and stream-based content.
[class mip::SyncFileBaseData](class_mip_syncfilebasedata.md)  | Not yet documented.
[class mip::SyncFilePolicyData](class_mip_syncfilepolicydata.md)  | Not yet documented.
[class mip::SyncFileSensitivityData](class_mip_syncfilesensitivitydata.md)  | Not yet documented.
[class mip::TaskDispatcherDelegate](class_mip_taskdispatcherdelegate.md)  |  A class that defines the interface to the MIP SDK task dispatcher.
[class mip::TemplateDescriptor](class_mip_templatedescriptor.md)  | Not yet documented.
[class mip::TemplateNotFoundError](class_mip_templatenotfounderror.md)  |  Template ID is not recognized by RMS service.
[class mip::UserRights](class_mip_userrights.md)  |  A group of users and the rights associated with them.
[class mip::UserRoles](class_mip_userroles.md)  |  A group of users and the roles associated with them.
struct mip::ApplicationInfo  |  A struct that includes application specific information.
struct mip::TelemetryConfiguration  |  Custom telemetry settings (not commonly used)


