# class mip::ProtectionProfile::Observer 
Interface that receives notifications related to [ProtectionProfile](#classmip_1_1_protection_profile).
This interface must by implemented by applications using the protection SDK
  
## Summary
 Members                        | Descriptions                                
--------------------------------|---------------------------------------------
public inline virtual void OnLoadSuccess(const std::shared_ptr<ProtectionProfile>& profile, const std::shared_ptr<void>& context)  |  Called when profile was loaded successfully.
public inline virtual void OnLoadFailure(const std::exception_ptr& error, const std::shared_ptr<void>& context)  |  Called when loading a profile caused an error.
  
## Members
  
### OnLoadSuccess
Called when profile was loaded successfully.
  
#### Parameters
* profile A reference to the newly-created [ProtectionProfile](#classmip_1_1_protection_profile)
* context The same context that was passed to [ProtectionProfile::LoadAsync](#classmip_1_1_protection_profile_1aeb141706dc10935931841fdb82d11031)
An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionProfile::LoadAsync](#classmip_1_1_protection_profile_1aeb141706dc10935931841fdb82d11031) and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](#classmip_1_1_protection_profile_1_1_observer_1a31e73965ffb0bd152b3954b013faa773) or [ProtectionProfile::Observer::OnLoadFailure](#classmip_1_1_protection_profile_1_1_observer_1acdad73bb6a2dcc93295e0e16e422f291)
  
### OnLoadFailure
Called when loading a profile caused an error.
  
#### Parameters
* error [Error](#classmip_1_1_error) that occured while loading 
* context The same context that was passed to [ProtectionProfile::LoadAsync](#classmip_1_1_protection_profile_1aeb141706dc10935931841fdb82d11031)
An application can pass any type of context (e.g. std::promise, std::function, etc.) to [ProtectionProfile::LoadAsync](#classmip_1_1_protection_profile_1aeb141706dc10935931841fdb82d11031) and that same context will be forwarded as-is to [ProtectionProfile::Observer::OnLoadSuccess](#classmip_1_1_protection_profile_1_1_observer_1a31e73965ffb0bd152b3954b013faa773) or [ProtectionProfile::Observer::OnLoadFailure](#classmip_1_1_protection_profile_1_1_observer_1acdad73bb6a2dcc93295e0e16e422f291)