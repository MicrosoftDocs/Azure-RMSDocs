# MIP SDK for C++ (Preview) Reference

The Microsoft Information Protection (MIP) SDK for C++ (Preview) allows developers to manage and apply data protection policies to data and other digital assets.  

To learn more, see [MIP Developer blog](https://aka.ms/MIPDevelopers) and [MIP samples](https://aka.ms/mipsdksamples).

The MIP SDK for C++ includes the following classes:

| Class name | Description |
| :----------|:------------|
[mip::Action](class_mip_action.md) | Base class for all actions. |
[mip::AddContentFooterAction](class_mip_addcontentfooteraction.md) | An action class which specifies adding a content footer to the document.
[mip::addContentHeaderAction](class_mip_addcontentheaderaction.md) | An action class that specifies adding content header.
[mip::AddWatermarkAction](class_mip_addwatermarkaction.md) | An action class that specifies adding watermark.
[mip::BadInputError](class_mip_badinputerror.md) | Bad input error, input to the API was invalid.
[mip::CommonRights](class_mip_commonrights.md) | Universally supported rights.
[mip::Consent](class_mip_consent.md) | Represents a user's acceptance/refusal to allow an action.
[mip::ConsentCallback](class_mip_consentcallback.md) | Interface for consent request notifications.
[mip::ConsentResult](class_mip_consentresult.md) | Describes result of consent request after user interaction.
[mip::ContentLabel](class_mip_contentlabel.md) | Abstraction for a Microsoft Information Protection label that is applied to a piece of content, typically a document.
[mip::CustomAction](class_mip_customaction.md) | Generic action class that captures all the sub-properties of the action as a property bag.
[mip::CustomProtectedStream](class_mip_customprotectedstream.md) | Wraps a stream to provide transparent encryption and decryption on read and write.
[mip::EditableDocumentRights](class_mip_editabledocumentrights.md) | Rights that apply to editable documents.
[mip::EmailRights](class_mip_emailrights.md) | Rights that apply to email.
[mip::Error](class_mip_error.md) | Base class for all errors that will be reported (thrown or returned) from MIP SDK.
[mip::ExecutionState](class_mip_executionstate.md) | Interface for all the state needed to execute the engine.
[mip::FileEngine](class_mip_fileengine.md) | Interface for all engine functions.
[mip::FileEngine::Settings](class_mip_fileengine_settings.md) | 
[mip::FileHandler](class_mip_filehandler.md) | Interface for all file handling functions.
[mip::FileHandler::Observer](class_mip_filehandler_observer.md) | Observer interface for clients to get notifications for file handler related events.
[mip::FileIOError](class_mip_fileioerror.md) | File IO error.
[mip::FileProfile](class_mip_fileprofile.md) | Root class for Microsoft Information Protection operations.
[mip::FileProfile::Observer](class_mip_fileprofile_observer.md) | Observer interface used to receive profile-related event notifications.
[mip::FileProfile::Settings](class_mip_fileprofile_settings.md) | Interface for managing file profile settings.
[mip::GetUserPolicyResult](class_mip_getuserpolicyresult.md) | Describes the results of a user policy acquisition request.
[mip::InternalError](class_mip_internalerror.md) | Internal SDK error. Something unexpected happened.
[mip::IStream](class_mip_istream.md) | Base interface for protected streams.
[mip::JustificationRequiredError](class_mip_justificationrequirederror.md) | Requested change requires an explanation for the change.
[mip::JustifyAction](class_mip_justifyaction.md) | Request requires justification to a label downgrade and setting the response in the execution state.
[mip::Label](class_mip_label.md) | Abstraction for a single Microsoft Information Protection label.
[mip::LabelingOptions](class_mip_labelingoptions.md) | Interface for configuring labeling options for the SetLabel method.
[mip::MetadataAction](class_mip_metadataaction.md) | An action specifying the metadata information to be added to the content.
[mip::NetworkError](class_mip_networkerror.md) | Networking error.
[mip::NotSupportedError](class_mip_notsupportederror.md) | Operation not supported error.
[mip::PolicyDescriptor](class_mip_policydescriptor.md) | Represents an ad-hoc policy associated with protected content.
[mip::PolicyEngine](class_mip_policyengine.md) | This class provides an interface for all engine functions.
[mip::PolicyEngine::Settings](class_mip_policyengine_settings.md) | An instance of this class with the appropriate parameters should be provide to initiate an engine.
[mip::PrivilegedRequiredError](class_mip_privilegedrequirederror.md) | Current label was set by privilege assignment method cannot override.
[mip::Profile](class_mip_profile.md) | Root class for Microsoft Information Protection operations.
[mip::Profile::Observer](class_mip_profile_observer.md) | Interface used to receive notifications for profile related event notifications.
[mip::Profile::Settings](class_mip_profile_settings.md) | Configures profile settings.
[mip::ProtectAdhocAction](class_mip_protectadhocaction.md) | An action class which specifies adding ad-hoc protection to the document.  
[mip::ProtectbyTemplateAction](class_mip_protectbytemplateaction.md) | An action class which specifies adding protection by template to the document.
[mip::ProtectDoNotForwardAction](class_mip_protectdonotforwardaction.md) | An action class which specifies adding do not forward protection to the document.
[mip::ProtectionProfile](class_mip_protectionprofile.md) | Base class used to perform protection operations.
[mip::ProtectionProfile::Observer](class_mip_protectionprofile_observer.md) | Use to receive protection profile notifications.
[mip::ProtectionProfile::Settings](class_mip_protectionprofile_settings.md) | Protection profile settings used throughout the life of the instance.
[mip::RemoveContentFooterAction](class_mip_removecontentfooteraction.md) | An action class which specifies removing the content footer from the document.
[mip::RemoveContentHeaderAction](class_mip_removecontentheaderaction.md) | An action class which specifies removing the content header from the document.
[mip::RemoveProtectionAction](class_mip_removeprotectionaction.md) | An action class which specifies removing protection from the document.
[mip::RemoveWatermarkAction](class_mip_removewatermarkaction.md) | An action class which specifies removing the watermarking from the document.
[mip::RMSCryptographyException](class_mip_rmscryptographyexception.md) | RMS cryptography exception.
[mip::RMSException](class_mip_rmsexception.md) | Base RMS exception.
[mip::RMSInvalidArgumentException](class_mip_rmsinvalidargumentexception.md) | RMS invalid argument exception.
[mip::RMSLogicException](class_mip_rmslogicexception.md) | RMS logic exception.
[mip::RMSNetworkException](class_mip_rmsnetworkexception.md) | RMS Network exception.
[mip::RMSNotFoundException](class_mip_rmsnotfoundexception.md) | RMS not found exception.
[mip::RMSNullPointerException](class_mip_rmsnullpointerexception.md) | RMS null pointer exception.
[mip::RMSOfficeFileException](class_mip_rmsofficefileexception.md) | RMS Office file exception.
[mip::RMSPFileException](class_mip_rmspfileexception.md) | RMS PFile exception.
[mip::RMSRightsException](class_mip_rmsrightsexception.md) | RMS rights exception.
[mip::RMSStreamException](class_mip_rmsstreamexception.md) | RMS stream exception.
[mip::Roles](class_mip_roles.md) | Defines roles for protecting data.
[mip::Stream](class_mip_stream.md) | A class that defines the interface between the MIP SDK and stream based content.
[mip::TemplateDescriptor](class_mip_templatedescriptor.md) | Describes an RMS template.
[mip::UserPolicy](class_mip_userpolicy.md) | Represents the policy associated with protected content.
[mip::UserRights](class_mip_userrights.md) | Represents a group of users and the rights associated with them.
[mip::UserRoles](class_mip_userroles.md) | Represents a group of users and the roles associated with them.
 
