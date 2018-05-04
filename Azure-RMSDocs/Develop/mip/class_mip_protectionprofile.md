# class mip::ProtectionProfile 
[ProtectionProfile](#classmip_1_1_protection_profile) is the root class for performing protection operations.
An application need to create a [ProtectionProfile](#classmip_1_1_protection_profile) prior to performing any protection operations
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public const Settings& GetSettings() const  |  Gets settings used by [ProtectionProfile](#classmip_1_1_protection_profile) during its initialization and throughout its lifetime.
public void ClearCaches()  |  Deletes caches (e.g. consent databases, etc.)
  
## Members
  
### Settings
Gets settings used by [ProtectionProfile](#classmip_1_1_protection_profile) during its initialization and throughout its lifetime.
  
#### Returns
[Settings](#classmip_1_1_protection_profile_1_1_settings) used by [ProtectionProfile](#classmip_1_1_protection_profile) during its initialization and throughout its lifetime
  
### ClearCaches
Deletes caches (e.g. consent databases, etc.)
Useful for debugging/testing