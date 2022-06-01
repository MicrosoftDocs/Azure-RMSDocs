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

The MIP SDK for C++ includes Enumerations and structures](mip-enums-and-structs.md), and the following classes:

 Class                         | Description                                
--------------------------------|---------------------------------------------
class [AccessDeniedError] | The user could not get access to the content. For example, no permissions, content revoked.
class [Action] | Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
class [ActionData] | _Not yet documented._
class [AddContentFooterAction] | An action class that specifies adding a content footer to the document.
class [AddContentHeaderAction] | An action class that specifies adding content header.
class [AddWatermarkAction] | An action class that specifies adding watermark.
class [AddWatermarkActionData] | _Not yet documented._
class [AdhocProtectionRequiredError] | Adhoc protection should be set to complete the action on the file.
class [ApplicationActionState] | _Not yet documented._
class [ApplyLabelAction] | Apply label actions requires the calling application to apply a specific label.
class [ArgumentData] | _Not yet documented._
class [AsyncControl] | Class used to cancel async operation.
class [AuditDelegate] | A class that defines the interface to the MIP SDK audit notifications.
class [AuditEvent] | A single audit event.
class [AuthDelegate] | Delegate for auth related operations.
class [BadInputError] | Bad input error, thrown when the input to an SDK API is invalid.
class [ClassificationData] | _Not yet documented._
class [ClassificationRequest] | Class that contains the request of a classification call on the Execution State.
class [ClassificationResult] | Class that contains the result of a classification call on the Execution State.
class [ComputeEngine] | _Not yet documented._
class [ComputeEngineContext] | _Not yet documented._
class [ConditionData] | _Not yet documented._
class [ConsentDelegate] | Delegate for consent related operations.
class [ConsentDeniedError] | An operation that required consent from user was not granted consent.
class [ProtectionHandler::ConsumptionSettings] | Settings used to create a ProtectionHandler to consume existing content.
class [ContentFormatNotSupportedError] | Content Format is not supported.
class [ContentLabel] | Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
class [ContentMarkingActionData] | _Not yet documented._
class [CustomAction] | CustomAction is a generic action class that captures all the sub-properties of the action as a property bag. The caller is responsible to understand the meaning of the action.
class [CustomerKeyUnavailableError] | Bring your own encryption key needed and unavailable.
class [DelegateResponseBase] | Base class for all DelegateResponse classes.
class [DelegateResponseError] | Delegate Response Error. Thrown or returned in response to encountering an error in a delegate method.
class [DelegationLicense] | _Not yet documented._
class [DelegationLicenseSettings] | _Not yet documented._
class [DeprecatedApiError] | Caller invoked a deprecated API.
class [DetailedClassificationResult] | Class that contains the result of a classification call on the Execution State.
class [DiagnosticDelegate] | A class that defines the interface to the MIP SDK audit/telemetry notifications.
class [DocumentState] | _Not yet documented._
class [Error] | Base class for all errors that will be reported (thrown or returned) from MIP SDK.
class [Event] | A single audit/telemetry event.
class [EventContext] | A single audit/telemetry event context.
class [EventProperty] | A single audit/telemetry property.
class [ExecutionState] | Interface for all the state needed to execute the engine.
class [FileEngine] | This class provides an interface for all engine functions.
class [FileExecutionState] | _Not yet documented._
class [FileHandler] | Interface for all file handling functions.
class [FileInspector] | _Not yet documented._
class [FileIOError] | File IO error.
class [FileProfile] | FileProfile class is the root class for using the Microsoft Information Protection operations.
class [FileStatus] | Interface for all file status functions.
class [GetTemplatesSettings] | Settings to use when obtaining templates.
class [HttpDelegate] | Interface for overriding HTTP handling.
class [HttpOperation] | Interface that describes a single HTTP operation, implemented by client app when overriding HttpDelegate.
class [HttpRequest] | Interface that describes a single HTTP request.
class [HttpResponse] | Interface that describes a single HTTP response, implemented by client app when overriding HttpDelegate.
class [Identity] | Abstraction for identity.
class [InsufficientBufferError] | Insufficient buffer error.
class [InternalError] | Internal error. This error is thrown when something unexpected happens during execution.
class [JsonDelegate] | _Not yet documented._
class [JsonDocument] | JsonDocument abstraction class.
class [JsonValue] | _Not yet documented._
class [JustificationRequiredError] | _Not yet documented._
class [JustifyAction] | Justify Action requires providing a justification to a label downgrade and setting the response in the execution state.
class [Label] | Abstraction for a single Microsoft Information Protection label.
class [LabelActionData] | _Not yet documented._
class [LabelDisabledError] | Label is disabled or inactive.
class [LabelGroupData] | _Not yet documented._
class [LabelingOptions] | Interface for configuring labeling options for the SetLabel/DeleteLabel methods.
class [LabelNotFoundError] | Label ID is not recognized.
class [LicenseApplicationData] | The application data from a license.
class [LicenseConnectionInfo] | The connection information from a license.
class [LicenseDescriptor] | The descriptor from a license.
class [LicenseNameAndDescriptionItem] | The descriptor line item from a license.
class [LicenseNotRegisteredError] | License is not registered.
class [LoggerDelegate] | A class that defines the interface to the MIP SDK logger.
class [LogMessageData] | A class that stores log messages.
class [MetadataAction] | An Action that adds metadata information to the content.
class [MetadataEntry] | An abstraction class for metadata entry.
class [MetadataVersion] | Interface for a MetadataVersion. MetadataVersion determines which metadata is active and how it is processed.
class [MipConfiguration] | Configuration used by MIP sdk during its creation and throughout its lifetime.
class [MipContext] | MipContext represents state that is shared across all profiles, engines, handlers.
class [MsgAttachmentData] | _Not yet documented._
class [MsgInspector] | _Not yet documented._
class [NetworkError] | Networking error. Caused by unexpected behavior when making network calls to service endpoints.
class [NoAuthTokenError] | The user could not get access to the content due to missing authentication token.
class [NoPermissionsError] | The user could not get access to the content. For example, no permissions, content revoked.
class [NoPolicyError] | Tenant policy is not configured for classification/labels.
class [NotSupportedError] | The operation requested by the application is not supported by the SDK.
class [AuthDelegate::OAuth2Challenge] | a class that contains all the information required from the calling application in order to generate an oauth2 token.
class [AuthDelegate::OAuth2Token] | A class containing access token info provided by an application.
class [FileHandler::Observer] | Observer interface for clients to get notifications events related to file handler.
class [FileProfile::Observer] | Observer interface for clients to get notifications for profile related events.
class [PolicyProfile::Observer] | Observer interface for clients to get notifications for profile related events.
class [ProtectionEngine::Observer] | Interface that receives notifications related to ProtectionEngine.
class [ProtectionHandler::Observer] | Interface that receives notifications related to ProtectionHandler.
class [ProtectionProfile::Observer] | Interface that receives notifications related to ProtectionProfile.
class [OperationCancelledError] | Operation was cancelled.
class [ParsedPublishingLicense] | _Not yet documented._
class [ParsedPublishingLicenseBuilder] | _Not yet documented._
class [PolicyEngine] | This class provides an interface for all engine functions.
class [PolicyHandler] | This class provides an interface for all policy handler functions on a file.
class [PolicyPackageData] | _Not yet documented._
class [PolicyProfile] | PolicyProfile class is the root class for using the Microsoft Information Protection operations. A typical application will only need one PolicyProfile but it can create multiple profiles if needed.
class [PolicyRuleData] | _Not yet documented._
class [PrivilegedRequiredError] | Current label was assigned as a privileged operation (The equivalent to an administrator operation), therefore it can't be overridden.
class [PropertyData] | _Not yet documented._
class [ProtectAdhocAction] | An action class that specifies adding adhoc protection to the document.
class [ProtectAdhocDkAction] | An action class that specifies adding adhoc double key protection to the document.
class [ProtectByEncryptOnlyAction] | An action class that specifies adding encrypt only protection to the document.
class [ProtectByTemplateAction] | An action class that specifies adding protection by template to the document.
class [ProtectDoNotForwardAction] | An action class that specifies adding do not forward protection to the document.
class [ProtectDoNotForwardDkAction] | An action class that specifies adding do not forward double key protection to the document.
class [ProtectionActionData] | _Not yet documented._
class [ProtectionCommonSettings] | Settings to use for protection operations.
class [ProtectionDescriptor] | Description of protection associated with a piece of content.
class [ProtectionDescriptorBuilder] | Constructs a ProtectionDescriptor that describes protection associated with a piece of content.
class [ProtectionEngine] | Manages protection-related actions related to a specific identity.
class [ProtectionHandler] | Manages protection-related actions for a specific protection configuration.
class [ProtectionProfile] | ProtectionProfile is the root class for performing protection operations.
class [ProtectionSettings] | Interface for configuring protection options for the SetLabel method.
class [ProxyAuthenticationError] | Proxy authentication failure.
class [PublishingLicenseInfo] | Holds the details of a Publishing License used to create a protection handler.
class [ProtectionHandler::PublishingSettings] | Settings used to create a ProtectionHandler to protect new content.
class [PublishingUseLicenseRequest] | Request for a use license in the publishing request.
class [RecommendLabelAction] | Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
class [RemoveContentFooterAction] | An action class that specifies removing the content footer from the document.
class [RemoveContentHeaderAction] | An action class that specifies removing the content header from the document.
class [RemoveProtectionAction] | An action class that specifies removing protection from the document.
class [RemoveWatermarkAction] | An action class that specifies removing the watermarking from the document.
class [RulePackageData] | _Not yet documented._
class [SensitiveTypeClassificationData] | _Not yet documented._
class [SensitivityConditionData] | _Not yet documented._
class [SensitivityTypesRulePackage] | _Not yet documented._
class [ServiceDisabledError] | The user could not get access to the content due to a service being disabled.
class [ComputeEngine::Settings] | _Not yet documented._
class [FileEngine::Settings] | _Not yet documented._
class [FileProfile::Settings] | Settings used by FileProfile during its creation and throughout its lifetime.
class [PolicyEngine::Settings] | Defines the settings associated with a PolicyEngine.
class [PolicyProfile::Settings] | Settings used by PolicyProfile during its creation and throughout its lifetime.
class [ProtectionEngine::Settings] | Settings used by ProtectionEngine during its creation and throughout its lifetime.
class [ProtectionProfile::Settings] | Settings used by ProtectionProfile during its creation and throughout its lifetime.
class [StorageDelegate] | A class that defines the interface to the MIP SDK storage for caching.
class [StorageDelegate::StorageSettings] | Settings used by StorageDelegate.
class [StorageTable] | A class that defines the interface to the MIP SDK storage table used for caching.
class [Stream] | A class that defines the interface between the MIP SDK and stream-based content.
class [SyncFileBaseData] | _Not yet documented._
class [SyncFilePolicyData] | _Not yet documented._
class [SyncFileSensitivityData] | _Not yet documented._
class [TaskDispatcherDelegate] | A class that defines the interface to the MIP SDK task dispatcher.
class [TelemetryDelegate] | A class that defines the interface to the MIP SDK telemetry notifications.
class [TelemetryEvent] | A single telemetry event.
class [TemplateArchivedError] | Template ID is archived and unavailable for protection.
class [TemplateDescriptor] | _Not yet documented._
class [TemplateNotFoundError] | Template ID is not recognized by RMS service.
class [TenantInformation] | Tenant information from RMS.
class [UserRights] | A group of users and the rights associated with them.
