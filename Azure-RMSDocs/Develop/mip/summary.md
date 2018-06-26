# Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
 define FILE_API       | _Not yet documented._
 enum Consent       |  Represents a user's decision to consent to connect to a service endpoint.
 public const std::string& GetCustomSettingPolicyDataName()       |  Name of the setting to explicitly specify policy data.
 public const std::string& GetCustomSettingExportPolicyFileName()       |  Name of the setting to explicitly specify file path to export SCC policy data to.
 public const std::string& GetCustomSettingPolicyDataFile()       |  Name of the setting to explicitly specify policy data file path.
 namespace mip  | _Not yet documented._
 namespace mip::rights  | _Not yet documented._
 namespace mip::roles  | _Not yet documented._
 class ConsentDelegate  |  Delegate for consent related operations.
 class mip::FileProfile::Observer  |  [Observer](class_mip_fileprofile_observer.md) interface for clients to get notifications for profile related events.
 class mip::ProtectionProfile::Observer  |  Interface that receives notifications related to [ProtectionProfile](class_mip_protectionprofile.md).
 class mip::ProtectionEngine::Observer  |  Interface that receives notifications related to [ProtectionEngine](class_mip_protectionengine.md).
 class mip::Profile::Observer  |  [Observer](class_mip_profile_observer.md) interface for clients to get notifications for profile related events.
 class mip::ProtectionHandler::Observer  |  Interface that receives notifications related to [ProtectionHandler](class_mip_protectionhandler.md).
 class mip::FileHandler::Observer  |  [Observer](class_mip_filehandler_observer.md) interface for clients to get notifications for file handler related events.
 class mip::FileEngine::Settings  | _Not yet documented._
 class mip::Profile::Settings  |  [Settings](class_mip_profile_settings.md) used by [Profile](class_mip_profile.md) during its creation and throughout its lifetime.
 class mip::ProtectionEngine::Settings  |  [Settings](class_mip_protectionengine_settings.md) used by [ProtectionEngine](class_mip_protectionengine.md) during its creation and throughout its lifetime.
 class mip::FileProfile::Settings  |  [Settings](class_fileprofile_settings.md) used by [FileProfile](class_mip_fileprofile.md) during its creation and throughout its lifetime.
 class mip::PolicyEngine::Settings  |  An instance of this class with the appropriate parameters should be provide to initiate an engine.
 class mip::ProtectionProfile::Settings  |  [Settings](class_mip_protectionprofile_settings.md) used by [ProtectionProfile](class_mip_protectionprofile.md) during its creation and throughout its lifetime.
 struct ApplicationInfo  |  Application identifier as set in the aad portal.
  
## Members
  
### FILE_API
_Not documented yet._

  
### Consent
Represents a user's decision to consent to connect to a service endpoint.

 Values                         | Descriptions                                
--------------------------------|---------------------------------------------
AcceptAlways            | Consent, and remember this decision
Accept            | Consent, just one time
Reject            | Do not consent
  
### GetCustomSettingPolicyDataName
Name of the setting to explicitly specify policy data.

  
**Returns**: The custom settings key.
  
### GetCustomSettingExportPolicyFileName
Name of the setting to explicitly specify file path to export SCC policy data to.

  
**Returns**: The custom settings key.
  
### GetCustomSettingPolicyDataFile
Name of the setting to explicitly specify policy data file path.

  
**Returns**: The custom settings key.