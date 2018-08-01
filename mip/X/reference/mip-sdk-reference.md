---
title: Microsoft Information Protection (MIP) SDK for C++ (Preview) Reference 
description: Library reference information for MIP SDK for C++.
author: BryanLa
manager: mbaldwin
ms.service: information-protection
services: information-protection
ms.topic: overview
ms.date: 05/18/2018
ms.author: bryanla
---

# Microsoft Information Protection SDK for C++ (Preview) Reference

The Microsoft Information Protection (MIP) SDK for C++ (Preview) allows developers to manage and apply data protection policies to data and other digital assets.  

To learn more, see [MIP Developer blog](https://aka.ms/MIPDevelopers)<!-- and [MIP samples](https://aka.ms/mipsdksamples)-->.

The MIP SDK for C++ includes:

- [Enumerations and structures](mip-enums-and-structs.md)
- [Functions](mip-functions.md)
- The following classes:

| Class name | Description |
| :----------|:------------|
[ConsentDelegate](class_consentdelegate.md)  |  Delegate for consent-related operations.
[mip::AccessDeniedError](class_mip_accessdeniederror.md)  |  The user could not get access to the content, such as access denied, content revoked, and so on.
[mip::Action](class_mip_action.md)  |  Interface for an action. Each action translates to a step that needs to be taken by the application to apply the label (as defined in the policy)
[mip::AddContentFooterAction](class_mip_addcontentfooteraction.md)  |  An action class that specifies a content footer to be added to the document.
[mip::AddContentHeaderAction](class_mip_addcontentheaderaction.md)  |  An action class that specifies adding content header.
[mip::AddWatermarkAction](class_mip_addwatermarkaction.md)  |  An action class that specifies adding watermark.
[mip::ApplyLabelAction](class_mip_applylabelaction.md)  |  Apply label actions requires the calling application to apply a specific label.
[mip::BadInputError](class_mip_badinputerror.md)  |  Bad input error, thrown when the input to an sdk api is invalid.
[mip::ClassificationResult](class_mip_classificationresult.md)  |  Class that contains the result of a classification call on the Execution State.
[mip::ContentLabel](class_mip_contentlabel.md)  |  Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
[mip::CustomAction](class_mip_customaction.md)  |  [CustomAction](class_mip_customaction.md) is a generic action class that captures all the subproperties of the action as a property bag. The caller is responsible to understand the meaning of the action.
[mip::Error](class_mip_error.md)  |  Base class for all errors that will be reported (thrown or returned) from MIP SDK.
[mip::ExecutionState](class_mip_executionstate.md)  |  Interface for all the state needed to execute the engine.
[mip::FileEngine](class_mip_fileengine.md)  |  Interface for all engine functions.
[mip::FileEngine::Settings](class_mip_fileengine::settings.md)  | _Not yet documented._
[mip::FileHandler](class_mip_filehandler.md)  |  Interface for all file handling functions.
[mip::FileHandler::Observer](class_mip_filehandler::observer.md)  |  [Observer](class_mip_filehandler_observer.md)-interface for clients to get notifications for file handler related events.
[mip::FileIOError](class_mip_fileioerror.md)  |  File IO error.
[mip::FileProfile](class_mip_fileprofile.md)  |  [FileProfile](class_mip_fileprofile.md) class is the root class for using the Microsoft Information Protection operations.
[mip::FileProfile::Observer](class_mip_fileprofile_observer.md)  |  [Observer](class_mip_fileprofile_observer.md)-interface for clients to get notifications for profile-related events.
[mip::FileProfile::Settings](class_mip_fileprofile_settings.md)  |  [Settings](class_mip_fileprofile_settings.md) used by [FileProfile](class_mip_fileprofile.md) during its creation and throughout its lifetime.
[mip::InternalError](class_mip_internalerror.md)  |  Internal error. This error is thrown when something unexpected happens during execution.
[mip::JustificationRequiredError](class_mip_justificationrequirederror.md)  | _Not yet documented._
[mip::JustifyAction](class_mip_justifyaction.md)  |  Justify [Action](class_mip_action.md) requires providing a justification to a label downgrade and setting the response in the execution state.
[mip::Label](class_mip_label.md)  |  Abstraction for a single Microsoft Information Protection label.
[mip::LabelingOptions](class_mip_labelingoptions.md)  |  Interface for configuring labeling options for the SetLabel method.
[mip::LoggerDelegate](class_mip_loggerdelegate.md)  |  A class that defines the interface to the MIP SDK logger.
[mip::MetadataAction](class_mip_metadataaction.md)  |  An [Action](class_mip_action.md) that adds metadata information to the content.
[mip::NetworkError](class_mip_networkerror.md)  |  Networking error. Caused by unexpected behavior when making network calls to service endpoints.
[mip::NotSupportedError](class_mip_notsupportederror.md)  |  The operation requested by the application is not supported by the sdk.
[mip::PolicyEngine](class_mip_policyengine.md)  |  This class provides an interface for all engine functions.
[mip::PolicyEngine::Settings](class_mip_policyengine_settings.md)  |  An instance of this class with the appropriate parameters should be provided to initiate an engine.
[mip::PrivilegedRequiredError](class_mip_privilegedrequirederror.md)  |  Current label was assigned as a privileged operation (The equivalent to an administrator operation), therefore it can't be overriden.
[mip::Profile](class_mip_profile.md)  |  [Profile](class_mip_profile.md) class is the root class for using the Microsoft Information Protection operations. A typical application will only need one [Profile](class_mip_profile.md) but it can create multiple profiles if needed.
[mip::Profile::Observer](class_mip_profile_observer.md)  |  [Observer](class_mip_profile_observer.md)-interface for clients to get notifications for profile related events.
[mip::Profile::Settings](class_mip_profile_settings.md)  |  [Settings](class_mip_profile_settings.md) used by [Profile](class_mip_profile.md) during its creation and throughout its lifetime.
[mip::ProtectAdhocAction](class_mip_protectadhocaction.md)  |  An action class which specifies adding adhoc protection to the document.
[mip::ProtectByTemplateAction](class_mip_protectbytemplateaction.md)  |  An action class which specifies adding protection by template to the document.
[mip::ProtectDoNotForwardAction](class_mip_protectdonotforwardaction.md)  |  An action class which specifies adding do not forward protection to the document.
[mip::ProtectionDescriptor](class_mip_protectiondescriptor.md)  |  Represents an ad-hoc policy associated with protected content.
[mip::ProtectionDescriptorBuilder](class_mip_protectiondescriptorbuilder.md)  |  Represents an ad-hoc policy associated with protected content.
[mip::ProtectionEngine](class_mip_protectionengine.md)  |  Performs protection-related actions related to a specific identity.
[mip::ProtectionEngine::Observer](class_mip_protectionengine_observer.md)  |  Interface that receives notifications related to [ProtectionEngine](class_mip_protectionengine.md).
[mip::ProtectionEngine::Settings](class_mip_protectionengine_settings.md)  |  [Settings](class_mip_protectionengine_settings.md) used by [ProtectionEngine](class_mip_protectionengine.md) during its creation and throughout its lifetime.
[mip::ProtectionHandler](class_mip_protectionhandler.md)  |  Performs protection-related actions for a specific protection configuration (i.e. users, rights, roles, etc.)
[mip::ProtectionHandler::Observer](class_mip_protectionhandler_observer.md)  |  Interface that receives notifications related to [ProtectionHandler](class_mip_protectionhandler.md).
[mip::ProtectionProfile](class_mip_protectionprofile.md)  |  [ProtectionProfile](class_mip_protectionprofile.md) is the root class for performing protection operations.
[mip::ProtectionProfile::Observer](class_mip_protectionprofile_observer.md)  |  Interface that receives notifications related to [ProtectionProfile](class_mip_protectionprofile.md).
[mip::ProtectionProfile::Settings](class_mip_protectionprofile_settings.md)  |  [Settings](class_mip_protectionprofile_settings.md) used by [ProtectionProfile](class_mip_protectionprofile.md) during its creation and throughout its lifetime.
[mip::RecommendLabelAction](class_mip_recommendlabelaction.md)  |  Recommend label actions is meant to suggest a label to the users. Suppressing this call after a user ignores the recommended label should be done through the supported actions on the execution state.
[mip::RemoveContentFooterAction](class_mip_removecontentfooteraction.md)  |  An action class which specifies removing the content footer from the document.
[mip::RemoveContentHeaderAction](class_mip_removecontentheaderaction.md)  |  An action class which specifies removing the content header from the document.
[mip::RemoveProtectionAction](class_mip_removeprotectionaction.md)  |  An action class which specifies removing protection from the document.
[mip::RemoveWatermarkAction](class_mip_removewatermarkaction.md)  |  An action class which specifies removing the watermarking from the document.
[mip::Stream](class_mip_stream.md)  |  A class that defines the interface between the MIP SDK and stream-based content.
[mip::UserRights](class_mip_userrights.md)  |  Represents a group of users and the rights associated with them.
[mip::UserRoles](class_mip_userroles.md)  |  Represents a group of users and the roles associated with them.

 
