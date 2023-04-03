---
title: MIP SDK for C++ Reference
description: MIP SDK for C++ Reference
author: msmbaldwin
ms.service: information-protection
ms.topic: reference
ms.author: mbaldwin
ms.date: 03/30/2023
---
# MIP SDK for C++ Reference

The Microsoft Information Protection (MIP) SDK for C++ allows developers to manage and apply data protection policies to data and other digital assets.

The MIP SDK for C++ includes Enumerations and structures](mip-enums-and-structs.md), and the following classes:

 Class                         | Description                                
--------------------------------|---------------------------------------------
class [AccessDeniedError](class_mip_accessdeniederror.md) | The user could not get access to the content. For example, no permissions, content revoked.
class [Action](class_mip_action.md) | Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
class [ActionData](class_mip_actiondata.md) | _Not yet documented._
class [AddContentFooterAction](class_mip_addcontentfooteraction.md) | An action class that specifies adding a content footer to the document.
class [AddContentHeaderAction](class_mip_addcontentheaderaction.md) | An action class that specifies adding content header.
class [AddWatermarkAction](class_mip_addwatermarkaction.md) | An action class that specifies adding watermark.
class [AddWatermarkActionData](class_mip_addwatermarkactiondata.md) | _Not yet documented._
class [AdhocProtectionRequiredError](class_mip_adhocprotectionrequirederror.md) | Adhoc protection should be set to complete the action on the file.
class [ApplicationActionState](class_mip_applicationactionstate.md) | _Not yet documented._
class [ApplyLabelAction](class_mip_applylabelaction.md) | Apply label actions requires the calling application to apply a specific label.
class [ArgumentData](class_mip_argumentdata.md) | _Not yet documented._
class [AsyncControl](class_mip_asynccontrol.md) | Class used to cancel async operation.
class [AuditDelegate](class_mip_auditdelegate.md) | A class that defines the interface to the MIP SDK audit notifications.
class [AuditEvent](class_mip_auditevent.md) | A single audit event.
class [AuthDelegate](class_mip_authdelegate.md) | Delegate for auth related operations.
class [BadInputError](class_mip_badinputerror.md) | Bad input error, thrown when the input to an SDK API is invalid.
class [ClassificationData](class_mip_classificationdata.md) | _Not yet documented._
class [ClassificationRequest](class_mip_classificationrequest.md) | Class that contains the request of a classification call on the Execution State.
class [ClassificationResult](class_mip_classificationresult.md) | Class that contains the result of a classification call on the Execution State.
class [ComputeEngine](class_mip_computeengine.md) | _Not yet documented._
class [ComputeEngineContext](class_mip_computeenginecontext.md) | _Not yet documented._
class [ConditionData](class_mip_conditiondata.md) | _Not yet documented._
class [ConsentDelegate](class_mip_consentdelegate.md) | Delegate for consent related operations.
class [ConsentDeniedError](class_mip_consentdeniederror.md) | An operation that required consent from user was not granted consent.
class [ProtectionHandler::ConsumptionSettings](class_mip_protectionhandler_consumptionsettings.md) | Settings used to create a ProtectionHandler to consume existing content.
class [ContentFormatNotSupportedError](class_mip_contentformatnotsupportederror.md) | Content Format is not supported.
class [ContentLabel](class_mip_contentlabel.md) | Abstraction for a Microsoft Purview Information Protection label that is applied to a piece of content, typically a document.
class [ContentMarkingActionData](class_mip_contentmarkingactiondata.md) | _Not yet documented._
class [CustomAction](class_mip_customaction.md) | CustomAction is a generic action class that captures all the sub-properties of the action as a property bag. The caller is responsible to understand the meaning of the action.
class [CustomerKeyUnavailableError](class_mip_customerkeyunavailableerror.md) | Bring your own encryption key needed and unavailable.
class [DelegateResponseBase](class_mip_delegateresponsebase.md) | Base class for all DelegateResponse classes.
class [DelegateResponseError](class_mip_delegateresponseerror.md) | Delegate Response Error. Thrown or returned in response to encountering an error in a delegate method.
class [DelegationLicense](class_mip_delegationlicense.md) | _Not yet documented._
class [DelegationLicenseSettings](class_mip_delegationlicensesettings.md) | _Not yet documented._
class [DeprecatedApiError](class_mip_deprecatedapierror.md) | Caller invoked a deprecated API.
class [DetailedClassificationResult](class_mip_detailedclassificationresult.md) | Class that contains the result of a classification call on the Execution State.
class [DiagnosticDelegate](class_mip_diagnosticdelegate.md) | A class that defines the interface to the MIP SDK audit/telemetry notifications.
class [DirectoryObject](class_mip_directioryobject.md) | The directory object information which includes- type, email, objectId and PUID.
class [DirectoryObjectRights](class_mip_directioryobjectrights.md) | The directory object and rights associated with it.
class [DocumentState](class_mip_documentstate.md) | _Not yet documented._
class [Error](class_mip_error.md) | Base class for all errors that will be reported (thrown or returned) from MIP SDK.
class [Event](class_mip_event.md) | A single audit/telemetry event.
class [EventContext](class_mip_eventcontext.md) | A single audit/telemetry event context.
class [EventProperty](class_mip_eventproperty.md) | A single audit/telemetry property.
class [ExecutionState](class_mip_executionstate.md) | Interface for all the state needed to execute the engine.
class [FileEngine](class_mip_fileengine.md) | This class provides an interface for all engine functions.
class [FileExecutionState](class_mip_fileexecutionstate.md) | _Not yet documented._
class [FileHandler](class_mip_filehandler.md) | Interface for all file handling functions.
class [FileInspector](class_mip_fileinspector.md) | _Not yet documented._
class [FileIOError](class_mip_fileioerror.md) | File IO error.
class [FileProfile](class_mip_fileprofile.md) | FileProfile class is the root class for using the Microsoft Information Protection operations.
class [FileStatus](class_mip_filestatus.md) | Interface for all file status functions.
class [GetTemplatesSettings](class_mip_gettemplatessettings.md) | Settings to use when obtaining templates.
class [HttpDelegate](class_mip_httpdelegate.md) | Interface for overriding HTTP handling.
class [HttpOperation](class_mip_httpoperation.md) | Interface that describes a single HTTP operation, implemented by client app when overriding HttpDelegate.
class [HttpRequest](class_mip_httprequest.md) | Interface that describes a single HTTP request.
class [HttpResponse](class_mip_httpresponse.md) | Interface that describes a single HTTP response, implemented by client app when overriding HttpDelegate.
class [Identity](class_mip_identity.md) | Abstraction for identity.
class [InsufficientBufferError](class_mip_insufficientbuffererror.md) | Insufficient buffer error.
class [InternalError](class_mip_internalerror.md) | Internal error. This error is thrown when something unexpected happens during execution.
class [JsonDelegate](class_mip_jsondelegate.md) | _Not yet documented._
class [JsonDocument](class_mip_jsondocument.md) | JsonDocument abstraction class.
class [JsonValue](class_mip_jsonvalue.md) | _Not yet documented._
class [JustificationRequiredError](class_mip_justificationrequirederror.md) | _Not yet documented._
class [JustifyAction](class_mip_justifyaction.md) | Justify Action requires providing a justification to a label downgrade and setting the response in the execution state.
class [Label](class_mip_label.md) | Abstraction for a single Microsoft Purview Information Protection label.
class [LabelActionData](class_mip_labelactiondata.md) | _Not yet documented._
class [LabelDisabledError](class_mip_labeldisablederror.md) | Label is disabled or inactive.
class [LabelGroupData](class_mip_labelgroupdata.md) | _Not yet documented._
class [LabelingOptions](class_mip_labelingoptions.md) | Interface for configuring labeling options for the SetLabel/DeleteLabel methods.
class [LabelNotFoundError](class_mip_labelnotfounderror.md) | Label ID is not recognized.
class [LicenseApplicationData](class_mip_licenseapplicationdata.md) | The application data from a license.
class [LicenseConnectionInfo](class_mip_licenseconnectioninfo.md) | The connection information from a license.
class [LicenseDescriptor](class_mip_licensedescriptor.md) | The descriptor from a license.
class [LicenseNameAndDescriptionItem](class_mip_licensenameanddescriptionitem.md) | The descriptor line item from a license.
class [LicenseNotRegisteredError](class_mip_licensenotregisterederror.md) | License is not registered.
class [LicenseRightsData](class_mip_licenserightsdata.md) | The rights related information of the publishing license.
class [LoggerDelegate](class_mip_loggerdelegate.md) | A class that defines the interface to the MIP SDK logger.
class [LogMessageData](class_mip_logmessagedata.md) | A class that stores log messages.
class [MetadataAction](class_mip_metadataaction.md) | An Action that adds metadata information to the content.
class [MetadataEntry](class_mip_metadataentry.md) | An abstraction class for metadata entry.
class [MetadataVersion](class_mip_metadataversion.md) | Interface for a MetadataVersion. MetadataVersion determines which metadata is active and how it is processed.
class [MipConfiguration](class_mip_mipconfiguration.md) | Configuration used by MIP sdk during its creation and throughout its lifetime.
class [MipContext](class_mip_mipcontext.md) | MipContext represents state that is shared across all profiles, engines, handlers.
class [MsgAttachmentData](class_mip_msgattachmentdata.md) | _Not yet documented._
class [MsgInspector](class_mip_msginspector.md) | _Not yet documented._
class [NetworkError](class_mip_networkerror.md) | Networking error. Caused by unexpected behavior when making network calls to service endpoints.
class [NoAuthTokenError](class_mip_noauthtokenerror.md) | The user could not get access to the content due to missing authentication token.
class [NoPermissionsError](class_mip_nopermissionserror.md) | The user could not get access to the content. For example, no permissions, content revoked.
class [NoPolicyError](class_mip_nopolicyerror.md) | Tenant policy is not configured for classification/labels.
class [NotSupportedError](class_mip_notsupportederror.md) | The operation requested by the application is not supported by the SDK.
class [AuthDelegate::OAuth2Challenge](class_mip_authdelegate_oauth2challenge.md) | a class that contains all the information required from the calling application in order to generate an oauth2 token.
class [AuthDelegate::OAuth2Token](class_mip_authdelegate_oauth2token.md) | A class containing access token info provided by an application.
class [FileHandler::Observer](class_mip_filehandler_observer.md) | Observer interface for clients to get notifications events related to file handler.
class [FileProfile::Observer](class_mip_fileprofile_observer.md) | Observer interface for clients to get notifications for profile related events.
class [PolicyProfile::Observer](class_mip_policyprofile_observer.md) | Observer interface for clients to get notifications for profile related events.
class [ProtectionEngine::Observer](class_mip_protectionengine_observer.md) | Interface that receives notifications related to ProtectionEngine.
class [ProtectionHandler::Observer](class_mip_protectionhandler_observer.md) | Interface that receives notifications related to ProtectionHandler.
class [ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) | Interface that receives notifications related to ProtectionProfile.
class [OperationCancelledError](class_mip_operationcancellederror.md) | Operation was cancelled.
class [ParsedPublishingLicense](class_mip_parsedpublishinglicense.md) | _Not yet documented._
class [ParsedPublishingLicenseBuilder](class_mip_parsedpublishinglicensebuilder.md) | _Not yet documented._
class [PolicyEngine](class_mip_policyengine.md) | This class provides an interface for all engine functions.
class [PolicyHandler](class_mip_policyhandler.md) | This class provides an interface for all policy handler functions on a file.
class [PolicyPackageData](class_mip_policypackagedata.md) | _Not yet documented._
class [PolicyProfile](class_mip_policyprofile.md) | PolicyProfile class is the root class for using the Microsoft Purview Information Protection operations. A typical application will only need one PolicyProfile but it can create multiple profiles if needed.
class [PolicyRuleData](class_mip_policyruledata.md) | _Not yet documented._
class [PrivilegedRequiredError](class_mip_privilegedrequirederror.md) | Current label was assigned as a privileged operation (The equivalent to an administrator operation), therefore it can't be overridden.
class [PropertyData](class_mip_propertydata.md) | _Not yet documented._
class [ProtectAdhocAction](class_mip_protectadhocaction.md) | An action class that specifies adding adhoc protection to the document.
class [ProtectAdhocDkAction](class_mip_protectadhocdkaction.md) | An action class that specifies adding adhoc double key protection to the document.
class [ProtectByEncryptOnlyAction](class_mip_protectbyencryptonlyaction.md) | An action class that specifies adding encrypt only protection to the document.
class [ProtectByTemplateAction](class_mip_protectbytemplateaction.md) | An action class that specifies adding protection by template to the document.
class [ProtectDoNotForwardAction](class_mip_protectdonotforwardaction.md) | An action class that specifies adding do not forward protection to the document.
class [ProtectDoNotForwardDkAction](class_mip_protectdonotforwarddkaction.md) | An action class that specifies adding do not forward double key protection to the document.
class [ProtectionActionData](class_mip_protectionactiondata.md) | _Not yet documented._
class [ProtectionCommonSettings](class_mip_protectioncommonsettings.md) | Settings to use for protection operations.
class [ProtectionDescriptor](class_mip_protectiondescriptor.md) | Description of protection associated with a piece of content.
class [ProtectionDescriptorBuilder](class_mip_protectiondescriptorbuilder.md) | Constructs a ProtectionDescriptor that describes protection associated with a piece of content.
class [ProtectionEngine](class_mip_protectionengine.md) | Manages protection-related actions related to a specific identity.
class [ProtectionHandler](class_mip_protectionhandler.md) | Manages protection-related actions for a specific protection configuration.
class [ProtectionProfile](class_mip_protectionprofile.md) | ProtectionProfile is the root class for performing protection operations.
class [ProtectionSettings](class_mip_protectionsettings.md) | Interface for configuring protection options for the SetLabel method.
class [ProxyAuthenticationError](class_mip_proxyauthenticationerror.md) | Proxy authentication failure.
class [PublishingLicenseInfo](class_mip_publishinglicenseinfo.md) | Holds the details of a Publishing License used to create a protection handler.
class [ProtectionHandler::PublishingSettings](class_mip_protectionhandler_publishingsettings.md) | Settings used to create a ProtectionHandler to protect new content.
class [PublishingUseLicenseRequest](class_mip_publishinguselicenserequest.md) | Request for a use license in the publishing request.
class [RecommendLabelAction](class_mip_recommendlabelaction.md) | Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
class [RemoveContentFooterAction](class_mip_removecontentfooteraction.md) | An action class that specifies removing the content footer from the document.
class [RemoveContentHeaderAction](class_mip_removecontentheaderaction.md) | An action class that specifies removing the content header from the document.
class [RemoveProtectionAction](class_mip_removeprotectionaction.md) | An action class that specifies removing protection from the document.
class [RemoveWatermarkAction](class_mip_removewatermarkaction.md) | An action class that specifies removing the watermarking from the document.
class [RulePackageData](class_mip_rulepackagedata.md) | _Not yet documented._
class [SensitiveTypeClassificationData](class_mip_sensitivetypeclassificationdata.md) | _Not yet documented._
class [SensitivityConditionData](class_mip_sensitivityconditiondata.md) | _Not yet documented._
class [SensitivityTypesRulePackage](class_mip_sensitivitytypesrulepackage.md) | _Not yet documented._
class [ServiceDisabledError](class_mip_servicedisablederror.md) | The user could not get access to the content due to a service being disabled.
class [ComputeEngine::Settings](class_mip_computeengine_settings.md) | _Not yet documented._
class [FileEngine::Settings](class_mip_fileengine_settings.md) | _Not yet documented._
class [FileProfile::Settings](class_mip_fileprofile_settings.md) | Settings used by FileProfile during its creation and throughout its lifetime.
class [PolicyEngine::Settings](class_mip_policyengine_settings.md) | Defines the settings associated with a PolicyEngine.
class [PolicyProfile::Settings](class_mip_policyprofile_settings.md) | Settings used by PolicyProfile during its creation and throughout its lifetime.
class [ProtectionEngine::Settings](class_mip_protectionengine_settings.md) | Settings used by ProtectionEngine during its creation and throughout its lifetime.
class [ProtectionProfile::Settings](class_mip_protectionprofile_settings.md) | Settings used by ProtectionProfile during its creation and throughout its lifetime.
class [StorageDelegate](class_mip_storagedelegate.md) | A class that defines the interface to the MIP SDK storage for caching.
class [StorageDelegate::StorageSettings](class_mip_storagedelegate_storagesettings.md) | Settings used by StorageDelegate.
class [StorageTable](class_mip_storagetable.md) | A class that defines the interface to the MIP SDK storage table used for caching.
class [Stream](class_mip_stream.md) | A class that defines the interface between the MIP SDK and stream-based content.
class [SyncFileBaseData](class_mip_syncfilebasedata.md) | _Not yet documented._
class [SyncFilePolicyData](class_mip_syncfilepolicydata.md) | _Not yet documented._
class [SyncFileSensitivityData](class_mip_syncfilesensitivitydata.md) | _Not yet documented._
class [TaskDispatcherDelegate](class_mip_taskdispatcherdelegate.md) | A class that defines the interface to the MIP SDK task dispatcher.
class [TelemetryDelegate](class_mip_telemetrydelegate.md) | A class that defines the interface to the MIP SDK telemetry notifications.
class [TelemetryEvent](class_mip_telemetryevent.md) | A single telemetry event.
class [TemplateArchivedError](class_mip_templatearchivederror.md) | Template ID is archived and unavailable for protection.
class [TemplateDescriptor](class_mip_templatedescriptor.md) | _Not yet documented._
class [TemplateNotFoundError](class_mip_templatenotfounderror.md) | Template ID is not recognized by RMS service.
class [TenantInformation](class_mip_tenantinformation.md) | Tenant information from RMS.
class [UserRights](class_mip_userrights.md) | A group of users and the rights associated with them.
