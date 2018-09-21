# MIP SDK for C++ (Preview) Reference

The Microsoft Information Protection (MIP) SDK for C++ (Preview) allows developers to manage and apply data protection policies to data and other digital assets.  

To learn more, see [MIP Developer blog](https://aka.ms/MIPDevelopers)<!-- and [MIP samples](https://aka.ms/mipsdksamples)-->.

The MIP SDK for C++ includes:

- [Enumerations and structures](mip-enums-and-structs.md)
- [Functions](mip-functions.md)
- The following classes:

| Class name | Description |
| :----------|:------------|
[AccessDeniedError](class_mip_accessdeniederror.md)  |  The user could not get access to the content. For example, no permissions, content revoked.
[Action](class_mip_action.md)  |  Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
[AddContentFooterAction](class_mip_addcontentfooteraction.md)  |  An action class that specifies adding a content footer to the document.
[AddContentHeaderAction](class_mip_addcontentheaderaction.md)  |  An action class that specifies adding content header.
[AddWatermarkAction](class_mip_addwatermarkaction.md)  |  An action class that specifies adding watermark.
[ApplyLabelAction](class_mip_applylabelaction.md)  |  Apply label actions requires the calling application to apply a specific label.
[BadInputError](class_mip_badinputerror.md)  |  Bad input error, thrown when the input to an SDK API is invalid.
[ClassificationResult](class_mip_classificationresult.md)  |  Class that contains the result of a classification call on the Execution State.
[ConsentDelegate](class_consentdelegate.md)  |  Delegate for consent related operations.
[ConsentDeniedError](class_mip_consentdeniederror.md)  |  An operation that required consent from user was not granted consent.
[ContentLabel](class_mip_contentlabel.md)  |  Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
[CustomAction](class_mip_customaction.md)  |  [CustomAction](class_mip_customaction.md) is a generic action class that captures all the sub-properties of the action as a property bag. The caller is responsible to understand the meaning of the action.
[Error](class_mip_error.md)  |  Base class for all errors that will be reported (thrown or returned) from MIP SDK.
[ExecutionState](class_mip_executionstate.md)  |  Interface for all the state needed to execute the engine.
[FileEngine::Settings](class_mip_fileengine_settings.md)  | _Not yet documented._
[FileEngine](class_mip_fileengine.md)  |  This class provides an interface for all engine functions.
[FileHandler::Observer](class_mip_filehandler_observer.md)  |  [Observer](class_mip_filehandler_observer.md) interface for clients to get notifications events related to file handler.
[FileHandler](class_mip_filehandler.md)  |  Interface for all file handling functions.
[FileIOError](class_mip_fileioerror.md)  |  File IO error.
[FileProfile::Observer](class_mip_fileprofile_observer.md)  |  [Observer](class_mip_fileprofile_observer.md) interface for clients to get notifications for profile related events.
[FileProfile::Settings](class_mip_fileprofile_settings.md)  |  [Settings](class_mip_fileprofile_settings.md) used by [FileProfile](class_mip_fileprofile.md) during its creation and throughout its lifetime.
[FileProfile](class_mip_fileprofile.md)  |  [FileProfile](class_mip_fileprofile.md) class is the root class for using the Microsoft Information Protection operations.
[HttpDelegate](class_mip_httpdelegate.md)  |  Interface for overriding HTTP handling.
[HttpRequest](class_mip_httprequest.md)  |  Interface that describes a single HTTP request.
[HttpResponse](class_mip_httpresponse.md)  |  Interface that describes a single HTTP response, implemented by client app when overriding [HttpDelegate](class_mip_httpdelegate.md).
[InternalError](class_mip_internalerror.md)  |  Internal error. This error is thrown when something unexpected happens during execution.
[JustificationRequiredError](class_mip_justificationrequirederror.md)  | _Not yet documented._
[JustifyAction](class_mip_justifyaction.md)  |  Justify [Action](class_mip_action.md) requires providing a justification to a label downgrade and setting the response in the execution state.
[Label](class_mip_label.md)  |  Abstraction for a single Microsoft Information Protection label.
[LabelingOptions](class_mip_labelingoptions.md)  |  Interface for configuring labeling options for the SetLabel/DeleteLabel methods.
[LoggerDelegate](class_mip_loggerdelegate.md)  |  A class that defines the interface to the MIP SDK logger.
[MetadataAction](class_mip_metadataaction.md)  |  An [Action](class_mip_action.md) that adds metadata information to the content.
[NetworkError](class_mip_networkerror.md)  |  Networking error. Caused by unexpected behavior when making network calls to service endpoints.
[NotSupportedError](class_mip_notsupportederror.md)  |  The operation requested by the application is not supported by the SDK.
[PolicyEngine::Settings](class_mip_policyengine_settings.md)  |  Defines the settings associated with a [PolicyEngine](class_mip_policyengine.md).
[PolicyEngine](class_mip_policyengine.md)  |  This class provides an interface for all engine functions.
[PolicyHandler](class_mip_policyhandler.md)  |  This class provides an interface for all policy handler functions on a file.
[PolicyProfile::Observer](class_mip_policyprofile_observer.md)  |  [Observer](class_mip_policyprofile_observer.md) interface for clients to get notifications for profile related events.
[PolicyProfile::Settings](class_mip_policyprofile_settings.md)  |  [Settings](class_mip_policyprofile_settings.md) used by [PolicyProfile](class_mip_policyprofile.md) during its creation and throughout its lifetime.
[PolicyProfile](class_mip_policyprofile.md)  |  [PolicyProfile](class_mip_policyprofile.md) class is the root class for using the Microsoft Information Protection operations. A typical application will only need one [PolicyProfile](class_mip_policyprofile.md) but it can create multiple profiles if needed.
[PolicySyncError](class_mip_policysyncerror.md)  |  An attempt to sync policy data failed.
[PrivilegedRequiredError](class_mip_privilegedrequirederror.md)  |  Current label was assigned as a privileged operation (The equivalent to an administrator operation), therefore it can't be overriden.
[ProtectAdhocAction](class_mip_protectadhocaction.md)  |  An action class that specifies adding adhoc protection to the document.
[ProtectByTemplateAction](class_mip_protectbytemplateaction.md)  |  An action class that specifies adding protection by template to the document.
[ProtectDoNotForwardAction](class_mip_protectdonotforwardaction.md)  |  An action class that specifies adding do not forward protection to the document.
[ProtectionDescriptor](class_mip_protectiondescriptor.md)  |  Description of protection associated with a piece of content.
[ProtectionDescriptorBuilder](class_mip_protectiondescriptorbuilder.md)  |  Constructs a [ProtectionDescriptor](class_mip_protectiondescriptor.md) that describes protection associated with a piece of content.
[ProtectionEngine::Observer](class_mip_protectionengine_observer.md)  |  Interface that receives notifications related to [ProtectionEngine](class_mip_protectionengine.md).
[ProtectionEngine::Settings](class_mip_protectionengine_settings.md)  |  [Settings](class_mip_protectionengine_settings.md) used by [ProtectionEngine](class_mip_protectionengine.md) during its creation and throughout its lifetime.
[ProtectionEngine](class_mip_protectionengine.md)  |  Manages protection-related actions related to a specific identity.
[ProtectionHandler::Observer](class_mip_protectionhandler.md)  |  Interface that receives notifications related to [ProtectionHandler](class_mip_protectionhandler.md).
[ProtectionHandler](class_mip_protectionhandler.md)  |  Manages protection-related actions for a specific protection configuration.
[ProtectionProfile::Observer](class_mip_protectionprofile_observer.md)  |  Interface that receives notifications related to [ProtectionProfile](class_mip_protectionprofile.md).
[ProtectionProfile::Settings](class_mip_protectionprofile_settings.md)  |  [Settings](class_mip_protectionprofile_settings.md) used by [ProtectionProfile](class_mip_protectionprofile.md) during its creation and throughout its lifetime.
[ProtectionProfile](class_mip_protectionprofile.md)  |  [ProtectionProfile](class_mip_protectionprofile.md) is the root class for performing protection operations.
[RecommendLabelAction](class_mip_recommendlabelaction.md)  |  Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
[RemoveContentFooterAction](class_mip_removecontentfooteraction.md)  |  An action class that specifies removing the content footer from the document.
[RemoveContentHeaderAction](class_mip_removecontentheaderaction.md)  |  An action class that specifies removing the content header from the document.
[RemoveProtectionAction](class_mip_removeprotectionaction.md)  |  An action class that specifies removing protection from the document.
[RemoveWatermarkAction](class_mip_removewatermarkaction.md)  |  An action class that specifies removing the watermarking from the document.
[Stream](class_mip_stream.md)  |  A class that defines the interface between the MIP SDK and stream-based content.
[TransientNetworkError](class_mip_transientnetworkerror.md)  |  Transient networking error. Caused by unexpected behavior when making network calls to service endpoints. The operation can be retried as this error is a transient error.
[UserRights](class_mip_userrights.md)  |  A group of users and the rights associated with them.
[UserRoles](class_mip_userroles.md)  |  A group of users and the roles associated with them.
